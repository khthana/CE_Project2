/****************************************************************************
** Form interface generated from reading ui file 'smurfform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef SMURFFORM_H
#define SMURFFORM_H

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

class smurfForm : public QDialog
{
    Q_OBJECT

public:
    smurfForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~smurfForm();

    QGroupBox* smurfGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* lineEdit_smurf_Device;
    QLabel* targetTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* countTextLabel;
    QLineEdit* numberPacketlineEdit;
    QLabel* amplifierTextLabel;
    QLineEdit* networkIPlineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateSmurf();
    virtual void progresssmurf();

protected:
    QGridLayout* smurfFormLayout;
    QVBoxLayout* layout54;
    QSpacerItem* spacer14;
    QGridLayout* smurfGroupBoxLayout;
    QVBoxLayout* layout52;
    QHBoxLayout* layout158;
    QSpacerItem* spacer139;
    QHBoxLayout* layout187;
    QHBoxLayout* layout189;
    QSpacerItem* spacer12;
    QHBoxLayout* layout190;
    QHBoxLayout* layout16;
    QSpacerItem* spacer13;
    QHBoxLayout* layout15;

protected slots:
    virtual void languageChange();

};

#endif // SMURFFORM_H
