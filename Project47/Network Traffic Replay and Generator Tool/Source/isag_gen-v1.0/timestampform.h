/****************************************************************************
** Form interface generated from reading ui file 'timestampform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef TIMESTAMPFORM_H
#define TIMESTAMPFORM_H

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

class timestampForm : public QDialog
{
    Q_OBJECT

public:
    timestampForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~timestampForm();

    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;
    QGroupBox* timestampGroupBox;
    QLabel* deviceTextLabel;
    QLineEdit* deviceLineEdit;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLabel* dIPTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* countTextLabel;
    QLineEdit* numberPacketlineEdit;

public slots:
    virtual void GenerateTimeStamp();
    virtual void progresstimestamp();

protected:
    QGridLayout* timestampFormLayout;
    QGridLayout* layout98;
    QSpacerItem* spacer214;
    QHBoxLayout* layout235;
    QSpacerItem* spacer211;
    QHBoxLayout* layout234;
    QGridLayout* timestampGroupBoxLayout;
    QVBoxLayout* layout195;
    QHBoxLayout* layout194;
    QHBoxLayout* layout236;
    QHBoxLayout* layout237;
    QHBoxLayout* layout78;

protected slots:
    virtual void languageChange();

};

#endif // TIMESTAMPFORM_H
