#include <qthread.h> 
class MyThread : public QThread {

    public:
        int id;
        virtual void run();
        void setfile(char *);
        int getid();
    };

    
    
