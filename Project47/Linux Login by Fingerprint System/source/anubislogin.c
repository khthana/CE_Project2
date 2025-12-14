#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>
#include <pwd.h>
#include <unistd.h>
#include <sys/types.h>

static struct pam_conv conv = {
	misc_conv,
	NULL
};

int main(int argc, char *argv[])
{
	pam_handle_t *pamh=NULL;
	int retval;
	const char *uid = "0";
	const char *ttyn = "tty3";
	char device[16] = "";

	if(argc == 3) {
		uid = argv[1];
		ttyn = argv[2];
		strcat(device,"/dev/");
		strcat(device,ttyn);
		if(atoi(uid)==0)
		{
			fprintf(stderr,"Usage : anubislogin [uid] [ttyN]\nuser@host$ anubislogin 1000 tty2\n");
			exit(1);
		}
	}
	
	if(argc != 3) {
		fprintf(stderr, "Usage: anubislogin [uid] [ttyn]\n");
		exit(1);
	}
	//fprintf(stdout,"uid before = %s\n",uid);
	/* pam_start() initialize the pam_handle_t for anubislogin */
	retval = pam_start("anubislogin", uid, &conv, &pamh);


	/* pam_authenticate() attempt to authenticate the user */
	if(retval == PAM_SUCCESS)
		retval = pam_authenticate(pamh, 0);

	if(retval == PAM_SUCCESS) {
		//fprintf(stdout, "AUthenticated retval = %d\n",retval);
		/*  pam_get_time() retrieve the username */

		retval = pam_get_item(pamh, PAM_USER, (const void **) &uid);
		if(retval != PAM_SUCCESS)
			fprintf(stderr," pam get itme error \n");	
	
		/* getpwuid(3) retrieve group , shell , etc.*/
		struct passwd *pw;
		int p_uid;
		char *dir;
		char *uname;
		p_uid = atoi (uid);
		pw = getpwuid(p_uid);
		dir = pw->pw_dir;
		uname = pw->pw_name;
		/* chdir to home */
		if(chdir(dir)==-1)
			fprintf(stderr,"change dir fail \n");
		/* chown ower and group for terminal device */
		if(chown(device,pw->pw_uid,pw->pw_gid)==-1)
			fprintf(stderr,"change owner fail \n");
		/* set gid */
		if(setgid(pw->pw_gid)==-1)
			fprintf(stderr,"set gid fail \n");
		/*initgroups */
		if(initgroups(uname,pw->pw_gid)==-1)
			fprintf(stderr,"initgroups fail \n");
		/*initialized environment */
		setenv("HOME",pw->pw_dir, 1);
		setenv("SHELL",pw->pw_shell, 1);
		setenv("LOGNAME",pw->pw_name, 1);
		/* set uid */
		if(setuid(pw->pw_uid)==-1)
			fprintf(stderr,"set uid fail \n");

		//fprintf(stdout,"UID passwd entry: \n name=%s, uid=%d, gid=%d, home=%s, shell=%s\n",pw->pw_name, pw->pw_uid, pw->pw_gid, pw->pw_dir, pw->pw_shell);	
		/* pam_end() free pam handle */
		if(pam_end(pamh,retval) != PAM_SUCCESS) {
			pamh = NULL;
			fprintf(stderr, "anubislogin: failed to release authenticator\n");
			exit(1);
		}


		/* fork(2) */
		
		/* execvp(3) launch shell (bash(1) , tcsh(1), etc.) */
		char *cmd[] = { "bash", (char *)0 };
		execvp("bash",cmd);
		return (retval == PAM_SUCCESS ? 0:1 );		
	}
	if(retval == PAM_AUTH_ERR){
		/* syslog(3) */
		//fprintf(stdout, "Not Authenticated retval = %d \n",retval);
		fprintf(stdout, "login incorrect\n");
		sleep(3);
		exit(1);
	}

}
