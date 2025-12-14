#ifndef lint
#endif not lint
#ifndef lint
#endif not lint
#include <sys/types.h>
#include <sys/file.h>
#include <sys/socket.h>


#include <rpc/rpc.h>
#include <rpc/pmap_clnt.h>
#include <rpc/pmap_prot.h>
#include <nfs/rpcv2.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

/* Constant defs */

#define	DODUMP		0x1
#define	DOEXPORTS	0x2

void itoa(int i,char *ch);
struct mountlist {
	struct mountlist *ml_left;
	struct mountlist *ml_right;
	char	ml_host[RPCMNT_NAMELEN+1];
	char	ml_dirp[RPCMNT_PATHLEN+1];
};

struct grouplist {
	struct grouplist *gr_next;
	char	gr_name[RPCMNT_NAMELEN+1];
};

struct exportslist {
	struct exportslist *ex_next;
	struct grouplist *ex_groups;
	char	ex_dirp[RPCMNT_PATHLEN+1];
};

static struct mountlist *mntdump;
static struct exportslist *exports;
static int type = 0;
int xdr_mntdump(), xdr_exports();
void itoa(int i,char *ch);

/*
 * This command queries the NFS mount daemon for it's mount list and/or
 * it's exports list and prints them out.
 * MAIN  nfsscan -<option> <hostname>
 */

main(argc, argv)
	int argc;
	char **argv;
{
	register struct mountlist *mntp;
	register struct exportslist *exp;
	register struct grouplist *grp;
	extern char *optarg;
	extern int optind;
	register int rpcs = 0;
	char ch;
	char *host;
	int estat;
	int  lenght,i;
   	char temp[5];
   		

	while ((ch = getopt(argc, argv, "e")) != EOF)
		switch((char)ch) {
		
		case 'e':
			rpcs |= DOEXPORTS;
			break;
		case '?':
		default:
			usage();
		}
	argc -= optind;
	argv += optind;

	if (argc > 0)
		host = *argv;
	else
        usage();

//-------------------------------------------------
	lenght=strlen(host);
	if  ((host[lenght-1]  == '5') && 
	(host[lenght-2] == '5') && 
	(host[lenght-3] == '2')) {     	
        	for (i=1;i<255;i++){ 
       			host[lenght-3] = '\0'; 
        		itoa(i,temp); 
        		strcat(host,temp); 
//---------------------------------------------------        		
//***************************************************
	
	if (rpcs & DOEXPORTS)
		if ((estat = callrpc(host, RPCPROG_MNT, RPCMNT_VER1,
			RPCMNT_EXPORT, xdr_void, (char *)0,
			xdr_exports, (char *)&exports)) != 0) {
			clnt_perrno(estat);
			fprintf(stderr, "\nPlease type :nfsscan -? \n");
			//exit(1);
		}

	/* Now just print out the results */
	if (rpcs & DOEXPORTS) {
		printf("Exports list on %s:\n", host);
		exp = exports;
		while (exp) {
			printf("%-35s", exp->ex_dirp);
			grp = exp->ex_groups;
			if (grp == NULL) {
				printf("Everyone\n");
			} else {
				while (grp) {
					printf("%s ", grp->gr_name);
					grp = grp->gr_next;
				}
				printf("\n");
			}
			exp = exp->ex_next;
		}
	}
printf("%s\n",host); 
 		}          
     	} 

//******************************************************

	if (rpcs & DOEXPORTS)
		if ((estat = callrpc(host, RPCPROG_MNT, RPCMNT_VER1,
			RPCMNT_EXPORT, xdr_void, (char *)0,
			xdr_exports, (char *)&exports)) != 0) {
			clnt_perrno(estat);
			fprintf(stderr, "\nPlease type :nfsscan -? \n");
			exit(1);
		}

	/* Now just print out the results */
	if (rpcs & DOEXPORTS) {
		printf("Exports list on %s:\n", host);
		exp = exports;
		while (exp) {
			printf("%-35s", exp->ex_dirp);
			grp = exp->ex_groups;
			if (grp == NULL) {
				printf("Everyone\n");
			} else {
				while (grp) {
					printf("%s ", grp->gr_name);
					grp = grp->gr_next;
				}
				printf("\n");
			}
			exp = exp->ex_next;
		}
	}
}


/*
 * Xdr routine to retrieve exports list
 */
xdr_exports(xdrsp, exp)
	XDR *xdrsp;
	struct exportslist **exp;
{
	register struct exportslist *ep;
	register struct grouplist *gp;
	int bool, grpbool;
	char *strp;

	*exp = (struct exportslist *)0;
	if (!xdr_bool(xdrsp, &bool))
		return (0);
	while (bool) {
		ep = (struct exportslist *)malloc(sizeof(struct exportslist));
		if (ep == NULL)
			return (0);
		ep->ex_groups = (struct grouplist *)0;
		strp = ep->ex_dirp;
		if (!xdr_string(xdrsp, &strp, RPCMNT_PATHLEN))
			return (0);
		if (!xdr_bool(xdrsp, &grpbool))
			return (0);
		while (grpbool) {
			gp = (struct grouplist *)malloc(sizeof(struct grouplist));
			if (gp == NULL)
				return (0);
			strp = gp->gr_name;
			if (!xdr_string(xdrsp, &strp, RPCMNT_NAMELEN))
				return (0);
			gp->gr_next = ep->ex_groups;
			ep->ex_groups = gp;
			if (!xdr_bool(xdrsp, &grpbool))
				return (0);
		}
		ep->ex_next = *exp;
		*exp = ep;
		if (!xdr_bool(xdrsp, &bool))
			return (0);
	}
	return (1);
}
/*
 * Print the help .
 */
usage()
{
	fprintf(stderr, " \n  Help usage: nfsscan -<option> hostnameNFS\n");	 
 	fprintf(stderr, "  option    : -? ishelp\n");  	 	
	fprintf(stderr, "  option    : -e is showexport list\n");   	
	fprintf(stderr, "  Example   : nfsscan -e 127.0.0.1\n\n");
 	 exit(1);  
}

void itoa(int i,char *ch) 
{ 
  int len,j,k; 
  char temp[] = "000000000"; 
  if (i < 10) len = 0; 
  else if (i < 100) len = 1; 
  else len = 2; 
 
  for(j=0;j<=len;j++) 
  { 
    k = i % 10; 
    i = (i - k) /10; 
    temp[len-j] += k; 
  } 
  temp[len+1] = '\0'; 
  strcpy(ch,temp); 
  return; 
} 

