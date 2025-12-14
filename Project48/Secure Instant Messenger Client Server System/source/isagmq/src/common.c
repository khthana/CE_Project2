#include<openssl/bio.h>
#include<openssl/err.h>
#include<openssl/rand.h>
#include<openssl/ssl.h>
#include<openssl/x509v3.h>
#ifndef  WIN32
#include<pthread.h>
#define THREAD_CC									
#define THREAD_TYPE					pthread_t
#define THREAD_CREATE(tid,entry,arg) pthread_create(&(tid),NULL,(entry),(arg))

#else
#include<windows.h>
#define THREAD_CC					_ _cdecl
#define THREAD_TYPE								DWORD
#define THREAD_CREATE(tid,entry,arg)	do {  _beginthred((entry),0,(arg));  
																				(tid) = GetCurrentThreadId(); 
																			}while(0);

#endif

//#define PORT				"443"
#define SERVER		"161.246.5.31"
#define CLIENT		"161.246.5.30


#define int_error(msg)	 handle_error(__FILE__, __LINE__, msg)
 void handle_error(const char *file ,int lineno,const char*msg)
{
	fprintf(stderr,"** %s:%i %s\n ", file,lineno,msg);
	ERR_print_errors_fp(stderr);
	exit(-1);
}

void init_OpenSSL(void)
{
	if(!SSL_library_init())
	{
		fprintf(stderr, "** OpenSSL initialization failed!\n");
		exit(-1);
	}
	SSL_load_error_strings();
}



