#include <qapplication.h>
#include "honeywallmm.h"
#include "userpass.h"

int main( int argc, char ** argv )
{
    QApplication a( argc, argv );
    HoneywallMM h;
    UserPass u;
    int chk = 0;  
    chk = u.exec();
    if (!chk && u.getFlag()) 
    {
       h.show();
       a.connect( &a, SIGNAL( lastWindowClosed() ), &a, SLOT( quit() ) );
       return a.exec();
   } 
}
