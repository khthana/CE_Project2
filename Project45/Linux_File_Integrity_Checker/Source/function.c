//####################################################
//#
//#   File : function.h
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
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>
#include "global.h"
//#include "main.c"

#ifndef MD
#define MD 5
#endif

#if MD == 2
#include "md2.h"
#endif
#if MD == 4
#include "md4.h"
#endif
#if MD == 5
#include "md5.h"
#endif



/* Length of test block, number of test blocks.
 */

#define TEST_BLOCK_LEN 1000
#define TEST_BLOCK_COUNT 1000
#define FALSE 0
#define TRUE !FALSE
#define PASSWORD_LEN 8

#if MD == 2
#define MD5_CTX MD2_CTX
#define MDInit MD2Init
#define MDUpdate MD2Update
#define MDFinal MD2Final
#endif
#if MD == 4
#define MD5_CTX MD4_CTX
#define MDInit MD4Init
#define MDUpdate MD4Update
#define MDFinal MD4Final
#endif
#if MD == 5
#define MD5_CTX MD5_CTX
#define MDInit MD5Init
#define MDUpdate MD5Update
#define MDFinal MD5Final
#endif


#define FALSE 0
#define TRUE !FALSE

typedef struct MemShare MemShare;

struct MemShare {

	unsigned long  int timeToSleep;
	char refDB [50];
	char DBFile [50];
	char anotherFile [50];
	char anotherDB [50];
	char LogAccess [50];
	char LogModify [50];
	char LogStatus [50];
	char LogInode [50];
	char password [100];
	char backUp [50];
	char high [50];
	char medium [50];
	char low [50];
	char refH [50];
	char refM [50];
	char refL [50];
};	
static struct MemShare* MeMS;
/*
printf ("refDB %s\n",MeMS->refDB);
printf ("DBFile %s\n",MeMS->DBFile);
printf ("anotherFile %s\n",MeMS->anotherFile);
printf ("anotherDB %s\n",MeMS->anotherDB);
printf ("backUP %s\n",MeMS->backUp);
printf ("high %s\n",MeMS->high);
printf ("medium %s\n",MeMS->medium);
printf ("low %s\n",MeMS->low);
printf ("refH %s\n",MeMS->refH);
printf ("refM %s\n",MeMS->refM);
printf ("refL %s\n",MeMS->refL);
*/
extern int alphasort();

static void MDPrint PROTO_LIST ((unsigned char [16]));
static int checkDir PROTO_LIST ((char*));
static int checkMD5 PROTO_LIST ((char*, char*));
static int checkMod PROTO_LIST ((char*, char*));
static int checkPer PROTO_LIST ((char*, char*));
static int checkAcc PROTO_LIST ((char*, char*));
static int checkIno PROTO_LIST ((char*, char*));
static void checkIntegrity PROTO_LIST ((char*, char*));
static int addLogFileAcc PROTO_LIST ((char*));
static int addLogFileMod PROTO_LIST ((char*));
static int addLogFilePer PROTO_LIST ((char*));
static int addLogFileIno PROTO_LIST ((char*));
static int setAccessMD5 PROTO_LIST ((char*, char*));
static int setLastStatusMD5 PROTO_LIST ((char*, char*));
static int setLastStatusMod PROTO_LIST ((char*, char*));
static int setLastStatusPer PROTO_LIST ((char*, char*));
static int setLastStatusIno PROTO_LIST ((char*, char*));
static int recursiveDirectory PROTO_LIST ((char*, char*, int));
static int file_select PROTO_LIST ((struct direct**));
static int count PROTO_LIST ((char*));
static void init ();
static int checkIntegrityDB ();
static void initIntegrityDB ();
static int addIntegrity PROTO_LIST ((char*));
static int check PROTO_LIST ((char*));
static void mailToAdmin PROTO_LIST ((char*));
static void integrityDB ();
static int changeIntegrity PROTO_LIST ((char*));
static void encryp PROTO_LIST ((char*, char*));
static void decryp PROTO_LIST ((char*, char*));

