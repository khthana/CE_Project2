/****************************************************************************
** Form interface generated from reading ui file 'formTest.ui'
**
** Created: Thu Jan 13 09:16:29 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef FORM2_H
#define FORM2_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class KTextBrowser;

class Form2 : public QDialog
{
    Q_OBJECT

public:
    Form2( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~Form2();

    KTextBrowser* kTextBrowser1;

protected:

protected slots:
    virtual void languageChange();

};

#endif // FORM2_H
