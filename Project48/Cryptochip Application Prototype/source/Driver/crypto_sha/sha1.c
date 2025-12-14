#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>

#undef PDEBUG
#ifdef DEBUG
#	define PDEBUG(fmt, args...) printf("sha1 : " fmt, ## args)
#else
#	define PDEBUG(fmt, args...)
#endif

void menu(void);

int main(int argc, char *argv[])
{
	if (argc == 1)
		menu();

	// Get source file to src variable
	// Use fread and fopen
	FILE *f;			// Variable use to store filestream
	char *src;
	char *filename;
	struct stat statbuf;		// Variable use to get stat

	filename = argv[1];
	lstat(filename, &statbuf);	// Get stat from filename
	int fsize = statbuf.st_size;
	src = (char *)malloc(fsize);	// Allocation Memory for buffer content of file

	if(!(f = fopen(filename, "rb"))){
		printf("sha1 : open error, file : %s\n", filename);
	}

	src = (char *)malloc(fsize);
	fread(src, sizeof(char), fsize, f);
	PDEBUG("content \n");
	PDEBUG("%s", src);
	PDEBUG("\n");

	fclose(f);

	int fd = open("/dev/crypto_SHA", O_RDWR);

	// complain if the open failed
	if (fd == -1) {
		perror("open");
		return 1;
	}

	write(fd, src, fsize);

	unsigned long digest[5];
	read(fd, &digest[0], 64);
	//buffer[16] = '\0';
	printf("sha1 : digest = %08X%08X%08X%08X%08X\n", digest[0], digest[1], digest[2], digest[3], digest[4]);

	close(fd);
	free(src);
	return 0;
}

void menu(void)
{
	printf("\n");
	printf("\t\tSHA1 DEMO Program\n\n\n");
	printf("Syntax : ./sha1 FILENAME\n");
	printf("\n");
	printf("\t\t\t\tThanks.\n");

	exit(0);
}
