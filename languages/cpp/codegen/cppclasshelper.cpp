/*
 * KDevelop C++ Language Support
 *
 * Copyright 2008 Hamish Rodda <rodda@kde.org>
 * Copyright 2012 Miha Čančula <miha@noughmad.eu>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
 */

#include "cppclasshelper.h"
#include "cppnewclass.h"

#include <codecompletion/missingincludeitem.h>
#include <language/codegen/templateclassassistant.h>
#include <language/codegen/coderepresentation.h>
#include <language/codegen/documentchangeset.h>
#include <language/duchain/classfunctiondeclaration.h>
#include <interfaces/icore.h>
#include <interfaces/iprojectcontroller.h>
#include <interfaces/iproject.h>
#include <project/projectmodel.h>
#include <project/interfaces/iprojectfilemanager.h>
#include <project/interfaces/ibuildsystemmanager.h>

#include <KLocalizedString>
#include <QMessageBox>
#include <QVBoxLayout>
#include <QLabel>
#include <QListWidget>

using namespace KDevelop;

CppClassHelper::CppClassHelper (KDevelop::TemplateClassAssistant* assistant) : m_assistant(assistant)
{

}

CppClassHelper::~CppClassHelper()
{

}

KDevelop::ClassGenerator* CppClassHelper::generator()
{
    KUrl url = m_assistant->baseUrl();
    IProject* project = ICore::self()->projectController()->findProjectForUrl(url);
    ProjectBaseItem* item = 0;

    if (project)
    {
        QList<ProjectBaseItem*> items = project->itemsForUrl(url);

        if (!items.isEmpty())
        {
            item = items.first();
        }
    }

    return new CppTemplateNewClass(item);
}

KDevelop::OverridesPage* CppClassHelper::overridesPage()
{
    return new CppOverridesPage(m_assistant->generator(), m_assistant);
}

KDevelop::ClassIdentifierPage* CppClassHelper::identifierPage()
{
    return new CppClassIdentifierPage(m_assistant);
}

CppTemplateNewClass::CppTemplateNewClass (ProjectBaseItem* parentItem)
: TemplateClassGenerator (parentItem ? parentItem->url() : KUrl())
, m_type(DefaultType)
, m_objectType(new CppClassType)
, m_parentItem(parentItem)
{

}

CppTemplateNewClass::~CppTemplateNewClass()
{

}

QVariantHash CppTemplateNewClass::templateVariables()
{
    QVariantHash variables = KDevelop::TemplateClassGenerator::templateVariables();

    QList<DeclarationPointer> privateFunctions;
    QList<DeclarationPointer> protectedFunctions;
    QList<DeclarationPointer> publicFunctions;

    QList<DeclarationPointer> privateMembers;
    QList<DeclarationPointer> protectedMembers;
    QList<DeclarationPointer> publicMembers;

    QList<DeclarationPointer> slotDeclarations;
    QList<DeclarationPointer> signalDeclarations;

    DUChainReadLocker lock(DUChain::lock());
    foreach (DeclarationPointer ptr, declarations())
    {
        ClassMemberDeclaration* member = dynamic_cast<ClassMemberDeclaration*>(ptr.data());
        if (!member)
        {
            continue;
        }

        if (member->isFunctionDeclaration())
        {
            ClassFunctionDeclaration* function = dynamic_cast<ClassFunctionDeclaration*>(member);

            if (function->isSlot())
            {
                slotDeclarations << ptr;
            }
            else if (function->isSignal())
            {
                signalDeclarations << ptr;
            }
            else if (function->accessPolicy() == Declaration::Private)
            {
                privateFunctions << ptr;
            }
            else if (function->accessPolicy() == Declaration::Protected)
            {
                protectedFunctions << ptr;
            }
            else if (function->accessPolicy() == Declaration::Public)
            {
                publicFunctions << ptr;
            }
        }
        else
        {
            switch (member->accessPolicy())
            {
                case Declaration::Private:
                case Declaration::DefaultAccess:  // In C++, class members are private by default
                    privateMembers << ptr;
                    break;

                case Declaration::Protected:
                    protectedMembers << ptr;
                    break;

                case Declaration::Public:
                    publicMembers << ptr;
            }
        }
    }

    variables["private_functions"] = QVariant::fromValue(privateFunctions);
    variables["protected_functions"] = QVariant::fromValue(protectedFunctions);
    variables["public_functions"] = QVariant::fromValue(publicFunctions);

    variables["slots"] = QVariant::fromValue(slotDeclarations);
    variables["signals"] = QVariant::fromValue(signalDeclarations);

    variables["private_members"] = QVariant::fromValue(privateMembers);
    variables["protected_members"] = QVariant::fromValue(protectedMembers);
    variables["public_members"] = QVariant::fromValue(publicMembers);

    variables["namespaces"] = m_namespaces;

    return variables;
}


