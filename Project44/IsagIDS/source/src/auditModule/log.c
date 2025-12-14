#define __KERNEL__
#define MODULE
#define BEGIN_KMEM old_fs = get_fs();set_fs(get_ds());
#define END_KMEM set_fs(old_fs);

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/types.h>
#include <sys/syscall.h>
#include <asm/unistd.h>
#include <asm/uaccess.h>	/* for set_fs(),get_fs() ... */
#include <linux/proc_fs.h>
#include <linux/fcntl.h>
#include <linux/net.h>		/* for constant SYS_BIND,SYS_SEND etc. */
#include <linux/socket.h>

#include "../define.h"	/* structure to keep log and definition of program */
#include "../config.h"

extern void* sys_call_table[];
asmlinkage static pid_t (*orig_fork)(struct pt_regs);
asmlinkage int (*orig_execve)(struct pt_regs);

asmlinkage int (*open)(char*,int,int);
asmlinkage int (*close)(int);
asmlinkage ssize_t (*read)(unsigned int,char*,size_t);
asmlinkage ssize_t (*write)(unsigned int,char*,size_t);
asmlinkage int (*socketCall)(int,unsigned long*);
asmlinkage int (*unlink)(const char*);

char addr[16];				// keep (struct sockaddr_in) of IDS server availble //
int sendComplete=1;			// set to 0 if connection not available
int configComplete=1;			// set to 0 if configfile error
int saveDataOption=1;			// set to 1 if connection not available module will save 
					// data to current host first
int send_old_data(){
   int fd,result,send;
   struct execInfor data;
   mm_segment_t old_fs;
   BEGIN_KMEM
   fd=open(TEMP_DATA, O_RDWR,0600);
   END_KMEM
   if (fd<0){
	   // cant open file may be file not exist //
	   return -1;
   }
   result=sizeof(struct execInfor);
   while(1){
      BEGIN_KMEM
      result=read(fd,(char*)&data,sizeof(struct execInfor));
      END_KMEM
      if (result==sizeof(struct execInfor)){
         send=send_to_socket(data);
         if (send<0) break;
      }else {
         break;
      }
   }
   /* check if send not complete save rest of old data to file */
   if(send<0){
   ////////////doit//////////////now///////////!!!!!!////////////
   	close(fd);
   }else{
	  /* send complete so delete temp file */
	  close(fd);
	  BEGIN_KMEM
	  unlink(TEMP_DATA);
	  END_KMEM
   }
}

int save_audit_data(struct execInfor data){
   int fd;
   mm_segment_t old_fs;

   BEGIN_KMEM
   fd=open(TEMP_DATA,O_CREAT | O_RDWR | O_APPEND,0600);
   END_KMEM
   if (fd>0){
	   BEGIN_KMEM
	   write(fd,(char*)&data,sizeof(struct execInfor));
	   close(fd);
	   END_KMEM
	   return 1;
   } else{
	   // error  open fill for save //
	   return -1;
   }
}

int send_to_socket(struct execInfor data){
/* return value : 1 	succeed
   		 -1	can't connect to server maybe socket create,connection error,send error etc.
                 -2	config file error
*/
   unsigned long arg[6];
   int sock_fildes, result, fd, i;
   char encrypted[sizeof(struct execInfor)+1];
//   char *chptr;
   
   mm_segment_t old_fs;
/* source code of sys_socketcall is at /usr/src/linux/net/socket.c line 1545  */
   /* create socket */
   arg[0]=AF_INET;
   arg[1]=SOCK_STREAM;
   arg[2]=0;
BEGIN_KMEM
   sock_fildes=socketCall(SYS_SOCKET,arg);
END_KMEM
   if (sock_fildes==-1){
      /* create socket failed */
      sendComplete=0;
      return -1;
   }

   /* connect to IDS server */
   arg[0]=sock_fildes;
   arg[1]=(unsigned long)addr;
   arg[2]=16;
BEGIN_KMEM
   result=socketCall(SYS_CONNECT,arg);
END_KMEM
   if (result<0) { /* if connect to server fail */
	sendComplete=0;
	return -1;
   }

   /* send data to IDS host */
   /*** do easy encryption first ***/
   memcpy(encrypted,(char*)&data,sizeof(struct execInfor));
   encrypted[sizeof(struct execInfor)]=(char)42;
   for (i=0;i<(sizeof(struct execInfor)+1);i++){
	   encrypted[i]=(char)(encrypted[i]+3);
   }
   /*** and then send data ***/
   arg[0]=sock_fildes;
   arg[1]=(unsigned long)encrypted;
   arg[2]=sizeof(struct execInfor)+1;
   arg[3]=0;
BEGIN_KMEM
   result=socketCall(SYS_SEND,arg);
   close(sock_fildes);
END_KMEM
//   printk("<5>sending %d bytes\n",result);
   if (result<0){
       sendComplete=0;
        return -1;
   }
   /* send complete */
   sendComplete=1;
   return 1;
}
                       
