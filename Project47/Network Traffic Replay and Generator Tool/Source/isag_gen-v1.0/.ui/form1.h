/****************************************************************************
** Form interface generated from reading ui file 'form1.ui'
**
** Created: Wed Dec 1 14:57:18 2004
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.3   edited Nov 24 2003 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef FIRSTFORM_H
#define FIRSTFORM_H

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
class QWidgetStack;
class QWidget;
class QButtonGroup;
class QRadioButton;
class QPushButton;
class QCheckBox;
class QGroupBox;
class QLineEdit;

class firstForm : public QMainWindow
{
    Q_OBJECT

public:
    firstForm( QWidget* parent = 0, const char* name = 0, WFlags fl = WType_TopLevel );
    ~firstForm();

    QWidgetStack* functionWidgetStack;
    QWidget* generatePage;
    QButtonGroup* generatePacketButtonGroup;
    QRadioButton* templateRadioButton;
    QRadioButton* configFileRadioButton;
    QPushButton* acceptPushButton;
    QWidget* replayPage;
    QCheckBox* checkBox1;
    QGroupBox* replayGroupBox;
    QLineEdit* fileLineEdit1;
    QPushButton* browsePushButton1;
    QLineEdit* fileLineEdit2;
    QPushButton* browsePushButton2;
    QLineEdit* fileLineEdit3;
    QPushButton* browsePushButton3;
    QPushButton* sendPushButton;
    QPushButton* cancelPushButton;
    QMenuBar *MenuBar;
    QPopupMenu *fileMenu;
    QPopupMenu *editMenu;
    QPopupMenu *Function;
    QPopupMenu *helpMenu;
    QToolBar *toolBar;
    QAction* fileOpenAction;
    QAction* fileSaveAction;
    QAction* fileSaveAsAction;
    QAction* fileExitAction;
    QAction* editUndoAction;
    QAction* editRedoAction;
    QAction* editFindAction;
    QAction* helpContentsAction;
    QAction* helpIndexAction;
    QAction* helpAboutAction;
    QActionGroup* functionActionGroup;
    QAction* generateAction;
    QAction* replayAction;
    QAction* Action;
    QAction* Action_2;
    QAction* Action_3;
    QAction* Action_4;
    QAction* Action_5;
    QAction* Action_6;

public slots:
    virtual void fileOpen();
    virtual void load( const QString & fileName );
    virtual void fileSave();
    virtual void fileSaveAs();
    virtual void fileExit();
    virtual void editUndo();
    virtual void editRedo();
    virtual void editPaste();
    virtual void editFind();
    virtual void helpIndex();
    virtual void helpContents();
    virtual void helpAbout();
    virtual void changeFunction( QAction * action );
    virtual void changeMode();
    virtual void showReplay();

protected:
    QString filename;

    QVBoxLayout* firstFormLayout;
    QGridLayout* replayGroupBoxLayout;
    QVBoxLayout* layout206;
    QSpacerItem* spacer141;
    QHBoxLayout* layout203;
    QHBoxLayout* layout204;
    QHBoxLayout* layout205;
    QHBoxLayout* layout127;
    QSpacerItem* spacer140;
    QHBoxLayout* layout123;

protected slots:
    virtual void languageChange();

};

#endif // FIRSTFORM_H
