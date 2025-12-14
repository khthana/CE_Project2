/****************************************************************************
** Form interface generated from reading ui file 'icmpechoreqform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
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
class QGroupBox;
class QLabel;
class QLineEdit;
class QPushButton;

class icmpEchoReqForm : public QDialog
{
    Q_OBJECT

public:
    icmpEchoReqForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~icmpEchoReqForm();

    QGroupBox* icmpEchoReqGroupBox;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLabel* dIPTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* countTextLabel;
    QLineEdit* numberPacketlineEdit;
    QLabel* payloadTextLabel;
    QLineEdit* payloadLineEdit;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateICMPReq();
    virtual void progressecho();

protected:
    QGridLayout* icmpEchoReqFormLayout;
    QVBoxLayout* layout70;
    QSpacerItem* spacer47;
    QGridLayout* icmpEchoReqGroupBoxLayout;
    QHBoxLayout* layout218;
    QSpacerItem* spacer43;
    QHBoxLayout* layout219;
    QSpacerItem* spacer44;
    QHBoxLayout* layout220;
    QSpacerItem* spacer45;
    QHBoxLayout* layout220_2;
    QSpacerItem* spacer45_2;
    QHBoxLayout* layout47;
    QSpacerItem* spacer42;
    QHBoxLayout* layout53;
    QSpacerItem* spacer46;

protected slots:
    virtual void languageChange();

};

#endif // ICMPECHOREQFORM_H
