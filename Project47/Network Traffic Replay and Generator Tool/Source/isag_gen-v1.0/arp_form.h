/****************************************************************************
** Form interface generated from reading ui file 'arp_form.ui'
**
** Created: Thu Jan 27 19:27:39 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ARP_FORM_H
#define ARP_FORM_H

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
class QComboBox;

class ARP_Form : public QDialog
{
    Q_OBJECT

public:
    ARP_Form( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~ARP_Form();

    QPushButton* Button_Arp_Generate;
    QPushButton* Button_Arp_cancel;
    QGroupBox* arpGroupBox;
    QLabel* textLabel3_3;
    QLineEdit* lineEdit_Arp_Smac1;
    QLineEdit* lineEdit_Arp_Smac2;
    QLineEdit* lineEdit_Arp_Smac3;
    QLineEdit* lineEdit_Arp_Smac4;
    QLineEdit* lineEdit_Arp_Smac5;
    QLineEdit* lineEdit_Arp_Smac6;
    QLabel* textLabel3_4;
    QLineEdit* lineEdit_Arp_Dmac1;
    QLineEdit* lineEdit_Arp_Dmac2;
    QLineEdit* lineEdit_Arp_Dmac3;
    QLineEdit* lineEdit_Arp_Dmac4;
    QLineEdit* lineEdit_Arp_Dmac5;
    QLineEdit* lineEdit_Arp_Dmac6;
    QLabel* textLabel2;
    QComboBox* comboBox_Arp_Type;
    QLabel* textLabel3;
    QLineEdit* lineEdit_Arp_Sip;
    QLabel* textLabel4;
    QLineEdit* lineEdit_Arp_Device;
    QLabel* textLabel3_2;
    QLineEdit* lineEdit_Arp_Dip;
    QLabel* textLabel1;
    QLineEdit* numberPacketlineEdit;

public slots:
    virtual void set_value();
    virtual void ProgressArp();

protected:
    QGridLayout* ARP_FormLayout;
    QSpacerItem* spacer114;
    QHBoxLayout* layout85;
    QSpacerItem* spacer113;
    QHBoxLayout* layout84;
    QGridLayout* arpGroupBoxLayout;
    QHBoxLayout* layout105;
    QHBoxLayout* layout107;
    QHBoxLayout* layout112;
    QSpacerItem* spacer94;
    QHBoxLayout* layout116;
    QSpacerItem* spacer96;
    QHBoxLayout* layout115;
    QSpacerItem* spacer95;
    QHBoxLayout* layout117;
    QSpacerItem* spacer97;
    QHBoxLayout* layout118;
    QSpacerItem* spacer98;

protected slots:
    virtual void languageChange();

};

#endif // ARP_FORM_H
