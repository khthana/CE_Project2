#include <stdio.h>
#include <unistd.h>
#define CONFIG_H "config.h"
#define MAX_PATHNAME_LEN 128

int main(){
	FILE *fp;
	char pathname[MAX_PATHNAME_LEN+1];

	fp=fopen(CONFIG_H,"w");
	if (fp==NULL){
		printf("Error create config.h\n");
		return 1;
	}
	if ((getcwd(pathname,MAX_PATHNAME_LEN))==NULL){
		printf("Path name too long!Please change MAX_PATHNAME_LEN in install.c and recompile it...\n");
		return 1;
	}
	fprintf(fp,"#define WORKING_DIR %c%s%c\n",(char)34,pathname,(char)34);
	fprintf(fp,"#define CONFIG_FILE %c%s/config.ids%c\n",(char)34,pathname,(char)34);
	fprintf(fp,"#define TEMP_DATA   %c%s/tempdata%c\n",(char)34,pathname,(char)34);
	fprintf(fp,"#define MODULE_FSUID %d\n",getuid());
	fprintf(fp,"#define MODULE_FSGID %d\n",getgid());
	
	fclose(fp);
}
