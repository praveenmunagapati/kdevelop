/* This file is part of KDevelop
    Copyright 2008 Hamish Rodda <rodda@kde.org>

   This library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public
   License version 2 as published by the Free Software Foundation.

   This library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public License
   along with this library; see the file COPYING.LIB.  If not, write to
   the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
*/

#ifndef KDEVPLATFORM_PLUGIN_OUTPUTPAGE_H
#define KDEVPLATFORM_PLUGIN_OUTPUTPAGE_H

#include <QWidget>
#include <QUrl>
#include <ktexteditor/cursor.h>

#include "ipagefocus.h"

namespace KDevelop {

class TemplateRenderer;
class SourceFileTemplate;
class CreateClassAssistant;

/**
 * Assistant page for setting the output location of generated source code
 */
class OutputPage : public QWidget, public IPageFocus
{
    Q_OBJECT

public:
    explicit OutputPage(QWidget* parent);
    ~OutputPage() override;

    /**
     * Creates form widgets according to the number of output files of the template @p fileTemplate.
     * File identifiers and labels are read from @p fileTemplate, but not the actual URLs.
     *
     * This function is useful to prevent UI flickering that occurs when adding widgets while the page is visible.
     * It can be called immediately after the template is selected, before the user specified anything for the generated code.
     */
    void prepareForm(const KDevelop::SourceFileTemplate& fileTemplate);
    /**
     * Loads file URLs from the template @p fileTemplate.
     * This function only sets URLs and file positions to widgets created by prepareForm(),
     * so be sure to call prepareForm() before calling this function.
     *
     * @param fileTemplate the template archive with the generated files
     * @param baseUrl the directory where the files are to be generated
     * @param renderer used to render any variables in output URLs
     */
    void loadFileTemplate(const KDevelop::SourceFileTemplate& fileTemplate, const QUrl& baseUrl,
                          KDevelop::TemplateRenderer* renderer);

    /**
     * Returns the file URLs, as specified by the user.
     */
    QHash<QString, QUrl> fileUrls() const;
    /**
     * Returns the positions within files where code is to be generated.
     */
    QHash<QString, KTextEditor::Cursor> filePositions() const;

    void setFocusToFirstEditWidget() override;

Q_SIGNALS:
    /**
     * @copydoc ClassIdentifierPage::isValid
     */
    void isValid(bool valid);

private:
    friend struct OutputPagePrivate;
    struct OutputPagePrivate* const d;
};

}

#endif // KDEVPLATFORM_PLUGIN_OUTPUTPAGE_H
