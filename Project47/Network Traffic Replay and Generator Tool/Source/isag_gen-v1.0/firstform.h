/****************************************************************************
** Form interface generated from reading ui file 'firstform.ui'
**
** Created: Thu Jan 27 19:27:40 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
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
class QFrame;
class QButtonGroup;
class QRadioButton;
class QPushButton;
class QGroupBox;
class QLineEdit;
class QLabel;
class QComboBox;
class QTable;

class firstForm : public QMainWindow
{
    Q_OBJECT

public:
    firstForm( QWidget* parent = 0, const char* name = 0, WFlags fl = WType_TopLevel );
    ~firstForm();

    QWidgetStack* functionWidgetStack;
    QWidget* generatePage;
    QFrame* frame11;
    QButtonGroup* generatePacketButtonGroup;
    QRadioButton* templateRadioButton;
    QRadioButton* configFileRadioButton;
    QPushButton* acceptPushButton;
    QPushButton* ExitpushButton;
    QWidget* replayPage;
    QGroupBox* replayGroupBox;
    QLineEdit* fileLineEdit1;
    QPushButton* browsePushButton1;
    QButtonGroup* buttonGroup3;
    QLabel* textLabel1;
    QComboBox* patturnComboBox;
    QLabel* textLabel1_2_2;
    QLineEdit* lineEdit_Replay_inf;
    QLabel* iptextLabel;
    QLineEdit* ipLineEdit;
    QLabel* textLabel2;
    QLineEdit* listNumberLineEdit;
    QLabel* textLabel3_3;
    QComboBox* protocolComboBox;
    QButtonGroup* buttonGroup4;
    QRadioButton* matchRadioButton;
    QRadioButton* nMatchRadioButton;
    QButtonGroup* changeIPGroup;
    QLineEdit* sIPLineEdit;
    QLineEdit* dIPLineEdit;
    QLabel* textLabel3_2;
    QLabel* textLabel3;
    QButtonGroup* buttonGroup2;
    QRadioButton* normalRadioButton;
    QRadioButton* fastRadioButton;
    QPushButton* sendPushButton;
    QPushButton* showButton_2;
    QPushButton* cancelPushButton;
    QTable* tableResult;
    QWidget* capturePage;
    QGroupBox* groupBox35;
    QPushButton* showButton;
    QPushButton* ButtonExit;
    QLineEdit* fileLineEdit2;
    QPushButton* browsePushButton2;
    QLabel* textLabel1_2;
    QLineEdit* lineEdit_Capture_inf;
    QLabel* textLabel2_2;
    QPushButton* startButton;
    QTable* capturetable;
    QMenuBar *MenuBar;
    QPopupMenu *fileMenu;
    QPopupMenu *Function;
    QPopupMenu *helpMenu;
    QToolBar *toolBar;
    QAction* fileOpenAction;
    QAction* fileSaveAction;
    QAction* fileSaveAsAction;
    QAction* fileExitAction;
    QAction* helpAboutAction;
    QActionGroup* functionActionGroup;
    QAction* generateAction;
    QAction* replayAction;
    QAction* captureAction;
    QAction* Action;
    QAction* Action_2;
    QAction* Action_3;
    QAction* Action_4;
    QAction* Action_5;
    QAction* Action_6;
    QAction* Action_7;
    QAction* Action_8;
    QAction* functionnew_itemAction;
    QAction* separatornew_itemAction;
    QAction* Action_9;
    QAction* Action_10;
    QAction* separatornew_itemAction_2;

public slots:
    virtual void fileOpen();
    virtual void fileOpen2();
    virtual void load( const QString & fileName );
    virtual void fileSave();
    virtual void fileSaveAs();
    virtual void fileExit();
    virtual void helpAbout();
    virtual void changeFunction( QAction * action );
    virtual void ChangeMode();
    virtual void showReplay();
    virtual void ModeChange();
    virtual void fileNameChanged( const QString & );
    virtual void ShowCapture();
    virtual void clickTable( int row, int col );
    virtual void startCapture();
    virtual void Showprogress();
    virtual void ShowCaptureprogress();
    virtual void displayshow();

protected:
    QString filename;

    QGridLayout* firstFormLayout;
    QGridLayout* generatePageLayout;
    QVBoxLayout* layout81;
    QSpacerItem* spacer49;
    QHBoxLayout* layout80;
    QSpacerItem* spacer43;
    QSpacerItem* spacer44;
    QHBoxLayout* layout65;
    QSpacerItem* spacer5;
    QSpacerItem* spacer41;
    QHBoxLayout* replayPageLayout;
    QGridLayout* replayGroupBoxLayout;
    QVBoxLayout* layout99;
    QHBoxLayout* layout48;
    QHBoxLayout* layout98;
    QGridLayout* buttonGroup3Layout;
    QSpacerItem* spacer107;
    QSpacerItem* spacer108;
    QHBoxLayout* layout21;
    QHBoxLayout* layout95;
    QSpacerItem* spacer103;
    QHBoxLayout* layout97;
    QSpacerItem* spacer32;
    QVBoxLayout* layout113;
    QSpacerItem* spacer104;
    QHBoxLayout* layout49;
    QVBoxLayout* layout50;
    QGridLayout* buttonGroup4Layout;
    QVBoxLayout* layout91;
    QSpacerItem* spacer102;
    QGridLayout* buttonGroup2Layout;
    QVBoxLayout* layout90;
    QGridLayout* capturePageLayout;
    QGridLayout* groupBox35Layout;
    QVBoxLayout* layout114;
    QHBoxLayout* layout118;
    QHBoxLayout* layout120;
    QSpacerItem* spacer109;
    QHBoxLayout* layout106;
    QHBoxLayout* layout119;

protected slots:
    virtual void languageChange();

};

#endif // FIRSTFORM_H
