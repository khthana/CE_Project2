#include <sys/types.h>
#include <sys/socket.h>
#include <sys/file.h>
#include <stdio.h>
#include <time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include "../define.h"
#include "../config.h"
#include "global.h"
#include "md5.h"

#define MAXOPENFILE 255
int servPort=8000;
int maxQueue=20;
/* use in analyse part */
int SEQ_LEN=12;
int DB_WINDOW_SIZE=750;
int R_WINDOW_SIZE=200;
float BEHAVIOUR_THRESHOLD=35;
/* option value */
int verbose_mode=0;	// if value is 0 then not show anything!

int getOption(int argc,char *argv[]){
	int option;

	while ((option=getopt(argc,argv,"v"))!=-1){
		switch(option){
			case 'v': verbose_mode=1;
				  break;
		}
	}
	return 0;
}

int startDaemon(){
	int childpid,fd;

	if (getppid()==1){
		// if parent is init process then don't have to do anything //
		return 0;
	}	
	signal(SIGTTOU, SIG_IGN);
	signal(SIGTTIN, SIG_IGN);
	signal(SIGTSTP, SIG_IGN);

	if ( (childpid=fork())<0){
		printf("Error starting\n");
		return -1;
	}else if(childpid>0){
		// parent exit //
		return -1;
	}
	
	if (setpgid(0,getpid())==-1){
		printf("Can't change process group\n");
		return -1;
	}
	for (fd=0;fd<MAXOPENFILE; fd++){
		if ((verbose_mode)&&(fd==1))continue;
		else close(fd);
	}
	umask(0);
	chdir(WORKING_DIR);
	return 0;
}

int createConfigFile(int mode){
   	FILE *config_file;

   	config_file=fopen(SERV_CONFIG_FILE,"w");
        if (config_file==NULL){
           printf("Create config file error!\n");
           return -1;
        }
	if (mode==1){
		fprintf(config_file,"SERVER_PORT		%d\n",servPort);
	}
        fprintf(config_file,"SEQ_LEN		%d\n",SEQ_LEN);
        fprintf(config_file,"DB_WINDOW_SIZE		%d\n",DB_WINDOW_SIZE);
        fprintf(config_file,"R_WINDOW_SIZE		%d\n",R_WINDOW_SIZE);
        fprintf(config_file,"BEHAVIOUR_THRESHOLD	%f\n",BEHAVIOUR_THRESHOLD);
        fclose(config_file);
        return 0;
}

int readConfigFile(){
	FILE *fd;
	char buf[20];
 	fd=fopen(SERV_CONFIG_FILE,"r");
	if (fd==NULL){
		return -1;
	}
	while (!feof(fd)){
	      	fscanf(fd,"%s",buf);
		if (!strcmp(buf,"SERVER_PORT")){
			fscanf(fd,"%d",&servPort);
		}
		else if (!strcmp(buf,"SEQ_LEN")){
			fscanf(fd,"%d",&SEQ_LEN);
		}
		else if (!strcmp(buf,"DB_WINDOW_SIZE")){
			fscanf(fd,"%d",&DB_WINDOW_SIZE);
		}
		else if (!strcmp(buf,"R_WINDOW_SIZE")){
			fscanf(fd,"%d",&R_WINDOW_SIZE);
		}
		else if (!strcmp(buf,"BEHAVIOUR_THRESHOLD")){
			fscanf(fd,"%f",&BEHAVIOUR_THRESHOLD);
		}
	}

	fclose(fd);
	return 0;
}

