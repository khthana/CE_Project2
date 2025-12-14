/****************************************************************************
** Form interface generated from reading ui file 'main_form.ui'
**
** Created: Thu Nov 18 12:45:48 2004
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef MAIN_FORM_H
#define MAIN_FORM_H

#include <qvariant.h>
#include <qmainwindow.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QAction;
class QActionGroup;
class QToolBar;
class QPopupMenu;
class QGroupBox;
class QPushButton;

class Main_Form : public QMainWindow
{
    Q_OBJECT

public:
    Main_Form( QWidget* parent = 0, const char* name = 0, WFlags fl = WType_TopLevel );
    ~Main_Form();

    QGroupBox* formatGroupBox;
    QPushButton* Button_Arp;
    QPushButton* Button_ICMP;
    QPushButton* Button_Tcp;
    QPushButton* Button_Udp;
    QPushButton* Button_Dns;
    QGroupBox* attackGroupBox;
    QPushButton* Button_Synflood;
    QPushButton* Button_Smurf;
    QPushButton* Button_Quit;
    QMenuBar *MenuBar;
    QPopupMenu *fileMenu;
    QPopupMenu *editMenu;
    QPopupMenu *helpMenu;
    QToolBar *toolBar;
    QAction* fileNewAction;
    QAction* fileOpenAction;
    QAction* fileSaveAction;
    QAction* fileSaveAsAction;
    QAction* filePrintAction;
    QAction* fileExitAction;
    QAction* editUndoAction;
    QAction* editRedoAction;
    QAction* editCutAction;
    QAction* editCopyAction;
    QAction* editPasteAction;
    QAction* editFindAction;
    QAction* helpContentsAction;
    QAction* helpIndexAction;
    QAction* helpAboutAction;

public slots:
    virtual void fileNew();
    virtual void fileOpen();
    virtual void fileSave();
    virtual void fileSaveAs();
    virtual void filePrint();
    virtual void fileExit();
    virtual void editUndo();
    virtual void editRedo();
    virtual void editCut();
    virtual void editCopy();
    virtual void editPaste();
    virtual void editFind();
    virtual void helpIndex();
    virtual void helpContents();
    virtual void helpAbout();
    virtual void ArpForm();
    virtual void icmp_form();
    virtual void tcp_form();
    virtual void udp_form();
    virtual void smurf_form();
    virtual void syncflood_form();

protected:
    QVBoxLayout* formatGroupBoxLayout;
    QVBoxLayout* layout37;
    QVBoxLayout* attackGroupBoxLayout;
    QVBoxLayout* layout38;

protected slots:
    virtual void languageChange();

};

#endif // MAIN_FORM_H
