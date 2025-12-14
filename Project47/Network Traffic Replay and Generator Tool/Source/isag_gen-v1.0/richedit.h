/****************************************************************************
** Form interface generated from reading ui file 'richedit.ui'
**
** Created: Thu Jan 13 09:16:30 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef CONFIGUREFORM_H
#define CONFIGUREFORM_H

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
class QTextEdit;
class QComboBox;
class QSpinBox;

class configureForm : public QMainWindow
{
    Q_OBJECT

public:
    configureForm( QWidget* parent = 0, const char* name = 0, WFlags fl = WType_TopLevel );
    ~configureForm();

    QTextEdit* configtextEdit;
    QComboBox* fontComboBox;
    QSpinBox* SpinBox2;
    QMenuBar *menubar;
    QPopupMenu *fileMenu;
    QPopupMenu *editMenu;
    QPopupMenu *PopupMenu_2;
    QPopupMenu *helpMenu;
    QToolBar *toolBar;
    QToolBar *Toolbar;
    QAction* fileNewAction;
    QAction* fileOpenAction;
    QAction* fileSaveAction;
    QAction* fileSaveAsAction;
    QAction* fileExitAction;
    QAction* editUndoAction;
    QAction* editRedoAction;
    QAction* editCutAction;
    QAction* editCopyAction;
    QAction* editPasteAction;
    QAction* boldAction;
    QAction* italicAction;
    QAction* underlineAction;
    QActionGroup* alignActionGroup;
    QAction* leftAlignAction;
    QAction* rightAlignAction;
    QAction* centerAlignAction;

public slots:
    virtual void fileExit();
    virtual void fileNew();
    virtual void fileOpen();
    virtual void fileSave();
    virtual void fileSaveAs();
    virtual void helpAbout();
    virtual void helpContents();
    virtual void helpIndex();
    virtual void changeAlignment( QAction * align );
    virtual int saveAndContinue( const QString & action );

protected:
    QString fileName;

    QHBoxLayout* configureFormLayout;

protected slots:
    virtual void languageChange();

    virtual void init();


};

#endif // CONFIGUREFORM_H