static int checkDir (filename)
char* filename;
{
	struct stat statbuff;
	char* ptr;

	stat(filename, &statbuff);

	switch (statbuff.st_mode & S_IFMT){
		case S_IFDIR: ptr = "directory";		break;
		case S_IFCHR: ptr = "character special";	break;
		case S_IFBLK: ptr = "block special"; 		break;
		case S_IFREG: ptr = "regular";			break;
	#ifdef S_IFLNK
		case S_IFLNK: ptr = "symbolic link";		break;
	#endif
	#ifdef S_IFSOCK
		case S_IFSOCK: ptr = "socket";			break;
	#endif
	#ifdef S_IFIFO
		case S_IFIFO: ptr = "fifo";			break;
	#endif
		default: ptr = "** unknown mode **";		break;
	}
	if (!strcmp (ptr, "directory"))
		return ( TRUE );
	return ( FALSE );
}

static void init ()
{
	int fp1, fp2, num_read;
        int i;
	char* tmp;
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDONLY, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("refFile can't be opened\n");
                exit (0);
        }
        else {
                if (1){//((fp2 = open ("/root/v2/md5-c/bkup", O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
			strcpy (MeMS->DBFile, buf1);
        		for (i=0;i<52;buf1 [i++]=' ');
			
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->refDB, buf1);
               		for (i=0;i<52;buf1 [i++]=' ');
			
	   		num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->anotherFile, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');
	
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->anotherDB, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');

			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->LogAccess, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');

			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->LogModify, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');
		
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->LogStatus, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');
	
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->LogInode, buf1);
		        for (i=0;i<52;buf1 [i++]=' ');
	
			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->high, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');

			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->medium, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');

			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->low, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
			
			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->refH, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
			
			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->refM, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');

			num_read = read (fp1, buf1, 51);
                        buf1 [count (buf1)] = '\0';
                        strcpy (MeMS->refL, buf1);
                        for (i=0;i<52;buf1 [i++]=' ');

			
			//lseek (fp1, -51, SEEK_END);
			num_read = read (fp1, buf1, 51);
			buf1 [count (buf1)] = '\0';
			MeMS->timeToSleep = atol (buf1);
		        for (i=0;i<52;buf1 [i++]=' ');
			
			strcpy(MeMS->backUp,"/etc/isagcheck/backUp");
			
                }
                close (fp1);
        }
	initIntegrityDB ();
}

static int checkMD5 (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
  	MD5_CTX context;
	int len, i;
	char* tmp;
	char* r;
  	unsigned char buffer [1024], digest [16], buffer2 [167];

	for (i=0;i<167;buffer2 [i++]=' ');
	if ((file = fopen (filename, "r+")) == NULL) {
		return (2);
	}
	else {
		MDInit (&context);
 		while (len = fread (buffer, 1, 1024, file))
  			MDUpdate (&context, buffer, len);
 		MDFinal (digest, &context);

		fclose (file);

		if ((file = fopen (refDB, "r+")) == NULL) {
			return (2);
		}
		else {
			while (len = fread (buffer2, 1, 166, file)){
				if (!strncmp(filename, buffer2, count (buffer2) < strlen (filename) ? strlen (filename) : count (buffer2))) {
					tmp = (char*) malloc (33);
					r = (char*) malloc (4);
					tmp[0] = '\0';
					for (i = 0; i < 16; i++) {
						sprintf (r, "%02x", digest[i]);
						strcat (tmp, r);
					}
					if (!strncmp(tmp, &buffer2 [51], 32)) {
						free (r);
						free (tmp);
						fclose (file);
						setAccessMD5 (filename, refDB);
						return (0);
					}
					else {
						free (r);
						free (tmp);
						fclose (file);
						setAccessMD5 (filename, refDB);
						return (1);
					}
				}
				for (i=0;i<167;buffer2 [i++]=' ');
			}
		}
	}
}

static int checkMod (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime();
	char* asctime();
	char* tmp;
	int len, i;
	char buffer2 [167];

	for (i=0;i<167;buffer2 [i++]=' ');
	stat (filename, &statbuff);

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (2);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)) {
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				tmp = (char*) malloc (25);
				strcpy (tmp, asctime (localtime (&statbuff.st_mtime)));
				if (!strncmp (tmp, &buffer2 [84], 24)) {
					free (tmp);
					fclose (file);
					return (0);
				}
				else {
					fclose (file);
					free (tmp);
					return (1);
				}
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
}

static int checkPer (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buffer2 [167];

	for (i=0;i<167;buffer2 [i++]=' ');
	stat (filename, &statbuff);

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (2);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)) {
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				tmp = (char*) malloc (25);
				strcpy (tmp, asctime (localtime (&statbuff.st_ctime)));
				if (!strncmp (tmp, &buffer2 [109], 24)) {
					free (tmp);
					fclose (file);
					return (0);
				}
				else {
					fclose (file);
					free (tmp);
					return (1);
				}
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
}

