#include<qsqlquery.h>
#include <qsqldatabase.h>

/**********************************************/
/*Edit snort_inline Database connection here 	         */
/*********************************************/
QString DB_SNORT_DRIVER="";
QString DB_SNORT_DBNAME ="";
QString DB_SNORT_USER = "";
QString DB_SNORT_PASSWD = "";
QString DB_SNORT_HOST = "";
/********************************************/

/********************************************/
/*  Edit samhain Database connection here  	      */
/********************************************/
QString DB_SAMHAIN_DRIVER = "";
QString DB_SAMHAIN_DBNAME ="";
QString DB_SAMHAIN_USER="";
QString DB_SAMHAIN_PASSWD ="";
QString DB_SAMHAIN_HOST="";
/********************************************/

/********************************************/
/*     Edit sebek Database connection here   		      */
/********************************************/
QString DB_SEBEK_DRIVER="";
QString DB_SEBEK_DBNAME ="";
QString DB_SEBEK_USER="";
QString DB_SEBEK_PASSWD ="";
QString DB_SEBEK_HOST="";
/********************************************/

/********************************************/
/*      Edit cage Database connection here  	                      */
/********************************************/
QString DB_CAGE_DRIVER="";
QString DB_CAGE_DBNAME="" ;
QString DB_CAGE_USER="";
QString DB_CAGE_PASSWD="" ;
QString DB_CAGE_HOST="" ;
/********************************************/


void readConfDB()
{
    FILE *fp;
    fp = fopen("./tartarusdb.conf","r");
    if(fp == NULL)
    {
	system("touch ./tartarusdb.conf");
    }
    else
    {
	 char strbuf[81];
	 char *strptr, *substr,*token;
	 int length ;
	 QString driver,dbname,username,password,hostname;
	 strptr = fgets(strbuf,81,fp);
	 while(strptr != NULL)
	 {
	     if(strptr[0] == '#')
	     {
		 length = strlen(strptr);
		 strptr[length-1] = '\0';
		 substr = strstr(strptr," ");
		 token = strtok(substr+1," ");
		 if(strcmp(token,"SNORT") == 0)
		 {
		    strptr = fgets(strbuf,81,fp);
		    while (strptr[0] != '#')
		    {
			length = strlen(strptr);
			strptr[length-1] = '\0';
			substr = strstr(strptr,"=");
			token = strtok(strptr,"=");
			if(strcmp(token,"DRIVER") == 0 )
			{
			    DB_SNORT_DRIVER= substr + 1;
			}
			else if(strcmp(token,"DBNAME") == 0 )
			{
			    DB_SNORT_DBNAME = substr + 1;
			}
			 else if(strcmp(token,"USER") == 0)
			{
			     DB_SNORT_USER = substr + 1;
			 }
			  else if(strcmp(token,"PASSWD") == 0)
			 {
			      DB_SNORT_PASSWD = substr + 1;
			  }
			  else if(strcmp(token,"HOST") == 0)
			  {
			      DB_SNORT_HOST = substr + 1;
			  }
			  strptr=fgets(strbuf,81,fp);
			   if(strptr == NULL)
			  {
			      break;
			  }
		      }
		}
		else if(strcmp(token,"CAGE") == 0)
		{
		    strptr = fgets(strbuf,81,fp);
		    while (strptr[0] != '#')
		    {
			length = strlen(strptr);
			strptr[length-1] = '\0';
			substr = strstr(strptr,"=");
			token = strtok(strptr,"=");
			if(strcmp(token,"DRIVER") == 0 )
			{
			    DB_CAGE_DRIVER= substr + 1;
			}
			else if(strcmp(token,"DBNAME") == 0 )
			{
			    DB_CAGE_DBNAME = substr + 1;
			}
			 else if(strcmp(token,"USER") == 0)
			{
			     DB_CAGE_USER = substr + 1;
			 }
			  else if(strcmp(token,"PASSWD") == 0)
			 {
			      DB_CAGE_PASSWD = substr + 1;
			  }
			  else if(strcmp(token,"HOST") == 0)
			  {
			      DB_CAGE_HOST = substr + 1;
			  }
			  strptr=fgets(strbuf,81,fp);
			   if(strptr == NULL)
			  {
			      break;
			  }
		      }
		}
		else if(strcmp(token,"SAMHAIN") == 0)
		{
		    strptr = fgets(strbuf,81,fp);
		    while (strptr[0] != '#')
		    {
			length = strlen(strptr);
			strptr[length-1] = '\0';
			substr = strstr(strptr,"=");
			token = strtok(strptr,"=");
			if(strcmp(token,"DRIVER") == 0 )
			{
			    DB_SAMHAIN_DRIVER= substr + 1;
			}
			else if(strcmp(token,"DBNAME") == 0 )
			{
			    DB_SAMHAIN_DBNAME = substr + 1;
			}
			 else if(strcmp(token,"USER") == 0)
			{
			     DB_SAMHAIN_USER = substr + 1;
			 }
			  else if(strcmp(token,"PASSWD") == 0)
			 {
			      DB_SAMHAIN_PASSWD = substr + 1;
			  }
			  else if(strcmp(token,"HOST") == 0)
			  {
			      DB_SAMHAIN_HOST = substr + 1;
			  }
			  strptr=fgets(strbuf,81,fp);
			  if(strptr == NULL)
			  {
			      break;
			  }
		      }
		}
		else if(strcmp(token,"SEBEK") == 0)
		{
		    strptr = fgets(strbuf,81,fp);
		    while (strptr[0] != '#')
		    {
			if(strptr == NULL)
			{
			    break;
			}
			length = strlen(strptr);
			strptr[length-1] = '\0';
			substr = strstr(strptr,"=");
			token = strtok(strptr,"=");
			if(strcmp(token,"DRIVER") == 0 )
			{
			    DB_SEBEK_DRIVER= substr + 1;
			}
			else if(strcmp(token,"DBNAME") == 0 )
			{
			    DB_SEBEK_DBNAME = substr + 1;
			}
			 else if(strcmp(token,"USER") == 0)
			{
			     DB_SEBEK_USER = substr + 1;
			 }
			  else if(strcmp(token,"PASSWD") == 0)
			 {
			      DB_SEBEK_PASSWD = substr + 1;
			  }
			  else if(strcmp(token,"HOST") == 0)
			  {
			      DB_SEBEK_HOST = substr + 1;
			  }
			  strptr=fgets(strbuf,81,fp);
			   if(strptr == NULL)
			  {
			      break;
			  }
		      }
		}
	     }
	 }
	 fclose(fp);
     }
}


