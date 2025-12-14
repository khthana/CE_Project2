
#include <winsock.h>
#include <stdio.h>
#include "vrmysql.h"


CVRDatabase::CVRDatabase( char* szHost,char* szUsername,char* szPassword,char* szDatabase )
{
	strcpy ( m_szHost, szHost );
	strcpy ( m_szUsername, szUsername );
	strcpy ( m_szPassword, szPassword );
	strcpy ( m_szDatabase, szDatabase );

	m_pConnection = NULL;
}

int CVRDatabase::Connect()
{
	if ( m_pConnection != NULL ) Close();
	m_pConnection = mysql_init( NULL );
	mysql_real_connect( m_pConnection,m_szHost,m_szUsername,m_szPassword,m_szDatabase,0,NULL,0 );

	return 0;
}


int CVRDatabase::Close()
{
	if ( m_pConnection != NULL ) 
	{
		mysql_close( m_pConnection );
		m_pConnection = NULL;
	}

	return 0;
}


int CVRDatabase::SQLQuery( char* szSQLQuery )
{
	strcpy ( m_szSQLQuery, szSQLQuery );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	unsigned int numrows = (unsigned int)mysql_num_rows( m_resultSet );
	unsigned int numfields = mysql_num_fields( m_resultSet );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row for header

	while( (row = mysql_fetch_row(m_resultSet) ) != NULL) 
	{
		for( unsigned int i=0; i<numfields; i++ )
		{
			printf("%s\n",row[i] != NULL?row[i]:"NULL"); 
		}
	}

	return 0;
}


int CVRDatabase::ChkAuthorize( char* szUsername, char* szPassword )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT Password FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return 1;	// Not found
	if ( strcmp ( szPassword,row[0] ) != 0 ) return 2;	// Wrong password

	return 0;	// Authorized
}


int CVRDatabase::GetMapCode( char* szUsername )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT MapCode FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return 999;	// Not found

	return atoi( row[0] );	// Authorized
}


int CVRDatabase::GetPosX( char* szUsername )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT PositionX FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return 5;	// Not found

	return atoi( row[0] );	// Authorized
}


int CVRDatabase::GetPosY( char* szUsername )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT PositionY FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return 5;	// Not found

	return atoi( row[0] );	// Authorized
}

int CVRDatabase::GetSuit( char* szUsername )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT Suit FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return 0;	// Not found

	return atoi( row[0] );	// Authorized
}


DB_USER_INFO* CVRDatabase::GetUserInfo( char* szUsername )
{
	DB_USER_INFO* dbUserInfo = new DB_USER_INFO;
	ZeroMemory( dbUserInfo, sizeof(DB_USER_INFO) );
		dbUserInfo->nMapcode = 0;
		dbUserInfo->nPosX = 0;
		dbUserInfo->nPosY = 0;
		strcpy ( dbUserInfo->szAddress , "" );
		strcpy ( dbUserInfo->szBirthdate , "" );
		strcpy ( dbUserInfo->szEmail , "" );
		strcpy ( dbUserInfo->szFirstname , "" );
		strcpy ( dbUserInfo->szLastname , "" );
		strcpy ( dbUserInfo->szPassword , "" );
		strcpy ( dbUserInfo->szTelephone , "" );
		strcpy ( dbUserInfo->szUsername , "Guest" );

	if ( m_pConnection == NULL ) return dbUserInfo;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT * FROM users WHERE Username = '%s'", szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	

	if ( row == NULL ) return dbUserInfo;

		dbUserInfo->nMapcode = atoi(row[3]);
		dbUserInfo->nPosX = atoi(row[4]);
		dbUserInfo->nPosY = atoi(row[5]);
		strcpy ( dbUserInfo->szAddress , row[9] );
		strcpy ( dbUserInfo->szBirthdate , row[8] );
		strcpy ( dbUserInfo->szEmail , row[11] );
		strcpy ( dbUserInfo->szFirstname , row[6] );
		strcpy ( dbUserInfo->szLastname , row[7] );
		strcpy ( dbUserInfo->szPassword , row[2] );
		strcpy ( dbUserInfo->szTelephone , row[10] );
		strcpy ( dbUserInfo->szUsername , row[1] );

	return dbUserInfo;
}




int CVRDatabase::GetCountRow( char* szTable )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT count(*) FROM %s", szTable  );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );
	
	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row

	return atoi(row[0]);
}



DB_MAP_INFO* CVRDatabase::GetMapInfo( int nID )
{
	DB_MAP_INFO* dbMapInfo = new DB_MAP_INFO;
	ZeroMemory( dbMapInfo, sizeof(DB_MAP_INFO) );
	dbMapInfo->nMapcode = 0;
	strcpy ( dbMapInfo->szMapName, "" );

	if ( m_pConnection == NULL ) return dbMapInfo;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT * FROM map WHERE MapID = %d", nID );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return dbMapInfo;

	dbMapInfo->nMapcode = atoi(row[1]);
	strcpy ( dbMapInfo->szMapName, row[2] );

	return dbMapInfo;

}

DB_WRAP_INFO* CVRDatabase::GetWrapInfo( int nID )
{
	DB_WRAP_INFO* dbWrapInfo = new DB_WRAP_INFO;
	ZeroMemory( dbWrapInfo, sizeof(DB_WRAP_INFO) );
	dbWrapInfo->nSrcMapcode = 0;
	dbWrapInfo->nSrcX = 0;
	dbWrapInfo->nSrcY = 0;
	dbWrapInfo->nDestMapcode = 0;
	dbWrapInfo->nDestX = 0;
	dbWrapInfo->nDestY = 0;

	if ( m_pConnection == NULL ) return dbWrapInfo;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "SELECT * FROM wrap WHERE WrapID = %d", nID );
	mysql_query( m_pConnection, m_szSQLQuery );

	m_resultSet = mysql_store_result( m_pConnection );

	MYSQL_ROW row;
	row = mysql_fetch_row( m_resultSet );	// Fetch row
	
	if ( row == NULL ) return dbWrapInfo;

	dbWrapInfo->nSrcMapcode = atoi( row[1] );
	dbWrapInfo->nSrcX = atoi( row[2] );
	dbWrapInfo->nSrcY = atoi( row[3] );
	dbWrapInfo->nDestMapcode = atoi( row[4] );
	dbWrapInfo->nDestX = atoi( row[5] );
	dbWrapInfo->nDestY = atoi( row[6] );

	return dbWrapInfo;

}


int CVRDatabase::UpdatePosition( char* szUsername, int nX, int nY )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "UPDATE users SET PositionX=%d, PositionY=%d WHERE Username = '%s'", nX, nY, szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	return 0;
}


int CVRDatabase::UpdateMap( char* szUsername, UINT nMapcode )
{
	if ( m_pConnection == NULL ) return -1;	// m_pConnection init failed

	sprintf ( m_szSQLQuery, "UPDATE users SET MapCode=%d WHERE Username = '%s'", (int)nMapcode , szUsername );
	mysql_query( m_pConnection, m_szSQLQuery );

	return 0;
}