static int checkAcc (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buffer2 [167];

	for (i=0;i<167;buffer2 [i++]=' ');
	stat (filename, &statbuff);

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (2);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)) {
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				tmp = (char*) malloc (25);
				strcpy (tmp, asctime (localtime (&statbuff.st_atime)));
				if (!strncmp (tmp, &buffer2 [134], 24)) {
					free (tmp);
					fclose (file);
					return (0);
				}
				else {
					fclose (file);
					free (tmp);
					return (1);
				}
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
}

static int checkIno (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buffer2 [167];

	for (i=0;i<167;buffer2 [i++]=' ');
	stat (filename, &statbuff);

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (2);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)) {
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				tmp = (char*) malloc (7);
				sprintf (tmp,"%d", statbuff.st_ino);
				if (!strncmp (tmp, &buffer2 [159], count (&buffer2 [159]))) {
					free (tmp);
					fclose (file);
					return (0);
				}
				else {
					fclose (file);
					free (tmp);
					return (1);
				}
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
}

static int setAccessMD5 (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buffer2 [167];
	stat (filename, &statbuff);

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (0);
	}
	else {  tmp = (char*) malloc (25);
		while (len = fread (buffer2, 1, 166, file)){
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				strncpy (&buffer2 [134], asctime (localtime( &statbuff.st_atime)), 24);
				buffer2 [165] = '\n';
				buffer2 [166] = '\0';
				fseek (file, -166, 1);
				fprintf (file, buffer2);
				/*free (tmp);*/
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
	fclose (file);
}

static void MDPrint (digest)
unsigned char digest [16];
{
  	unsigned int i;

  	for (i = 0; i < 16; i++)
	 	printf ("%02x", digest [i]);
}

static int addLogFileAcc (filename)
char* filename;
//char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	int len, i;
	char buf [77];
	stat (filename, &statbuff);
	for (i=0;i<77;buf [i++]=' ');
	if ((file = fopen (MeMS->LogAccess, "r+")) == NULL) {
		return (0);
	}
	else {
		fseek (file, 0, 2);
		strncpy (buf, filename, strlen (filename));
		buf [strlen (filename)] = ' ';
		strncpy (&buf [51], asctime (localtime (&statbuff.st_atime)), 24);
		buf [75] = '\n';
		buf [76] = '\0';
		fprintf (file, buf);
	}
	fclose (file);
	return (1);
}

static int addLogFileMod (filename)
char* filename;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	int len, i;
	char buf [77];
	stat (filename, &statbuff);
	for (i=0;i<77;buf [i++]=' ');
	if ((file = fopen (MeMS->LogModify, "r+")) == NULL) {
		return (0);
	}
	else {
		fseek (file, 0, 2);
		strncpy (buf, filename, strlen (filename));
		buf [strlen (filename)] = ' ';
		strncpy (&buf [51], asctime (localtime (&statbuff.st_mtime)), 24);
		buf [75] = '\n';
		buf [76] = '\0';
		fprintf (file, buf);
	}
	fclose (file);
	return (1);
}

static int addLogFilePer (filename)
char* filename;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	int len, i;
	char buf [77];
	stat (filename, &statbuff);
	for (i=0;i<77;buf[i++]=' ');
	if ((file = fopen (MeMS->LogStatus, "r+")) == NULL) {
		return (0);
	}
	else {
		fseek (file, 0, 2);
		strncpy (buf, filename, strlen (filename));
		buf [strlen (filename)] = ' ';
		strncpy (&buf [51], asctime (localtime (&statbuff.st_ctime)), 24);
		buf [75] = '\n';
		buf [76] = '\0';
		fprintf (file, buf);
	}
	fclose (file);
	return (1);
}

static int addLogFileIno (filename)
char* filename;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buf [84];
	stat (filename, &statbuff);
	for (i=0;i<84;buf [i++]=' ');
	if ((file = fopen (MeMS->LogInode, "r+")) == NULL) {
		return (0);
	}
	else {
		fseek (file, 0, 2);
		strncpy (buf, filename, strlen (filename));
		buf [strlen (filename)] = ' ';
		strncpy (&buf [51], asctime (localtime (&statbuff.st_ctime)), 24);
		buf [75] = ' ';
		tmp = (char*) malloc (7);
		sprintf (tmp,"%d", statbuff.st_ino);
		strncpy (&buf [76], tmp, 6);
		buf [82] = '\n';
		buf [83] = '\0';
		fprintf (file, buf);
	}
	fclose (file);
	return (1);
}

