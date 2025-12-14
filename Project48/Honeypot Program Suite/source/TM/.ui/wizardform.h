/****************************************************************************
** Form interface generated from reading ui file 'wizardform.ui'
**
** Created: Tue Jan 31 12:19:57 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef WIZARDFORM_H
#define WIZARDFORM_H

#include <qvariant.h>
#include <qwizard.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QWidget;
class QPushButton;
class QLabel;
class QLineEdit;
class QButtonGroup;
class QComboBox;
class QListBox;
class QListBoxItem;

class WizardForm : public QWizard
{
    Q_OBJECT

public:
    WizardForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~WizardForm();

    QWidget* WizardPage;
    QPushButton* savePath;
    QLabel* textLabel1;
    QLabel* textLabel2;
    QLineEdit* confPath;
    QLabel* textLabel3;
    QLineEdit* rulePath;
    QLineEdit* cagePath;
    QPushButton* resetPath;
    QWidget* WizardPage_2;
    QButtonGroup* connectbuttonGroup;
    QLabel* textLabel11;
    QLabel* textLabel5;
    QLabel* textLabel7;
    QLabel* textLabel6;
    QLineEdit* nameLineEdit;
    QComboBox* driverComboBox;
    QLineEdit* dbnameLineEdit;
    QLineEdit* usernameLineEdit;
    QLineEdit* passwordLineEdit;
    QLabel* textLabel8;
    QLabel* textLabel9;
    QLabel* textLabel10;
    QLineEdit* hostnameLineEdit;
    QLineEdit* portLineEdit;
    QPushButton* editPushButton;
    QListBox* dbListBox;

public slots:
    virtual void checkInput();
    virtual void saveConfig();
    virtual void datachange();
    virtual void editdb();

protected:
    QGridLayout* layout3;
    QGridLayout* layout2;
    QGridLayout* connectbuttonGroupLayout;

protected slots:
    virtual void languageChange();

private:
    void init();

};

#endif // WIZARDFORM_H
