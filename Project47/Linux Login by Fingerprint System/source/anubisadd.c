#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <stdio.h>
#include <scanner.h>
#include <VFinger.h>
#include <string.h>
#include <pwd.h>
#include <sys/stat.h>


struct scanner_info* scanner = &scanner_AFS4000;
int do_extraction (unsigned char *image, BYTE* features,int w , int h, int dpi)
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
		return -1;
	}
	else
	{

		//printf("G: %d, size: %d byetes, minutiae count: %d\n",VFFeatGetG(features),features_size,VFFeatGetMinutiaCount(features));
		return 0;
	}
}	
int save_file(char *name, unsigned char *image)
{

	int		ret = 0;
	FILE	*file = NULL;
	
	
	
	file = fopen (name, "wb");
	if (file == NULL)
	{
		ret = -1;
		return ret;
	}
	int len = 96*96;
	fwrite((BYTE *)image,1,len,file);
	fclose (file);
	return ret;


}
int get_file(char *name,char **image)
{
	FILE *file;
	char *buffer;
	long Lsize;
	file = fopen(name,"rb");
	if(file==NULL)
		exit(1);
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
	
	pid = fork();
	switch(pid)
	{
		case -1:
			perror("fork failed");
			exit(1);
		case 0:
			/* useradd XXX */
			execl("/usr/sbin/adduser","adduser","--disabled-password","--gecos",user,user,0);
			break;
		default: 

			/* define value */
			fprintf(stdout,"");
			BYTE featuresFromScanner[VF_MAX_FEATURES_SIZE];
			BYTE gen_features [VF_MAX_FEATURES_SIZE];
			static BYTE	features [VF_GENERALIZE_COUNT] [VF_MAX_FEATURES_SIZE];
			const BYTE	*features_p [VF_GENERALIZE_COUNT] = {features[0], features[1], features[2]};
			DWORD features_size = 0;
			int result = 1;
			int c=1, ret = 0;
			result = VFInitialize();
			//fprintf(stdout,"VFInitialize returns %d \n",result);
			if (result != VFE_OK){
				fprintf(stderr,"VFInitialize error");
				return 1;
			}
			sleep(1);
			fprintf(stdout,"Please scan your finger \n");
			while(c<4)
			{		
				/* initial value */
				int i = scanner -> init();
				int dpi = scanner -> dpi;
				char *name = scanner -> name;
				char *imageFromScanner;
				int w1,h1;
				char tmpfile[5];
				char filename[256]="";
				char symname[256]="";
				
				/* select UID from /etc/passwd where user = XXX */
				sleep(1);
				pw = getpwnam(user);
				if(pw==NULL)
				{
					fprintf(stderr,"anubisadd: Only root may add a user or group to the system\n");
					return 1;
				}
				uid = pw->pw_uid;
				sprintf(tmpfile,"%d",uid);
				strcat(filename,"/etc/anubis/");
				strcat(filename,tmpfile);
				sprintf(tmpfile,"_%d",c);
				strcat(filename,tmpfile);				
	
				/* get image from device */
				do
				{
					imageFromScanner = scanner -> read(&w1, &h1);
					
				}while(imageFromScanner == NULL);

				/* save image file and the filename is /etc/anubis/UID */
				save_file(filename,imageFromScanner);
				/* create symlink */
				strcat(symname,"/etc/anubis/");
				strcat(symname,pw->pw_name);
				strcat(symname,tmpfile);
				if(chmod(filename,S_IRUSR)==-1)
					fprintf(stdout,"chmod file error \n");
				symlink(filename,symname);
				fprintf(stdout,"got Image %d from 3\n",c);
				/* get image from file and some detail */
				
				get_file(filename,&imageFromScanner);
				ret = do_extraction (imageFromScanner, features[c-1],w1 ,h1,dpi);
				free(imageFromScanner);
				
				
				if (c == VF_GENERALIZE_COUNT)
				{
					features_size = 0;
					result = VFGeneralize (VF_GENERALIZE_COUNT, features_p, gen_features, &features_size, 0);
					
					if(result<0)
					{
						fprintf(stdout,"Sorry, The fingerprint's quality is not suitable.\nPlease scan your finger again!!\n");
						sleep(2);
						c=0;
					}else
					{
						//fprintf(stdout,"done.\n");
					}
				}
				if( ret == 0)
				{
					c++;
				}
				
				//====================================			
				/* close scanner */
				scanner -> close();	
				
			}
			VFFinalize();
			break;
	}
	fprintf(stdout,"your UID is %d\n",uid);
	fprintf(stdout,"done.\n");
	return 0;
}
