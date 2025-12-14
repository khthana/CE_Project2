#include <sys/types.h>
#include <stdio.h>
#include <time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include "global.h"
#include "md5.h"
#include "../define.h"


void mailToRoot(char *mesg){
	char cmd[256];
	sprintf(cmd,"echo %s | mail root@localhost",mesg);
	system(cmd);
}

int findBlackList(int uid,char *hostIP){
/* find user in black list 
   return -1 -> error
   return 0  -> not found
   return 1  -> found

 */
   int blfile;
   int found=0,result=1;
   struct blackUser bu;
   
   blfile=open(BLACK_LIST_FILE,O_RDONLY);
   if (blfile<0) return -1;
   
   while((result>0)&&(!found)){
      result=read(blfile,&bu,(sizeof(struct blackUser)));
      if (result>0){
           if ((bu.uid==uid)&&(!strcmp(bu.hostIP,hostIP)) ){
              	found=1;
           }
      }        
   }
   close(blfile);
   return found;

}

int writeBlackList(struct execInfor data,char *hostIP,float *person_score){
    struct blackUser bu;
    int bufile;
    char msg_digest[16],msg_digest2[16];
    int mdfile;
    char mdfilename[80];
    
    // calculate MD from eventlist file //
    MDFile(BLACK_LIST_FILE,msg_digest);
    // read old eventlist MD file //
    sprintf(mdfilename,".%s",BLACK_LIST_FILE);
    mdfile=open(mdfilename,O_RDONLY);
    if (mdfile>0){
	    // read MD in file //
	    read(mdfile,(char*)&msg_digest2,16);
	    if (memcmp(msg_digest,msg_digest2,16)!=0){
		    // if MD not match log to eventlist //
                    writeEventList(data,hostIP,person_score,"blacklist file has change");
 	    }
    }else{
	    // log error to eventlist file //
            writeEventList(data,hostIP,person_score,"Cannot open MD for blcklist");
    }


    // start write log file //
    bu.uid=data.uid;
    bu.score=*person_score;
    bu.detectTime=data.startTime;
    strcpy(bu.hostIP,hostIP);
    
    bufile=open(BLACK_LIST_FILE,O_CREAT|O_RDWR|O_APPEND,0600);
    if (bufile<0) return -1;
    write(bufile,&bu,sizeof(struct blackUser));
    close(bufile);

    // write new MD //
    MDFile(BLACK_LIST_FILE,msg_digest);
    sprintf(mdfilename,".%s",BLACK_LIST_FILE);
    mdfile=open(mdfilename,O_CREAT|O_TRUNC|O_RDWR,0600);
    write(mdfile,(char*)&msg_digest,16);
    close(mdfile);


    return 0;
    
}

int removeBlackList(struct execInfor data,struct sockaddr_in client_addr){
    char hostIP[20];
    int found=0;
	int mdfile;
    char mdfilename[80];
    char msg_digest[16];
	int result=5,tmpfile,bufile;
    char tempfilename[15]="tempblXXXXXX";
    struct blackUser bu;
    
    // open blakclist file, temp file to keep tempory blacklist //
    strcpy(hostIP,inet_ntoa(client_addr.sin_addr));
    tmpfile=mkstemp(tempfilename);
    bufile=open(BLACK_LIST_FILE, O_RDONLY);
    if ((tmpfile<0)&&(bufile<0)){
	    return -1;
    }
    while (result>0){
	    result=read(bufile,(char*)&bu,sizeof(struct blackUser));
	    if ((result>0)&&(!strcmp(bu.hostIP,hostIP))&&(data.uid==bu.uid)){
		    //if found uid to delete //
		    found=1;
		    continue;
	    }
	    if (result>0) write(tmpfile,&bu,sizeof(struct blackUser));		    
    }
    close(tmpfile);
    close(bufile);
    rename(tempfilename,BLACK_LIST_FILE);

    // write new MD //
    MDFile(BLACK_LIST_FILE,msg_digest);
    sprintf(mdfilename,".%s",BLACK_LIST_FILE);
    mdfile=open(mdfilename,O_CREAT|O_TRUNC|O_RDWR,0600);
    write(mdfile,(char*)&msg_digest,16);
    close(mdfile);
    
	return found;
}

