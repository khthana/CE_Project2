
#include "common.h"
#include "client.h"

static char *host=HOST;
static int port=PORT;
static int require_server_auth=0;
static char *ciphers=0;
static int reconnect=0;
static int ssl_request(SSL *ssl,char *act_name ) {
    char *request=0;
    char buf[BUFSIZZ];
				char buf2[1024];
    int r;
    int len;
    FILE *fp;
 			char acct_name[255];
 			char cert_name[255];
				int i = 0;

				buddy_cert_file(act_name,acct_name,2);
				buddy_cert_file(act_name,cert_name,3);
				gaim_debug(GAIM_DEBUG_INFO, "Isagq", "file name is %s\n",acct_name);			
				if(!(fp=fopen(acct_name,"r")))
				gaim_debug(GAIM_DEBUG_INFO, "Isagq", "can't open file");
						
						sprintf(buf,"%s",act_name);
						r=SSL_write(ssl,buf,sizeof(buf));				
				for(;;){

				if(fgets(buf,sizeof(buf),fp) == NULL ){
					strcpy(buf,"");
					r=SSL_write(ssl,buf,sizeof(buf));
					break;
					}

				fprintf(stdout, "%s", buf);
    r=SSL_write(ssl,buf,sizeof(buf));

  	if(r<=0)
			break; //return 0;  
			
		
}
						fclose(fp);
 
				gaim_debug(GAIM_DEBUG_INFO, "Isagq", "recieve certificate\n");
				fp=fopen(cert_name,"w");
				
    while(1){

      r=SSL_read(ssl,buf2,BUFSIZZ);
						gaim_debug(GAIM_DEBUG_INFO,"IsagQ","%s",buf2);
      switch(SSL_get_error(ssl,r)){
        case SSL_ERROR_NONE:
          break;
        case SSL_ERROR_WANT_READ:
          continue;
        case SSL_ERROR_ZERO_RETURN:
          goto shutdown;
        case SSL_ERROR_SYSCALL:
          fprintf(stderr,
            "SSL Error: Premature close\n");
          goto done;
        default:
          berr_exit("SSL read problem");
      }

 
						fputs(buf2,fp);
    }
    
  shutdown:
    r=SSL_shutdown(ssl);
    switch(r){
      case 1:
        break; /* Success */
      case 0:
      case -1:
      default:
        berr_exit("Shutdown failed");
    }
    
  done:
    SSL_free(ssl);
    free(request);
    fclose(fp);
				
				return(0);
  }
    
void ssl_con1(char *acct_name){
    SSL_CTX *ctx;
    SSL *ssl;
    BIO *sbio;
    int sock;
    extern char *optarg;
    int c;
    SSL_SESSION *sess;
    char key[255];
				key_file(key);
    /* Build our SSL context*/
    ctx=initialize_ctx(key,PASSWORD);
    
    /* Set our cipher list */
    if(ciphers){
      SSL_CTX_set_cipher_list(ctx,ciphers);
    }

    /* Connect the TCP socket*/
    sock=tcp_connect(host,port);

    /* Connect the SSL socket */
    ssl=SSL_new(ctx);
    sbio=BIO_new_socket(sock,BIO_NOCLOSE);
    SSL_set_bio(ssl,sbio,sbio);

    if(SSL_connect(ssl)<=0)
      berr_exit("SSL connect error");
    if(require_server_auth)
      check_cert_file(ssl,host);

    /* Now hang up and reconnect, if requested */
    if(reconnect) {
      sess=SSL_get1_session(ssl); /*Collect the session*/
      SSL_shutdown(ssl);
      SSL_free(ssl);
      close(sock);
      
      sock=tcp_connect(host,port);
      ssl=SSL_new(ctx);
      sbio=BIO_new_socket(sock,BIO_NOCLOSE);
      SSL_set_bio(ssl,sbio,sbio);
      SSL_set_session(ssl,sess); /*And resume it*/
      if(SSL_connect(ssl)<=0)
        berr_exit("SSL connect error (second connect)");
      check_cert_file(ssl,host);
    }
    
    
   	ssl_request(ssl,acct_name);

    /* Shutdown the socket */
    destroy_ctx(ctx);
    close(sock);

    //exit(0);
  }

