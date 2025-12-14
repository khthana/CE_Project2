/* This file is clear capture data_file and report_file 
 * 
 */
#include <stdio.h>
#include <string.h>
int main(int argc,char **argv)
{
	FILE *file_out;

	file_out = fopen("dos.temp","a");
	if (strcmp(argv[1],"1") == 0)
		fprintf(file_out,"You have test land attack\n");
	if (strcmp(argv[1],"2") == 0)
		fprintf(file_out,"You have test teardrop attack\n");
	if (strcmp(argv[1],"3") == 0)
		fprintf(file_out,"You have test jolt attack\n");
	if (strcmp(argv[1],"4") == 0)
		fprintf(file_out,"You have test winfreeze attack\n");
	fclose(file_out);

}