static int setLastStatusMD5 (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
  	MD5_CTX context;
	int len, i;
	char* tmp;
	char* r;
  	unsigned char buffer [1024], digest [16], buffer2 [167];

	if ((file = fopen (filename, "r+")) == NULL) {
		return (0);
	}
	else {
		MDInit (&context);
 		while (len = fread (buffer, 1, 1024, file))
  			MDUpdate (&context, buffer, len);
 		MDFinal (digest, &context);

		fclose (file);

		if ((file = fopen (refDB, "r+")) == NULL) {
			return (0);
		}
		else {
			while (len = fread (buffer2, 1, 166, file)){
				if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename): count (buffer2))) {
					tmp = (char*) malloc (33);
					r = (char*) malloc (4);
					tmp[0] = '\0';
					for (i = 0; i < 16; i++) {
						sprintf (r, "%02x", digest [i]);
						strcat (tmp, r);
					}
					strncpy (&buffer2 [51], tmp, 32);
					//buffer2 [50] = ' ';
					buffer2 [165] = '\n';
					buffer2 [166] = '\0';
					fseek (file, -166, 1);
					fprintf (file, buffer2);
				}
				for (i=0;i<167;buffer2 [i++]=' ');
			}
		}
		fclose (file);
	}
	return (1);
}

static int setLastStatusMod (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	int len, i;
	char buffer2 [167];
	stat (filename, &statbuff);
	for (i=0;i<166;buffer2 [i++]=' ');

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (0);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)){
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				strncpy (&buffer2 [84], asctime (localtime (&statbuff.st_mtime)), 24);
				buffer2 [50] = ' ';
				buffer2 [165] = '\n';
				buffer2 [166] = '\0';
				fseek (file, -166, 1);
				fprintf (file, buffer2);
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
	fclose (file);
	return (1);
}

static int setLastStatusPer (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	int len, i;
	char buffer2 [167];

	stat (filename, &statbuff);
	for (i=0;i<166;buffer2 [i++]=' ');

	if ((file = fopen (refDB, "r+")) == NULL) {
		return (0);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)){
			buffer2 [166] = '\0';
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				strncpy (&buffer2 [109], asctime (localtime (&statbuff.st_ctime)), 24);
				//fseek (file, -166, 1);
				buffer2 [50] = ' ';
				buffer2 [165] = '\n';
				buffer2 [166] = '\0';
				fseek (file, -166, 1);
				fprintf (file, buffer2);
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
	fclose (file);
	return (1);
}

