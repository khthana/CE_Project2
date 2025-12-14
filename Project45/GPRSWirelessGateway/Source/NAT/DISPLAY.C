/* File: SRC\DISPLAY.C */

#include "napt.h"

#define	ATT_NORMAL		0
#define	ATT_INVERSE		1
#define	ATT_INDICATOR		2
#define	ATT_PROTOCOL		3
#define	ATT_LCL_ADRS		4
#define	ATT_REM_ADRS		5
#define	ATT_MAPPING		6
#define	ATT_PKT_COUNT		7
#define	ATT_EXPIRE		8
#define	ATT_ERR_TXT		9

#define	ATTRIBUTES		10

#define	SCREEN_ROWS		25
#define	SCREEN_COLS		80

#define	FIRST_ROW		0
#define	FIRST_COL		0

#define	LAST_ROW		(SCREEN_ROWS - 1)
#define	LAST_COL		(SCREEN_COLS - 1)

#define	MSG_SECONDS		60
#define	MSG_COLUMN		4
#define	MAX_SHRINK		(SCREEN_ROWS - 4)

#define	CHAR_BYTES		2
#define	ROW_BYTES		(SCREEN_COLS * CHAR_BYTES)
#define	SCREEN_SIZE		(SCREEN_ROWS * ROW_BYTES)
#define	ROWCOL(r, c)		((r)*ROW_BYTES + (c)*CHAR_BYTES)

PRIVATE byte			Attribute(int) ;
PRIVATE void			Display_Hex(char *, void *, int) ;
PRIVATE int			Display_Offset(int) ;
PRIVATE void			Display_Mapping(MAPPING far *) ;
PRIVATE int			Display_Row(int) ;
PRIVATE void			Erase_Row(int, int) ;
PRIVATE void			Erase_Rows(int, int) ;
PRIVATE void			Move_Rows(int, int, int) ;
PRIVATE int			PutStrAt(char *, int, int, int) ;
PRIVATE void			Scroll_Indicators(void) ;
PRIVATE void			Shrink_Window(void) ;
//
PRIVATE void	newdisplay(void);

PRIVATE SEMA_INFO *		display_sema = NULL ;
PRIVATE BOOL			color = TRUE ;
PRIVATE byte far *		video_buffer ;
PRIVATE int			footer = LAST_ROW ;
PRIVATE longword		msg_timer = 0L ;
PRIVATE int rowprint = 0;

void Init_Display(void)
{
	MtCSemaCreate(&display_sema) ;
	clrscrn() ;
	printf("%s\n",(char*)NOTICE);
}

void Display(void)
{
	Erase_Row(0, ATT_INVERSE) ;
	if(endisplay == 1)
	{
		clrscrn();
		printf("Proto\tRemote IP:Port\t     Local IP:Port     Mapping   Rcvd   Sent   Expire ");

		Erase_Row(footer, ATT_INVERSE) ;
		printf("%s\n",(char*)NOTICE);

		MtCSetPri(NULL, MTC_LOW) ;
		Show_Percent() ;
		Visit_Mappings(Display_Mapping) ;
	}
}

PRIVATE void Scroll_Indicators(void)
{
}

BOOL Scroll_Key(word scan_ascii)
	{
	int delta ;

	switch (scan_ascii)
		{
		case 0x4800: /* Up Arrow */
			delta = -1 ;
			break ;
		case 0x4900: /* Page Up */
			delta = -(SCREEN_ROWS - 3) ;
			break ;
		case 0x5000: /* Down Arrow */
			delta = 1 ;
			break ;
		case 0x5100: /* Page Down */
			delta = SCREEN_ROWS - 3 ;
			break ;
		default:
			return FALSE ;
		}

	(void) Display_Offset(delta) ;
	return TRUE ;
}

PRIVATE int Display_Offset(int delta)
{
	static int offset = 0 ;
	offset += delta ;
	if (offset < 0) offset = 0 ;
	if (Mappings(0) && offset >= Mappings(0))
		{
		offset = Mappings(0) - 1 ;
		}
	return offset ;
}


