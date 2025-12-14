#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pwd.h>

int main(int argc, char *argv[])
{
	const char *user = "nobody";
	struct passwd *pw;
	int uid;
	char filename1[256]="";
	char filename2[256]="";
	char filename3[256]="";
	char symname1[256]="";
	char symname2[256]="";
	char symname3[256]="";
	char tmpfile[5];
	pid_t pid,ppid;
	int j=1;
	/* check permission */

	struct passwd *pww;
	char uident[20]="";
	uid_t uidu;
	uidu = getuid();
	sprintf(uident,"%d",uidu);
	if(strcmp(uident,"0")!=0)
	{
		fprintf(stderr,"anubisdel: Only root may delete a user \n");
		return 1;
	}
	/* check arguement */
	if(argc == 2) {
		user = argv[1];
	}

	if(argc > 2 || argc == 1) {
		fprintf(stderr, "Usage: anubisdel [user]\n");
		exit(1);
	}
	/* select UID from /etc/passwd where user = XXX */
	pw = getpwnam(user);

	if(pw!=NULL)
	{

		pid = fork();
		switch(pid)
		{
			case -1:
				perror("fork failed");
				exit(1);
			case 0:	
					uid = pw->pw_uid;
					sprintf(tmpfile,"%d",uid);
					strcat(filename1,"/etc/anubis/");
					strcat(filename1,tmpfile);
					sprintf(tmpfile,"_1");
					strcat(filename1,tmpfile);
	
					sprintf(tmpfile,"%d",uid);
					strcat(filename2,"/etc/anubis/");
					strcat(filename2,tmpfile);
					sprintf(tmpfile,"_2");
					strcat(filename2,tmpfile);
			
					sprintf(tmpfile,"%d",uid);
					strcat(filename3,"/etc/anubis/");
					strcat(filename3,tmpfile);
					sprintf(tmpfile,"_3");
					strcat(filename3,tmpfile);

					//fprintf(stdout,"filename1 = %s ,filename2 = %s ,filename3 = %s \n",filename1,filename2,filename3);					
					/* rm /etc/anubis/UID */
					execlp("rm","rm",filename1,filename2,filename3,0);			
				
				break;
			default: 	
				break;
		}
		pid = fork();
		switch(pid)
		{
			case -1:
				perror("fork failed");
				exit(1);
			case 0:	
					strcat(symname1,"/etc/anubis/");
					strcat(symname1,pw->pw_name);
					sprintf(tmpfile,"_1");
					strcat(symname1,tmpfile);
			
					strcat(symname2,"/etc/anubis/");
					strcat(symname2,pw->pw_name);
					sprintf(tmpfile,"_2");
					strcat(symname2,tmpfile);
			
					strcat(symname3,"/etc/anubis/");
					strcat(symname3,pw->pw_name);
					sprintf(tmpfile,"_3");
					strcat(symname3,tmpfile);
			
					//fprintf(stdout,"symname1 = %s ,symname2 = %s ,symname3 =%s\n",symname1,symname2,symname3);
					/* rm /etc/anubis/user */					
					execlp("rm","rm",symname1,symname2,symname3,0);					
				break;
			default: 	
				break;
		}	
		pid = fork();
		switch(pid)
		{
			case -1:
				perror("fork failed");
				exit(1);
			case 0:	
				/* userdel XXX */
				execl("/usr/sbin/deluser","deluser","--remove-home",user,0);
				break;
			default: 	
				sleep(1);
				break;
		}		
		fprintf(stdout,"Removing fingerprint successful\n");
	}
	else
	{
		fprintf(stdout,"anubisdel: the user '%s' does not exist.\n",user);
	}
	return 0;
	
}
