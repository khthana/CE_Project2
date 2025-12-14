#include <qapplication.h>
#include "firstform.h"

int main( int argc, char ** argv )
{
    QApplication a( argc, argv );
    firstForm w;
    w.show();
    a.connect( &a, SIGNAL( lastWindowClosed() ), &a, SLOT( quit() ) );
    return a.exec();
}
