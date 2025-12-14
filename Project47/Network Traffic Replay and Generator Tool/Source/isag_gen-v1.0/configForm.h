/****************************************************************************
** Form interface generated from reading ui file 'configForm.ui'
**
** Created: Wed Jan 26 12:26:42 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef CONFIGFORM_H
#define CONFIGFORM_H

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
class QFrame;
class QTextEdit;
class QLineEdit;
class QPushButton;

class ConfigForm : public QMainWindow
{
    Q_OBJECT

public:
    ConfigForm( QWidget* parent = 0, const char* name = 0, WFlags fl = WType_TopLevel );
    ~ConfigForm();

    QFrame* frameEdit;
    QTextEdit* textEdit;
    QLineEdit* fileConfLineEdit;
    QPushButton* browseConfPushButton;
    QPushButton* GenerateConfButton;
    QPushButton* cancleButton;
    QMenuBar *MenuBar;
    QPopupMenu *fileMenu;
    QPopupMenu *editMenu;
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

    virtual int saveAndContinue( const QString & action );

public slots:
    virtual void fileNew();
    virtual void fileOpen();
    virtual void fileOpen2();
    virtual void load( const QString & fileName );
    virtual void fileSave();
    virtual void fileSaveAs();
    virtual void filePrint();
    virtual void fileExit();
    virtual void editUndo();
    virtual void editRedo();
    virtual void editCut();
    virtual void editCopy();
    virtual void editPaste();
    virtual void GenerateConfig();
    virtual void FileNameSelected( const QString & fileName );
    virtual void ConfigProgress();

protected:
    QGridLayout* ConfigFormLayout;
    QGridLayout* frameEditLayout;
    QHBoxLayout* layout9;
    QHBoxLayout* layout203_2;

protected slots:
    virtual void languageChange();

private:
    void init();

};

#endif // CONFIGFORM_H
