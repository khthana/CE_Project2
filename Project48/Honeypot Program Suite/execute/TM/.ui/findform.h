/****************************************************************************
** Form interface generated from reading ui file 'findform.ui'
**
** Created: พ. ธ.ค. 21 20:09:06 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef FINDFORM_H
#define FINDFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;
class QLineEdit;
class QPushButton;

class FindForm : public QDialog
{
    Q_OBJECT

public:
    FindForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~FindForm();

    QLabel* textLabel1;
    QLineEdit* findEdit;
    QPushButton* okButton;
    QPushButton* cancelButton;

public slots:
    virtual void dataChange();

protected:
    QVBoxLayout* FindFormLayout;
    QVBoxLayout* layout13;
    QHBoxLayout* layout10;
    QHBoxLayout* layout12;
    QSpacerItem* spacer3;

protected slots:
    virtual void languageChange();

private:
    void init();

};

#endif // FINDFORM_H
