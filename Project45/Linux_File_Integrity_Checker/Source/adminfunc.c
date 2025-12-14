//####################################################
//#
//#   File : adminfunc.h
//#
//####################################################

//#include <ncurses.h>
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
#include "global.h"
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <netdb.h>
#include <sys/utsname.h>

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
//#define PASSWORD_LEN 8 

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

        unsigned long int timeToSleep;
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


extern int alphasort ();

static int addFileToDB PROTO_LIST ((char*));
static int recursiveDir PROTO_LIST ((char*, int));
static int recursiveDirPolicy PROTO_LIST ((char*, int));
static int count PROTO_LIST ((char*));
static int file_select PROTO_LIST ((struct direct**));
static int checkDir PROTO_LIST ((char*));
static int delFileFromDB PROTO_LIST ((char*));
static int delDirFromDB PROTO_LIST ((char*));
static int deleteFile PROTO_LIST ((char*));
static int dropFilePolicy PROTO_LIST ((char*));
static int activeFilePolicy PROTO_LIST ((char*));
static void swapFile ();
static void secureHigh ();
static void secureMedium ();
static void secureLow ();
static void CtimeSec PROTO_LIST ((char*));
static void CtimeMin PROTO_LIST ((char*));
static void CtimeHour PROTO_LIST ((char*));
static void CtimeDay PROTO_LIST ((char*));
static void reportForm ();
static void reportDay PROTO_LIST ((char*, char*));
static void reportMouth PROTO_LIST ((char*, char));
static void reportYear PROTO_LIST ((char*, char*));
static void reportHour PROTO_LIST ((char*, char*, char*));
static void reportAll PROTO_LIST ((char*, char*, char*));
static void encrypF PROTO_LIST ((char*, char*));
static void decrypF PROTO_LIST ((char*, char*));
static int encrypPasswd PROTO_LIST ((char*,char*));
static void MDPrint PROTO_LIST ((char*));
static void MDString PROTO_LIST ((char*));
static void integrityDB ();
static int changeIntegrity PROTO_LIST ((char*));
static void init ();
static int addPolicy PROTO_LIST ((char*));
static void usage PROTO_LIST ((char*));
static int checkDay PROTO_LIST ((char*));

static int checkDay (day)
char* day;

{
	char* tmp1;
	int tmp2;

	if ((day[2]=='/') && (day[5]=='/')){
		tmp1 = (char*) malloc (3);
		tmp1[0]=day[0];
		tmp1[1]=day[1];
		tmp1[2]='\0';
		tmp2 = atoi(tmp1);
		if ((tmp2>=1) && (tmp2<=31)) {
			tmp1[0]=day[3];
			tmp1[1]=day[4];
			tmp1[2]='\0';
			tmp2 = atoi (tmp1);
			if ((tmp2>=1) && (tmp2<=12)){
				free (tmp1);
				tmp1 = (char*) malloc (5);
				tmp1[0]=day[6];
				tmp1[1]=day[7];
				tmp1[2]=day[8];
				tmp1[3]=day[9];
				tmp1[4]='\0';
				tmp2 = atoi (tmp1);
				if ((tmp2>=1990) && (tmp2<=2006)){
					free (tmp1);
					return (1);
				}
				else {
					free (tmp1);
					return (0);
				}
				
			}
			else {
				free (tmp1);
				return (0);
			}
		}
		else{ 
			free (tmp1);
			return (0);
		}
	
	
	}
	else 
		return (0);
}

static void usage (prgm)
char* prgm;
{
	printf ("\nIsagCheck V. 1.00 Usage:%s {Command Type(s)] [Options] <log> <File name or Directory> <Date>\n",prgm);
	printf ("Some Command Types\n");
	printf ("\tadd Add another file or directory for check\n");
	printf ("\tdel Delete file or directory from Database\n");
	printf ("\texcl Exclude file from default Database\n");
	printf ("\tactive Active file from default Database\n");
	printf ("\treport Report result of file change\n");
	printf ("Some Options\n");
	printf ("\t-f filename\n");
	printf ("\t-d directory\n\n");
	printf ("\t For Command report\n");
	printf ("\t-d Day : dd/mm/yyyy\n");
	printf ("\t-m Mount : mm/yyyy\n");
	printf ("\t-y year : yyyy\n");
	printf ("\t-h Hour : ss-ee, s=start hour, e=end hour\n");
	printf ("\t-a All condition change\n");
	printf ("Some Log\n");
	printf ("\tacc Report access file change\n");
	printf ("\tino Rport Inoe file change\n");
	printf ("\tper Report Permission file change\n");
	printf ("\tmod Report Modify file change\n");
	printf ("Some Date\n");
	printf ("\t10/01/2003 for option select -d\n");
	printf ("\t01/2003 for option select -m\n");
	printf ("\t2003 for option select -y\n");
	printf ("\t6-8 for option select -h\n");
	printf ("Example: isagcheck report -a -d 10/01/2003\n");
	printf ("SEE THE MAN PAGE FOR MANY MORE OPTIONS, DESCRIPTIONS, AND EXAMPLES \n");

}

