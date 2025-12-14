/****************************************************************************
** Form interface generated from reading ui file 'aboutdialog.ui'
**
** Created: Tue Jan 31 22:39:38 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef ABOUTDIALOG_H
#define ABOUTDIALOG_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QLabel;
class QPushButton;
class QTabWidget;
class QWidget;
class QTextBrowser;

class AboutDialog : public QDialog
{
    Q_OBJECT

public:
    AboutDialog( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~AboutDialog();

    QLabel* textLabel1;
    QLabel* pixmapLabel1;
    QPushButton* closeAbout;
    QTabWidget* tabWidget4;
    QWidget* tab;
    QLabel* textLabel2;
    QWidget* tab_2;
    QTextBrowser* textBrowser1;
    QWidget* TabPage;
    QTextBrowser* textBrowser2;

protected:

protected slots:
    virtual void languageChange();

};

#endif // ABOUTDIALOG_H
