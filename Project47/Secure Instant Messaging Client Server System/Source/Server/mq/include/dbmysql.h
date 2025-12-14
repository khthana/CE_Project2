#ifndef HEADER_db_mysql_H
#define HEADER_db_mysql_H
#include "common.h"
#include "/usr/local/mysql/include/mysql.h"

#define DEF_HOST_NAME "localhost"              /*Define Database Argument*/
#define DEF_USER_NAME "root"
#define DEF_PASSWORD  "isagmq"
#define DEF_DB_NAME   "isagmq"
#define DEF_PORT_NUM  0 /* use default port */
#define DEF_SOCKET_NAME NULL /* use default socket name */

static MYSQL *isagmq_db;
static MYSQL_RES *res_set;

void print_error (MYSQL *conn, char *message);

MYSQL *do_connect (char *host_name, char *user_name, char *password, char *db_name,
                   unsigned int port_num, char *socket_name, unsigned int flags);

void do_disconnect (MYSQL *conn);

void process_result_set (MYSQL *conn, MYSQL_RES *res_set);

int process_query(MYSQL *conn, char *query);

#endif
