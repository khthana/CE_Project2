/*
 *
 * NAME
 *	pam_anubis.c -- Copyright (C) 2005 Mr. Kriangkrai Nitranon
 *                      ptk386@hotmail.com
 *
 * DESCRIPTION:
 *       This defines a PAM useable module for use with fingerprint scanner_AFS4000
 *
 * AUTHOR:
 *	Kriangkrai Nitranon, 01/01/05
 *
 * LICENSE: See file LICENSE.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <scanner.h>
#include <VFinger.h>
#include <string.h>
#include <security/pam_modules.h>


struct scanner_info* scanner = &scanner_AFS4000;

void do_extraction (unsigned char *image, BYTE* features,int w , int h, int dpi)
{
	DWORD features_size = 0;
	int ret = 0;
	ret = VFExtract (w, h, (BYTE *) image, dpi, features, &features_size, 0);
	if (ret != VFE_OK)
	{
		if (ret == VFE_LOW_QUALITY_IMAGE)
		{
			fprintf (stdout,"WARNING: Image1 is low quality.\n");
		}
		else
		{
			fprintf (stderr,"An error1 occured. Exiting %d.\n",ret);
			exit (1);
		}
	}

	//fprintf(stdout,"G: %d, size: %d byetes, minutiae count: %d\n",VFFeatGetG(features),features_size,VFFeatGetMinutiaCount(features));
}
int get_file(char *name,char **image)
{
	FILE *file;
	char *buffer;
	long Lsize;
	file = fopen(name,"rb");
	if(file==NULL)
	{
		//fprintf(stderr,"login incorrect\n");
		return 1;
	}
	fseek(file,0,SEEK_END);
	Lsize = ftell(file);
	//printf("Lsize = %d\n",Lsize);
	rewind(file);	
	buffer = (char*)malloc(Lsize);
	if(buffer == NULL)
		exit(2);	
	fread(buffer,1,Lsize,file);
	*image = buffer;
	fclose(file);
	return 0;
}
PAM_EXTERN int pam_sm_authenticate(pam_handle_t * pamh, int flags, int argc, const char **argv)
{
	/* define value for pam */
	const char *uid;
	char *passwd;
	int retval;
	
	//fprintf(stdout,"pam start to authenticate\n");
	/* get the user id */
	retval = pam_get_user(pamh, &uid, NULL);
		

	if(retval == PAM_SUCCESS)
	{
		if( uid == NULL )
		{
			fprintf(stderr, "bad username [%s]\n",uid);
		}
				
	}
	else
	{
		fprintf(stderr, "trouble reading username \n");
		return PAM_INCOMPLETE;
	}

	/* define value for scanner and Verifinger */
	int ret;
	int i = scanner -> init();
	int dpi = scanner -> dpi;
	int w1, w2, h2, h1;
	int result = 0;		
	char *name = scanner -> name;
	char *imageFromFile , *imageFromScanner;
	char filename1[256]="";
	char filename2[256]="";
	char filename3[256]="";
	
	BYTE featuresFromFile[VF_MAX_FEATURES_SIZE];
	static BYTE featuresFromFiles[VF_GENERALIZE_COUNT] [VF_MAX_FEATURES_SIZE];
	BYTE featuresFromScanner[VF_MAX_FEATURES_SIZE];
	const BYTE *feats[VF_GENERALIZE_COUNT] = {featuresFromFiles[0],featuresFromFiles[1],featuresFromFiles[2]};
	
	VFMatchDetails md;
	md.Size = sizeof(md);
	//md.Size = sizeof(VFMatchDetails);
	strcat(filename1,"/etc/anubis/");
	strcat(filename1,uid);
	strcat(filename1,"_1");
	strcat(filename2,"/etc/anubis/");
	strcat(filename2,uid);
	strcat(filename2,"_2");
	strcat(filename3,"/etc/anubis/");
	strcat(filename3,uid);
	strcat(filename3,"_3");
	/* initialize and set value for Verifinger Linux SDK  */
	
	ret = VFInitialize();
	//fprintf(stdout,"VFInitialize returns %d \n",ret);
	if (ret != VFE_OK){
		fprintf(stderr,"VFInitialize error");
		return 1;
	}
