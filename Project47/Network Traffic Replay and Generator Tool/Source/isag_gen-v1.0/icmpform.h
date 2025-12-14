/****************************************************************************
** Form interface generated from reading ui file 'icmpform.ui'
**
** Created: Thu Jan 13 09:16:29 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ICMPECHOREQFORM_H
#define ICMPECHOREQFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QPushButton;
class QGroupBox;
class QLabel;
class QLineEdit;

class icmpEchoReqForm : public QDialog
{
    Q_OBJECT

public:
    icmpEchoReqForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~icmpEchoReqForm();

    QPushButton* backPushButton;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;
    QGroupBox* icmpEchoReqGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLineEdit* dIPLineEdit;
    QLabel* dIPTextLabel;
    QLineEdit* countLineEdit;
    QLabel* countTextLabel;

public slots:
    virtual void GenerateICMP();

protected:
    QHBoxLayout* layout53;
    QSpacerItem* spacer46;
    QGridLayout* icmpEchoReqGroupBoxLayout;
    QSpacerItem* spacer42;
    QSpacerItem* spacer43;
    QSpacerItem* spacer44;
    QSpacerItem* spacer45;

protected slots:
    virtual void languageChange();

};

#endif // ICMPECHOREQFORM_H
