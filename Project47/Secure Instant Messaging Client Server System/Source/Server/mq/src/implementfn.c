#include "implementfn.h"

void ssl_disconnect(SSL *ssl)
{
    if( (SSL_get_shutdown(ssl) & SSL_RECEIVED_SHUTDOWN) ? 1 : 0 )
        SSL_shutdown(ssl);
    else
        SSL_clear(ssl);

    NUMBER_CLIENT--;
    fprintf(stderr, "\nSSL Connection closed\n");
    SSL_free(ssl);

}


void ssl_read(SSL *ssl, char *buf, int length)
{
    int  err;
    //char *buffer = buf;

    err = SSL_read(ssl, buf, length);
    if (err < 0)
    {
        fprintf(stdout,"Error Read\n");
        ssl_disconnect(ssl);
    }
}

void ssl_write(SSL *ssl, char *buf, int length)
{
    int  err;

    err = SSL_write(ssl, buf, length);
    if (err < 0)
    {
        fprintf(stdout,"Error write\n");
        ssl_disconnect(ssl);
    }

}
