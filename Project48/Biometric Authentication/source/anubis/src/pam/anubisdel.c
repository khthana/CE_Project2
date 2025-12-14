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
//	int uid;
	char filename[256]="";
	char filename2[256]="";
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

	/* select username  from /etc/passwd where user = XXX */
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
				strcat(filename, "/etc/anubis/userdb/face/");
				strcat(filename, pw->pw_name);
				strcat(filename, ".xml");
				fprintf(stdout,"%s", filename);
					
				strcat(filename2, "/etc/anubis/userdb/face/");
				strcat(filename2, pw->pw_name);
				strcat(filename2, "_face.xml");
				fprintf(stdout, "%s", filename2);
					
				/* rm /etc/anubis/userdb/face/user.xml */					
				execlp("rm", "rm", filename, 0);
				execlp("rm", "rm", filename2, 0);
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
		fprintf(stdout,"Removing user successful\n");
	}
	else
	{
		fprintf(stdout,"anubisdel: the user '%s' does not exist.\n",user);
	}
	return 0;
	
}