PRIVATE int Display_Row(int mapping)
{
	int row = 1 + mapping;// - Display_Offset(0) ;
	return (0 < row && row < footer) ? row : 0 ;
}

PRIVATE byte Attribute(int code)
{
	static byte attributes[2][ATTRIBUTES] =
		{
		{ /* MONO */
		/* ATT_NORMAL	*/	0x07,
		/* ATT_INVERSE	*/	0x70,
		/* ATT_INDICATOR*/	0xF8,
		/* ATT_PROTOCOL	*/	0x07,
		/* ATT_LCL_ADRS	*/	0x07,
		/* ATT_REM_ADRS	*/	0x07,
		/* ATT_MAPPING	*/	0x07,
		/* ATT_PKT_COUNT*/	0x07,
		/* ATT_EXPIRE	*/	0x07,
		/* ATT_ERR_TXT	*/	0x0F
		},
		{/* COLOR */
		/* ATT_NORMAL	*/	0x07,
		/* ATT_INVERSE	*/	0x70,
		/* ATT_INDICATOR*/	0xF8,
		/* ATT_PROTOCOL	*/	0x0E,
		/* ATT_LCL_ADRS	*/	0x02,
		/* ATT_REM_ADRS	*/	0x03,
		/* ATT_MAPPING	*/	0x0A,
		/* ATT_PKT_COUNT*/	0x07,
		/* ATT_EXPIRE	*/	0x04,
		/* ATT_ERR_TXT	*/	0x0C
		}
		} ;

	return attributes[color][code] ;
}

void Update_Display(void)
{
	static longword cycle = 0L ;

	if (Check_Timeout(cycle))
	{
		longword now ;

		MtCSemaReset(display_sema) ;
		now = Set_Timeout(0) ;
		cycle = now + (Set_Timeout(10) - now + 15) / 30 ;
	}
}

PRIVATE void Display_Mapping(MAPPING far *m)
{
	char bfr[81], *proto ;
	unsigned minutes, hours ;
	static int mapping = 0 ;
	longword now, seconds ;
	int row, col ;

	if(endisplay == 1)
	{
	if (msg_timer && Check_Timeout(msg_timer))
	{
		Restore_Window() ;
		msg_timer = 0L ;
	}

	if (!m)
	{
		MtCSemaWait(display_sema, FALSE) ;
		MtCSemaSet(display_sema) ;
		mapping = 0 ;
		return ;
	}

	if (m->status & STATUS_SERVER) return ;

	if (!row) return ;
	col = 2 ;

	switch (m->c.protocol)
	{
		case TCP_PROTO:		proto = "TCP  " ;	break ;
		case UDP_PROTO:		proto = "UDP  " ;	break ;
		case ICMP_PROTO:	proto = "ICMP " ;	break ;
		default:
//			sprintf(proto = bfr, "%02Xh  ", m->c.protocol) ;
			sprintf(proto = bfr, "%Xh  ", m->c.protocol) ;
			break ;
	}
	printf("%s ",proto);

//	sprintf(bfr, "%16s", IP2Ascii(m->c.remote_IP)) ;
	sprintf(bfr, "  %s", IP2Ascii(m->c.remote_IP)) ;
	printf("%s",bfr);

	if (m->c.protocol == ICMP_PROTO) strcpy(bfr, "       ") ;
	else
//		sprintf(bfr, ":%-6u", m->c.remote_port) ;
		sprintf(bfr, ":%-2u", m->c.remote_port) ;
	printf(" %s ",bfr);

//	sprintf(bfr, "%16s", IP2Ascii(m->c.local_IP)) ;
	sprintf(bfr, " %s", IP2Ascii(m->c.local_IP)) ;
	printf("%s",bfr);

	if (m->c.protocol == ICMP_PROTO) strcpy(bfr, "       ") ;
	else
//	sprintf(bfr, ":%-6u", m->c.local_port) ;
		sprintf(bfr, ":%-2u", m->c.local_port) ;
	printf(" %s ",bfr);

//	sprintf(bfr, "%5u ", m->mapped_port) ;
	sprintf(bfr, "%7u ", m->mapped_port) ;
	printf("%s",bfr);

//	sprintf(bfr, "%6lu", m->pkt_rcvd) ;
	sprintf(bfr, "%4lu", m->pkt_rcvd) ;
	printf("%s",bfr);

//	sprintf(bfr, "%6lu", m->pkt_sent) ;
	sprintf(bfr, "%7lu", m->pkt_sent) ;
	printf("%s",bfr);

	now = Set_Timeout(0) ;
	if (now >= m->time_out) seconds = 0L ;
	else seconds = (64L * (m->time_out - now) + (1165L/2L)) / 1165L ;
	hours = (unsigned) (seconds / 3600L) ;	seconds %= 3600L ;
	minutes = (unsigned) (seconds / 60L) ;	seconds %= 60L ;

	sprintf(bfr, " %02u:%02u:%02lu", hours, minutes, seconds) ;
	printf("  %s\n",bfr);
	if(rowprint < 25)
		rowprint++;
	else
	{
		clrscrn();
		rowprint = 0;
		newdisplay();
	}
	} //exitconsole ==1
}
void newdisplay(void)
{	clrscrn();
	printf("Proto\tRemote IP:Port\t     Local IP:Port     Mapping   Rcvd   Sent   Expire ");

//	printf("%s\n",(char*)NOTICE);
	Show_Percent() ;
//	Visit_Mappings(Display_Mapping) ;
}

