/****************************************************************************
** Form interface generated from reading ui file 'processform.ui'
**
** Created: Sat Jan 29 21:51:36 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef PROCESSFORM_H
#define PROCESSFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QPushButton;
class QLabel;

class processForm : public QDialog
{
    Q_OBJECT

public:
    processForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~processForm();

    QPushButton* stopButton;
    QLabel* textLabel1;

public slots:
    virtual void Process( char * str );
    virtual void stopProcess();
    virtual void setDisplayText( char * s );

protected:

protected slots:
    virtual void languageChange();

};

#endif // PROCESSFORM_H
