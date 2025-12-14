/****************************************************************************
** Form interface generated from reading ui file 'templateform.ui'
**
** Created: Wed Jan 26 14:00:58 2005
**      by: The User Interface Compiler ($Id: qt/main.cpp   3.3.2   edited Nov 24 13:47 $)
**
** WARNING! All changes made in this file will be lost!
****************************************************************************/

#ifndef TEMPLATEFORM_H
#define TEMPLATEFORM_H

#include <qvariant.h>
#include <qdialog.h>

class QVBoxLayout;
class QHBoxLayout;
class QGridLayout;
class QSpacerItem;
class QGroupBox;
class QPushButton;

class templateForm : public QDialog
{
    Q_OBJECT

public:
    templateForm( QWidget* parent = 0, const char* name = 0, bool modal = FALSE, WFlags fl = 0 );
    ~templateForm();

    QGroupBox* groupBox13;
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

public slots:
    virtual void ArpFunc();
    virtual void tcpFunc();
    virtual void udpFunc();
    virtual void syncfloodFunc();
    virtual void smurfFunc();
    virtual void icmpFunc();

protected:
    QGridLayout* templateFormLayout;
    QGridLayout* groupBox13Layout;
    QGridLayout* formatGroupBoxLayout;
    QVBoxLayout* layout73;
    QVBoxLayout* layout178;
    QSpacerItem* spacer47;
    QGridLayout* attackGroupBoxLayout;
    QHBoxLayout* layout177;
    QSpacerItem* spacer154;

protected slots:
    virtual void languageChange();

};

#endif // TEMPLATEFORM_H
