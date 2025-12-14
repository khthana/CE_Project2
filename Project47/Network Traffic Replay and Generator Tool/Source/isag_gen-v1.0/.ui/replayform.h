/****************************************************************************
** Form interface generated from reading ui file 'replayform.ui'
**
** Created: Wed Jan 5 10:15:34 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef REPLAYFORM_H
#define REPLAYFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QListView;
class QListViewItem;

class replayForm : public QDialog
{
    Q_OBJECT

public:
    replayForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~replayForm();

    QListView* listView1;

protected:
    QGridLayout* replayFormLayout;

protected slots:
    virtual void languageChange();

};

#endif // REPLAYFORM_H
