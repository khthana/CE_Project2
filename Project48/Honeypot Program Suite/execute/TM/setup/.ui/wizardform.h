/****************************************************************************
** Form interface generated from reading ui file 'wizardform.ui'
**
** Created: Sun Jan 29 15:42:22 2006
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
class QLabel;
class QPushButton;
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
    QLabel* textLabel1;
    QPushButton* resetPath;
    QLineEdit* rulePath;
    QLabel* textLabel3;
    QLabel* textLabel2;
    QLineEdit* cagePath;
    QPushButton* savePath;
    QLineEdit* confPath;
    QLabel* textLabel1_2;
    QLineEdit* ipHoneywall;
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
    QPushButton* connectPushButton;
    QListBox* dbListBox;
    QPushButton* newPushButton;
    QPushButton* delPushButton;

public slots:
    virtual void checkInput();
    virtual void newConnect();
    virtual void connectdb();
    virtual void disconnectdb();
    virtual void saveConfig();
    virtual void datachange();
    virtual void deldb( QString dbname );
    virtual void editdb( QString name );

protected:
    QGridLayout* connectbuttonGroupLayout;

protected slots:
    virtual void languageChange();

private:
    void init();
    virtual void destroy();

};

#endif // WIZARDFORM_H
