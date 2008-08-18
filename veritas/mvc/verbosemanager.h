/***************************************************************************
 *   Copyright (C) 2008 by Peter Penz <peter.penz@gmx.at>                  *
 *             modified by Manuel Breugelmans <mbr.nxi@gmail.com>          *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA            *
 ***************************************************************************/

#ifndef VERITAS_VERBOSEMANAGER_H
#define VERITAS_VERBOSEMANAGER_H

#include "veritas/test.h"
#include <QObject>

class QAbstractItemView;
class QModelIndex;
class QAbstractButton;
class QItemSelection;

namespace Veritas
{

class VerboseToggle;
class Test;

/**
 * @brief Allows to select and deselect items for the single-click mode.
 *
 * Whenever an item is hovered by the mouse, a toggle button is shown
 * which allows to select/deselect the current item.
 * @todo extract common bits with selection manager
 */
class VerboseManager : public QObject
{
    Q_OBJECT

public:
    VerboseManager(QAbstractItemView* parent);
    virtual ~VerboseManager();

public slots:
    /**
     * Resets the selection manager so that the toggle button gets
     * invisible.
     */
    void reset();

signals:
    /** Is emitted if the selection has been changed by the toggle button. */
    void openVerbose(Veritas::Test*);

private slots:
    void slotEntered(const QModelIndex& index);
    void slotViewportEntered();
    void emitOpenVerbose();
    void slotRowsRemoved(const QModelIndex& parent, int start, int end);
    void slotSelectionChanged(const QItemSelection& selected, const QItemSelection& deselected);

private:
    Test* itemFromIndex(const QModelIndex& index) const;

private:
    QAbstractItemView* m_view;
    VerboseToggle* m_toggle;
};

} // namespace Veritas

#endif // VERITAS_SELECTION_MANAGER_H

