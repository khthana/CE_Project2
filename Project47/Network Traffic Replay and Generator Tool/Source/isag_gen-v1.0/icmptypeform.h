/****************************************************************************
** Form interface generated from reading ui file 'icmptypeform.ui'
**
** Created: Wed Jan 26 12:26:43 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ICMPTYPEFORM_H
#define ICMPTYPEFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QButtonGroup;
class QRadioButton;
class QPushButton;

class icmpTypeForm : public QDialog
{
    Q_OBJECT

public:
    icmpTypeForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~icmpTypeForm();

    QButtonGroup* icmpbuttonGroup;
    QRadioButton* echoreqRadioButton;
    QRadioButton* redirectRadioButton;
    QRadioButton* timeExceedRadioButton;
    QRadioButton* timeStampRadioButton;
    QRadioButton* unreachRadioButton;
    QPushButton* NextPushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void selecteIcmpType();

protected:
    QVBoxLayout* layout226;
    QSpacerItem* spacer205;
    QVBoxLayout* icmpbuttonGroupLayout;
    QVBoxLayout* layout190;
    QHBoxLayout* layout191;
    QSpacerItem* spacer188;

protected slots:
    virtual void languageChange();

};

#endif // ICMPTYPEFORM_H
