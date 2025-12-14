/****************************************************************************
** Form interface generated from reading ui file 'errorform.ui'
**
** Created: Wed Jan 26 12:26:42 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ERRORFORM_H
#define ERRORFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QGroupBox;
class QLabel;
class QPushButton;

class errorForm : public QDialog
{
    Q_OBJECT

public:
    errorForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~errorForm();

    QGroupBox* errorGroupBox;
    QLabel* errorLabel;
    QPushButton* okButton;

public slots:
    virtual void setTextLabel( char * str );

protected:
    QGridLayout* errorFormLayout;
    QGridLayout* errorGroupBoxLayout;
    QVBoxLayout* layout35;
    QHBoxLayout* layout6;
    QSpacerItem* spacer5;

protected slots:
    virtual void languageChange();

};

#endif // ERRORFORM_H
