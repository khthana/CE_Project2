#include "common.h"
#include "serv_services.h"
//#include "linklist.h"
#define   NO_ERROR        0x00
#define   CONNECT_FULL    0x01

static char ip_client[16];
static char channel ;
NODE *list;
unsigned char buffer_read[MAX_MESSAGE];
char user_id[FIX_USER_ID];
 
DH *dh512 = NULL;
DH *dh1024 = NULL;


void init_dhparams(void)
{
    BIO *bio;

    bio = BIO_new_file("dh512.pem", "r");
    if (!bio)
        int_error("Error opening file dh512.pem");
    dh512 = PEM_read_bio_DHparams(bio, NULL, NULL, NULL);
    if (!dh512)
        int_error("Error reading DH parameters from dh512.pem");
    BIO_free(bio);

    bio = BIO_new_file("dh1024.pem", "r");
    if (!bio)
        int_error("Error opening file dh1024.pem");
    dh1024 = PEM_read_bio_DHparams(bio, NULL, NULL, NULL);
    if (!dh1024)
        int_error("Error reading DH parameters from dh1024.pem");
    BIO_free(bio);
}

DH *tmp_dh_callback(SSL *ssl, int is_export, int keylength)
{
    DH *ret;

    if (!dh512 || !dh1024)
        init_dhparams(  );

    switch (keylength)
    {
        case 512:
            ret = dh512;
            break;
        case 1024:
        default: /* generating DH params is too costly to do on the fly */
            ret = dh1024;
            break;
    }
    return ret;
}

#define CIPHER_LIST "ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH"
#define CAFILE "rootcert.pem"
#define CADIR NULL
#define CERTFILE "server.pem"
SSL_CTX *setup_server_ctx(void)
{
    SSL_CTX *ctx;
 
    ctx = SSL_CTX_new(SSLv23_method(  ));
    if (SSL_CTX_load_verify_locations(ctx, CAFILE, CADIR) != 1)
        int_error("Error loading CA file and/or directory");
    if (SSL_CTX_set_default_verify_paths(ctx) != 1)
        int_error("Error loading default CA file and/or directory");
    if (SSL_CTX_use_certificate_chain_file(ctx, CERTFILE) != 1)
        int_error("Error loading certificate from file");
    //SSL_CTX_set_default_passwd_cb(ctx,"secure!"); 
    if (SSL_CTX_use_PrivateKey_file(ctx, CERTFILE, SSL_FILETYPE_PEM) != 1)
       int_error("Error loading private key from file");
    SSL_CTX_set_verify(ctx, SSL_VERIFY_PEER|SSL_VERIFY_FAIL_IF_NO_PEER_CERT,
                       verify_callback);
    SSL_CTX_set_verify_depth(ctx, 4);
    SSL_CTX_set_options(ctx, SSL_OP_ALL | SSL_OP_NO_SSLv2 |
                             SSL_OP_SINGLE_DH_USE);
    SSL_CTX_set_tmp_dh_callback(ctx, tmp_dh_callback);
    if (SSL_CTX_set_cipher_list(ctx, CIPHER_LIST) != 1)
        int_error("Error setting cipher list (no valid ciphers)");
    return ctx;
}

  
void THREAD_CC server_thread(void *arg)
{
    SSL *ssl = (SSL *)arg;
long err;
 
#ifndef WIN32
    pthread_detach(pthread_self(  ));
#endif
    if (SSL_accept(ssl) <= 0)
        int_error("Error accepting SSL connection");
    if ((err = post_connection_check(ssl, CLIENT)) != X509_V_OK)
    {
        fprintf(stderr, "-Error: peer certificate: %s\n",
                X509_verify_cert_error_string(err));
        int_error("Error checking SSL object after connection");
    }
    fprintf(stderr, "SSL Connection opened\n");
    if (do_services(ssl))
    {
        if(Delete(list,user_id) == 1 )
	{
		traverse(list);
		NUMBER_CLIENT--;
	 	fprintf(stdout,"Number of current Client : %d\n\n", NUMBER_CLIENT);
		logout(ssl,buffer_read,user_id);	
	}
	SSL_shutdown(ssl);
    }
    else
    {
        SSL_clear(ssl);
    }
    fprintf(stderr, "SSL Connection closed\n");
    SSL_free(ssl);
    ERR_remove_state(0);
#ifdef WIN32
    _endthread(  );
#endif
}

