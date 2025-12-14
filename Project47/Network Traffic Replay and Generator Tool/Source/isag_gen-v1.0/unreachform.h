/****************************************************************************
** Form interface generated from reading ui file 'unreachform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef UNREACHFORM_H
#define UNREACHFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QGroupBox;
class QLabel;
class QLineEdit;
class QComboBox;
class QPushButton;

class unreachForm : public QDialog
{
    Q_OBJECT

public:
    unreachForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~unreachForm();

    QGroupBox* redirectGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QLabel* modeTextLabel;
    QComboBox* modeComboBox;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLabel* textLabel3_3_3;
    QLineEdit* lineEdit_Arp_Smac1_3;
    QLineEdit* lineEdit_Arp_Smac2_3;
    QLineEdit* lineEdit_Arp_Smac3_3;
    QLineEdit* lineEdit_Arp_Smac4_3;
    QLineEdit* lineEdit_Arp_Smac5_3;
    QLineEdit* lineEdit_Arp_Smac6_3;
    QLabel* dIPTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* textLabel3_4_3;
    QLineEdit* lineEdit_Arp_Dmac1_3;
    QLineEdit* lineEdit_Arp_Dmac2_3;
    QLineEdit* lineEdit_Arp_Dmac3_3;
    QLineEdit* lineEdit_Arp_Dmac4_3;
    QLineEdit* lineEdit_Arp_Dmac5_3;
    QLineEdit* lineEdit_Arp_Dmac6_3;
    QLabel* textLabel1_3;
    QLineEdit* numberPacketlineEdit_3;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateUnreach();
    virtual void ChangeMode();
    virtual void progressun();

protected:
    QGridLayout* unreachFormLayout;
    QVBoxLayout* layout210;
    QSpacerItem* spacer210;
    QGridLayout* redirectGroupBoxLayout;
    QVBoxLayout* layout209;
    QHBoxLayout* layout208;
    QHBoxLayout* layout269;
    QSpacerItem* spacer235;
    QHBoxLayout* layout227;
    QSpacerItem* spacer206;
    QHBoxLayout* layout98;
    QHBoxLayout* layout228;
    QSpacerItem* spacer207;
    QHBoxLayout* layout99;
    QHBoxLayout* layout100;
    QHBoxLayout* layout231;
    QSpacerItem* spacer209;
    QHBoxLayout* layout230;

protected slots:
    virtual void languageChange();

};

#endif // UNREACHFORM_H