float analyseData(struct sockaddr_in client_addr, struct execInfor data){
/* return behaviour value in complete or -1 if error */
   	int fd,mdfd,lck;
        char write_config[20];
        int result;
        char clientIP[MAX_FILENAME];
        char recentFilename[MAX_FILENAME];
	char dbFilename[MAX_FILENAME];
	char template[MAX_FILENAME];
	unsigned char msg_digest[16],old_digest[16];
        struct userLog userData;
	unsigned int score;
	float percent=0;

        strcpy(clientIP,inet_ntoa(client_addr.sin_addr));
        result=chdir(clientIP);
        if (result<0){
            // directory not found .. create it //
            result=mkdir(clientIP, 0700);
            if (result<0) {
               return -1;
            }
            chdir(clientIP);
            
            // create configuration for this host //
            createConfigFile(0);
        }
	// check message digest use md5 //
	sprintf(template,".%d_lck",data.uid);
	while ((lck=open(template,O_CREAT|O_RDWR|O_TRUNC|O_EXCL,600))<0){
		sleep(2);
	}
	close(lck);
	  // calculate file's MD5 //
	sprintf(template,"%d",data.uid);
	MDFile(template,msg_digest);
        
	  // read old MD5 //
	sprintf(template,".%d",data.uid);
	mdfd=open(template,O_CREAT|O_RDWR,0600);
	flock(mdfd,LOCK_EX);
	if (mdfd>0){
		read(mdfd,(char*)&old_digest,16);
		if (memcmp(msg_digest,old_digest,16)!=0){
			// error with digest send to log!
			chdir("..");
			writeEventList(data,clientIP,&percent,"MD not match");
			chdir(clientIP);
		}
	}else{
		chdir("..");
		writeEventList(data,clientIP,&percent,"MD not found");
		chdir(clientIP);
	}
	
        // write behaviour data to file //
        sprintf(template,"%d",data.uid);
   	fd=open(template,O_CREAT| O_APPEND | O_WRONLY,0600);
	flock(fd,LOCK_EX);
        if (fd>0){
           strcpy(userData.pathname,data.pathname);
           strcpy(userData.command,data.command);
           userData.startTime=data.startTime;
           write(fd,&userData,sizeof(struct userLog));
//           close(fd);
	   // read/write new MD //
	   sprintf(template,"%d",data.uid);
	   MDFile(template,msg_digest);
//	   sprintf(template,".%d",data.uid);
//	   mdfd=open(template,O_CREAT|O_RDWR|O_TRUNC,0600);
	   if (mdfd>0){
		lseek(mdfd,0,SEEK_SET);
		write(mdfd,(char*)&msg_digest,16);
		close(mdfd);
	   }else{
		chdir("..");
		writeEventList(data,clientIP,&percent,"Can't write new MD");
		chdir(clientIP);
	   }
	   close(fd);

	   sprintf(template,".%d_lck",data.uid);
	   unlink(template);
	   // do filter data and analyse //
           readConfigFile();
	   // create temp filename use in analyse part //
	   sprintf(template,"%d_recentXXXXXX",data.uid);
	   mktemp(template);
	   strcpy(recentFilename,template);
	   sprintf(template,"%d_dbXXXXXX",data.uid);
	   mktemp(template);
	   strcpy(dbFilename,template);
	   sprintf(template,"%d",data.uid);
	   
	   readLog(template,recentFilename,dbFilename);	   
	   score=analyse(recentFilename,dbFilename);
	   unlink(recentFilename);
	   unlink(dbFilename);
	   if (score>0){
		   percent=((float)((long)score/((float)((SEQ_LEN*(SEQ_LEN+1))/2)*(compareCount+1) )))*100;
		   printf("uid:%d score:%ld/%ld percent:%f\n",data.uid, score, (long)((SEQ_LEN*(SEQ_LEN+1))/2)*(compareCount+1),percent);
                   // return behaviour score //
                   chdir("..");
                   return percent;
	   }
        }
        chdir("..");
        return -1;
}

int main(int argc,char *argv[]){
	int result, i;
	int server_sock_fildes, client_sock_fildes;
	int client_addrlen;
	struct sockaddr_in server_addr, client_addr;
	struct execInfor data;
        float person_score;
	char recvBuf[MAX_RECEIVE];

	getOption(argc,argv);
	if ((startDaemon())<0){
		return 1;
	}
	
	if (readConfigFile()<0){
		printf("Config file error... creating new config file\n");
                createConfigFile(1);
	}
	 
	server_sock_fildes=socket(AF_INET, SOCK_STREAM,0);
	server_addr.sin_family=AF_INET;
	server_addr.sin_addr.s_addr=htonl(INADDR_ANY);
	server_addr.sin_port=htons(servPort);
	result=bind(server_sock_fildes, (struct sockaddr*)&server_addr, sizeof(server_addr));
	if (result<0){
		printf("Error in binding\n");
		return 1;
	}
	
	listen(server_sock_fildes,maxQueue);
	signal(SIGCHLD,SIG_IGN);
	while(1){
   		client_sock_fildes=accept(server_sock_fildes, (struct sockaddr *)&client_addr, &client_addrlen);
                if (client_sock_fildes>0){
                      if (fork()==0){
                         // child process //
                            result=recv(client_sock_fildes,recvBuf,MAX_RECEIVE,0);
                            if (result==(sizeof(struct execInfor)+1)){
//				  printf("received %d bytes\n",result);
				  // do decryption first //
				  for (i=0;i<(sizeof(struct execInfor)+1);i++){
					  recvBuf[i]=(char)(recvBuf[i]-3);
				  }
				  if (recvBuf[sizeof(struct execInfor)]!=42){
					  close(client_sock_fildes);
					  return 0;
				  }
				  memcpy((char*)&data,recvBuf,sizeof(struct execInfor));
                                  // receive and analyse data //
                                  person_score=analyseData(client_addr,data);
                                  // response //                                  
                                  if (person_score<BEHAVIOUR_THRESHOLD){
                                      responseIntrusion(data,client_addr,&person_score);
                                  }else{
				      if (removeBlackList(data,client_addr)==1){
					      writeEventList(data,inet_ntoa(client_addr.sin_addr),&person_score,"Removed from black list");
				      }
				  }
                                  
                            }
                            close(client_sock_fildes);
			    return 0;
                      }else {
                            close(client_sock_fildes);
                      }
                }else printf("accept fail!\n");	
        }
}
