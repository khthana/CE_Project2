#include "common.h"
#include "implementfn.h"
#include "linklist.h"
#ifndef HEADER_SERVICES_H
#define HEADER_SERVICES_H 

void write_error(SSL *ssl,char message[]);
void getemailaddr(char contact_id[], char email[]);
void get_nick_email(char contact_id[], char nickname[],char email[]);

void new_user(SSL *ssl, unsigned char *buffer_read, char *ip_client, char user_id[]);
void add_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void add_nick_name(char user_id_contact[], char contact_list[]);
int add_ip(char user_id_contact[],char contact_list[]);
void login(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void status(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *list);
void change_nick_name(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void delete_admin(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void delete_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[]);
//void find_contactlist(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *link);
int check_db5(char tempq1[], char user_id[], char tempq2[],char user_id_contact[],char type_service[]);

void admit(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void request_info(SSL *ssl , unsigned char *buffer_read , char user_id[]);
void accept_authorize(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void authorize_list(SSL *ssl, unsigned char *buffer_read, char user_id[],NODE *list);
void set_status(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void deny(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void getnickname(char contact_id[], char nickname[]);
int checklength(char contact_id[],char nickname[],char status[],char ip[],char temp[],int msg,int length);

#endif
