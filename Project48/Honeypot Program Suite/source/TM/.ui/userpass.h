/****************************************************************************
** Form interface generated from reading ui file 'userpass.ui'
**
** Created: Tue Jan 31 10:49:44 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef USERPASS_H
#define USERPASS_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;
class QLineEdit;
class QPushButton;

class UserPass : public QDialog
{
    Q_OBJECT

public:
    UserPass( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~UserPass();

    QLabel* textLabel1;
    QLabel* textLabel2;
    QLineEdit* userEdit;
    QLineEdit* passEdit;
    QPushButton* loginButton;
    QPushButton* cancleLogin;

    int getFlag();

public slots:
    virtual void dataChange();
    virtual void chkUser();
    virtual void cancelLogin();

protected:
    QVBoxLayout* UserPassLayout;
    QHBoxLayout* layout26;
    QSpacerItem* spacer24;
    QSpacerItem* spacer26;
    QGridLayout* layout25;
    QVBoxLayout* layout24;
    QVBoxLayout* layout23;
    QHBoxLayout* layout21;
    QSpacerItem* spacer21;
    QSpacerItem* spacer22;
    QHBoxLayout* layout20;

protected slots:
    virtual void languageChange();

private:
    int flag;

    void init();

};

#endif // USERPASS_H
