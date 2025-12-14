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

#include "icmpechoreqform.h"
#include "redirectform.h"
#include "timeexceedform.h"
#include "timestampform.h"
#include "unreachform.h"

void icmpTypeForm::selecteIcmpType()
{
      if (  echoreqRadioButton->isChecked())
    {
   icmpEchoReqForm o;
   o.show();
   o.exec();
    }
     else if ( redirectRadioButton->isChecked())
      {
  redirectForm o;
  o.show();  
  o.exec();
     }
    else if ( timeExceedRadioButton->isChecked())
    {
 timeexceedForm o;
 o.show(); 
              o.exec();
    }
     else if ( timeStampRadioButton->isChecked())
    {
  timestampForm o;
  o.show();  
  o.exec();
    }
     else
    {
  unreachForm o;
  o.show(); 
  o.exec();
    }

}
