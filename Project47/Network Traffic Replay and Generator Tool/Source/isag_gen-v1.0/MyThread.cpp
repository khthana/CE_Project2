#include "MyThread.h"
#include <stdio.h>


char capture[1000];

void MyThread::run()
 {
    
    printf("run = %s \n",capture);
    system(capture);
    //id = getpid();
    //printf("id = %d \n",id);
}
int MyThread::getid()
{
    return id;
}
void MyThread::setfile(char *file)
{    
    //char temp[1000];
    //strcpy(temp,file);
    //printf("set = %s \n",file);
    //int line = strlen(file);
    //printf("line = %d \n",line);
    strcpy(capture,"");
   // for (int i = 0 ; i<line; i++)
   // {
// capture[i]= temp[i];
  //  }
    //strcpy(capture,"");
    strcpy(capture,file); 
  //  printf("set = %s \n",capture);
  // strcat(capture," > /dev/null");
}



