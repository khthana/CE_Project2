#include <stdio.h>
#include <stdlib.h>
#include <openssl/x509.h>
#include <openssl/x509v3.h>
#include <openssl/err.h>
#include <openssl/pem.h>
#include <dirent.h>
#include <sys/stat.h>
#include <gtk/gtk.h>
#include <openssl/x509_vfy.h>

/*#define CA_FILE "/root/isagca/rootcert.pem"
#define CA_DIR "/root/isagca"
#define CRL_FILE "/root/isagca/crl.pem"*/


#define ENTRY_COUNT 6

char CA_FILE[255],CA_DIR[255],CRL_FILE[255];
extern void ssl_con1(char *acct_name);
struct entry
{
char *key;
char *value;
};

struct entry entries[ENTRY_COUNT] = {
  {"countryName", "TH"},
  {"stateOrProvinceName", "BK"},
  {"localityName", "IsagQ"},
  {"organizationName", "ISAG"},
  {"organizationalUnitName", "Server Division"},
  {"commonName", "too00@thaimail.com"},
};

void create_req(char *acct_name,int size)
{
  int i;
  X509_REQ *req;
  X509_NAME *subj;
  EVP_PKEY *pkey;
  EVP_MD *digest;
  FILE *fp;
		RSA             *keypair;
		ca_file(CA_FILE);
		crl_file(CRL_FILE);
		ca_dir(CA_DIR );
		char act_name[255];  
	 char pubkey_file[255],pvkey_file[255],req_file[255];
		sprintf(act_name,"%s",acct_name);
  OpenSSL_add_all_algorithms ();
  ERR_load_crypto_strings ();
		entries[5].value = act_name;
  //seed_prng ();
		 if ((keypair = RSA_generate_key(size, RSA_F4, NULL, NULL)) == NULL)
 	{ //return 1;
				};

		pkey = EVP_PKEY_new();
  EVP_PKEY_assign_RSA(pkey, keypair);
 	buddy_cert_file(act_name,pvkey_file,1);
		buddy_cert_file(act_name,pubkey_file,0); 
		buddy_cert_file(act_name,req_file,2); 


  if (!(fp = fopen(pvkey_file, "w")))
	int_error("Error writing to request file");

	//write privKey to file
	 if (!PEM_write_PrivateKey(fp, pkey, NULL, NULL, 0, 0, NULL))
        {
        	int_error("Error writing Private key to file pointer");
        }
  fclose(fp);
  if (!(fp = fopen(pubkey_file, "w")))
	int_error("Error writing to request file");

	//write pubKey to file
	 if (!PEM_write_PUBKEY(fp, pkey))
        {
        	int_error("Error writing Public key to file pointer");
        }
  fclose(fp);



/* first read in the private key */
  if (!(fp = fopen (pvkey_file, "r")))
    int_error ("Error reading private key file");
  if (!(pkey = PEM_read_PrivateKey (fp, NULL, NULL, "secret")))
    int_error ("Error reading private key in file");
  fclose (fp);

/* create a new request and add the key to it */
  if (!(req = X509_REQ_new ()))
    int_error ("Failed to create X509_REQ object");
  X509_REQ_set_pubkey (req, pkey);

/* assign the subject name */
  if (!(subj = X509_NAME_new ()))
    int_error ("Failed to create X509_NAME object");

  for (i = 0; i < ENTRY_COUNT; i++)
    {
      int nid;
      X509_NAME_ENTRY *ent;

      if ((nid = OBJ_txt2nid (entries[i].key)) == NID_undef)
	{
	  fprintf (stderr, "Error finding NID for %s\n", entries[i].key);
	  int_error ("Error on lookup");
	}
      if (!(ent = X509_NAME_ENTRY_create_by_NID (NULL, nid, MBSTRING_ASC,
						 entries[i].value, -1)))
	int_error ("Error creating Name entry from NID");
      if (X509_NAME_add_entry (subj, ent, -1, 0) != 1)
	int_error ("Error adding entry to Name");
    }
  if (X509_REQ_set_subject_name (req, subj) != 1)
    int_error ("Error adding subject to request");

/* add an extension for the FQDN we wish to have */
  {
    X509_EXTENSION *ext;
    STACK_OF (X509_EXTENSION) * extlist;
    char *name = "subjectAltName";
    char *value = "DNS:splat.zork.org";

    extlist = sk_X509_EXTENSION_new_null ();

    if (!(ext = X509V3_EXT_conf (NULL, NULL, name, value)))
      int_error ("Error creating subjectAltName extension");

    sk_X509_EXTENSION_push (extlist, ext);

    if (!X509_REQ_add_extensions (req, extlist))
      int_error ("Error adding subjectAltName to the request");
    sk_X509_EXTENSION_pop_free (extlist, X509_EXTENSION_free);
  }

/* pick the correct digest and sign the request */
  if (EVP_PKEY_type (pkey->type) == EVP_PKEY_DSA)
    digest = EVP_dss1 ();
  else if (EVP_PKEY_type (pkey->type) == EVP_PKEY_RSA)
    digest = EVP_sha1 ();
  else
    int_error ("Error checking public key for a valid digest");
  if (!(X509_REQ_sign (req, pkey, digest)))
    int_error ("Error signing request");

/* write the completed request */
  if (!(fp = fopen (req_file, "w")))
    int_error ("Error writing to request file");
  if (PEM_write_X509_REQ (fp, req) != 1)
    int_error ("Error while writing request");
  fclose (fp);

  EVP_PKEY_free (pkey);
  X509_REQ_free (req);
  return 0;
}
void	get_name_from_cert(char *user,char *cert){

		strncpy(user,cert+4,strlen(cert)-8);
}
void scan_cert(gpointer data){
	
	int indx;

	char *dir;
	char *user_name;
	
	DIR *dp;
	char temp[255];
	char x1[255],x2[255];
	struct dirent *entry;
	struct stat statbuf;

	gchar *user_data[255][3]  ;
	indx = 0;	
	sprintf(temp,"%s/cert",gaim_user_dir());
	dir=temp;
	if( (dp=opendir(dir))==NULL){
	fprintf(stderr,"can't open dir\n");
	return;
	};
	
	chdir(dir);
	while((entry=readdir(dp)) != NULL){
		lstat(entry->d_name,&statbuf);
		
		if(S_ISDIR(statbuf.st_mode)){
			if(strcmp(".",entry->d_name) == 0 || strcmp("..",entry->d_name) == 0)
			continue;


			//savedir(entry,statbuf,alg,option);
			scan_cert(entry->d_name);
		}
		else 
		{
			if(S_ISLNK(statbuf.st_mode) || S_ISSOCK(statbuf.st_mode))
			{
			printf(" %*s%s/\n ", 0,"",entry->d_name);	
			printf("this is symlink\n");
			}
			else{
				char tag[4];
					
				memcpy(tag,entry->d_name,4);
				/* try finding the tag */
				
				if(!strncmp("[PV]",tag,4)) 
				{
						
						strcpy(x1,"");
						strcpy(x2,"");
						gaim_debug(GAIM_DEBUG_INFO, "Isagq", "data before append = %s\n",entry->d_name);			
						//get_name_from_cert(user_name,entry->d_name);
						//sprintf(x1,"%s",entry->d_name);
						sprintf(x1,"%s",entry->d_name);
						gaim_debug(GAIM_DEBUG_INFO, "Isagq", "x1  = %s\n",x1);
						strncpy(x2,x1+4,strlen(x1)-8);
						gaim_debug(GAIM_DEBUG_INFO, "Isagq", "error 2\n");
						strcpy(x2+strlen(x1)-8,"\0");
					
					 gaim_debug(GAIM_DEBUG_INFO, "Isagq", "data before append 2 = %s\n",x2);										
							user_name = x2;
					//	user_list=g_list_append(user_list,user_name);
				  user_data[indx][0] = user_name;
				  user_data[indx][1] = "1";
				  user_data[indx][2] = "2";
						gtk_clist_append( (GtkCList *) data, user_data[indx]);
						/*sprintf(cmd,"openssl x509 -noout -in %s -fingerprint >> fingerprint",entry->d_name);
 				  system(cmd);
				  fp = fopen("fingerprint","r");
				  fgets(buf,sizeof(buf),fp);
				  fclose(fp);*/
						indx++;
		
				}     			
   								
			}
		}
	
		

	}
	chdir("..");
	closedir(dp);

			//	verify_cert();
			
    return;
}
void init_cert(){
				GaimAccount *acct;
				GList *cur_acct;
				char *acct_name;
				cur_acct=gaim_accounts_get_all();
				int err;
				while(cur_acct != NULL)
				{
								acct = (GaimAccount *)cur_acct->data;
								acct_name = acct->username;	
								gaim_debug(GAIM_DEBUG_INFO, "Isagq","%s\n",acct_name);
								//verify_cert(acct_name);						
								if(check_cert(acct_name)==0)
								{
												create_req(acct_name,1024);												 
											
								}
								cur_acct = cur_acct->next;
				}
			gaim_debug(GAIM_DEBUG_INFO, "Isagq","out of init cert \n");				
}
int verify_callback(int ok, X509_STORE_CTX *stor)
{
	if(!ok)
		fprintf(stderr, "Error: %s\n", X509_verify_cert_error_string(stor->error));
	return ok;
}
int verify_cert(char *usr)
{
	X509		*cert;
	X509_STORE	*store;
	X509_LOOKUP	*lookup;
	X509_STORE_CTX	*verify_ctx;
	FILE 		*fp;
	char cert_file[255];
	OpenSSL_add_all_algorithms();
	ERR_load_crypto_strings();
	//seed_prng();
	buddy_cert_file(usr,cert_file,3);
	/* first read the client certificate */
	if(!(fp = fopen(cert_file, "r")))
		int_error("Error reading client certificate file");
	if(!(cert = PEM_read_X509(fp, NULL, NULL, NULL)))
		int_error("Error reading certificate in file");
	fclose(fp);

	/* create the cert store and set the verify callback */
	if(!(store = X509_STORE_new()))
		int_error("Error creating X509_STORE_CTX object");
		X509_STORE_set_verify_cb_func(store, verify_callback);
	
	/* load the CA certificate and CRLs */
	if(X509_STORE_load_locations(store, CA_FILE, CA_DIR) != 1)
		int_error("Error loading the CA file or directory");
	if(X509_STORE_set_default_paths(store) !=1)
		int_error("Error loading the system-wide CA certificates");
	if(!(lookup = X509_STORE_add_lookup(store, X509_LOOKUP_file())))
		int_error("Error creating X509_LOOKUP object");
	if(X509_load_crl_file(lookup, CRL_FILE, X509_FILETYPE_PEM) != 1)
		int_error("Error reading CRL file");
	/*     
	if(!(lookup = X509_STORE_add_lookup(store, X509_LOOKUP_file())))
		fprintf(stderr, "Error creating X509_LOOKUP object\n");
	if(X509_LOOKUP_load_file(lookup, CA_FILE, X509_FILETYPE_PEM) !=1)
		fprintf(stderr, "Error reading the CA file\n");
	if(!(lookup = X509_STORE_add_lookup(store, X509_LOOKUP_hash_dir())))
		fprintf(stderr, "Error creating X509_LOOKUP object\n");
	if(X509_LOOKUP_add_dir(lookup, CA_DIR, X509_FILETYPE_PEM) !=1)
		fprintf(stderr, "Error reading the CRL file\n");*/

/* enabling verification against CRLs is not possible in prior versions */
#if (OPENSSL_VERSION_NUMBER > 0x00907000L)
	/* set the flags of the store so that CRLs are consulted */
	X509_STORE_set_flags(store, X509_V_FLAG_CRL_CHECK | X509_V_FLAG_CRL_CHECK_ALL);
#endif
	
	/*create a verification context and initialize it*/
	if (!(verify_ctx = X509_STORE_CTX_new()))
		int_error("Error creating X509_STORE_CTX object");
	/*X509_STORE_CTX_init did not return an error condition in prior versions*/
#if (OPENSSL_VERSION_NUMBER > 0x00907000L)
	if (X509_STORE_CTX_init(verify_ctx, store, cert, NULL) != 1)
		int_error("Error initializing verification context");
#else
	X509_STORE_CTX_init(verify_ctx, store, cert, NULL);
#endif

	/* verify the certificate */
	if (X509_verify_cert(verify_ctx)!=1)
		printf("Error verifying the certificate\n");
	else
		printf("Certificate verified correctly!\n");
	return 0;
}



























