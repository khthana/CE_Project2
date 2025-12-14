/****************************************************************************
** Form interface generated from reading ui file 'syncfloodform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef SYNCFLOODFORM_H
#define SYNCFLOODFORM_H

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

class syncfloodForm : public QDialog
{
    Q_OBJECT

public:
    syncfloodForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~syncfloodForm();

    QGroupBox* synfloodGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QLabel* targetTextLabel;
    QLineEdit* targetIPLineEdit;
    QLabel* dPortTextLabel;
    QLineEdit* dPortLineEdit;
    QLabel* numberPacketTextLabel;
    QLineEdit* numberPacketLineEdit;
    QLabel* numberPacketSendTextLabel;
    QLineEdit* numberBurstLineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateSyncflood();
    virtual void progresssyn();

protected:
    QGridLayout* syncfloodFormLayout;
    QVBoxLayout* layout43;
    QGridLayout* synfloodGroupBoxLayout;
    QVBoxLayout* layout42;
    QHBoxLayout* layout33;
    QSpacerItem* spacer144;
    QHBoxLayout* layout41;
    QHBoxLayout* layout170;
    QSpacerItem* spacer40;
    QHBoxLayout* layout36;
    QHBoxLayout* layout40;
    QVBoxLayout* layout38;
    QSpacerItem* spacer9;
    QHBoxLayout* layout13;
    QSpacerItem* spacer8;
    QHBoxLayout* layout12;

protected slots:
    virtual void languageChange();

};

#endif // SYNCFLOODFORM_H
