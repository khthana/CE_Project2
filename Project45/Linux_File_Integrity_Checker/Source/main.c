//####################################################
//#
//#   File : main.h
//#
//####################################################

#include <stdio.h>
#include <time.h>
#include <string.h>
#include <sys/types.h>
#include <sys/dir.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <errno.h>
#include <varargs.h>
#include "function.c"
#include "variable.c"
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>
#include <signal.h>

#define FALSE 0
#define TRUE !FALSE
#define MEM_SZ 4096

extern struct MemShare* MeMS;
extern long int timeToSleep;
extern int checkDir PROTO_LIST ((char*));
extern void checkIntegrity PROTO_LIST ((char*, char*));
extern int  recursiveDirectory PROTO_LIST ((char*, char*, int));
extern int count PROTO_LIST ((char*));
extern void init ();
extern int checkIntegrityDB ();
extern void initIntegrityDB ();
extern void integriteDB ();

int main (argc, argv)
int argc;
char** argv;
{
        FILE* file;
        int len, i, count;
        char buffer [51];
        char* filename;
        int j =0;
        int shid;
	pid_t id;
	int count1 =1;
	int count2 =3;
	int fp1;

        void* shared_memory = (void*)0;
        srand((unsigned int)getpid());
        shid = shmget((key_t)1234, MEM_SZ, 0666 | IPC_CREAT);

	shared_memory = (void*)shmat(shid, (void*)0, 0);
        MeMS = (struct MemShare *)shared_memory;

	init();

	for (i=0; i<51; buffer[i++]= ' ');
        	
	//id = fork();
	//switch (id) {
		
	//	case 0: {       signal(SIGHUP,SIG_IGN);
	//			while (1) {
	if ((fp1 = open ("/etc/isagcheck/status", O_CREAT,O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
               

	system ("/etc/isagcheck/decrypt  /etc/isagcheck/DBFile 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogAccess 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogIno 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogModify 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogStatus 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/db 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/refH 10110");
	system ("/etc/isagcheck/decrypt  /etc/isagcheck/high 10110");
	
					checkIntegrityDB();
					
					if ((file = fopen (MeMS->DBFile, "r+")) == NULL)
						printf ("DBFile can't be opened 1\n" );
					else {
						while (len = fread (buffer, 1, 51, file)) {
							for (i=0; buffer [i] != ' '; i++);
							filename = (char*) malloc (strlen (strtok (buffer, " "))+1);
							strcpy (filename, buffer);
							if (buffer [0]== '/'){
								if (checkDir (filename)) {
									recursiveDirectory(filename, MeMS->refDB, count2-1);
								}
								else {
									checkIntegrity (filename, MeMS->refDB);
								}
							}
							for (i=0; i<51; buffer[i++] =' ');
							free (filename);
						}
					//integrityDB ();
					}
					
					if ((file = fopen (MeMS->anotherFile, "r+")) == NULL)
                                                printf ("DBFile can't be opened 2\n" );
                                        else {  
                                                while (len = fread (buffer, 1, 51, file)) {
                                                        for (i=0; buffer [i] != ' '; i++);
                                                        filename = (char*) malloc (strlen (strtok (buffer, " "))+1);
                                                        strcpy (filename, buffer);
							if (buffer[0]=='/'){
                                                        	if (checkDir (filename)) {
                                                                	recursiveDirectory(filename, MeMS->anotherDB,count2-1);
                                                        	}       
                                                        	else {
                                                                	checkIntegrity (filename, MeMS->anotherDB);
                                                        	}
							}       
                                                        for (i=0; i<51; buffer[i++] =' ');
                                                        free (filename);
                                                }       
					//integrityDB ();
                                        }
					integrityDB ();
	//				sleep (MeMS->timeToSleep);
	//			}
	//		}
	//		break;
	//	default : exit (0);
	//}
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/DBFile 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/LogAccess 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/LogIno 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/LogModify 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/LogStatus 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/db 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/refH 10110");
	system ("/etc/isagcheck/encrypt  /etc/isagcheck/high 10110");
	close (fp1);
  	}	
        unlink ("/etc/isagcheck/status");
	return ( FALSE );
}