/*	int threshold = 60;
	//int threshold = 60;
	//int threshold = 72;
	//int threshold = 84;
    ret = VFSetParameter(VFP_MATCHING_THRESHOLD, (INT)threshold, NULL); 
	if (ret != VFE_OK){
		fprintf(stderr,"VFSetParameter error");
		return 1;
	} */
	int rotation = 180;
	ret = VFSetParameter(VFP_MAXIMAL_ROTATION, (INT)rotation, NULL);
	if (ret != VFE_OK){
		fprintf(stderr,"VFSetParameter error");
		return 1;
	}
	
	/* get image1 from file that has same name as uid in /etc/anubis */
	// fprintf(stdout,"filename1 = %s \n",filename1);
	if(get_file(filename1,&imageFromFile)==0)
	{
		do_extraction (imageFromFile, featuresFromFiles[0], 96, 96, 250);
		free(imageFromFile);
	}

	/* get image2 from file that has same name as uid in /etc/anubis */
	// fprintf(stdout,"filename2 = %s \n",filename2);
	if(get_file(filename2,&imageFromFile)==0)
	{
		do_extraction (imageFromFile, featuresFromFiles[1], 96, 96, 250);
		free(imageFromFile);
	}
	
	/* get image3 from file that has same name as uid in /etc/anubis */
	// fprintf(stdout,"filename3 = %s \n",filename3);	
	if(get_file(filename3,&imageFromFile)==0)
	{
		do_extraction (imageFromFile, featuresFromFiles[2], 96, 96, 250);
		free(imageFromFile);
	}
	
	/* open /dev/usb/device and select until a scanned fingerprint is received */
	fprintf(stdout,"Please scan your finger \n");
	do
	{
		imageFromScanner = scanner -> read(&w1, &h1);
	}while(imageFromScanner == NULL);
	do_extraction (imageFromScanner, featuresFromScanner, w1, h1, dpi);
	/* close /dev/usb/device */
	
	scanner -> close();
	
	
	/* Generalization */
	DWORD size;
	size = 0;
	result = VFGeneralize (VF_GENERALIZE_COUNT,feats, featuresFromFile, &size,0);
	if(result<0)
	{
		//fprintf(stdout,"Generalization failed: %d\n",result);
	}
	else
	{
		//fprintf(stdout,"Generalization succeeded: %d\n",result);
	}

	/* performs fingerprint verification between image from file and image from scanner*/
	
	result = VFVerify(featuresFromFile, featuresFromScanner, &md, 0);
	switch (result)
	{
		case VFE_OK:
			/* SUCCESS set the username for anubislogin */
			printf ("Fingerprints matched.\n"); //: %d\n", md.Similarity);		
			pam_set_item(pamh, PAM_USER,(const void *)uid);
			VFFinalize();
			return PAM_SUCCESS;
			break;
		case VFE_FAILED:
			/* FAILURE authentication has failed */
			printf("Fingerprints mismatched.\n");//: %d\n", md.Similarity);
			VFFinalize();
			return PAM_AUTH_ERR;
			break;
		default:
			VFFinalize();
			return PAM_AUTH_ERR;
			break;		
	}
	VFFinalize();
	return PAM_SUCCESS;
}
PAM_EXTERN int pam_sm_setcred(pam_handle_t *pamh, int flags, int argc,
			      const char **argv) {

return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_acct_mgmt(pam_handle_t *pamh, int flags, int argc,
				const char **argv) {


return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_open_session(pam_handle_t *pamh, int flags, int argc,
				   const char **argv) {

return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_close_session(pam_handle_t *pamh, int flags, int argc,
				    const char **argv) {


return PAM_SUCCESS;
}

PAM_EXTERN int pam_sm_chauthtok(pam_handle_t *pamh, int flags, int argc, 
				const char **argv) {

return PAM_SUCCESS;
}
