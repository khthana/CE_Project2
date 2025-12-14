#include <openssl/bio.h>
#include <openssl/err.h>
#include <openssl/rand.h>
#include <openssl/ssl.h>
#include <openssl/x509v3.h>
#include "common.h"
#include "dbmysql.h"
void ssl_read(SSL *ssl, char *buf, int length);
void ssl_write(SSL *ssl, char *buf, int length);
void ssl_disconnect(SSL *ssl);
