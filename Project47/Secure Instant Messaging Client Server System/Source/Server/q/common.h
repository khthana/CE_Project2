#ifndef COMMON_H
#define COMMON_H

#include <string.h>
#include <openssl/bio.h>
#include <openssl/err.h>
#include <openssl/rand.h>
#include <openssl/ssl.h>
#include <openssl/x509v3.h>
#include "reentrant.h"
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/time.h>
#include <time.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <netdb.h>
#include <sys/un.h>

#ifndef WIN32
#include <pthread.h>
#define THREAD_CC
#define THREAD_TYPE                    pthread_t
#define THREAD_CREATE(tid, entry, arg) pthread_create(&(tid), NULL, \
                                                      (entry), (arg))
#else
#include <windows.h>
#define THREAD_CC                      __cdecl
#define THREAD_TYPE                    DWORD
#define THREAD_CREATE(tid, entry, arg) do { _beginthread((entry), 0, (arg));\
                                            (tid) = GetCurrentThreadId();   \
                                       } while (0)
#endif


#define PORT            "16001"
#define PORT2            "16002"
#define PORT3            "16003"
#define SERVER          "localhost"
#define CLIENT          "localhost"

#define int_error(msg)  handle_error(__FILE__, __LINE__, msg)

#define   POINT_USER_ID   "CN="
#define   MAXSUBJECT      256
#define   FIX_USER_ID     9
#define   FIX_IP          16
#define   FIX_HEADER      6     //0 1 2 3 4 5 6 = 7 bytes

#define MAX_MESSAGE     512 //per packet
static int NUMBER_CLIENT = 0;
//char user[256];



void handle_error(const char *file, int lineno, const char *msg);

void init_OpenSSL(void);

int verify_callback(int ok, X509_STORE_CTX *store);

long post_connection_check(SSL *ssl, char *host);

void seed_prng(void);

#endif /* COMMON_H */
