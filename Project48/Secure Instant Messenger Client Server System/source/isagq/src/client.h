#ifndef _client_h
#define _client_h

#define PASSWORD "password"

int tcp_connect(host,port)
  char *host;
  int port;
  {
    struct hostent *hp;
    struct sockaddr_in addr;
    int sock;
    
    if(!(hp=gethostbyname(host)))
      printf("Couldn't resolve host");
    memset(&addr,0,sizeof(addr));
    addr.sin_addr=*(struct in_addr*)
      hp->h_addr_list[0];
    addr.sin_family=AF_INET;
    addr.sin_port=htons(port);

    if((sock=socket(AF_INET,SOCK_STREAM,
      IPPROTO_TCP))<0)
      printf("Couldn't create socket");
    if(connect(sock,(struct sockaddr *)&addr,
      sizeof(addr))<0)
      printf("Couldn't connect socket");
    
    return sock;
  }

/* Check that the common name matches the
   host name*/
void check_cert_file(SSL *ssl, char *host)
  {
    X509 *peer;
    char peer_CN[256];
    
    if(SSL_get_verify_result(ssl)!=X509_V_OK)
      printf("Certificate doesn't verify");

    /*Check the cert chain. The chain length
      is automatically checked by OpenSSL when
      we set the verify depth in the ctx */

    /*Check the common name*/
    peer=SSL_get_peer_certificate(ssl);
    X509_NAME_get_text_by_NID
      (X509_get_subject_name(peer),
      NID_commonName, peer_CN, 256);
    if(strcasecmp(peer_CN,host))
    printf("Common name doesn't match host name");
  }


#endif

