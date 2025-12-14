/****************************************************************************
** Form interface generated from reading ui file 'udpform.ui'
**
** Created: Thu Jan 27 19:39:32 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef UDPFORM_H
#define UDPFORM_H

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

class udpForm : public QDialog
{
    Q_OBJECT

public:
    udpForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~udpForm();

    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;
    QGroupBox* utpGroupBox;
    QLabel* devicetextLabel;
    QLabel* sIPtextLabel;
    QLabel* dIPtextLabel;
    QLabel* sPortTextLabel;
    QLabel* dPortTextLabel;
    QLabel* payloadTextLabel;
    QLineEdit* deviceLineEdit;
    QLineEdit* sourceIPLineEdit;
    QLineEdit* desIPLineEdit;
    QLineEdit* sPortLineEdit;
    QLineEdit* dPortLineEdit;
    QLineEdit* numberPacketlineEdit;

public slots:
    virtual void GenerateUDP();
    virtual void progressudp();

protected:
    QGridLayout* udpFormLayout;
    QGridLayout* layout127;
    QSpacerItem* spacer30;
    QHBoxLayout* layout40;
    QSpacerItem* spacer28;
    QHBoxLayout* layout39;
    QGridLayout* utpGroupBoxLayout;

protected slots:
    virtual void languageChange();

};

#endif // UDPFORM_H