void do_services(SSL *ssl)
{
    char ip[FIX_IP];
    char subject[MAXSUBJECT];
    //char user_id[FIX_USER_ID];
    int  registor_on = 0;
    int check = 0;
    X509 *ctx;
    X509_NAME *ctx_name;
    int duplicate;


    /*channel 0, sequence 1-2, length 3-4, command 5, flag 6*/
   // unsigned char buffer_read[MAX_MESSAGE];
    int i;
   
    for(i = 0;i < MAX_MESSAGE;i++)
    { buffer_read[i] = '\0'; }

    strcpy(ip, ip_client);
    /*Show information connect from client*/
	fprintf(stdout,"Server got connection from :%s\n", ip);
    
    /*Count number client */
    NUMBER_CLIENT++;
    fprintf(stdout,"Number of current Client : %d\n\n", NUMBER_CLIENT);
    if(NUMBER_CLIENT > 250)
    {
      fprintf(stdout, "Number current connect > 250 \n");
      fprintf(stdout, "Connect Again\n");
      //write_err_message(ssl, CONNECT_FULL, "Connect Again About Connection Full");
      goto exit_services;
    }
    //write_err_message(ssl, NO_ERROR, "Loading Connect Complete ^_^");

    /*Get Subject Information of user*/
        ctx = SSL_get_peer_certificate(ssl);
        ctx_name = X509_get_subject_name(ctx);
	X509_NAME_get_text_by_NID(ctx_name,NID_commonName,user_id,256);
	fprintf(stdout, "Connecting User : %s\n   ", user_id);
    
    //Initial Linked List
 	
	duplicate = Insert(list,user_id);
	if(duplicate)
	{
		printf("User_id is already in used");
	}
	traverse(list);

/* 
  if(NUMBER_CLIENT == 1) {
        if(!start_list(user_id, ip)) {
			fprintf(stdout, "%s   ", user_id);
        	printf("Start Linked List Error\n");
		}
    }
	else
		if( !insert(user_id, ip) ) {
			fprintf(stdout, "%s   ", user_id);
			printf("Insert Linked List Error\n");
		}
*/

		
    while(1)
    {
        /*read message channel*/
        /*channel 0, sequence 1-2, length 3-4, command 5, flag 6*/
        fprintf(stdout, "%s   ", user_id);
	fprintf(stdout, "Wait service command...........\n");
	SSL_read(ssl, buffer_read, sizeof(buffer_read));
        channel = buffer_read[0];
	//fprintf(stdout,"------------------> %#x\n",channel);	
        /*check channel*/
        switch(channel)
        {
            case 0x1: /*check user*/
							fprintf(stdout, "%s   ", user_id);
               				fprintf(stdout, "Packet channel 1:New user\n");
						    //new_user(ssl, buffer_read, ip, user_id);							
							/*free buffer of the channel*/
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';		
               				break;

            case 0x2: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 2:Login\n");
                			//login(ssl, buffer_read, user_id);
							/*free buffer of the channel*/
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
                     		break;

            case 0x3: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 3:Add Contractlist\n");
							add_contactlist(ssl, buffer_read, user_id);
							/*free buffer of the channel*/
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';	
                     		break;

            case 0x4: 
							fprintf(stdout, "%s   ", user_id);
				    		fprintf(stdout, "Packet channel 4:Change Nick Name\n");
							change_nick_name(ssl, buffer_read, user_id);				
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
                      		break;

            case 0x5: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 5:Status\n");
		      				if(buffer_read[5] == 0x51)
							{
								fprintf(stdout,"Calling Status\n");
								status(ssl, buffer_read, user_id,list);
							}
							else if(buffer_read[5] == 0x21)
							{
								fprintf(stdout,"Calling Request Info\n");								
								request_info(ssl,buffer_read,user_id);
							}
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
                      		break;

            case 0x6: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 6:Error\n");
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
                      		break;

		    case 0x7: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 7:Logout\n");
							/*Delect User ID from Liked List*/
        //    						if(Delete(list,user_id) == 1 )
	//						{
	//							traverse(list);
	//							NUMBER_CLIENT--;
	//						 	fprintf(stdout,"Number of current Client : %d\n\n", NUMBER_CLIENT);
	//							logout(ssl,buffer_read,user_id);	
	//						}
	//						else fprintf(stdout,"Can't Delete link list\n");
//							for(i = 0;i < MAX_MESSAGE;i++)
//								buffer_read[i] = '\0';
							goto exit_services;

    	    case 0x8: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel 8:Find Contactlist\n");
							/*Find Contract list*/
							find_contactlist(ssl, buffer_read, user_id,list);
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
							break;

			case 0xa: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel a:Delete Admin\n");
							//delete_admin(ssl, buffer_read, user_id);
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
							break;

			case 0x51: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel a:Set Status\n");
							set_status(ssl,buffer_read,user_id);
						    for(i=0 ; i<MAX_MESSAGE;i++) 
								buffer_read[i] = '\0';
		  				    break;

			case 0x55: 
							fprintf(stdout, "%s   ", user_id);
							if(buffer_read[5] == 0x51)
							{
							   	fprintf(stdout, "Packet channel a:Deny\n");
							   	deny(ssl,buffer_read,user_id);
							}
		    			    else if(buffer_read[5] = 0x5a)
							{
							   	fprintf(stdout, "Packet channel a:Admit\n");
							   	admit(ssl,buffer_read,user_id);
							}
		 				    for(i=0 ;i<MAX_MESSAGE;i++) 
								buffer_read[i] = '\0';
		  				    break;

			case 0x5e: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel a:Authorized List\n");
						    if(buffer_read[5] == 0x51)
						    authorize_list(ssl,buffer_read,user_id,list);
						    else accept_authorize(ssl,buffer_read,user_id);

							for(i=0 ;i<MAX_MESSAGE;i++) buffer_read[i] = '\0';
							break;

			case 0xb: 
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet channel a:Delete Contactlist\n");
							delete_contactlist(ssl, buffer_read, user_id);
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
							break;

            default : 	
							fprintf(stdout, "%s   ", user_id);
							fprintf(stdout, "Packet no channel\n");
							for(i = 0;i < MAX_MESSAGE;i++)
								buffer_read[i] = '\0';
							goto exit_services;
							break;
        }
    }

exit_services:    
    //return do_server_loop(ssl);
    //return (SSL_get_shutdown(ssl) & SSL_RECEIVED_SHUTDOWN) ? 1 : 0;
}


