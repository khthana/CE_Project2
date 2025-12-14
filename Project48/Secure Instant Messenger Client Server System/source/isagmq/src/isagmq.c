
#include "common.h"
#include "common.c"
#include "server.h"
#include "createCert.c"
static int client_auth=0;
static int fork_child=1;
static char *ciphers=0;

#define CLIENT_AUTH_REQUEST 1
#define CLIENT_AUTH_REQUIRE 2
#define CLIENT_AUTH_REHANDSHAKE 3

static int s_server_session_id_context = 1;
static int s_server_auth_session_id_context = 2;

static int http_serve(SSL *ssl,int s)
 {
    char buf[BUFSIZZ],buf2[BUFSIZZ];
    int r,len,err,nread;
    BIO *io,*ssl_bio;
    FILE *fp;
				char dir[255];
				char cert[255];
				char name[255];
				char tmp[1024];
    	io=BIO_new(BIO_f_buffer());
    	ssl_bio=BIO_new(BIO_f_ssl());
    	BIO_set_ssl(ssl_bio,ssl,BIO_CLOSE);
    	BIO_push(io,ssl_bio);
 				r=SSL_read(ssl,buf,BUFSIZZ); 
					fprintf(stdout, "%s\n",buf);
					sprintf(name,"%s",buf);
				 sprintf(dir,"[CR]%s.pem",buf);
				 sprintf(cert,"[CE]%s.pem",buf);					
					fp=fopen(dir,"w");
 		  while(1){
      strcpy(buf,"");
						r=SSL_read(ssl,buf,BUFSIZZ);
	
      if(SSL_get_error(ssl,r)==SSL_ERROR_ZERO_RETURN)
   			goto shutdown;		
						 
						 if(!strcmp(buf,"\r\n") ||!strcmp(buf,"\n") ||!strcmp(buf,"") )
        break;
	
						fputs(buf,fp);
    	};
							fclose(fp);

						create_cert(name);
						fp=fopen(cert,"r");
						strcpy(buf2,"");
						for(;;){
							if(fgets(buf2,sizeof(buf2),fp) != NULL )
									{
										fprintf(stdout, "%s",buf2);
									 //	r=BIO_puts(io,buf2);
										r=SSL_write(ssl,buf2,sizeof(buf2));
										//r=BIO_flush(io);
										//strcpy(buf2,"");
										
									}
							else break;	
							}

  shutdown:
    r=SSL_shutdown(ssl);
    if(!r){

      shutdown(s,1);
      r=SSL_shutdown(ssl);
    }
      
    switch(r){  
      case 1:
        break; /* Success */
      case 0:
      case -1:
      default:
        berr_exit("Shutdown failed");
    }

    SSL_free(ssl);
    close(s);

    return(0);
  }
 
int main(argc,argv)
  int argc;
  char **argv;
  {
    int sock,s;
    BIO *sbio;
    SSL_CTX *ctx;
    SSL *ssl;
    int r;
    pid_t pid;
    extern char *optarg;
    int c;

 
    
    /* Build our SSL context*/
    ctx=initialize_ctx(KEYFILE,PASSWORD);
    load_dh_params(ctx,DHFILE);

    SSL_CTX_set_session_id_context(ctx,
      (void*)&s_server_session_id_context,
      sizeof s_server_session_id_context); 
    
    /* Set our cipher list */
    if(ciphers){
      SSL_CTX_set_cipher_list(ctx,ciphers);
    }
    
    switch(client_auth){
      case CLIENT_AUTH_REQUEST:
        SSL_CTX_set_verify(ctx,SSL_VERIFY_PEER,0);
        break;
      case CLIENT_AUTH_REQUIRE:
        SSL_CTX_set_verify(ctx,SSL_VERIFY_PEER |
          SSL_VERIFY_FAIL_IF_NO_PEER_CERT,0);
        break;
      case CLIENT_AUTH_REHANDSHAKE:
        /* Do nothing */
        break;
    }
    
    sock=tcp_listen();

    while(1){
      if((s=accept(sock,0,0))<0)
        err_exit("Problem accepting");

      if(fork_child && (pid=fork())){
        close(s);
      }
      else {
        sbio=BIO_new_socket(s,BIO_NOCLOSE);
        ssl=SSL_new(ctx);
        SSL_set_bio(ssl,sbio,sbio);
        
        if((r=SSL_accept(ssl)<=0))
          berr_exit("SSL accept error");
        
        http_serve(ssl,s);
        
        if(fork_child)
          exit(0);
      }
    }
    destroy_ctx(ctx);
    exit(0);
  }
