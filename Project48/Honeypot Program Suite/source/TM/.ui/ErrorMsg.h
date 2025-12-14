/****************************************************************************
** Form interface generated from reading ui file 'ErrorMsg.ui'
**
** Created: จ. ธ.ค. 26 03:51:48 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ERRORMSG_H
#define ERRORMSG_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;
class QPushButton;

class ErrorMsg : public QDialog
{
    Q_OBJECT

public:
    ErrorMsg( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~ErrorMsg();

    QLabel* textLabel;
    QPushButton* pushButton20;

protected:
    QVBoxLayout* ErrorMsgLayout;
    QVBoxLayout* layout30;
    QHBoxLayout* layout28;
    QSpacerItem* spacer25;
    QSpacerItem* spacer26;

protected slots:
    virtual void languageChange();

};

#endif // ERRORMSG_H
