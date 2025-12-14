/****************************************************************************
** Form interface generated from reading ui file 'honeywallmm.ui'
**
** Created: Tue Jan 31 22:39:38 2006
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.5   edited Aug 31 12:13 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef HONEYWALLMM_H
#define HONEYWALLMM_H

#include <qvariant.h>
#include <qdialog.h>
#include "wizardform.h"
#include "aboutdialog.h"

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QSplitter;
class QFrame;
class QPushButton;
class QTabWidget;
class QWidget;
class QLabel;
class QListBox;
class QListBoxItem;
class QCheckBox;
class QSpinBox;
class QLineEdit;
class QComboBox;
class QTable;
class QGroupBox;

class HoneywallMM : public QDialog
{
    Q_OBJECT

public:
    HoneywallMM( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~HoneywallMM();

    QSplitter* splitter3;
    QFrame* frame9;
    QPushButton* configPushButton;
    QFrame* frame9_2;
    QPushButton* refreshPushButton;
    QFrame* frame8_3;
    QPushButton* aboutPushButton;
    QTabWidget* tabPage;
    QWidget* statusPage;
    QFrame* line3;
    QLabel* pixmapLabel2;
    QLabel* textLabel17;
    QFrame* frame20;
    QLabel* textLabel12_3;
    QLabel* textLabel13_3_2;
    QLabel* textLabel13_3;
    QLabel* cage3Status;
    QLabel* cage2Status;
    QLabel* nameCage3;
    QLabel* hostNametextLabel1;
    QLabel* cage1Status;
    QLabel* nameCage2;
    QLabel* hostNametextLabel3;
    QLabel* hostNametextLabel2;
    QLabel* nameCage1;
    QPushButton* cage1SuspendButton;
    QPushButton* cage3StartButton;
    QPushButton* cage3SuspendButton;
    QPushButton* cage2SuspendButton;
    QPushButton* cage1StartButton;
    QPushButton* cage2StartButton;
    QLabel* textLabel17_2;
    QLabel* pixmapLabel1;
    QFrame* frame18;
    QLabel* textLabel16;
    QLabel* textLabel12;
    QLabel* textLabel13;
    QLabel* hostnameLabel;
    QLabel* textLabel15_3;
    QLabel* h1Status;
    QPushButton* h1StopButton;
    QPushButton* h1StartButton;
    QWidget* rulePage;
    QListBox* RuleChoiceListbox;
    QPushButton* SelectRuleButton;
    QPushButton* UnselectRuleButton;
    QListBox* selectRuleListbox;
    QPushButton* RuleOkButton;
    QPushButton* RuleCancleButton;
    QLabel* textLabel1_3;
    QLabel* textLabel2_4;
    QWidget* managePage;
    QFrame* frame4;
    QCheckBox* numCheck;
    QCheckBox* groupCheck;
    QCheckBox* ownCheck;
    QCheckBox* passCheck;
    QCheckBox* modeCheck;
    QSpinBox* numUser;
    QSpinBox* groupRoot;
    QLineEdit* ownerPass;
    QComboBox* passCh;
    QComboBox* modePass;
    QPushButton* saveConfigButton;
    QPushButton* resetConfigButton;
    QLabel* textLabel5;
    QFrame* frame24;
    QLabel* textLabel3;
    QLineEdit* pathCage;
    QPushButton* PushButtonNext;
    QPushButton* PushButtonPrev;
    QPushButton* PushButtonLast;
    QPushButton* PushButtonFirst;
    QLabel* textLabel4;
    QLabel* textLabel1;
    QLabel* textLabel2;
    QLineEdit* nameCage;
    QLineEdit* ipCage;
    QLabel* textLabel6;
    QPushButton* PushButtonDelete;
    QPushButton* PushButtonClear;
    QPushButton* PushButtonInsert;
    QComboBox* hostnamecomboBox;
    QWidget* controlPage;
    QLabel* textLabel1_2;
    QTable* cageTable;
    QWidget* eventPage;
    QGroupBox* snort_inline_log;
    QCheckBox* ip_src_checkBox;
    QLineEdit* ip_src_lineEdit;
    QCheckBox* ip_dst_checkBox;
    QLineEdit* ip_dst_lineEdit;
    QCheckBox* sig_name_checkBox;
    QLineEdit* sig_lineEdit;
    QPushButton* snortFind;
    QTable* snortLogTable;
    QGroupBox* samhain_log;
    QCheckBox* path_checkBox;
    QLineEdit* path_lineEdit;
    QCheckBox* owner_old_checkBox;
    QLineEdit* owner_old_lineEdit;
    QCheckBox* owner_new_checkBox;
    QLineEdit* owner_new_lineEdit;
    QTable* samhainLogTable;
    QPushButton* samhainFind;
    QGroupBox* sebek_log;
    QCheckBox* command_checkBox1;
    QLineEdit* command_lineEdit1;
    QCheckBox* command_checkBox2;
    QLineEdit* command_lineEdit2;
    QCheckBox* command_checkBox3;
    QLineEdit* command_lineEdit3;
    QTable* sebekLogTable;
    QPushButton* sebekFind;
    QComboBox* LogcomboBox2;
    QComboBox* LogcomboBox;
    QLabel* textLabel2_3;
    QLabel* textLabel3_2;

public slots:
    virtual void startcage1();
    virtual void suspendcage1();
    virtual void startcage2();
    virtual void suspendcage2();
    virtual void startcage3();
    virtual void suspendcage3();
    virtual void starth1();
    virtual void stoph1();
    virtual void dataChange();
    virtual void copyVmware();
    virtual void regisCage();
    virtual void delCage();
    virtual void createCageConfig();
    virtual void applyRule();
    virtual void clearRule();
    virtual void selectRule();
    virtual void removeRule();
    virtual void showLog();
    virtual void showCageInformation();
    virtual void showCageTable();
    virtual void querySnortDB( QString sqlcmd );
    virtual void querySamhainDB( QString sqlcmd );
    virtual void querySebekDB( QString sqlcmd );
    virtual void queryCageDB( QString sqlcmd );
    virtual void checkButton();
    virtual void chageCageState();
    virtual void configTartarus();
    virtual void about();
    virtual void refresh();

protected:
    QGridLayout* layout25;
    QVBoxLayout* layout28;
    QGridLayout* layout27;
    QGridLayout* layout26;
    QVBoxLayout* layout66;
    QSpacerItem* spacer29;
    QSpacerItem* spacer27_2;
    QSpacerItem* spacer30;
    QVBoxLayout* layout48;
    QVBoxLayout* layout62;
    QSpacerItem* spacer26_2;
    QVBoxLayout* layout47;
    QGridLayout* frame4Layout;
    QHBoxLayout* layout21;
    QVBoxLayout* layout19;
    QVBoxLayout* layout20;
    QVBoxLayout* layout279;
    QGridLayout* layout31_2;
    QHBoxLayout* layout50_2;
    QHBoxLayout* layout19_3;
    QVBoxLayout* layout14_2;
    QVBoxLayout* layout15_2;
    QVBoxLayout* layout16_2;
    QVBoxLayout* layout17_3;
    QGridLayout* layout32_3;
    QHBoxLayout* layout38_3;
    QVBoxLayout* layout36_4;
    QVBoxLayout* layout35_4;
    QVBoxLayout* layout34_4;
    QHBoxLayout* layout38_2_2;
    QVBoxLayout* layout36_2_2;
    QVBoxLayout* layout35_2_2;
    QVBoxLayout* layout34_2_2;

protected slots:
    virtual void languageChange();

private:
    void init();
    void destroy();

};

#endif // HONEYWALLMM_H
