//####################################################
//#
//#   File : admin.c
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
#include <stdlib.h>
#include "adminfunc.c"
#include "variable.c"
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>
#include <termios.h>

#define MEM_SZ 4096
//#define PASSWORD_LEN 8
#define PASSWORD_LEN 100 

extern struct MemShare* MeMS;

extern int addFileToDB PROTO_LIST ((char*));
extern int recursiveDir PROTO_LIST ((char*, int));
extern int  delFileFromDB PROTO_LIST ((char*));
extern int  delDirFromDB PROTO_LIST ((char*));
extern int deleteFile PROTO_LIST ((char*));
extern int dropFilePolicy PROTO_LIST ((char*));
extern int activeFilePolicy PROTO_LIST ((char*));
extern void swapFile ();
extern void secureHigh ();
extern void secureMedium ();
extern void secureLow ();
extern void CtimeSec PROTO_LIST ((char*));
extern void CtimeMin PROTO_LIST ((char*));
extern void CtimeHour PROTO_LIST ((char*));
extern void CtimeDay PROTO_LIST ((char*));
extern void reportForm ();
extern void reportDay PROTO_LIST ((char*, char*));
extern void reportMouth PROTO_LIST ((char*, char*));
extern void reportYear PROTO_LIST ((char*, char*));
extern void reportAll PROTO_LIST ((char*,char*, char*));
extern void encrypF PROTO_LIST ((char*, char*));
extern void decrypF PROTO_LIST ((char*, char*));
extern int encrypPasswd PROTO_LIST ((char*,char*));
extern void integrityDB ();
extern void init ();
extern void usage PROTO_LIST ((char*));
extern int checkDay PROTO_LIST ((char*));
extern int count PROTO_LIST ((char*));

