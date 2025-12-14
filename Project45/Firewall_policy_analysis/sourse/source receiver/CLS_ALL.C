/* This file is clear capture data_file and report_file 
 * 
 */
#include <stdio.h>
int main()
{
	FILE *file_out;
	
	file_out = fopen("sender.con","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("tcp.cap","w");
	fprintf(file_out,"");
	fclose(file_out);
	
	//capture data file
	
	file_out = fopen("tcp.cap","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("udp.cap","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("icmp.cap","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("dos.cap","w");
	fprintf(file_out,"");
	fclose(file_out);
	
	//report data file

	file_out = fopen("tcp.rep","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("udp.rep","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("icmp.rep","w");
	fprintf(file_out,"");
	fclose(file_out);

	file_out = fopen("dos.rep","w");
	fprintf(file_out,"");
	fclose(file_out);

}