static int addPolicy (filename)
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
                return (0);
        }
        else {
                MDInit (&context);
                while (len = fread (buffer, 1, 1024, file))
                        MDUpdate (&context, buffer, len);
                MDFinal (digest, &context);

                fclose (file);

                if ((file = fopen ("/etc/isagcheck/refH", "r+")) == NULL) {
                        printf ("DB can't be opened\n");
                        exit (0);
                }
                else {
                        while (len = fread (buffer2, 1, 166, file)){
                                if (!strncmp(filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
                                        return (0);
                                }
                        }// if not found file in db done
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
			for (i=0;i<7;tmp [i++] = ' ');
                        sprintf (tmp, "%d", statbuff.st_ino);
			
                        for (i=0;i<6;i++)
                                if (tmp[i]=='\0')
                                        tmp[i]=' ';
                        strncpy (&buffer2 [159], tmp, 6);

                        fseek (file, 0, 2);
                        buffer2 [165] = '\n';
                        buffer2 [166] = '\0';
                        fseek (file, 0, 2);
                        fprintf (file, buffer2);
                        free (tmp);
                        free (r);
                        fclose (file);
                }
                if ((file = fopen ("/etc/isagcheck/high", "r+")) == NULL) { // add file to db_file
                        printf ("DBFile can't be opened\n");
                        exit (0);
                }
		               else {
                        while (len = fread (buf, 1, 51, file)){
                                if (!strncmp(filename, buf, count (buf)<strlen(filename)?strlen (filename):count (buf))) {
                                        return (0);
                                }
                        }
                        for (i=0;i<52;buf [i++]=' ');
                        strncpy (buf, filename, strlen (filename));
                        fseek (file, 0, 2);
                        buf [50] = '\n';
                        buf [51] = '\0';
                        fprintf (file, buf);
                        fclose (file);
                }
        }
        return (0);


	

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
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n"); 
                exit (0);
        }       
        else {
                if (1){//((fp2 = open ("/root/v2/md5-c/bkup", O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        //printf ("Jay");
                        
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
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
        }
        //initIntegrityDB ();
}

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

static int addFileToDB(filename)
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
		return (0);
	}
	else {
 		MDInit (&context);
 		while (len = fread (buffer, 1, 1024, file))
  			MDUpdate (&context, buffer, len);
 		MDFinal (digest, &context);

		fclose (file);

		//if ((file = fopen ("/etc/isagcheck/refH", "r+")) == NULL) {
		if ((file = fopen (MeMS->anotherDB, "r+")) == NULL) {
			printf ("DB can't be opened\n");
			exit (0);
		}
		else {
			while (len = fread (buffer2, 1, 166, file)){
				if (!strncmp(filename, buffer2, count (buffer2)<strlen (filename)?strlen (filename):count (buffer2))) {
					return (0);
				}
			}// if not found file in db done
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
			for (i=0;i<7;tmp [i++] = ' ');
			sprintf (tmp, "%d", statbuff.st_ino);
			for (i=0;i<6;i++)
				if (tmp[i]=='\0')
					tmp[i]=' ';
			strncpy (&buffer2 [159], tmp, 6);
					
			fseek (file, 0, 2);
			buffer2 [165] = '\n';
			buffer2 [166] = '\0';
			fseek (file, 0, 2);
			fprintf (file, buffer2);
			free (tmp);
			free (r);
			fclose (file);
		}
		//if ((file = fopen ("/etc/isagcheck/high", "r+")) == NULL) { // add file to db_file
		if ((file = fopen (MeMS->anotherFile, "r+")) == NULL) { // add file to db_file
			printf ("DBFile can't be opened\n");
			exit (0);
		}
		else {
			while (len = fread (buf, 1, 51, file)){
				if (!strncmp(filename, buf, count (buf)<strlen(filename)?strlen (filename):count (buf))) {
					return (0);
				}
			}
			for (i=0;i<52;buf [i++]=' ');
			strncpy (buf, filename, strlen (filename));
			fseek (file, 0, 2);
			buf [50] = '\n';
			buf [51] = '\0';
			fprintf (file, buf);
			fclose (file);
		}
	}
	return (0);
}

