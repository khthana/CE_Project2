/****************************************************************************
** Form interface generated from reading ui file 'tcpform.ui'
**
** Created: Thu Jan 27 19:39:32 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef TCPFORM_H
#define TCPFORM_H

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

class tcpForm : public QDialog
{
    Q_OBJECT

public:
    tcpForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~tcpForm();

    QGroupBox* tcpGroupBox;
    QLabel* dPortTextLabel;
    QLabel* sPortTextLabel;
    QLabel* dIPTextLabe;
    QLabel* deviceTextLabel;
    QLabel* sIPTextLabel;
    QLineEdit* deviceLineEdit;
    QLineEdit* sourceIPLineEdit;
    QLineEdit* desIPLineEdit;
    QLineEdit* sPortLineEdit;
    QLineEdit* dPortLineEdit;
    QLabel* payloadTextLabel;
    QLineEdit* numberPacketlineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateTCP();
    virtual void progresstcp();

protected:
    QGridLayout* tcpFormLayout;
    QVBoxLayout* layout123;
    QSpacerItem* spacer30;
    QGridLayout* tcpGroupBoxLayout;
    QHBoxLayout* layout40;
    QSpacerItem* spacer28;
    QHBoxLayout* layout39;

protected slots:
    virtual void languageChange();

};

#endif // TCPFORM_H
