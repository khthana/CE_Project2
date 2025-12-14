#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pwd.h>
#include <sys/stat.h>

int main(int argc, char *argv[])
{

	const char *user = "nobody";
	struct passwd *pw;
	int uid;
	
	pid_t pid;
	
	/* check permission */

	struct passwd *pww;
	char uident[20]="";
	uid_t uidu;
	uidu = getuid();
	sprintf(uident,"%d",uidu);
	if(strcmp(uident,"0")!=0)
	{
		fprintf(stderr,"anubisadd: Only root may add a user \n");
		return 1;
	}	
	/* check arguement */
	if(argc == 2) {
		user = argv[1];
	}

	if(argc > 2 || argc == 1) {
		fprintf(stderr, "Usage: anubisadd [user]\n");
		exit(1);
	}

	pww = getpwnam(user);
	if (pww != NULL)
	{
		fprintf(stdout, "anubisadd: The user %s already exists.\n", user);
		exit(1);
	}

	pid = fork();
	switch(pid)
	{
		case -1:
			perror("fork failed");
			exit(1);
		case 0:
			// useradd XXX 
			execl("/usr/sbin/adduser","adduser","--disabled-password","--gecos",user,user,0);
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
                        execl("/usr/local/bin/anubissampling", "anubissampling", 0);
			break;
		default:
			sleep(40);
                        execl("/usr/local/bin/anubisfacesampling", "anubisfacesampling", "-j", "/root/gaborrg_jet.xml", 0);
	                break;
	}
	
	if(pid !=0)
	{
		int stat_val;
		pid_t child_pid;

		child_pid = wait(&stat_val);
	}
	
	fprintf(stdout,"done.\n");
	free(pww);
	return 0;
}
