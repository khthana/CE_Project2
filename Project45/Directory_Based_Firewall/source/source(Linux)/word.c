#include<stdio.h>
#include<unistd.h>
#include<string.h>
#include<fcntl.h>
#include<sys/stat.h>
#include<sys/types.h>
#include<sys/time.h>
#include<time.h>

#define FILENAME "rules.txt"

char* read_file(size_t* length)// read text file and return stream of char
{
	size_t len;
	int fd;
	struct stat file_info;
	char* buffer;

	fd=open(FILENAME,O_RDONLY);
	fstat(fd,&file_info);
	len=file_info.st_size;
	if(!S_ISREG(file_info.st_mode)){
		close(fd);
		return NULL;
	}
	buffer=(char*)malloc(len);
	read(fd,buffer,len);
	close(fd);
	return buffer;
}
char* cut_rule(char* input,const char* keyword)// for cut rules from stream of file and return only rule for that user
{
	char* tempptr;				//temp pointer
	char* rules=(char*)malloc(sizeof(char));//to store rules to return
	char* name=(char*)malloc(sizeof(char)); //to store name for compare
	int len=strlen(input);			//length of string
	int i;					//AUX count
	tempptr=input;
	for(i=0;i<len;i++)
	{
		if(*tempptr==':')
		{
			if(0==strcmp(name,keyword))
			{
				tempptr++;
				strcpy(rules,tempptr);
				break;
			}else
			{
				while(*tempptr!='\n')
				{
					i++;
					tempptr++;
				};
				name=NULL;
				name=(char*)malloc(sizeof(char));
				tempptr++;
			};
		}else
		{
			strncat(name,tempptr,1);
			tempptr++;
		};
	}
	len=strlen(rules);
	tempptr=rules;
	for(i=0;i<len;i++)
	{
		if(*tempptr=='\n')
		{
			*tempptr='\0';	
			break;
		};
		tempptr++;
	};
	return rules;
}

char add_remove(char *input)
{
	int len,i;
	char *tempptr;
	char result;
	tempptr=input;
	len=strlen(input)-1;
	for(i=0;i<len;i++)
		tempptr++;
	if(*tempptr=='A')result='A';
	else result='D';
	*tempptr='\0';
	return result;
};
/*
int main()
{
	size_t* len;
	char *file;
	char *read=(char*)malloc(sizeof(char*));
	file=read_file(len);
	read=cut_rule(file,"rattp");
	printf("rule :%s\n",read);
	return 0;
}*/
