#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <pwd.h>
/*
#include <getopt.h>
#include "gaborrg_recog.h"
#include "gaborrg_recog_gui.h"
#include "recog_by_jets.h"
#include "anubis_marker.h"
#include "anubis_color_config.h"
#include "anubisrecog_gui.h"
#include "anubis_cv_capture.h"
#include "anubis_cv_rgb2gray.h"
#include "anubisrecog_gui_update.h"
*/
#include <security/pam_modules.h>
#include <security/pam_appl.h>

//#include <syslog.h>
/*
static unsigned char * jets_fname = NULL;
static unsigned char * masks_fname = NULL;
static unsigned char * fg_jets_fname = NULL;
*/
/*
int do_capture(int argc, char * argv[])
{
	MalibGtkDisplay * disp[4];
  	
	MalibSource     * s_cap, * s_haar, * s_jets, * s_face, * s_mark, * s_updt;
	MalibBuffer     * b_cap, * b_haar, * b_jets, * b_face, * b_mark, * b_updt;
	MalibGtkDisplay * d_mark;
//	int disp_cap, disp_conf, disp_jets, disp_mark, disp_last, disp_main;
	GrrGui * gui;
	
//	check_option(argc, argv);
	      
	malib_init (&argc, &argv);

	s_cap= (MalibSource*) anubis_cv_capture_new_with_size (320, 240);
	b_cap= (MalibBuffer*) malib_plainbuf_new_with_source (s_cap);

	s_haar= (MalibSource*) anubis_cv_haar_detect_obj_new_with_buf(b_cap, 0);
	
	b_haar= (MalibBuffer*) malib_plainbuf_new_with_source (s_haar);

//	s_jets= (MalibSource*) recog_by_jets_new_with_buf (b_haar, s_haar, jets_fname, masks_fname);
//	b_jets= (MalibBuffer*) malib_plainbuf_new_with_source(s_jets);

//	s_face= (MalibSource*) anubis_face_graph_measure_new_with_buf_and_jets (b_jets, ((RecogByJets*)s_jets)->cur_graph, fg_jets_fname, masks_fname, FGRAPH_AND_JETS,0.8);
	
//	b_face= (MalibBuffer*) malib_plainbuf_new_with_source(s_face);

//	s_updt= (MalibSource*) anubisrecog_gui_update_new_with_buf(b_face, s_haar, s_jets, s_face);
//	b_updt= (MalibBuffer*) malib_plainbuf_new_with_source(s_updt);

//      MalicMarkerFilter marker_filters[]= {s_jets, s_haar, NULL};

//	s_mark= (MalibSource*) anubis_marker_new_with_buf_and_filters(b_updt, marker_filters);
//	b_mark= (MalibBuffer*) malib_plainbuf_new_with_source(s_face);

//	d_mark= anubis_cv_gtkdisplay_new_for_embed (s_mark);

//      disp[0]= d_mark;
	disp[1]= NULL;
	    
//	gui= anubisrecog_gui_new(disp, NULL, s_face);
//	((MalicrecogGuiUpdate*)s_updt)->gui= gui;
	        
//	anubis_cv_gtkdisplay_auto_play2(disp);

	return 1;
}
*/
int get_file(char *filename,char *username)
{
	FILE *file;
	char *strptr;
	char strbuf[255];
	int count;
	
	file = fopen(filename,"r");
	if(file == NULL)
	{
		fprintf(stdout,"file is NULL\n");
		exit(1);
	}
	//result = fgetc(file);
	count = strlen(username);
	strptr=fgets(strbuf,count+1,file);
	if(strptr == NULL)
	{
		fprintf(stdout,"Cannot read file or file is NULL \n");
	}
	
	fclose(file);
	
	if (strcmp(strbuf,username))
	{
		return 1;	
	}
	return 0;
}

PAM_EXTERN int pam_sm_authenticate(pam_handle_t * pamh, int flags, int argc, const char **argv)
{
	
	const char * username;
//	const char * uid;
	char result_file[100]="/tmp/anubis.lock";
//	char * passwd;
	int retval;
	pid_t pid;
	
//	do_capture(argc, argv);

/*	
	char filename[100] = "";
	char jets_fname[100] = "";
	char jets_fname[100] = "";
*/
	
	retval =  pam_get_user(pamh, &username, NULL); 
//	pam_get_user(pamh, &uid, NULL);
	
//	fprintf(stdout, "Hello %s\n", uid);
	
	if(retval == PAM_SUCCESS)
	{
		if(username == NULL)
		{
			fprintf(stderr, "bad username [%s]\n", username);
		}
	}
	else
	{
		fprintf(stderr, "Trouble reading username \n");
		return PAM_INCOMPLETE;
	}

	char face_gaborrg[100] = "";
	char face_jets[100] = "";

        strcat(face_gaborrg, "/etc/anubis/userdb/face/");
	strcat(face_gaborrg, username);
	strcat(face_gaborrg, ".xml");

	strcat(face_jets, "/etc/anubis/userdb/face/");
	strcat(face_jets, username);
	strcat(face_jets, "_jets.xml");
/*
	pid = fork();
	switch(pid)
	{
		case -1:
			perror("fork failed");
			exit(1);
		case 0:
			// This is child process
			seteuid(1000);
			setegid(1000);

			execl("/tmp/anubis/src/anubisrecog", "anubisrecog", "-j", face_gaborrg, "-f", face_jets,0);
			break;
		default:
			break;
	}
*/
/*
	if(pid != 0)
	{
		int stat_val;
		pid_t child_pid;

		child_pid = wait(&stat_val);
	}
*/
/*	
	strcat(jets_fname,"/etc/anubis/userdb/face/");
	strcat(jets_fname, username);
	strcat(jets_fname, ".xml");
	strcat(fg_jets_fname, "/etc/anubis/userdb/face/");
	strcat(fg_jets_fname, username);
	strcat(fg_jets_fname, "_face.xml");
*/
/*
	if(username != NULL)
	{
		jets_fname = get_anubis_data_file_full_path_name(jets_fname);
}
*/	

	sleep(4);
	retval = get_file(result_file,username);

	if(retval==0)
	{
		return PAM_SUCCESS;
	}
	return PAM_AUTH_ERR;

}

PAM_EXTERN int pam_sm_setcred(pam_handle_t * pamh, int flags, int argc, const char ** argv)
{
	return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t * pamh, int flags, int argc, const char ** argv)
{
	return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_open_session(pam_handle_t * pamh, int flags, int argc, const char ** argv)
{
	return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_close_session(pam_handle_t * pamh, int flags, int argc, const char ** argv)
{
	return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_chauthtok(pam_handle_t * pamh, int flags, int argc, const char ** argv)
{
	return PAM_SUCCESS;
}