char *get_user_id(char subject[])
{
    char *user_id;
    char temp[3];
    int loop;
    int point = 0;
    
    
    user_id = (char *)malloc(sizeof(char) *10);

    //find user_id
    for(loop = 0;loop < MAXSUBJECT;loop++)
    {
        if(subject[loop] == 'C')
        {
            temp[0] = 'C';
            if(subject[loop+1] == 'N')
                temp[1] = 'N';
            else temp[0] = '\0';

            if(subject[loop+2] == '=')
            {   temp[2] = '=';
                loop +=3;
                for(point =0;point < FIX_USER_ID;point++)
                {   if(subject[loop+point] == '/')
                        break;
                    user_id[point] = subject[loop+point];
                }
                break;
            }
            else
            {   temp[0] = '\0';
                temp[1] = '\0';
            }   
        }    
    }
    user_id="isag32";
    return user_id;
}

 
int main(int argc, char *argv[])
{
    BIO     *acc, *client;
    SSL     *ssl;
    SSL_CTX *ctx;
    THREAD_TYPE tid;
	list = init_list();
    init_OpenSSL(  );
    seed_prng(  );
 
    ctx = setup_server_ctx(  );
 
    acc = BIO_new_accept(PORT);
    if (!acc)
        int_error("Error creating server socket");
 
    if (BIO_do_accept(acc) <= 0)
        int_error("Error binding server socket");
 
    for (;;)
    {
        if (BIO_do_accept(acc) <= 0)
            int_error("Error accepting connection");
 
        client = BIO_pop(acc);
        if (!(ssl = SSL_new(ctx)))
        int_error("Error creating SSL context");
        SSL_set_accept_state(ssl);
        SSL_set_bio(ssl, client, client);
        THREAD_CREATE(tid, (void *)server_thread, ssl);
    }
 
    SSL_CTX_free(ctx);
    BIO_free(acc);
    return 0;
}
