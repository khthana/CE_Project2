/****************************************************************************
** Form interface generated from reading ui file 'sending.ui'
**
** Created: Sun Jan 30 05:24:13 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef SENDING_H
#define SENDING_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;

class Sending : public QDialog
{
    Q_OBJECT

public:
    Sending( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~Sending();

    QLabel* sendLabel;

public slots:
    virtual void setTextLabel( char * str );

protected:

protected slots:
    virtual void languageChange();

};

#endif // SENDING_H