void Show_Percent(void)
{
	char bfr[10] ;int i =0;
	if(endisplay  == 1)
	{
	sprintf(bfr, "[%3u%c]", Percent_Used(), '%') ;
	for(i = 0; i< (LAST_COL -strlen(bfr));i++)
	{
		printf(" ");
	}
	printf("%s\n",bfr);
	}
}

PRIVATE void Erase_Rows(int first, int last)
{
	first = first; last = last;
}

PRIVATE void Erase_Row(int row, int attb)
{
	row = row; attb = attb;

}

PRIVATE void Display_Hex(char *label, void *data, int len)
{
	char bfr[81] ;
	char *bp, *p ;
	int i, col ;

	Shrink_Window() ;
	//col = PutStrAt(label, ATT_NORMAL, LAST_ROW, MSG_COLUMN) ;
	printf("%s",label);

	p = (char *) data ; bp = bfr ;
	for (i = 0; i < len; i++)
		{
		sprintf(bp, " %02X", *p++) ;
		bp += 3 ;
		}
	*bp = '\0' ;
	//PutStrAt(bfr, ATT_LCL_ADRS, LAST_ROW, col) ;

	printf("%s",bfr);
}

void Warning(CONNECTION *c, in_Header *ip, char *err, ...)
{
	c = c; ip = ip;
	if(endisplay == 1 )
	{
	printf("They are warning happend in program\n");
	printf("%s\n",err);
	}
}

PRIVATE void Move_Rows(int rows, int fm, int to)
{
	rows = rows; fm = fm; to =to; //prevent compiler warning
}

BOOL Restore_Window(void)
{
	if (footer == LAST_ROW) return FALSE ;
	Move_Rows(1, footer, LAST_ROW) ;
	Erase_Rows(footer, LAST_ROW - 1) ;
	footer = LAST_ROW ;
	return TRUE ;
}
PRIVATE void Shrink_Window(void)
{
/*	cur_rows = LAST_ROW - footer ;
	if (cur_rows + 1 <= MAX_SHRINK)
		{
		Move_Rows(cur_rows + 1, footer, footer - 1) ;
		footer-- ;
		}
	else Move_Rows(cur_rows - 1, footer + 2, footer + 1) ;
	Erase_Rows(LAST_ROW, LAST_ROW) ;
*/
}