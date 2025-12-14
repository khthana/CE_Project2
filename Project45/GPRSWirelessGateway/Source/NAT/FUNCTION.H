/* File: INC\FUNCTION.H */

/* -------------------------------------------------------------------- */
/* From RAUDIO.C							*/
/* -------------------------------------------------------------------- */
BOOL		RA_OutToSrvr(PACKET *, MAPPING far *) ;

/* -------------------------------------------------------------------- */
/* From FRAGMENT.C							*/
/* -------------------------------------------------------------------- */
void		Add_Fragment(in_Header *, unsigned, CONNECTION *) ;
void		Check_Fragments(void) ;
void		Expire_Fragments(void) ;
CONNECTION *	Fragment_Connection(PACKET *, unsigned, MTCBOOL *) ;

/* -------------------------------------------------------------------- */
/* From ASSEMBLY.ASM							*/
/* -------------------------------------------------------------------- */
void		Adjust_Checksum(word *, void *, void *, int) ;
int		Check_Timeout(longword) ;
unsigned	Checksum(void *, unsigned) ;
void		Delta_Checksum(word *, word) ;
BOOL		No_Op(void) ;
longword	Rev32(longword) ;
word		Rev16(word) ;
longword	Set_Timeout(int) ;

/* -------------------------------------------------------------------- */
/* From BOOTP.C								*/
/* -------------------------------------------------------------------- */
BOOL		BOOTP_Enabled(BOOL) ;
void		BOOTP_Attempt(void) ;

/* -------------------------------------------------------------------- */
/* From NAPT.C								*/
/* -------------------------------------------------------------------- */
longword	Ascii2IP(char *) ;
void		Error(char *, ...) ;
char *		IP2Ascii(longword) ;
BOOL		Protocol_Checksum_OK(in_Header *, unsigned) ;

/* -------------------------------------------------------------------- */
/* From IDENT.C								*/
/* -------------------------------------------------------------------- */
void		Ident_InToSrvr(PACKET *, MAPPING far *) ;

/* -------------------------------------------------------------------- */
/* From DNS.C								*/
/* -------------------------------------------------------------------- */
void		Add_DNS_Entry(char *, char *) ;
BOOL		DNS_OutToSrvr(PACKET *, MAPPING far *) ;
BOOL		DNS_InFmSrvr(PACKET *, MAPPING far *) ;

/* -------------------------------------------------------------------- */
/* From FTP.C								*/
/* -------------------------------------------------------------------- */
BOOL		FTP_InToSrvr(PACKET *, MAPPING far *) ;
BOOL		FTP_InFmSrvr(PACKET *, MAPPING far *) ;
BOOL		FTP_OutToSrvr(PACKET *, MAPPING far *) ;
BOOL		FTP_OutFmSrvr(PACKET *, MAPPING far *) ;

/* -------------------------------------------------------------------- */
/* From ARP.C								*/
/* -------------------------------------------------------------------- */
void		Local_ARP(void) ;
BOOL		Local_ARP_Resolve(longword, void far *) ;
void		Remote_ARP(void) ;
BOOL		Remote_ARP_Resolve(longword, void far *) ;

/* -------------------------------------------------------------------- */
/* From ICMP.C								*/
/* -------------------------------------------------------------------- */
void		Inbound_ICMP(void) ;
void		Outbound_ICMP(void) ;

/* -------------------------------------------------------------------- */
/* From MAPPING.C							*/
/* -------------------------------------------------------------------- */
MAPPING far *	Add_Client(MAPPING far *, CONNECTION *, byte *) ;
MAPPING far *	Add_Mapping(CONNECTION *, void far *) ;
MAPPING far *	Add_Server(byte, longword, word, BOOL) ;
void		Alloc_Tables(void) ;
CONNECTION *	Connection(in_Header *, void *) ;
void		Del_Mapping(MAPPING far *) ;
MAPPING far *	Find_Inbound(CONNECTION *) ;
MAPPING far *	Find_Outbound(CONNECTION *) ;
int		Mappings(int) ;
int		Max_Mappings(void) ;
CONNECTION *	Partial(in_Header *) ;
unsigned	Percent_Used(void) ;
void		Reset_Timeout(MAPPING far *, tcp_Header *) ;
CONNECTION *	Reverse(CONNECTION *) ;
void		Visit_Mappings(void (*)(MAPPING far *)) ;

/* -------------------------------------------------------------------- */
/* From CHECKSUM.C							*/
/* -------------------------------------------------------------------- */
void		Fix_IP_Checksum(in_Header *) ;
void		Fix_Prot_Checksum(in_Header *) ;
void		Fix_ICMP_Checksum(in_Header *) ;

/* -------------------------------------------------------------------- */
/* From DISPLAY.C							*/
/* -------------------------------------------------------------------- */
void 		Display(void) ;
void		Init_Display(void) ;
BOOL		Restore_Window(void) ;
//BOOL		Scroll_Key(word) ;
void		Show_Percent(void) ;
void		Update_Display(void) ;
void		Warning(CONNECTION *, in_Header *, char *, ...) ;

/* -------------------------------------------------------------------- */
/* From EXPIRE.C							*/
/* -------------------------------------------------------------------- */
void 		Expire(void) ;

/* -------------------------------------------------------------------- */
/* From INBOUND.C							*/
/* -------------------------------------------------------------------- */
void 		Inbound_IP(void) ;

/* -------------------------------------------------------------------- */
/* From OUTBOUND.C							*/
/* -------------------------------------------------------------------- */
BOOL		Local_Target(longword) ;
void 		Outbound_IP(void) ;

/* -------------------------------------------------------------------- */
/* From PHYSICAL.C							*/
/* -------------------------------------------------------------------- */
void		Dispatcher(void) ;
BOOL		Forward2Local(PACKET *, byte far *) ;
BOOL		Forward2Remote(PACKET *, byte far *) ;
void *		Local_Adrs(void) ;
int		Local_Class(void) ;
BOOL		Local_Send(PACKET *, unsigned) ;
void		Packet_Free(PACKET *) ;
void		Packet_Init(void) ;
void *		Remote_Adrs(void) ;
int		Remote_Class(void) ;
BOOL		Remote_Send(PACKET *, unsigned) ;
PACKET *	Wait_For_Packet(int) ;

/* -------------------------------------------------------------------- */
/* From CONFIG.C							*/
/* -------------------------------------------------------------------- */
void console(void);
void display(void);
void configGPRS(void);
void configNAT(void);
void configDHCP(void);
void printMenu(void);