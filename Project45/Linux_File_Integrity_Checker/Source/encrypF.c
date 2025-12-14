#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>

void encrypF(char *,char *);

int main (int argc,char *argv[])
{
	if (argc == 3)
		encrypF(argv[1],argv[2]);
	else
		printf ("Command incorect !\n");
	exit(0);
}

void encrypF(char *file_name,char *passwd)
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
	//printf("Complete \n");
}

