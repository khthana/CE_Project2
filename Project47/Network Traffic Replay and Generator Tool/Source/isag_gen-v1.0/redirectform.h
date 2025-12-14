/****************************************************************************
** Form interface generated from reading ui file 'redirectform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef REDIRECTFORM_H
#define REDIRECTFORM_H

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

class redirectForm : public QDialog
{
    Q_OBJECT

public:
    redirectForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~redirectForm();

    QGroupBox* redirectGroupBox;
    QLabel* textLabel4;
    QLineEdit* lineEdit_redirect_Device;
    QLabel* sIPTextLabel;
    QLineEdit* sIPLineEdit;
    QLabel* dIPTextLabel;
    QLineEdit* dIPLineEdit;
    QLabel* gatewayIPTextLabel;
    QLineEdit* gatewayIPLineEdit;
    QLabel* countTextLabel;
    QLineEdit* numberPacketlineEdit;
    QPushButton* generatePushButton;
    QPushButton* cancelPushButton;

public slots:
    virtual void GenerateRedirect();
    virtual void progressredirect();

protected:
    QGridLayout* redirectFormLayout;
    QVBoxLayout* layout80;
    QSpacerItem* spacer210;
    QGridLayout* redirectGroupBoxLayout;
    QHBoxLayout* layout145;
    QHBoxLayout* layout146;
    QHBoxLayout* layout147;
    QHBoxLayout* layout148;
    QHBoxLayout* layout149;
    QHBoxLayout* layout231;
    QSpacerItem* spacer209;
    QHBoxLayout* layout230;

protected slots:
    virtual void languageChange();

};

#endif // REDIRECTFORM_H