int writeEventList(struct execInfor data,char *hostIP,float *person_score,char *message){
    struct blackUser bu;
    int evfile;
    char mesg[160];
    struct tm *tm_ptr;
    int mdfile;
    char msg_digest[16];
    char msg_digest2[16];
    char mdfilename[80];

    // prepare time data //
    tm_ptr=localtime(&data.startTime);
    
    // calculate MD from eventlist file //
    MDFile(EVENT_LIST_FILE,msg_digest);
    // read old eventlist MD file //
    sprintf(mdfilename,".%s",EVENT_LIST_FILE);
    mdfile=open(mdfilename,O_RDONLY);
    if (mdfile>0){
	    // read MD in file //
	    read(mdfile,(char*)&msg_digest2,16);
	    if (memcmp(msg_digest,msg_digest2,16)!=0){
		    // if MD not match log to eventlist //
                    sprintf(mesg,"%d/%d/%d:%d.%d.%d:%d:%s:eventlist has changed\n",tm_ptr->tm_mday, tm_ptr->tm_mon+1, tm_ptr->tm_year+1900, tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec, data.uid, hostIP);
                    evfile=open(EVENT_LIST_FILE,O_CREAT|O_RDWR|O_APPEND, 0600);
                    if (evfile<0)return -1;
                    write(evfile,mesg,strlen(mesg));
                    close(evfile);
 	    }
    }else{
	    // log error to eventlist file //
                    sprintf(mesg,"%d/%d/%d:%d.%d.%d:%d:%s:Cannot open MD for eventlist \n",tm_ptr->tm_mday, tm_ptr->tm_mon+1, tm_ptr->tm_year+1900, tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec, data.uid, hostIP);
                    evfile=open(EVENT_LIST_FILE,O_CREAT|O_RDWR|O_APPEND, 0600);
                    if (evfile<0)return -1;
                    write(evfile,mesg,strlen(mesg));
                    close(evfile);
    }
    
    // start to log event //
    sprintf(mesg,"%d/%d/%d:%d.%d.%d:%d:%s:%s:%f\n",tm_ptr->tm_mday, tm_ptr->tm_mon+1, tm_ptr->tm_year+1900, tm_ptr->tm_hour, tm_ptr->tm_min, tm_ptr->tm_sec, data.uid, hostIP, message, *person_score);
    
    evfile=open(EVENT_LIST_FILE,O_CREAT|O_RDWR|O_APPEND,0600);
    if (evfile<0) return -1;
    write(evfile,mesg,strlen(mesg));
    close(evfile);
    
    // write new MD //
    MDFile(EVENT_LIST_FILE,msg_digest);
    sprintf(mdfilename,".%s",EVENT_LIST_FILE);
    mdfile=open(mdfilename,O_CREAT|O_TRUNC|O_RDWR,0600);
    write(mdfile,(char*)&msg_digest,16);
    close(mdfile);
    
    return 0;
    
}

int responseIntrusion(struct execInfor data,struct sockaddr_in client_addr,float *person_score){
    char hostIP[20];
    char mesg[256];
    int result;
    
    strcpy(hostIP,inet_ntoa(client_addr.sin_addr));
    sprintf(mesg,"INTRUSION DETECTED: USER:%d FROM:%s PERCENT:%f",data.uid,hostIP,*person_score);
    printf("%s\n",mesg);
    result=findBlackList(data.uid,hostIP);
    if (result<=0){
       // if not found in black list .. add this user to black list and event list//
       writeBlackList(data,hostIP,person_score);
       writeEventList(data,hostIP,person_score,"Intrusion detected");
       mailToRoot(mesg);
    }
}
