/* This file is clear capture data_file and report_file 
 * 
 */
#include <stdio.h>
int main(int argc,char **argv)
{
	FILE *file_out;

	file_out = fopen(argv[1],"w");
	fprintf(file_out,"");
	fclose(file_out);

}
