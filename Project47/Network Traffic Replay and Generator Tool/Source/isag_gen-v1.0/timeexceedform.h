/****************************************************************************
** Form interface generated from reading ui file 'timeexceedform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef TIMEEXCEEDFORM_H
#define TIMEEXCEEDFORM_H

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

class timeexceedForm : public QDialog
{
    Q_OBJECT

public:
    timeexceedForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~timeexceedForm();

    QGroupBox* timeexceedGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLabel* dIPTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* countTextLabel;
    QLineEdit* numberPacketlineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateTimeExceed();
    virtual void progresstimeex();

protected:
    QGridLayout* timeexceedFormLayout;
    QVBoxLayout* layout89;
    QSpacerItem* spacer214;
    QGridLayout* timeexceedGroupBoxLayout;
    QVBoxLayout* layout186;
    QHBoxLayout* layout185;
    QHBoxLayout* layout236;
    QHBoxLayout* layout237;
    QHBoxLayout* layout70;
    QHBoxLayout* layout235;
    QSpacerItem* spacer211;
    QHBoxLayout* layout234;

protected slots:
    virtual void languageChange();

};

#endif // TIMEEXCEEDFORM_H