static int setLastStatusIno (filename, refDB)
char* filename;
char* refDB;
{
	FILE* file;
	struct stat statbuff;
	struct tm* localtime ();
	char* asctime ();
	char* tmp;
	int len, i;
	char buffer2 [167];

	stat (filename, &statbuff);
	for (i=0;i<166;buffer2 [i++]=' ');
	if ((file = fopen (refDB, "r+")) == NULL) {
		return (0);
	}
	else {
		while (len = fread (buffer2, 1, 166, file)){
			if (!strncmp (filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
				tmp = (char*) malloc (7);
				sprintf (tmp, "%d", statbuff.st_ino);
				strncpy (&buffer2 [159], tmp, 6);
				buffer2 [50] = ' ';
				buffer2 [165] = '\n';
				buffer2 [166] = '\0';
				fseek (file, -166, 1);
				fprintf (file, buffer2);
				free (tmp);
			}
			for (i=0;i<167;buffer2 [i++]=' ');
		}
	}
	fclose (file);
	return (1);
}

static void checkIntegrity (filename, refDB)
char* filename;
char* refDB;
{
	int x;	
	int y;
	if (checkAcc (filename, refDB)){	
		addLogFileAcc (filename);
	}
	if (checkMD5 (filename, refDB)){
		setLastStatusMD5 (filename,refDB);
	}
	if (checkMod (filename,refDB)){
		setLastStatusMod (filename,refDB);
		addLogFileMod (filename);
	}
	if (checkPer (filename ,refDB)){
		setLastStatusPer (filename,refDB);
		addLogFilePer (filename);
	}
	if (checkIno (filename, refDB)){
		setLastStatusIno (filename, refDB);
		addLogFileIno (filename);
	}

	/*		
	do {
                x = checkAcc (filename, refDB);
                if (x==1){
			do{
                       		y = addLogFileAcc (filename);
				if (y==0)	
					sleep (2);
			}
			while (y!=1);
		}
                else if (x==2)
                        sleep (2);
        }              
        while (x==2);

	do {
		x = checkMD5 (filename, refDB);
		if (x==1){
			do{
				y = setLastStatusMD5 (filename, refDB);
				if (y==0)
					sleep (2);
			}
			while (y!=1);
		}	
		else if (x==2)
			sleep (2);
	}
	while (x==2);
	
	do {
                x = checkMod (filename, refDB);
                if (x==1){
			do{
                        	y = setLastStatusMod (filename, refDB);
				if (y==0)
					sleep (2);
			}
			while (y!=1);
			do{
				y = addLogFileMod (filename);
				if (y==0)
					sleep (2);
			}
			while (y!=1);
		}
                else if (x==2)
                        sleep (2);
        }
        while (x==2);
	
	do {
                x = checkPer (filename, refDB);
                if (x==1){
			do{
                         	y = setLastStatusPer (filename, refDB);
                                if (y==0)
                                        sleep (2);
                        }
                        while (y!=1);
                        do{
				y = addLogFilePer (filename);
                                if (y==0)
                                        sleep (2);
                        }
                        while (y!=1);
		}
                else if (x==2)
                        sleep (2);
        }
        while (x==2);

	do {
                x = checkIno (filename, refDB);
                if (x==1){
			do{
                        	y = setLastStatusIno (filename, refDB);
                                if (y==0)
                                        sleep (2);
                        }
                        while (y!=1);
                        do{
				y = addLogFileIno (filename);
                                if (y==0)
                                        sleep (2);
                        }
                        while (y!=1);
		}
                else if (x==2)
                        sleep (2);
        }
        while (x==2);*/
}

int file_select (struct direct* entry)
{
	if ((strcmp (entry->d_name, ".") == 0) || (strcmp (entry->d_name, "..") == 0))
		return ( FALSE );
	else
		return ( TRUE );
}

static int recursiveDirectory (directory, refDB, count2)
char* directory;
char* refDB;
{
	int count=0, i;
	struct direct** files;
	char* nameDir;
	int file_select ();
	
	if (count2==0)
		return (0);
	count = scandir (directory, &files, file_select, alphasort);
	if (count<=0){
		return (0);
	}
	for (i=1; i<count+1; i++){
		nameDir = (char*) malloc (strlen (directory)+strlen (files [i-1]->d_name)+2);
		strcpy (nameDir, directory);
		strcat (nameDir, "/");
		strcat (nameDir, files[i-1]->d_name);
		if (checkDir (nameDir))
			recursiveDirectory (nameDir, refDB, count2-1);
		else 
			checkIntegrity (nameDir, refDB);
	}
	free (nameDir);
	return (1);
}

static int count (filename)
char* filename;
{
	int i=0;
	for (i=0; filename [i] != ' '; i++);
	return (i);
}

static int checkIntegrityDB ()
{
	if (check (MeMS->LogAccess))
		mailToAdmin (MeMS->LogAccess);
	else if (check (MeMS->LogInode))
		mailToAdmin (MeMS->LogInode);
	else if (check (MeMS->LogModify))
                mailToAdmin (MeMS->LogModify);
	else if (check (MeMS->LogStatus))
                mailToAdmin (MeMS->LogStatus);
	else if (check (MeMS->anotherFile))
                mailToAdmin (MeMS->anotherFile);
	else if (check (MeMS->anotherDB))
                mailToAdmin (MeMS->anotherDB);
	else if (check (MeMS->high))
                mailToAdmin (MeMS->high);
	else if (check (MeMS->medium))
                mailToAdmin (MeMS->medium);
	else if (check (MeMS->low))
                mailToAdmin (MeMS->low);
	else if (check (MeMS->refH))
                mailToAdmin (MeMS->refH);
	else if (check (MeMS->refM))
                mailToAdmin (MeMS->refM);
	else if (check (MeMS->refL))
                mailToAdmin (MeMS->refL);
	
/*	 if (check ("/etc/isagcheck/LogAccess"))
                mailToAdmin (MeMS->LogAccess);
        else if (check ("/etc/isagcheck/LogIno")) 
                mailToAdmin (MeMS->LogInode);
        else if (check ("/etc/isagcheck/LogModify"))
                mailToAdmin (MeMS->LogModify);
        else if (check ("/etc/isagcheck/LogStatus"))
                mailToAdmin (MeMS->LogStatus);
        else if (check ("/etc/isagcheck/db"))
                mailToAdmin (MeMS->anotherFile);
        else if (check ("/etc/isagcheck/DBFile"))
                mailToAdmin (MeMS->anotherDB);
        else if (check ("/etc/isagcheck/high"))
                mailToAdmin (MeMS->high);
        else if (check ("/etc/isagcheck/medium"))
                mailToAdmin (MeMS->medium);
        else if (check ("/etc/isagcheck/low"))
                mailToAdmin (MeMS->low);
        else if (check ("/etc/isagcheck/refH"))
                mailToAdmin (MeMS->refH);
        else if (check ("/etc/isagcheck/refM"))
                mailToAdmin (MeMS->refM);
        else if (check ("/etc/isagcheck/refL"))
                mailToAdmin (MeMS->refL);
*/
}

static int check (filename)
char* filename;
{
	FILE* file;
        MD5_CTX context;
        int len, i;
        char* tmp;
        char* r;
        unsigned char buffer [1024], digest [16], buffer2 [167];

        for (i=0;i<167;buffer2 [i++]=' ');
        if ((file = fopen (filename, "r+")) == NULL) {
                return (2);
        }
        else {
                MDInit (&context);
                while (len = fread (buffer, 1, 1024, file))
                        MDUpdate (&context, buffer, len);
                MDFinal (digest, &context);

                fclose (file);
                
                if ((file = fopen ("/etc/isagcheck/md5DB", "r+")) == NULL) {
                        return (2);
                }
                else {  
			while (len = fread (buffer2, 1, 166, file)){
                                if (!strncmp(filename, buffer2, count (buffer2) < strlen (filename) ? strlen (filename) : count (buffer2))) {
                                        tmp = (char*) malloc (33);
                                        r = (char*) malloc (4);
                                        tmp[0] = '\0';
                                        for (i = 0; i < 16; i++) {
                                                sprintf (r, "%02x", digest[i]);
                                                strcat (tmp, r);
                                        }
					buffer2[166]='\0';
					sleep (2);
                                        if (!strncmp(tmp, &buffer2 [51], 32)) {
                                                free (r);
                                                free (tmp);
                                                fclose (file);
                                                return (0);
                                        }
                                        else {
                                                free (r);
                                                free (tmp);
                                                fclose (file);
                                                return (1);
                                        }
                                }
                                for (i=0;i<167;buffer2 [i++]=' ');
                        }
                }
        }
	return (0);

}

static void mailToAdmin (filename)
char* filename;
{
	printf("%s has change \n",filename);
}

static int addIntegrity (filename)
char* filename;
{
        FILE* file;
        struct stat statbuff;
        struct tm* localtime ();
        char* asctime ();
        MD5_CTX context;
        int len, i;
        char* tmp;
        char* r;
        char* j;
        unsigned char buffer [1024], digest [16], buffer2 [167], buf [52];

        stat (filename, &statbuff);
        for (i=0;i<167;buffer2 [i++]=' ');


        if ((file = fopen (filename, "r+")) == NULL) {
                printf ("%s can't be opened\n", filename);
                //exit (0);
        }
        else {
		MDInit (&context);
                while (len = fread (buffer, 1, 1024, file))
                        MDUpdate (&context, buffer, len);
                MDFinal (digest, &context);

                fclose (file);

                if ((file = fopen ("/etc/isagcheck/md5DB", "r+")) == NULL) {
                        printf ("DB can't be opened\n");
                        //exit (0);
                }
                else {
                        while (len = fread (buffer2, 1, 166, file)){
                                if (!strncmp(filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
                                        return (0);
                                }
                        }// if not found file in db done*/
                        for (i=0;i<167;buffer2 [i++]=' ');
                        strncpy (buffer2, filename, strlen (filename));
                        tmp = (char*) malloc (33);
                        r = (char*) malloc (4);
                        tmp[0] = '\0';
                        for (i = 0; i < 16; i++) {
                                sprintf (r, "%02x", digest[i]);
                                strcat (tmp, r);
                        }
                        strncpy (&buffer2 [51], tmp, 32);
                        free (tmp);
                        strncpy (&buffer2 [84], asctime (localtime (&statbuff.st_mtime)), 24);
                        strncpy (&buffer2 [109], asctime (localtime (&statbuff.st_ctime)), 24);
                        strncpy (&buffer2 [134], asctime (localtime (&statbuff.st_atime)), 24);
                        tmp = (char*) malloc (7);
                        sprintf (tmp, "%d", statbuff.st_ino);
                        strncpy (&buffer2 [159], tmp, 6);
                        fseek (file, 0, 2);
                        buffer2 [165] = '\n';
                        buffer2 [166] = '\0';
                        fseek (file, 0, 2);
                        fprintf (file, buffer2);
                        free (tmp);
                        free (r);
                        fclose (file);
			//printf ("%s\n",buffer2);
                }

	}
	return (0);
}

static void initIntegrityDB ()
{
	addIntegrity (MeMS->LogAccess);
        addIntegrity (MeMS->LogInode);
        addIntegrity (MeMS->LogModify);
        addIntegrity (MeMS->LogStatus);
        addIntegrity (MeMS->anotherFile);
        addIntegrity (MeMS->anotherDB);
        addIntegrity (MeMS->high);
        addIntegrity (MeMS->medium);
        addIntegrity (MeMS->low);
        addIntegrity (MeMS->refH);
        addIntegrity (MeMS->refM);
        addIntegrity (MeMS->refL);

}

static void integrityDB ()
{
	
	changeIntegrity (MeMS->LogAccess);
        changeIntegrity (MeMS->LogInode);
        changeIntegrity (MeMS->LogModify);
        changeIntegrity (MeMS->LogStatus);
        changeIntegrity (MeMS->anotherFile);
        changeIntegrity (MeMS->anotherDB);
        changeIntegrity (MeMS->high);
        changeIntegrity (MeMS->medium);
        changeIntegrity (MeMS->low);
        changeIntegrity (MeMS->refH);
        changeIntegrity (MeMS->refM);
        changeIntegrity (MeMS->refL);
	
}

static int changeIntegrity (filename)
char* filename;
{
	//printf ("h\n");
        FILE* file;
        struct stat statbuff;
        struct tm* localtime ();
        char* asctime ();
        MD5_CTX context;
        int len, i;
        char* tmp;
        char* r;
        char* j;
        unsigned char buffer [1024], digest [16], buffer2 [167], buf [52];

        stat (filename, &statbuff);
        for (i=0;i<167;buffer2 [i++]=' ');


        if ((file = fopen (filename, "r+")) == NULL) {
                printf ("%s can't be opened\n", filename);
                //exit (0);
        }
        else {
		MDInit (&context);
                while (len = fread (buffer, 1, 1024, file))
                        MDUpdate (&context, buffer, len);
                MDFinal (digest, &context);

                fclose (file);

                if ((file = fopen ("/etc/isagcheck/md5DB", "r+")) == NULL) {
                        printf ("DB can't be opened\n");
                        //exit (0);
                }
                else {
                        while (len = fread (buffer2, 1, 166, file)){
                                if (!strncmp(filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
                                       // return (0);
                                
                        //}// if not found file in db done
                        		for (i=0;i<167;buffer2 [i++]=' ');
                        		strncpy (buffer2, filename, strlen (filename));
                        		tmp = (char*) malloc (33);
                        		r = (char*) malloc (4);
                        		tmp[0] = '\0';
                        		for (i = 0; i < 16; i++) {
                                		sprintf (r, "%02x", digest[i]);
                                		strcat (tmp, r);
                        		}
                        		strncpy (&buffer2 [51], tmp, 32);
                        		free (tmp);
                        		strncpy (&buffer2 [84], asctime (localtime (&statbuff.st_mtime)), 24);
                        		strncpy (&buffer2 [109], asctime (localtime (&statbuff.st_ctime)), 24);
                        		strncpy (&buffer2 [134], asctime (localtime (&statbuff.st_atime)), 24);
                        		tmp = (char*) malloc (7);
                        		sprintf (tmp, "%d", statbuff.st_ino);
                        		strncpy (&buffer2 [159], tmp, 6);
                        		buffer2 [165] = '\n';
                        		buffer2 [166] = '\0';
                        		fseek (file, -166, 1);
                        		fprintf (file, buffer2);
                        		free (tmp);
                        		free (r);
                        		fclose (file);
					return (0);
				}
			}
                }

	}
	return (0);
}

static void encryp(file_name, passwd)
char* file_name;
char* passwd;
{
        int file,passwd_len,sum,j,tmp,k;
        long int i;
        unsigned char ch,*buf,*passwd_buf,*buf_new;

        i = 0;j = 0;sum = 0;k = 0;

        passwd_len = strlen(passwd);
        for (k = 0; k < passwd_len;k++) {
                sum = sum + passwd[k];
        }
        sum = sum % 256;
        if((file = open(file_name,O_RDONLY))== -1){
                perror("");
                exit(0);
        }
        while(read(file,&ch,1) == 1)
                i++;
        buf = (unsigned char *)malloc (sizeof(unsigned char) * i);
        passwd_buf = (unsigned char *)malloc(sizeof(unsigned char) * passwd_len);
        lseek (file,0,SEEK_SET);
        while (read(file,&ch,1) == 1){
                buf[j] = ch;
                j++;
        }
        for (k = 0; k < i;k++){
                buf[k] = buf[k] ^ sum;
        }
        close(file);
	if (buf[0] != 1){
                printf ("Can't Encrypytion !\n");
                free(buf);
                exit(0);
        }
        if (buf[1] != passwd_len){
                printf ("Can't Encryption 2!\n");
                free(buf);
                exit(0);
        }
        for(k = 0;k < passwd_len;k++ ){
                passwd_buf[k] = buf[k+2];
        }
        if(strcmp(passwd,passwd_buf) != 0){
                printf ("Can't Encryption 3!\n");
                free(buf);
                free(passwd_buf);
                exit(0);
        }
        k = i - 2 - passwd_len;
        buf_new = (unsigned char *) malloc (sizeof(unsigned char) * k);
        for (j = 0;j < k; j++){
                buf_new[j] = buf[j+2+passwd_len];
        }
        free(buf);
        for (j = 0; j < k/2;j++){
                if((j%2)==0){
                        tmp = buf_new[j];
                        buf_new[j] = buf_new[k-j-1];
                        buf_new[k-j-1] = tmp;
                }
        }
        file = open(file_name,O_WRONLY|O_TRUNC);
        write(file,buf_new,k);
        free(buf_new);
        close(file);
        printf ("Complete \n");
}

static void decryp(file_name, passwd)
char* file_name;
char* passwd;
{
        int file,passwd_len,j,k,sum,tmp;
        long int i;
        unsigned char ch;
        unsigned char *buf;

        i = 0;j = 0;sum = 0;
        passwd_len = strlen(passwd);
        for(k = 0; k < passwd_len; k++)
        {
                sum = sum + passwd[k];
        }
        sum = sum % 256;
        if((file = open(file_name,O_RDONLY))== -1)
        {
                perror ("");
                exit(0);
        }
        while (read(file,&ch,1)==1)
                i++;
        buf = (unsigned char *)malloc(sizeof(unsigned char) * i);
        lseek(file,0,SEEK_SET);
        while(read(file,&ch,1)==1)
        {
                buf[j] = ch;
                j++;
        }
        close(file);
 for (k = 0;k < i;k++)
        {
                buf[k] = buf[k]^sum;
        }
        if (buf[0] == 1)
        {
                printf ("This file was pass decryption \n");
                free(buf);
                exit(0);
        }
        for (k = 0;k < i/2; k++)
        {
                if((k % 2)==0)
                {
                        tmp = buf[k];
                        buf[k] = buf[i-k-1];
                        buf[i-k-1] = tmp;
                }
        }
        for (k=0;k<passwd_len;k++)
        {
                passwd[k] = passwd[k] ^ sum;
        }
        file = open(file_name,O_WRONLY|O_TRUNC);
        lseek(file,0,SEEK_SET);
        ch = 1 ^ sum;
        write (file,&ch,1);
        ch = passwd_len ^ sum;
        lseek(file,0,SEEK_CUR);
        write (file,&ch,1);
        lseek(file,0,SEEK_CUR);
        write (file,passwd,passwd_len);
        lseek (file,0,SEEK_CUR);
        write (file,buf,i);
        free(buf);
        close(file);
        printf("Complete \n");
}