KDevelop::DocumentChangeSet CppTemplateNewClass::generate()
{
  KDevelop::DocumentChangeSet changes = TemplateClassGenerator::generate();

  if (!m_parentItem) {
    // happens when we don't select anything in the project view
    // and create a new class from the code menu
    return changes;
  }

  //Pick the folder Item that should contain the new class
  IProject* p=m_parentItem->project();
  ProjectFolderItem* folder=m_parentItem->folder();
  ProjectTargetItem* target=m_parentItem->target();

  if(target) {
    folder=static_cast<ProjectFolderItem*>(m_parentItem->target()->parent());
    Q_ASSERT(folder->folder());
  }else if(!folder) {
    QHash<QString,KUrl> urls = fileUrls();
    Q_ASSERT(!urls.isEmpty());
    if(urls.isEmpty())
      return changes;
    QList<ProjectFolderItem*> folderList = p->foldersForUrl(urls.values().first().upUrl());
    if(folderList.isEmpty())
      return changes;
    folder = folderList.first();
  }

  // find target to add created class to
  if(!target && folder && p->projectFileManager()->features() & KDevelop::IProjectFileManager::Targets ) {
    QList<KDevelop::ProjectTargetItem*> t=folder->targetList();
    for(ProjectBaseItem* it=folder; it && t.isEmpty(); it=it->parent()) {
      t=it->targetList();
    }

    if(t.count()==1) { //Just choose this one
      target=t.first();
    } else if(t.count() > 1) {
      KDialog d;
      QWidget *w=new QWidget(&d);
      w->setLayout(new QVBoxLayout);
      w->layout()->addWidget(new QLabel(i18n("Choose one target to add the file or cancel if you do not want to do so.")));
      QListWidget* targetsWidget=new QListWidget(w);
      targetsWidget->setSelectionMode(QAbstractItemView::SingleSelection);
      foreach(ProjectTargetItem* it, t) {
        targetsWidget->addItem(it->text());
      }
      w->layout()->addWidget(targetsWidget);

      targetsWidget->setCurrentRow(0);
      d.setButtons( KDialog::Ok | KDialog::Cancel);
      d.enableButtonOk(true);
      d.setMainWidget(w);

      if(d.exec()==QDialog::Accepted) {
        if(targetsWidget->selectedItems().isEmpty()) {
          QMessageBox::warning(0, QString(), i18n("Did not select anything, not adding to a target."));
        } else {
          target= t[targetsWidget->currentRow()];
        }
      }
    }
  }

  if(target && p->buildSystemManager()) {
    QList<ProjectFileItem*> itemsToAdd;
    foreach (const KUrl& url, fileUrls())
    {
      if (ProjectFileItem* file = p->projectFileManager()->addFile(url, folder))
      {
        itemsToAdd << file;
      }
    }

    p->buildSystemManager()->addFilesToTarget(itemsToAdd, target);
  }

  return changes;
}

QList<KDevelop::DeclarationPointer> CppTemplateNewClass::addBaseClass(const QString& base)
{
  if(base.isEmpty()) {
    return m_baseClasses;
  }

  //strip access specifier
  QStringList splitBase = base.split(' ', QString::SkipEmptyParts);

  //if no access specifier is found use public by default
  if(splitBase.size() == 1) {
    splitBase.prepend("public");
  }

  QString full = splitBase.join(" ");
  QString name = splitBase.takeLast();
  QString access = splitBase.join(" ");
  m_baseAccessSpecifiers << access;

  //Call base function with stripped access specifier
  return ClassGenerator::addBaseClass(full);
}

void CppTemplateNewClass::clearInheritance()
{
  ClassGenerator::clearInheritance();
  m_baseAccessSpecifiers.clear();
}

void CppTemplateNewClass::setIdentifier(const QString& identifier)
{
  QStringList list = identifier.split("::");
  setName(list.last());
  m_objectType->setDeclarationId(DeclarationId(QualifiedIdentifier(name())));
  list.pop_back();
  m_namespaces = list;
}

StructureType::Ptr CppTemplateNewClass::objectType() const
{
  return StructureType::Ptr::staticCast<CppClassType>(m_objectType);
}

void CppTemplateNewClass::setType(Type type)
{
  m_type = type;
}


QString CppTemplateNewClass::identifier() const
{
  QString identifier = m_namespaces.join("::");

  identifier.append(m_namespaces.empty() ? name() : "::" + name());
  return identifier;
}