int main (argc,argv)
int argc;
char** argv;
{
//	initscr ();
	int i,x,fp1,fp2,num_read;
	char* filename;
	char* passwd;
	int shid;
	int len,len1;
	struct termios initialrsettings, newrsettings;
    	char password[PASSWORD_LEN + 1];
        void* shared_memory = (void*)0;
	char buf [33];
	int count1 = 3;
	
    	//printf("Enter password: ");
	//struct termios initialrsettings, newrsettings;
    	//char password[PASSWORD_LEN + 1];
	

       // srand((unsigned int)getpid());
        //shid = shmget((key_t)1234, MEM_SZ, 0666 | IPC_CREAT);

        //shared_memory = (void*)shmat(shid, (void*)0, 0);
        //MeMS = (struct MemShare *)shared_memory;

        /*srand((unsigned int)getpid());
        shid = shmget((key_t)1234, MEM_SZ, 0666 | IPC_CREAT);

        shared_memory = (void*)shmat(shid, (void*)0, 0);
        MeMS = (struct MemShare *)shared_memory;
	seed[0] = time(NULL);
  	seed[1] = getpid() ^ (seed[0] >> 14 & 0x30000);
	*/
	
	//struct termios initialrsettings, newrsettings;
    	//char password[PASSWORD_LEN + 1];
    	tcgetattr(fileno(stdin), &initialrsettings);
    	newrsettings = initialrsettings;
   	newrsettings.c_lflag &= ~ECHO;

    	printf("Enter password: ");
    	if(tcsetattr(fileno(stdin), TCSAFLUSH, &newrsettings) != 0) {
        fprintf(stderr,"Could not set attributes\n");
    	}
    	else {
        	fgets(password, PASSWORD_LEN, stdin);
        	tcsetattr(fileno(stdin), TCSANOW, &initialrsettings);
        	//fprintf(stdout, "\nYou entered %s\n", password);
        	//printf ("%s\n",password);
    	}

	
        srand((unsigned int)getpid());
        shid = shmget((key_t)1234, MEM_SZ, 0666 | IPC_CREAT);

        shared_memory = (void*)shmat(shid, (void*)0, 0);
        MeMS = (struct MemShare *)shared_memory;
	

        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/local.key 10110");
	if ((fp1 = open ("/etc/isagcheck/local.key", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");                                                               exit (0);
        }                               
        else {                          
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp1, buf, 33)) > 0){
				//printf ("passed 1\n");
				buf [32] ='\0';
			//	printf ("%s\n",buf);
                        }
                //}
                //else {
                //        printf ("aIn function delFileFromDB anotherDB or bkup can't be opened\n");
                //        exit (0);
                }
                close (fp1);
                close (fp2);
        }
	unlink (MeMS->backUp);
	for (i=0;password[i]!='\n';i++);
			password [i] ='\0';
	//printf ("%sJay",password);
	if (!encrypPasswd (password,buf)){
		printf ("\nPassword incorrect\n");
		 exit (0);
	}
	
	

        	system ("/etc/isagcheck/encrypt  /etc/isagcheck/local.key 10110");
	
	//	encrypF ("/etc/isagcheck/local.key", "password");	
	//fflush (stdout);
	//printf("Enter password: ");
    	/*if(tcsetattr(fileno(stdin), TCSAFLUSH, &newrsettings) != 0) {
        	fprintf(stderr,"Could not set attributes\n");
    	}
    	else {
        	scanf ("%s",password);
        	tcsetattr(fileno(stdin), TCSANOW, &initialrsettings);
		if (strcmp (password, "right")){
			printf ("\nPassword was not match\n");
			exit (0);	
		}
    	}*/
	//	#############################################
	if ((fp1 = open ("/etc/isagcheck/status", O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ) {
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/DBFile 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogAccess 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogIno 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogModify 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/LogStatus 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/db 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/refH 10110");
        	system ("/etc/isagcheck/decrypt  /etc/isagcheck/high 10110");
		close (fp1);
	
	}
	init ();
	//usage (argv[0]);	
	//iprintf ("passed usage");
	if (argc == 6){
		if (!strcmp (argv [1], "report")){
			if (checkDay (argv[4])){
				if (!strcmp (argv[2], "-h")){
					if (!strcmp (argv [3], "acc")){
						reportForm ();
						reportHour (MeMS->LogAccess, argv [4], argv [5]);
					}
					else if (!strcmp (argv [3], "per")){
						reportForm ();
						reportHour (MeMS->LogStatus, argv [4], argv [5]);
					}
					else if (!strcmp (argv [3], "mod")){
						reportForm ();
						reportHour (MeMS->LogModify, argv [4], argv [5]);
					}
					else if (!strcmp (argv [3], "ino")){
						reportForm ();
						reportHour (MeMS->LogInode, argv [4], argv [5]);
					}
					else {
						usage (argv [0]);
						return (0);
					}
				}
				else if (!strcmp (argv[2], "-a")){
					if (!strcmp (argv [3], "-h")){
						reportForm ();
						reportAll (argv[3],argv[4],argv [5]);
					}
					else {
						usage (argv [0]);
						return (0);
					}
				}
				else {
					usage (argv[0]);
					return (0);
				}
					
			}
			else {

				usage (argv[0]);
				return (0);
			}	
		}
		else {
			usage (argv [0]);
			return (0);
		}				
			printf ("\nReport success!..\n");
	}

	else if (argc == 5) {
		if (!strcmp (argv[1], "report")){
			if (!strcmp (argv[2], "-d")){	
				if (!strcmp (argv [3], "acc")){
					reportForm ();
					reportDay (MeMS->LogAccess,argv[4]);
				}
				else if (!strcmp (argv [3], "sta")){
					reportForm ();
					reportDay (MeMS->LogStatus,argv[4]);
				}
				else if (!strcmp (argv [3], "mod")){
					reportForm ();
					reportDay (MeMS->LogModify,argv[4]);
				}
				else if (!strcmp (argv [3], "ino")){
					reportForm ();
					reportDay (MeMS->LogInode,argv[4]);
				}
				else {
					usage (argv [0]);
					return (0);
				}				
			}
			else if (!strcmp (argv[2], "-m")){
				if (!strcmp (argv [3], "acc")){
					reportForm ();
					reportMouth (MeMS->LogAccess,argv[4]);
				}
				else if (!strcmp (argv [3], "sta")){
					reportForm ();
					reportMouth (MeMS->LogStatus,argv[4]);
				}
				else if (!strcmp (argv [3], "mod")){
					reportForm ();
					reportMouth (MeMS->LogModify,argv[4]);
				}
				else if (!strcmp (argv [3], "ino")){
					reportForm ();
					reportMouth (MeMS->LogInode,argv[4]);
				}
				else {
					usage (argv [0]);
					return (0);
				}				
			}
			else if (!strcmp (argv[2], "-y")){
				if (!strcmp (argv [3], "acc")){
					reportForm ();
					reportYear (MeMS->LogAccess,argv[4]);
				}
				else if (!strcmp (argv [3], "sta")){
					reportForm ();
					reportYear (MeMS->LogStatus,argv[4]);
				}
				else if (!strcmp (argv [3], "mod")){
					reportForm ();
					reportYear (MeMS->LogModify,argv[4]);
				}
				else if (!strcmp (argv [3], "ino")){
					reportForm ();
					reportYear (MeMS->LogInode,argv[4]);
				}
				else {
					usage (argv [0]);
					return (0);
				}				
			}
			else if (!strcmp (argv [2], "-a")){
				reportForm ();
				reportAll (argv [3],argv [4], NULL);
			}
			else {
				usage (argv [0]);
				return (0);
			}				

		}
		else {
			usage (argv [0]);
			return (0);
		}
			printf ("\nReport success!..\n");

	}	
	else if (argc == 4){
		filename = (char*) malloc (strlen (argv [3]));
	        strcpy (filename, argv [3]);
	
		
		if (!strcmp (argv[1], "add")){
			if (!strcmp (argv[2], "-f")){
				addFileToDB (filename);
			}
			else if (!strcmp (argv[2], "-d")){
				recursiveDir (filename, count1-1);
			}
			else {
				usage (argv [0]);
				return (0);
			}				
			printf ("\nAdding file into data base success!..\n");

		}
		else if (!strcmp (argv[1], "del")){
			if (!strcmp (argv[2], "-f")){
                                delFileFromDB (filename);
			}
                        else if (!strcmp (argv[2], "-d")){
				delDirFromDB  (filename);
				swapFile ();
			}						
			else {
				usage (argv [0]);
				return (0);
			}				
			printf ("\nDelete file from data base success!..\n");
		}
		else if (!strcmp (argv[1], "excl")){
			if (!strcmp (argv[2], "-f")){
				dropFilePolicy (filename);
				//addFileToDB (filename);
			}
			else if (!strcmp (argv[2], "-d")){
				recursiveDir (filename, count1-1);
			}
			else {
				usage (argv [0]);
				return (0);
			}				
			printf ("\nDrop file policy success!..\n");

		}
		else if (!strcmp (argv[1], "active")){
			if (!strcmp (argv[2], "-f")){
				activeFilePolicy (filename);
				//addFileToDB (filename);
			}
			else if (!strcmp (argv[2], "-d")){
				recursiveDir (filename, count1-1);
			}
			else {
				usage (argv [0]);
				return (0);
			}				
			printf ("\nActive file policy success!..\n");

		}
		else {
			usage (argv [0]);
			return (0);
		}
		//if (!strcmp (argv[1], "time")) {
		//	if (!strcmp (argv[3], "s")){
		//		CtimeSec (argv[2]);
		//	}
		//	if (!strcmp (argv[3], "m")){
		//		CtimeMin (argv[2]);
		//	}
		//	if (!strcmp (argv[3], "h")){		
		//		CtimeHour (argv[2]);
		//	}
		//	if (!strcmp (argv[3], "d")){
		//		CtimeDay (argv[2]);
		//	}
		//}
	}
	else if (argc == 3){
		if (!strcmp (argv[1], "sec")){
			if (!strcmp (argv[2], "-h")){
				secureHigh();
			}
			else if (!strcmp (argv[2], "-m")){
				secureMedium();
			}
			else if (!strcmp (argv[2], "-l")){
				secureLow();	
			}
			else {
				usage (argv [0]);
				return (0);
			}

			printf ("\nChange mode success!..\n");
		}
		else {
				usage (argv [0]);
				return (0);

		}
		//if (!strcmp (argv [1], "report")){
		//	if (!strcmp (argv [2], "All")){
		//		reportForm ();
		//		reportHour ("/etc/isagcheck/LogAccess","13/01/2003", "2-4");
		//	}
		//}

	
	}
	else {
		usage (argv [0]);
		return (0);
	}
	if ((fp1 = open ("/etc/isagcheck/status", O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ) {
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

	//integrityDB ();
	//##################################
	return (0);
}
