#include <openssl/ssl.h>
#include "common.h"
#include "implementfn.h"

#define AWAY            "Away"
#define BUSY            "Busy"
#define OFFLINE         "Offline"
#define ONLINE          "Online"

void add_contactlist(SSL *ssl, char type);
void add_nick_name(char user_id_contact[], char contact_list[]);
int add_ip(char user_id_contact[],char contact_list[]);
void login(SSL *ssl, unsigned char *buffer_read, char user_id[]);
void status(SSL *ssl);
void change_nick_name(SSL *ssl,char nick_name[]);
void delete_contactlist(SSL *ssl);
void delete_admin(SSL *ssl);
void de_con(SSL *ssl, char temp[]);


void find_contactlist(SSL *ssl);
void new_user(SSL *ssl, unsigned char *buffer_read, char *ip_client, char user_id[]);
void logout(SSL* ssl);
int make_services(SSL *ssl);
void connect_server(int check);




