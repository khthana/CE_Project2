#include <stdio.h>
#include <conio.h>
#include <string.h>

#include "asy.h"
#include "am186cc.h"

#define UART_BASE	SPCON0

static char str[120];

int main(int argc, char *argv[])
{
	int cnt, ch;
	FILE *in, *out;
	int bytecount;

        if ( asy_init(COM1, UART_BASE, ITYPE_UART, 1024, 9600L, 1, 0, 0) < 0 ) {
		printf("Error initialization COM%d\n", COM1 + 1);
		return -1;
	}

	if ( asy_ioctl(COM1, PARAM_UP, 0, (int32)0) < 0 ) {
		printf("Error PARAM_UP ioctl COM%d\n", COM1 + 1);
		return -1;
	}

	ch = 0;

/* Teminal mode testing */
#if 1

	while (ch != 27) {
		while ( (cnt = asy_rxcheck(COM1)) > 0 ) {
			while ( cnt-- ) {
				printf("%c", get_asy(COM1));
			}
		}

		if ( kbhit() ) {
			ch = getch();
			while ( asy_txcheck(COM1) );
			asy_write(COM1, &ch, 1);
		}
	}
#endif
/* end of terminal mode testing */

/* Transmit testing */
#if 0
	printf("TEST TX:\n");

	if ((in = fopen("\\PPP\\T.TXT", "rt"))
		== NULL)
	{
	   printf("Cannot open input file.\n");
	   return 1;
	}

	while (!feof(in)) {
		while ( asy_txcheck(COM1) );
//		fgets(str, 120, in);
//		asy_write(COM1, str, strlen(str));
        ch = fgetc(in);
        asy_write(COM1, &ch, 1);
	}

	fclose(in);
#endif
/* end of Transmit testing */

/* Receive testing */
#if 0
	printf("TEST RX:\n");

	if ((out = fopen("\\PPP\\R.TXT", "wt"))
		== NULL)
	{
	   printf("Cannot open output file.\n");
	   return 1;
	}

	bytecount = 0;

	while (ch != 27) {
		if (kbhit())
			ch = getch();
		while ( (cnt = asy_rxcheck(COM1)) > 0 ) {
/*
			while ( cnt-- ) {
					fputc(get_asy(COM1), out);
					bytecount++;
			}
*/
            cnt = asy_read(COM1, str, cnt);
            str[cnt] = '\0';
            fputs(str, out);
            bytecount += cnt;
			printf("RX: %d\r", bytecount);
		}
	}

	fclose(out);
#endif
/* end of receive testing */

	asy_info(COM1);


	if ( asy_ioctl(COM1, PARAM_DOWN, 0, (int32)0) < 0 ) {
		printf("Error PARAM_DOWN ioctl COM%d\n", COM1 + 1);
		return -1;
	}

	if ( asy_stop(COM1) < 0 ) {
		printf("Error stop COM%d\n",COM1 + 1);
		return -1;
	}

	return 0;
}