asmlinkage int new_execve(struct pt_regs regs)   {
	int error;
	char * filename;
	int fd;
	/********* add from kernel code ************/
	mm_segment_t old_fs;
        char *logFile;	/* file for keep information */
        struct execInfor procInfor;
        char **argu;
        int command_length=0,result,i=0;
	int tmpfsUid,tmpfsGid;
	/*******************************************/
        
        struct task_struct *t=current;
	filename = getname((char *) regs.ebx);

/************************* append from kernel source part ****************************/
	// temporary change uid //
	tmpfsUid=current->fsuid;
	tmpfsGid=current->fsgid;
	current->fsuid=MODULE_FSUID;
	current->fsgid=MODULE_FSGID;
	
        argu=(char**)regs.ecx;
   	/* keep information in struct execInfor */
        /* keep execute filename */
        strcpy(procInfor.pathname,filename);
	/* keep command and argument */
        strcpy(procInfor.command,argu[0]);
        command_length=strlen(argu[0]);		// track command length //
        strcat(procInfor.command," ");
        command_length++;
        i++;
        while( (argu[i]!=NULL)&&(command_length<MAX_COMM_LEN) ){
              command_length+=strlen(argu[i])+1;
              if (command_length<MAX_COMM_LEN){
                 strcat(procInfor.command,argu[i]);
                 strcat(procInfor.command, " ");
              }
           i++;
        }
        /* keep start time of command */
	procInfor.startTime=CURRENT_TIME;
        /* keep user information */
        procInfor.uid=current->uid;

        if (configComplete==1){
           	/* check if there old data to send */
		send_old_data();
                /* send data to IDS host */
                result=send_to_socket(procInfor);
                if(result<0){
		   if (saveDataOption){
			/* if connect failed .. save audit data to current host */
                      save_audit_data(procInfor);
		   }
		}
        }else {
           /* config file fail so we cant send information  to IDS server ! so save it */
           save_audit_data(procInfor);
        }

	//change uid ,gid back//
	current->fsuid=tmpfsUid;
	current->fsgid=tmpfsGid;

/****************************************************************************************/
	error = PTR_ERR(filename);
	if (IS_ERR(filename))
		goto out;
	error = do_execve(filename, (char **) regs.ecx, (char **) regs.edx, &regs);
	if (error == 0)
		current->ptrace &= ~PT_DTRACE;
	putname(filename);
out:
	return error;
}

int init_module(void){
   	int fd,result;
	mm_segment_t old_fs;

        /* trap exece system call */
        orig_execve=sys_call_table[__NR_execve];
        sys_call_table[__NR_execve]=new_execve;

        socketCall=sys_call_table[__NR_socketcall];
        open=sys_call_table[__NR_open];
        close=sys_call_table[__NR_close];
        read=sys_call_table[__NR_read];
        write=sys_call_table[__NR_write];
	unlink=sys_call_table[__NR_unlink];

       /* read configuration file */
       BEGIN_KMEM
       fd=open(CONFIG_FILE,O_RDONLY,0644);
       END_KMEM
       if (fd<0){ 
          /* if open config file failed so we cant init. connection */
          configComplete=0;
          sendComplete=0;
          return 0;
       }
       /* read config file */
       BEGIN_KMEM
       result=read(fd,(char*)addr,16);
       END_KMEM
       if (result!=16){
          configComplete=0;
          sendComplete=0;
          return 0;
       }
       BEGIN_KMEM
       result=read(fd,(char*)&saveDataOption,sizeof(int));
       close(fd);
       END_KMEM
       if (result!=sizeof(int)){
	   saveDataOption=1;		// default value is save data to current host
       }
       return 0;
}

void cleanup_module(void){
        sys_call_table[__NR_execve]=orig_execve;
}
