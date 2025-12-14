#include "dbmysql.h"

/***************************************************************************************/
/*Print Error for Mysql*/
void
print_error (MYSQL *conn, char *message)
{
  fprintf (stderr, "%s\n", message);
  if (conn != NULL)
  {
    fprintf(stderr, "Error %u (%s)\n",
            mysql_errno (conn) ,mysql_error (conn));
  }
}

/***************************************************************************************/
MYSQL *do_connect (char *host_name, char *user_name, char *password, char *db_name,
                   unsigned int port_num, char *socket_name, unsigned int flags)
{
  MYSQL *conn; /* pointer to connection handler */
  conn = mysql_init (NULL); /* allocate, initialize connection handler */
  if (conn == NULL)
  {
    print_error(NULL, "mysql_init() failed (probably out of memory)");
    return(NULL);
  }
  if (mysql_real_connect (conn, host_name, user_name, password,
      db_name, port_num, socket_name, flags) == NULL)
  {
    print_error(conn, "mysql_real_connect() failed");
    return(NULL);
  }
  return(conn); /* connection is established */
}

/***************************************************************************************/
void
do_disconnect (MYSQL *conn)
{
  mysql_close (conn);
}

/***************************************************************************************/
/*SHOW Result if SELECT*/
void
process_result_set (MYSQL *conn, MYSQL_RES *res_set)
{
  MYSQL_ROW row;
  unsigned int i;
  while((row = mysql_fetch_row(res_set)) != NULL)
  {
    for (i = 0; i < mysql_num_fields(res_set); i++)
    {
      if (i > 0)
        fputc ('\t', stdout);
      printf ("%s", row[i] != NULL ? row[i] : "NULL");
    }
    fputc ('\n', stdout);
  }
  if(mysql_errno (conn) != 0)
    print_error(conn, "mysql_fetch_row() failed");
  //else
    //printf ("%lu rows returned\n", (unsigned long) mysql_num_rows(res_set));
}

/***************************************************************************************/
/*PROCESS SELECT AND INSERT QUERY*/
#if !defined(MYSQL_VERSION_ID) || MYSQL_VERSION_ID<32224
#define mysql_field_count mysql_num_fields
#endif

int
process_query(MYSQL *conn, char *query)
{
  MYSQL_RES *res_set;   

  if(mysql_query(conn, query) != 0) /* the query failed */
  {
    print_error(conn, "process_query() failed");
    return -1;
  }

  /* the query succeeded; determine whether or not it returns data */
  res_set = mysql_store_result(conn);
  if(res_set == NULL) /* no result set was returned */
  {
    /*
    * does the lack of a result set mean that an error
    * occurred or that no result set was returned?
    */
    if(mysql_field_count (conn) > 0)
    {
      /*
      * a result set was expected, but mysql_store_result()
      * did not return one; this means an error occurred
      */
      print_error (conn, "Problem processing result set");
      return -1; //Problem processing result set
    }
    else
    {
      /*
      * no result set was returned; query returned no data
      * (it was not a SELECT, SHOW, DESCRIBE, or EXPLAIN),
      * so just report number of rows affected by query
      */
      /*
      printf ("%lu rows affected\n",
             (unsigned long) mysql_affected_rows (conn));
      */
      return 0; //No. result
    }
  }
  else /* a result set was returned */
  {
    /* process rows, then free the result set */
    //process_result_set(conn, res_set);
    /*
    if((row = mysql_fetch_row(res_set)) != NULL)
    {
    mysql_free_result(res_set);
    return 1;
    }
    else
    {
	    mysql_free_result(res_set);
	    return 0;
    }
    */
	  mysql_free_result(res_set);
	  return 1;
  }
}
/***************************************************************************************/