//Create Database connection
bool createConnections()
{
    readConfDB();
    //add snort_inline database
    if(DB_SNORT_DRIVER != NULL)
    {
	QSqlDatabase *snortdb = QSqlDatabase::addDatabase( DB_SNORT_DRIVER,"SNORT");
	snortdb->setDatabaseName( DB_SNORT_DBNAME );
	snortdb->setUserName( DB_SNORT_USER );
	snortdb->setPassword( DB_SNORT_PASSWD ); 
	snortdb->setHostName( DB_SNORT_HOST );
	if ( ! snortdb->open() ) 
	{
	    qWarning( "Failed to open snort_inline database: " + snortdb->lastError().text() );
	 }
    }
    
    //add samhain database
     if(DB_SAMHAIN_DRIVER != NULL)
    {
	 QSqlDatabase *samhaindb = QSqlDatabase::addDatabase( DB_SAMHAIN_DRIVER,"SAMHAIN");
	 samhaindb->setDatabaseName( DB_SAMHAIN_DBNAME );
	 samhaindb->setUserName( DB_SAMHAIN_USER );
	 samhaindb->setPassword( DB_SAMHAIN_PASSWD );
	 samhaindb->setHostName( DB_SAMHAIN_HOST );
	 if ( ! samhaindb->open() ) 
	 {
	     qWarning("Failed to open samhain database: " + samhaindb->lastError().text() );
	 }
     }
    
    //add sebek database
     if(DB_SEBEK_DRIVER != NULL)
     {
	 QSqlDatabase *sebekdb = QSqlDatabase::addDatabase( DB_SEBEK_DRIVER,"SEBEK");
	 sebekdb->setDatabaseName( DB_SEBEK_DBNAME );
	 sebekdb->setUserName( DB_SEBEK_USER );
	 sebekdb->setPassword( DB_SEBEK_PASSWD );
	 sebekdb->setHostName( DB_SEBEK_HOST );
	 if ( ! sebekdb->open() ) 
	 {
	    qWarning( "Failed to open sebek database: " + sebekdb->lastError().text() );
	 }
     }
    
     //add cage database
     if(DB_CAGE_DRIVER != NULL)
     {
	 QSqlDatabase *cagedb = QSqlDatabase::addDatabase( DB_CAGE_DRIVER,"CAGE");
	 cagedb->setDatabaseName( DB_CAGE_DBNAME );
	 cagedb->setUserName( DB_CAGE_USER );
	 cagedb->setPassword( DB_CAGE_PASSWD );
	 cagedb->setHostName( DB_CAGE_HOST );
	 if ( ! cagedb->open() ) 
	 {
	     qWarning( "Failed to open cage database: " + cagedb->lastError().text() );
	 }
     }
    return TRUE;
}

//Query Database
QSqlQuery queryDB(QString db, QString sqlcmd)
{
    QSqlDatabase *database = QSqlDatabase::database(db);
    QSqlQuery query(sqlcmd,database);
    if(query.isActive())
    {	
	return query;
    }
    return query;
}
