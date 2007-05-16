/***************************************************************************
 *   This file is part of KDevelop                                         *
 *   Copyright (C) 2007 Andreas Pakulat <apaku@gmx.de>                     *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU Library General Public License as       *
 *   published by the Free Software Foundation; either version 2 of the    *
 *   License, or (at your option) any later version.                       *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU Library General Public     *
 *   License along with this program; if not, write to the                 *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.         *
 ***************************************************************************/
/****************************************************************************
**
** Copyright (C) 1992-2006 Trolltech AS. All rights reserved.
**
** This file is part of the Qt Designer of the Qt Toolkit.
**
** This file may be used under the terms of the GNU General Public
** License version 2.0 as published by the Free Software Foundation
** and appearing in the file LICENSE.GPL included in the packaging of
** this file.  Please review the following information to ensure GNU
** General Public Licensing requirements will be met:
** http://www.trolltech.com/products/qt/opensource.html
**
** If you are unsure which license is appropriate for your use, please
** review the following information:
** http://www.trolltech.com/products/qt/licensing.html or contact the
** sales department at sales@trolltech.com.
**
** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
**
****************************************************************************/

#include "qtdesignerdocument.h"

#include "qtdesignerplugin.h"
#include "icore.h"
#include "iuicontroller.h"
#include <QtDesigner/QDesignerFormWindowManagerInterface>
#include <QtDesigner/QDesignerFormWindowInterface>
#include <QtDesigner/QDesignerFormEditorInterface>
#include <QtGui/QMdiArea>
#include <QtGui/QMdiSubWindow>
#include <QtCore/QFile>

QtDesignerDocument::QtDesignerDocument( const KUrl& url , KDevelop::ICore* core )
    : Sublime::UrlDocument(core->uiController()->controller(), url), KDevelop::IDocument(core), m_url(url)
{

}

KUrl QtDesignerDocument::url() const
{
    return m_url;
}

KSharedPtr<KMimeType> QtDesignerDocument::mimeType() const
{
    return KMimeType::mimeType("application/x-designer");
}

KParts::Part* QtDesignerDocument::partForView(QWidget*) const
{
    return 0;
}

KTextEditor::Document* QtDesignerDocument::textDocument() const
{
    return 0;
}

bool QtDesignerDocument::save(DocumentSaveMode)
{
    return true;
}

void QtDesignerDocument::reload()
{
}

void QtDesignerDocument::close()
{
}

bool QtDesignerDocument::isActive() const
{
    return true;
}

KDevelop::IDocument::DocumentState QtDesignerDocument::state() const
{
    return KDevelop::IDocument::Clean;
}

void QtDesignerDocument::setCursorPosition(const KTextEditor::Cursor&)
{
    return;
}

void QtDesignerDocument::activate(Sublime::View* view)
{
    Q_UNUSED(view)
    notifyActivated();
}

void QtDesignerDocument::setDesignerPlugin(QtDesignerPlugin* plugin)
{
    m_designerPlugin = plugin;
}

QWidget *QtDesignerDocument::createViewWidget(QWidget *parent)
{
    kDebug(9039) << "Creating new area for form: " << m_url << endl;
    QMdiArea* area = new QMdiArea(parent);
    area->setScrollBarsEnabled( true );
//     area->setVerticalScrollBarPolicy( Qt::ScrollBarAlwaysOn );
//     area->setHorizontalScrollBarPolicy( Qt::ScrollBarAlwaysOn );
    QFile uiFile(m_url.path());
    QDesignerFormWindowManagerInterface* manager = m_designerPlugin->designer()->formWindowManager();
    QDesignerFormWindowInterface* widget = manager->createFormWindow();
    kDebug(9039) << "now we have " << manager->formWindowCount() << " formwindows" << endl;
    widget->setFileName(m_url.path());
    widget->setContents(&uiFile);
    manager->setActiveFormWindow(widget);
    QMdiSubWindow* window = area->addSubWindow(widget, Qt::Window | Qt::WindowShadeButtonHint | Qt::WindowSystemMenuHint | Qt::WindowTitleHint);
    const QSize containerSize = widget->mainContainer()->size();
    const QSize containerMinimumSize = widget->mainContainer()->minimumSize();
    const QSize containerMaximumSize = widget->mainContainer()->maximumSize();
    const QSize decorationSize = window->geometry().size() - window->contentsRect().size();
    window->resize(containerSize+decorationSize);
    window->setMinimumSize(containerMinimumSize+decorationSize);
    if( containerMaximumSize == QSize(QWIDGETSIZE_MAX,QWIDGETSIZE_MAX) )
        window->setMaximumSize(containerMaximumSize);
    else
        window->setMaximumSize(containerMaximumSize+decorationSize);
    window->setWindowTitle( widget->mainContainer()->windowTitle() );
    m_areas << area;
    return area;
}


//kate: space-indent on;indent-width 4;replace-tabs on;auto-insert-doxygen on;indent-mode cstyle;
