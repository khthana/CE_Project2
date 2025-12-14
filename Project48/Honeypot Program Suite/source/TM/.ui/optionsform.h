/****************************************************************************
** Form interface generated from reading ui file 'optionsform.ui'
**
** Created: Tue Jan 3 21:17:19 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.4   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef OPTIONSFORM_H
#define OPTIONSFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;
class QPushButton;

class OptionsForm : public QDialog
{
    Q_OBJECT

public:
    OptionsForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~OptionsForm();

    QLabel* textLabel3;
    QPushButton* yesButton;
    QPushButton* noButton;

public slots:
    virtual bool regis();
    virtual bool noregis();

protected:
    QVBoxLayout* OptionsFormLayout;
    QVBoxLayout* layout140;
    QHBoxLayout* layout139;
    QSpacerItem* spacer16;
    QSpacerItem* spacer45;

protected slots:
    virtual void languageChange();

};

#endif // OPTIONSFORM_H
