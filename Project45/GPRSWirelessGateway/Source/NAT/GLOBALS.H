/* File: INC\GLOBALS.H */

#ifdef	NAPT

char err1[] = "Can't map %s packet" ;
char err2[] = "Can't send local Ethernet packet" ;
char err3[] = "Bad protocol checksum on %s packet" ;
char err4[] = "Unknown protocol (%u) on %s packet" ;
char err5[] = "Truncated %s packet" ;
char err6[] = "Bad IP version number (%d) on %s packet" ;

char			inbound[]	= "inbound" ;
char			outbound[]	= "outbound" ;
char			remote_name[64]	= "" ;

unsigned		remote_pdi	= 0 ;
unsigned		local_pdi	= 0 ;

longword		remote_IP	= 0L ;	/* Intel byte order */
longword		remote_mask	= 0L ;
longword		remote_gateway	= 0L ;
longword		local_IP	= 0L ;
longword		local_mask	= 0L ;
longword		local_gateway	= 0L ;

longword		_remote_IP	= 0L ;	/* Network byte order */
longword		_remote_mask	= 0L ;
longword		_remote_gateway	= 0L ;
longword		_local_IP	= 0L ;
longword		_local_mask	= 0L ;
longword		_local_gateway	= 0L ;
// config.c
char scan = 0;
int exitconsole = 1;
int i =0;
int j=0;
int k=0;
int sendcommand =0;
int gprstime = 0;
int NATtime = 0;
int keyhit = 0; //if kbhit,keyhit =1;
char command[30]= "";
char ccmd[30]="";
int endisplay =1; //enable display thread
#else

extern char		err1[], err2[], err3[], err4[], err5[], err6[] ;
extern char		inbound[], outbound[], remote_name[64] ;
extern unsigned		remote_pdi, local_pdi ;
extern longword		remote_IP, _remote_IP ;
extern longword		remote_mask, _remote_mask ;
extern longword		remote_gateway, _remote_gateway ;
extern longword		local_IP, _local_IP ;
extern longword		local_mask, _local_mask ;
extern longword		local_gateway, _local_gateway ;
//
extern char scan ;
extern int exitconsole ;
extern int i ;
extern int j;
extern int k;
extern int sendcommand ;
extern int gprstime;
extern int NATtime ;
extern int keyhit;
extern char command[30];
extern char ccmd[30];
extern int endisplay;

#endif

