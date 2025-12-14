#include <stdio.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>

void decrypF(char *,char *);

int main (int argc,char *argv[])
{
	if(argc == 3)
		decrypF(argv[1],argv[2]);
	else
		printf ("Command incoorect for :!\n", argv[0]);
	exit(0);
}


void decrypF(char *file_name,char *passwd)
{
	int file,passwd_len,sum,j,tmp,k;
	long int i;
	unsigned char ch,*buf,*passwd_buf,*buf_new;
	
	i = 0;j = 0;sum = 0;k = 0; 

	passwd_len = strlen(passwd);
	for(k = 0; k < passwd_len;k++)
	{
		sum = sum + passwd[k];
	}
	sum = sum % 256;
	if((file = open(file_name,O_RDONLY))== -1)
	{
		perror("");
		exit(0);
	}
	while(read(file,&ch,1) == 1)
		i++;
	buf = (unsigned char *)malloc (sizeof(unsigned char) * i);
	passwd_buf = (unsigned char *)malloc(sizeof(unsigned char) * passwd_len);
	lseek (file,0,SEEK_SET);
	while (read(file,&ch,1) == 1)
	{
		buf[j] = ch;
		j++;
	}
	for (k = 0; k < i;k++)
	{
		buf[k] = buf[k] ^ sum;
	}
	close(file);
	if (buf[0] != 1)
	{
	//	printf ("Can't Encrypytion !\n");
		free(buf);
		exit(0);
	}
	if (buf[1] != passwd_len)
	{
	//	printf ("Can't Encryption 2!\n");
		free(buf);
		exit(0);
	}
	for(k = 0;k < passwd_len;k++ )
	{
		passwd_buf[k] = buf[k+2];
	}
	if(strcmp(passwd,passwd_buf) != 0)
	{
	//	printf ("Can't Encryption 3!\n");
		free(buf);
		free(passwd_buf);
		exit(0);
	}
	k = i - 2 - passwd_len;
	buf_new = (unsigned char *) malloc (sizeof(unsigned char) * k);
	for (j = 0;j < k; j++)
	{
		buf_new[j] = buf[j+2+passwd_len];
	}
	free(buf);
	for (j = 0; j < k/2;j++)
	{
		if((j%2)==0)
		{
			tmp = buf_new[j];
			buf_new[j] = buf_new[k-j-1];
			buf_new[k-j-1] = tmp;
		}
	}
	file = open(file_name,O_WRONLY|O_TRUNC);
	write(file,buf_new,k);
	free(buf_new);
	close(file);
	//printf ("Complete \n");
}