static int delFileFromDB (filename)
char* filename;
{	
	int fp1, fp2, num_read;
	int i;
	unsigned char buf1[167], buf2 [52];
	for (i=0;i<167;buf1 [i++]=' ');
	for (i=0;i<52;buf2 [i++]=' ');
	if ((fp1 = open (MeMS->anotherDB, O_CREAT|O_RDONLY, S_IRUSR|S_IWUSR)) == -1 ){
        	printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {	
		if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                	while ((num_read = read (fp1, buf1, 166)) > 0){
				if (strncmp (filename, buf1, count (buf1)<strlen (filename)?strlen (filename):count (buf1))) {
					write (fp2, buf1, 166); 
				}
			}
		}
		else {
        		printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
			exit (0);
		}
		close (fp1);
		close (fp2);
 	}	
	if ((fp1 = open (MeMS->anotherDB, O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ){ 
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }               
        else {          
                if ((fp2 = open (MeMS->backUp, O_RDONLY, S_IRUSR|S_IWUSR)) != -1) {
                	while ((num_read = read (fp2, buf1, 166)) > 0){
                                write (fp1, buf1, 166);
                	}
		}       
		else {
        		printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
			exit (0);
		}
                close (fp1);
                close (fp2);
        }
	unlink (MeMS->backUp);	
//#########################################################################################################
	
	if ((fp1 = open (MeMS->anotherFile, O_RDONLY, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
             	if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                	while ((num_read = read (fp1, buf2, 51)) > 0){
				if (strncmp (filename, buf2, count (buf2)<strlen (filename)?strlen (filename):count (buf2))) {
                                	write (fp2, buf2, 51);
                        	}
                	}
		}
		else {
                	printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
			exit (0);
		}
                close (fp1);
                close (fp2);
        }
        if ((fp1 = open (MeMS->anotherFile, O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
            	if ((fp2 = open (MeMS->backUp, O_RDONLY, S_IRUSR|S_IWUSR)) != -1) {
                	while ((num_read = read (fp2, buf2, 51)) > 0){
                                write (fp1, buf2, 51);
                	}
		}
		else {
                	printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
			exit (0);
		}
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
	return (0);
}
	
static int delDirFromDB (directory) 
char* directory;
{
	int count = 0, i;
        struct direct** files;
        char* nameDir;
        int file_select ();
        
        count = scandir (directory, &files, file_select, alphasort);
        
        if (count <= 0){
                printf("No file in directory \n");
                exit (0);
        }
        for (i=1; i<count+1; i++){
                nameDir = (char*) malloc (strlen (directory) + strlen (files[i-1]->d_name) + 2);
                strcpy (nameDir, directory);
                strcat (nameDir, files[i-1]->d_name);
                if (checkDir (nameDir))
                        delDirFromDB (strcat (nameDir, "/"));
                else{ 
			deleteFile (nameDir);
                }
                free (nameDir);
        }                       
        free (nameDir);
}

static int deleteFile (filename)
char* filename;
{
	int fp1, fp2, num_read;
        int i;
        unsigned char buf1[167], buf2 [52];
        for (i=0;i<167;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        if ((fp1 = open (MeMS->anotherDB, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        while ((num_read = read (fp1, buf1, 166)) > 0){
                                if (!strncmp (filename, buf1, count (buf1)<strlen (filename)?strlen (filename):count (buf1))) {
        				for (i=0;i<167;buf1 [i++]='J');
					buf1 [165] = '\n';
					lseek (fp1, -166, SEEK_CUR);
                                        write (fp1, buf1, 166);
                                }
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
//#########################################################################################################

        if ((fp1 = open (MeMS->anotherFile, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp1, buf2, 51)) > 0){
                                if (!strncmp (filename, buf2, count (buf2)<strlen (filename)?strlen (filename):count (buf2))) {
        				for (i=0;i<52;buf2 [i++]='J');
					buf2 [50] = '\n';
					lseek (fp1, -51, SEEK_CUR);
                                        write (fp1, buf2, 51);
                                }
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
	return (0);
}

static int dropFilePolicy (filename)
char* filename;
{
	int fp1, fp2, num_read;
        int i;
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        
	if ((fp1 = open (MeMS->anotherFile, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp1, buf2, 51)) > 0){
                                if (!strncmp (filename, buf2, count (buf2)<strlen (filename)?strlen (filename):count (buf2))) {
					buf1 [0] = '#';
					strncpy (&buf1 [1], buf2, count (buf2));
					//buf1 [count (buf1)+1]='\0';
					//printf ("%sj\n",buf1);
                                        //for (i=0;i<52;buf2 [i++]='J');
                                        buf1 [50] = '\n';
                                        lseek (fp1, -51, SEEK_CUR);
                                        write (fp1, buf1, 51);
                                }       
                        }       
                }       
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }       
                close (fp1);
                close (fp2);
        }       
        unlink (MeMS->backUp);
	return (0);	
}

static int activeFilePolicy (filename)
char* filename;
{
	int fp1, fp2, num_read;
        int i;
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        
	if ((fp1 = open (MeMS->anotherFile, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp1, buf2, 51)) > 0){
                                if (!strncmp (filename, &buf2[1], count (&buf2[1])<strlen (filename)?strlen (filename):count (&buf2[1]))) {
					//buf1 [0] = '#';
					strncpy (buf1, &buf2[1], count (&buf2[1]));
					//buf1 [count (buf1)+1]='\0';
					//printf ("%sj\n",buf1);
                                        //for (i=0;i<52;buf2 [i++]='J');
                                        buf1 [50] = '\n';
                                        lseek (fp1, -51, SEEK_CUR);
                                        write (fp1, buf1, 51);
                                }       
                        }       
                }       
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }       
                close (fp1);
                close (fp2);
        }       
        unlink (MeMS->backUp);
	return (0);
}

static void swapFile () 
{	
	int fp1, fp2, num_read;
        int i;
        unsigned char buf1[167], buf2 [52];
        for (i=0;i<167;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');

	 if ((fp1 = open (MeMS->anotherDB, O_CREAT|O_RDONLY, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        while ((num_read = read (fp1, buf1, 166)) > 0){
                                if (buf1 [0]!= 'J') {
                                        write (fp2, buf1, 166);
                                }
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }


	if ((fp1 = open (MeMS->anotherDB, O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_RDONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp2, buf1, 166)) > 0){
                                write (fp1, buf1, 166);
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
//#########################################################################################################

	if ((fp1 = open (MeMS->anotherFile, O_RDONLY, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp1, buf2, 51)) > 0){
                                if (buf2 [0] !='J') {
                                        write (fp2, buf2, 51);
                                }
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }

	
	if ((fp1 = open (MeMS->anotherFile, O_TRUNC|O_WRONLY, S_IRUSR|S_IWUSR)) == -1 ) {
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_RDONLY, S_IRUSR|S_IWUSR)) != -1) {
                        while ((num_read = read (fp2, buf2, 51)) > 0){
                                write (fp1, buf2, 51);
                        }
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static int count (filename)
char* filename;
{
	int i=0;
	for (i=0; filename [i] != ' '; i++);
	return (i);
}

static int file_select (struct direct* entry)
{
	if ((strcmp (entry->d_name, ".") == 0) || (strcmp (entry->d_name, "..") ==0))
		return (FALSE);
	else 	
		return (TRUE);
}

static int recursiveDir (directory, count1)
char* directory;
{	
	int count = 0, i;
	struct direct** files;
	char* nameDir;
	int file_select ();
	if (count1 == 0)
		return 0;
	count = scandir (directory, &files, file_select, alphasort);
	
	if (count <= 0){
		printf("No file in directory \n");
		exit (0);
	}
	for (i=1; i<count+1; i++){
		nameDir = (char*) malloc (strlen (directory) + strlen (files[i-1]->d_name) + 2);
		strcpy (nameDir, directory);
		strcat (nameDir, files[i-1]->d_name);
		if (checkDir (nameDir))
			recursiveDir (strcat (nameDir, "/"), count1-1);
		else{ 
			addFileToDB (nameDir);
		}
		free (nameDir);
	}			
	free (nameDir);
}
static int recursiveDirPolicy (directory, count1)
char* directory;
{       
        int count = 0, i;
        struct direct** files;
        char* nameDir;
        int file_select ();
        if (count1 == 0)
                return 0;
        count = scandir (directory, &files, file_select, alphasort);
        
        if (count <= 0){
                printf("No file in directory \n");
                exit (0);
        }
        for (i=1; i<count+1; i++){
                nameDir = (char*) malloc (strlen (directory) + strlen (files[i-1]->d_name) + 2);
                strcpy (nameDir, directory);
                strcat (nameDir, files[i-1]->d_name);
                if (checkDir (nameDir))
                        recursiveDir (strcat (nameDir, "/"), count1-1);
                else{           
                        addPolicy (nameDir);
                }                       
                free (nameDir);
        }
        free (nameDir);
}

static void secureHigh ()
{
	int fp1, fp2, num_read;
        int i;
	char tmp1[] ="/etc/isagcheck/high";
	char tmp2[] ="/etc/isagcheck/refH";
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
			num_read = read (fp1, buf1, 51);
			i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
			for (i=0;tmp1[i]!='\0';i++)
				buf1 [i]= tmp1[i];
			buf1 [50]  ='\n';
			buf1 [51]  ='\0';
			lseek (fp1, -51, SEEK_CUR);
			write (fp1, buf1, 51);
			strcpy (MeMS->DBFile, tmp1);

                        num_read = read (fp1, buf1, 51);
			i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
			for (i=0;tmp2[i]!='\0';i++)
				buf1 [i]= tmp2[i];
			buf1 [50]  ='\n';
			buf1 [51]  ='\0';
			lseek (fp1, -51, SEEK_CUR);
			write (fp1, buf1, 51); 
			strcpy (MeMS->refDB, tmp2);
		}
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void secureMedium ()
{
	int fp1, fp2, num_read;
        int i;
        char tmp1[] ="/etc/isagcheck/medium";
        char tmp2[] ="/etc/isagcheck/refM";
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        num_read = read (fp1, buf1, 51);
                        i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
                        for (i=0;tmp1[i]!='\0';i++)
                                buf1 [i]= tmp1[i];
                        buf1 [50]  ='\n';
                        buf1 [51]  ='\0';
                        lseek (fp1, -51, SEEK_CUR);
                        write (fp1, buf1, 51);
                        strcpy (MeMS->DBFile, tmp1);

                        num_read = read (fp1, buf1, 51);
                        i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
                        for (i=0;tmp2[i]!='\0';i++)
                                buf1 [i]= tmp2[i];
                        buf1 [50]  ='\n';
                        buf1 [51]  ='\0';
                        lseek (fp1, -51, SEEK_CUR);
                        write (fp1, buf1, 51);  
                        strcpy (MeMS->refDB, tmp2);
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void secureLow ()
{
	int fp1, fp2, num_read;
        int i;
        char tmp1[] ="/etc/isagcheck/low";
        char tmp2[] ="/etc/isagcheck/refL";
        unsigned char buf1[52], buf2 [52];
        for (i=0;i<52;buf1 [i++]=' ');
        for (i=0;i<52;buf2 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR,S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }       
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        num_read = read (fp1, buf1, 51);
                        i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
                        for (i=0;tmp1[i]!='\0';i++)
                                buf1 [i]= tmp1[i];
                        buf1 [50]  ='\n';
                        buf1 [51]  ='\0';
                        lseek (fp1, -51, SEEK_CUR);
                        write (fp1, buf1, 51);
                        strcpy (MeMS->DBFile, tmp1);

                        num_read = read (fp1, buf1, 51);
                        i = count (buf1);
                        for (i=0;i<52;buf1 [i++]=' ');
                        for (i=0;tmp2[i]!='\0';i++)
                                buf1 [i]= tmp2[i];
                        buf1 [50]  ='\n';
                        buf1 [51]  ='\0';
                        lseek (fp1, -51, SEEK_CUR);
                        write (fp1, buf1, 51);  
                        strcpy (MeMS->refDB, tmp2);
                }
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);

}

static void CtimeSec (timeSleep)
char* timeSleep;
{
	int fp1, fp2, num_read;
        int i;
        char tmp1[] ="/etc/isagcheck/low";
        unsigned char buf1[52];
        for (i=0;i<52;buf1 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        for (i=0;i<52;buf1 [i++]=' ');
			strcpy (buf1, timeSleep);
			for (i=strlen(buf1);i<52;i++)
				buf1 [i] = ' ';
			buf1 [50] ='\n';
			buf1 [51] ='\0';
			lseek (fp1, -51, SEEK_END);
			write (fp1, buf1, 51);	
			MeMS->timeToSleep=atol(timeSleep);		
		}
                else {
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void CtimeMin (timeSleep)
char* timeSleep;
{	
	int fp1, fp2, num_read;
        int i;
	unsigned long int tmp;
        char tmp1[] ="/etc/isagcheck/low";
        unsigned char buf1[52];
        for (i=0;i<52;buf1 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {  
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        for (i=0;i<52;buf1 [i++]=' ');
			tmp = atol(timeSleep);
			tmp*=60;
			sprintf (buf1, "%ld", tmp);
                        for (i=strlen(buf1);i<52;i++)
                                buf1 [i] = ' ';
                        buf1 [50] ='\n';
                        buf1 [51] ='\0'; 
                        lseek (fp1, -51, SEEK_END);
                        write (fp1, buf1, 51);
                        MeMS->timeToSleep=60*atol(timeSleep);
                }
                else {  
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void CtimeHour (timeSleep)
char* timeSleep;
{
	 int fp1, fp2, num_read;
        int i;
	unsigned long int tmp;
        char tmp1[] ="/etc/isagcheck/low";
        unsigned char buf1[52];
        for (i=0;i<52;buf1 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {  
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        for (i=0;i<52;buf1 [i++]=' ');
			tmp = atol(timeSleep);
                        tmp*=3600;
                        sprintf (buf1, "%ld", tmp);
                        for (i=strlen(buf1);i<52;i++)
                                buf1 [i] = ' ';
                        buf1 [50] ='\n';
                        buf1 [51] ='\0'; 
                        lseek (fp1, -51, SEEK_END);
                        write (fp1, buf1, 51);
                        MeMS->timeToSleep=3600*atol(timeSleep);
                }
                else {  
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void CtimeDay (timeSleep)
char* timeSleep;
{
	int fp1, fp2, num_read;
        int i;
	unsigned long int tmp;
        char tmp1[] ="/etc/isagcheck/low";
        unsigned char buf1[52];
        for (i=0;i<52;buf1 [i++]=' ');
        if ((fp1 = open ("/etc/isagcheck/refFile", O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {  
                if ((fp2 = open (MeMS->backUp, O_CREAT|O_WRONLY, S_IRUSR|S_IWUSR)) != -1){
                        for (i=0;i<52;buf1 [i++]=' ');
			tmp = atol(timeSleep);
                        tmp*=3600;
                        sprintf (buf1, "%ld", tmp);
                        for (i=strlen(buf1);i<52;i++)
                                buf1 [i] = ' ';
                        buf1 [50] ='\n';
                        buf1 [51] ='\0'; 
                        lseek (fp1, -51, SEEK_END);
                        write (fp1, buf1, 51);
                        MeMS->timeToSleep=86400*atol(timeSleep);
                }
                else {  
                        printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                        exit (0);
                }
                close (fp1);
                close (fp2);
        }
        unlink (MeMS->backUp);
}

static void reportForm () 
{
	char* host;
        char** names;
        char** addrs;
        char computer [256];
	int ch;
        struct utsname uts;
        time_t timeval;
        struct hostent* hostinfo;

        (void)time(&timeval);
        if (gethostname (computer, 255) != 0 || uname (&uts) < 0) {
                fprintf (stderr, "Could not get host information\n");
                exit (0);
        }
        /*printf ("Computer hostname is: %s\n", computer);
        printf ("System is %s on %s hardware\n", uts.sysname, uts.machine);
        printf ("Node is : %s\n", uts.nodename);
        printf ("Version is : %s, %s\n",uts.release, uts.version);
        printf("Current time is : %s\n", ctime(&timeval));
        */
        //host = argv[1];
        hostinfo = gethostbyname(computer);
        addrs = hostinfo->h_addr_list;
	printf ("\nIsagcheck on Linux host\n");
        printf ("*** Processing Unix File System ***\n");
        printf ("Performing integrity file check...\n\n");sleep (1);
        printf ("Isagcheck (R) 0.9a File Check Report\n\n");
        printf ("Report generated by :\t\troot\n");
        printf ("Report created on :  \t\t%s\n", ctime (&timeval));
        printf ("\n");
        printf ("=============================================================================\n");
        printf ("Report Summary :\n");
        printf ("=============================================================================\n");
        printf ("\n");
        printf ("Host name :          \t\t%s\n",hostinfo->h_name);
        while(*addrs){                                                              
		printf ("Host IP address :    \t\t%s\n",inet_ntoa(*(struct in_addr *)*addrs));              
                addrs++;
        }
        printf ("System is :          \t\t%s on %s hardware\n", uts.sysname, uts.machine);         
	printf ("Version is :         \t\t%s, %s\n\n",uts.release, uts.version);      
        printf ("=============================================================================\n");
        printf ("Object Summary :\n");
        printf ("=============================================================================\n");
        printf ("\n");
	printf ("-----------------------------------------------------------------------------\n");
	printf ("# Section: Unix File System\n");	
	printf ("-----------------------------------------------------------------------------\n\n");
}

static void reportDay (filename, option)
char* filename;
char* option;
{
	int fp1, fp2, num_read;
        int i,x,count=32;
        unsigned char buf1[77], buf2 [84];
	char* mouth[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
	char* tmp = (char*)malloc (3);
	char* tmp2 = (char*) malloc (3);
	int ch,y;
	char* mode;
        tmp[0]=option[3];
        tmp[1]=option[4];
        tmp[2]='\0';
	tmp2[0]=option[0];
	tmp2[1]=option[1];
	tmp2[2]='\0';
	y = atoi (tmp2);
	if (y <10){
		tmp2[0]=tmp2[1];
		tmp2[1]='\0';
	}
	
	
	printf ("-----------------------------------------------------------------------------\n");
	printf ("%s :\n",!strcmp (&filename[18],"Ino")?"Inode":&filename [18]);	
	printf ("-----------------------------------------------------------------------------\n\n");
	x = atoi(tmp);
	//printf ("%s\n",option);
        for (i=0;i<77;buf1 [i++]=' ');
        for (i=0;i<84;buf2 [i++]=' ');
        if ((fp1 = open (filename, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
		if (!strcmp (&filename[18], "Ino")){
			while ((num_read = read (fp1, buf2, 83)) > 0){
				//printf ("%s %s\n",option, buf1);
                        	if (!strncmp (y<10?&option[1]:option, y<10?&buf2 [60]:&buf2[59],y<10?1:2)) {
                                	if (!strncmp (&mouth[x-1][0], &buf2 [55], 3)) {
                                        	if (!strncmp (&option [6], &buf2 [71], 4)) {
                                                	buf2 [75] ='\0';
                                                	printf ("%s\n",buf2);
                                                	for (i=0;i<84;buf2 [i++]=' ');
							ch=0;
                                        	}
                                	}
			//printf ("Jay\n");

                        	}
                	}
		}
		else {
                	while ((num_read = read (fp1, buf1, 76)) > 0){
				if (!strncmp (y<10?&option[1]:option, y<10?&buf1 [60]:&buf1[59],y<10?1:2)) {
					if (!strncmp (&mouth[x-1][0], &buf1 [55], 3)) {
						if (!strncmp (&option [6], &buf1 [71], 4)) {
							buf1 [75] ='\0';
							printf ("%s\n",buf1);
        						for (i=0;i<77;buf1 [i++]=' ');
							ch=0;
						}
					}
				
				}
                	}
                	close (fp1);
		}
        }
	printf ("\n\n");
}

static void reportMouth (filename, option)
char* filename;
char* option;
{
	 int fp1, fp2, num_read;
        int i,x,count=32;
        unsigned char buf1[77], buf2 [84];
        char* mouth[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        char* tmp = (char*)malloc (3);
        int ch;
        char* mode;
        tmp[0]=option[0];
        tmp[1]=option[1];
        tmp[2]='\0';

        printf ("-----------------------------------------------------------------------------\n");
	printf ("%s :\n",!strcmp (&filename[18],"Ino")?"Inode":&filename [18]);	
        printf ("-----------------------------------------------------------------------------\n\n");
        x = atoi(tmp);
        for (i=0;i<77;buf1 [i++]=' ');
        for (i=0;i<84;buf2 [i++]=' ');
        if ((fp1 = open (filename, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if (!strcmp (&filename[18], "Ino")){
			while ((num_read = read (fp1, buf2, 83)) > 0){
				if (!strncmp (&mouth[x-1][0], &buf2 [55], 3)) {
					if (!strncmp (&option [3], &buf2[71], 4)) {
						buf2 [75] ='\0';
                                                printf ("%s\n",buf2);
                                                for (i=0;i<84;buf2 [i++]=' ');
						ch=0;
					}
				}
			}
		}
		else {
			while ((num_read = read (fp1, buf1, 76)) > 0){
                           	if (!strncmp (&mouth[x-1][0], &buf1 [55], 3)) {
                                       	if (!strncmp (&option [3], &buf1 [71], 4)) {
                                               	count++;
                                               	buf1 [75] ='\0';
                                               	printf ("%s\n",buf1);
                                               	for (i=0;i<77;buf1 [i++]=' ');
                                	}
				}
                	}	
		}
                close (fp1);
        }
	printf ("\n\n");
}

static void reportYear (filename, option)
char* filename;
char* option;
{
	int fp1, fp2, num_read;
        int i,x,count=32;
        unsigned char buf1[77], buf2 [84];
        char* mouth[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        char* tmp = (char*)malloc (3);
        int ch;
        char* mode;
        tmp[0]=option[0];
        tmp[1]=option[1];
        tmp[2]='\0';

        printf ("-----------------------------------------------------------------------------\n");
        printf ("%s :\n",!strcmp (&filename[18],"Ino")?"Inode":&filename [18]);
        printf ("-----------------------------------------------------------------------------\n\n");
        x = atoi(tmp);
        for (i=0;i<77;buf1 [i++]=' ');
        for (i=0;i<84;buf2 [i++]=' ');
        if ((fp1 = open (filename, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if (!strcmp (&filename[18], "Ino")){
                        while ((num_read = read (fp1, buf2, 83)) > 0){
                        	if (!strncmp (&option [0], &buf2[71], 4)) {
                                	buf2 [75] ='\0';
                                        printf ("%s\n",buf2);
                                        for (i=0;i<84;buf2 [i++]=' ');
                                        ch=0;
                               	}
                        }
                }
                else {
                        while ((num_read = read (fp1, buf1, 76)) > 0){
                                if (!strncmp (&option [0], &buf1 [71], 4)) {
                                        count++;
                                	buf1 [75] ='\0';
                                        printf ("%s\n",buf1);
                                        for (i=0;i<77;buf1 [i++]=' ');
                               	}
                        }
                }
                close (fp1);
        }
        printf ("\n\n");

}

static void reportHour (filename, option, hour)
char* filename;
char* option;
char* hour;
{
	int fp1, fp2, num_read;
        int i,j,s,e,x,y,z,count=32;
        unsigned char buf1[77], buf2 [84];
        char* mouth[] = {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        char* tmp = (char*)malloc (3);
        char* tmp2 = (char*)malloc (3);
        int ch;
        char* mode;
	char* startH;
	char* endH;
	char* h;
	h = (char*)  malloc (3);
        tmp[0]=option[3];
        tmp[1]=option[4];
        tmp[2]='\0';
	tmp2[0]=option[0];
        tmp2[1]=option[1];
        tmp2[2]='\0';
        y = atoi (tmp2);
        if (y <10){
                tmp2[0]=tmp2[1];
                tmp2[1]='\0';
        }

	for (i=0;hour[i]!='-';i++);
	startH = (char*) malloc (i+1);
	startH[i]='\0';
	strncpy (startH, hour, i);
	for (j=0;hour[i+1]!='\0';j++,i++);
	endH = (char*) malloc (j+1);
	endH [j]='\0';
	strncpy (endH, &hour[i-j+1], j);
	y=i;
	z=j;
	s = atoi (startH);
	e = atoi (endH);
	e--;
	sprintf (endH,"%d",e);
	//printf ("%d-%d",s,e);
	if (s>=0 && s<=23)
		if (e>=0 && e<=23)
			if (s<=e) {
				
		
        printf ("-----------------------------------------------------------------------------\n");
        printf ("%s :\n",!strcmp (&filename[18],"Ino")?"Inode":&filename [18]);
        printf ("-----------------------------------------------------------------------------\n\n");
        x = atoi(tmp);
        for (i=0;i<77;buf1 [i++]=' ');
        for (i=0;i<84;buf2 [i++]=' ');
        if ((fp1 = open (filename, O_CREAT|O_RDWR, S_IRUSR|S_IWUSR)) == -1 ){
                printf ("In function delFileFromDB anotherDB or bkup can't be opened\n");
                exit (0);
        }
        else {
                if (!strcmp (&filename[18], "Ino")){
                        while ((num_read = read (fp1, buf2, 83)) > 0){
                                if (!strncmp (y<10?&option[1]:option, y<10?&buf2 [60]:&buf2[59],y<10?1:2)) {
                                        if (!strncmp (&mouth[x-1][0], &buf2 [55], 3)) {
                                                if (!strncmp (&option [6], &buf2 [71], 4)) {
							strncpy (h, &buf2[62], 2);
							h[2] ='\0';
							if ((atoi(h)>=s)&&(atoi(h)<=e)){
							buf2 [75] ='\0';
                                                        printf ("%s\n",buf2);
                                                        for (i=0;i<84;buf2 [i++]=' ');
                                                        ch=0;
							}
                                                }
                                        }

                                }
                        }
                }
                else {
                        while ((num_read = read (fp1, buf1, 76)) > 0){
                                if (!strncmp (y<10?&option[1]:option, y<10?&buf1 [60]:&buf1[59],y<10?1:2)) {
                                        if (!strncmp (&mouth[x-1][0], &buf1 [55], 3)) {
                                                if (!strncmp (&option [6], &buf1 [71], 4)) {
							strncpy (h, &buf1[62], 2);
							h[2] ='\0';
							if ((atoi(h)>=s)&&(atoi(h)<=e)){
                                                        buf1 [75] ='\0';
                                                        printf ("%s\n",buf1);
                                                        for (i=0;i<77;buf1 [i++]=' ');
                                                        ch=0;
							}
                                                }
                                        }

                                }
                        }
                        close (fp1);
                }
        }
        printf ("\n\n");
	
	}
}

static void reportAll (log,option,hour)
char* log;
char* option;
char* hour;
{
	if (hour==NULL){
		if (!strcmp (log, "-d")){
			reportDay (MeMS->LogAccess, option);
			reportDay (MeMS->LogStatus, option);
			reportDay (MeMS->LogModify, option);
			reportDay (MeMS->LogInode, option);
		}
		if (!strcmp (log, "-m")){
			reportMouth (MeMS->LogAccess, option);
			reportMouth (MeMS->LogStatus, option);
			reportMouth (MeMS->LogModify, option);
			reportMouth (MeMS->LogInode, option);
		}
		if (!strcmp (log, "-y")){
			reportYear (MeMS->LogAccess, option);
			reportYear (MeMS->LogStatus, option);
			reportYear (MeMS->LogModify, option);
			reportYear (MeMS->LogInode, option);
		}
	}
	else {
		reportHour (MeMS->LogAccess, option, hour);
		reportHour (MeMS->LogStatus, option, hour);
		reportHour (MeMS->LogModify, option, hour);
		reportHour (MeMS->LogInode, option, hour);
	}
}

static void decrypF(file_name, passwd)
char* file_name;
char* passwd;  
 
{
	int file,passwd_len,sum,j,tmp,k;
        long int i;
        unsigned char ch,*buf,*passwd_buf,*buf_new;

        i = 0;j = 0;sum = 0;k = 0;

        passwd_len = strlen(passwd);
        for(k = 0; k < passwd_len;k++)
        {
                sum = sum + passwd[k];
        }
        sum = sum % 256;
        if((file = open(file_name,O_RDONLY))== -1)
        {
                perror("");
                exit(0);
        }
        while(read(file,&ch,1) == 1)
                i++;
        buf = (unsigned char *)malloc (sizeof(unsigned char) * i);
        passwd_buf = (unsigned char *)malloc(sizeof(unsigned char) * passwd_len);
        lseek (file,0,SEEK_SET);
        while (read(file,&ch,1) == 1)
        {
                buf[j] = ch;
                j++;
        }
        for (k = 0; k < i;k++)
        {
                buf[k] = buf[k] ^ sum;
        }
        close(file);
        if (buf[0] != 1)
        {
                printf ("Can't Encrypytion !\n");
                free(buf);
                exit(0);
        }
	if (buf[1] != passwd_len)
        {
                printf ("Can't Encryption 2!\n");
                free(buf);
                exit(0);
        }
        for(k = 0;k < passwd_len;k++ )
        {
                passwd_buf[k] = buf[k+2];
        }
        if(strcmp(passwd,passwd_buf) != 0)
        {
                printf ("Can't Encryption 3!\n");
                free(buf);
                free(passwd_buf);
                exit(0);
        }
        k = i - 2 - passwd_len;
        buf_new = (unsigned char *) malloc (sizeof(unsigned char) * k);
        for (j = 0;j < k; j++)
        {
                buf_new[j] = buf[j+2+passwd_len];
        }
        free(buf);
        for (j = 0; j < k/2;j++)
        {
                if((j%2)==0)
                {
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

static void encrypF(file_name, passwd)
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

static int encrypPasswd (passwd,buf2)
char* passwd;
char* buf2;
{
	FILE* file;
        struct stat statbuff;
        struct tm* localtime ();
        char* asctime ();
        MD5_CTX context;
        int i;
        char* tmp;
        char* r;
        char* j;
	char* p1;
	char* p2;
  	unsigned int len = strlen (passwd);
        unsigned char buffer [1024], digest [16], buffer2 [167], buf [52];
		
	//printf ("%sJay\n",passwd);
	MDInit (&context);
  	MDUpdate (&context, passwd, len);
  	MDFinal (digest, &context);
	//MDPrint (digest);
	MDString (passwd);
	//printf ("4\n");
	p1 = (char*) malloc (33);
	p2 = (char*) malloc (33);
	p1 [0] = '\0';
	r = (char*) malloc (4);
	//printf ("6\n");
	for (i = 0; i< 16; i++) {
		sprintf (r, "%02x", digest [i]);
		strcat (p1, r);
	}
	//printf ("%s\n%s",p1,buf2);
	if (!strcmp (p1,buf2)){
		
		free (p1);
		free (p2);
		free (r);
		return (1);
	}
	free (p1);
	free (p2);
	free (r);
	
	//printf ("passed");
	return (0);
}

static void MDPrint (digest)
unsigned char digest[16];
{

  unsigned int i;

  for (i = 0; i < 16; i++)
 printf ("%02x", digest[i]);
}

static void MDString (string)
char *string;
{
  MD5_CTX context;
  unsigned char digest[16];
  unsigned int len = strlen (string);

  MDInit (&context);
  MDUpdate (&context, string, len);
  MDFinal (digest, &context);

  //printf ("MD%d (\"%s\") = ", MD, string);
  //MDPrint (digest);
  //printf ("\n");
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

