/* gcc check_ex.c -o xcheck
 * This file is check command and send signal to main program (main.sh)
 * and This file read command-data from sender.con
 */
#include <stdio.h>
#include <string.h>
int main()
{
	FILE *sender_signal;
	FILE *receive;
	char tempc,temp[10];
	int count;

	sender_signal = fopen("sender.con","r");
//	receive = fopen("dos.rep","w")
	count = 0;

		tempc = fgetc(sender_signal);
		if (tempc != '$')
			return 9;

		while (tempc != '$')
			tempc = fgetc(sender_signal);

		tempc = fgetc(sender_signal);

		while (tempc != '$')
		{
			temp[count] = tempc;
			tempc = fgetc(sender_signal);
			count++;
		}

		temp[count] = '\0';
		fclose(sender_signal);
	
	sender_signal = fopen("sender.con","w");
		fprintf(sender_signal,"");
		fclose(sender_signal);

	receive = fopen("dos.rep","w");
		if (strcmp(temp,"stop") == 0)	//stop normal capture(xcap) 
			return 0;
		else if (strcmp(temp,"tcp") == 0) //start capture(xcap) only tcp
			return 1;
		else if (strcmp(temp,"udp") == 0) //start capture(xcap) only udp
			return 2;
		else if (strcmp(temp,"icmp") == 0) //start capture(xcap) only icmp
			return 3;
		else if (strcmp(temp,"land") == 0) //start capture dos 
		{
			fprintf(receive,"Check Detect Land Attack!!.\n");
			return 4;
		}
		else if (strcmp(temp,"tear") == 0) //start capture dos
		{
			fprintf(receive,"Check Detect Teardrop Attack!!.\n");
			return 5;
		}
		else if (strcmp(temp,"jolt") == 0) //start capture dos
		{
			fprintf(receive,"Check Detect jolt Attack!!.\n");
			return 6;
		}
		else if (strcmp(temp,"dos") == 0) //stop capture dos
			return 7;
		else if (strcmp(temp,"exit") == 0) //exit program
			return 8;
		else if (strcmp(temp,"winf") == 0)
		{
			fprintf(receive,"Check Deteck Winfreeze Attack!!.\n");
			return 10;
		}
		else
			return 9; //don't care data
}
