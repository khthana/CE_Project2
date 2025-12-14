/****************************************************************************
** ui.h extension file, included from the uic-generated form implementation.
**
** If you want to add, delete, or rename functions or slots, use
** Qt Designer to update this file, preserving your code.
**
** You should not define a constructor or destructor in this file.
** Instead, write your code in functions called init() and destroy().
** These will automatically be called by the form's constructor and
** destructor.
*****************************************************************************/

#include "arp_form.h"
#include "icmptypeform.h"
#include "tcpform.h"
#include "udpform.h"
#include "smurfform.h"
#include "syncfloodform.h" 

void templateForm::ArpFunc()
{
    ARP_Form o;
    o.show();   
    o.exec();
}


void templateForm::tcpFunc()
{
      tcpForm o;
      o.show();   
      o.exec();
}

void templateForm::udpFunc()
{
    udpForm o;
    o.show();   
    o.exec();
}

void templateForm::syncfloodFunc()
{
    syncfloodForm o;
    o.show();  
    o.exec();
}

void templateForm::smurfFunc()
{
    smurfForm o;
    o.show();   
    o.exec();
}

void templateForm::icmpFunc()
{
     icmpTypeForm o;
    o.show();   
    o.exec();
}
