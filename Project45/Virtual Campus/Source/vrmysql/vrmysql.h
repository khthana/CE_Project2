#include "include/mysql.h"

#define HOST "161.246.6.2" ;
#define USERNAME "root" ;
#define PASSWORD "" ;
#define DATABASE "VRCampus" ;

struct DB_USER_INFO
{
	char szUsername[12];
	char szPassword[12];
	char szEmail[30];
	char szFirstname[50];
	char szLastname[50];
	char szAddress[120];
	char szTelephone[10];
	char szBirthdate[10];
	UINT nMapcode;
	int  nPosX;
	int  nPosY;
};

struct DB_MAP_INFO
{
	UINT nMapcode;
	char szMapName[12];
};

struct DB_WRAP_INFO
{
	UINT nSrcMapcode;
	int		nSrcX;
	int		nSrcY;
	UINT nDestMapcode;
	int		nDestX;
	int		nDestY;
};


class CVRDatabase
{
public:
	char	m_szHost[256];
	char	m_szUsername[256];
	char	m_szPassword[256];
	char	m_szDatabase[256];
	char	m_szTable[256];
	char	m_szSQLQuery[256];


	MYSQL	*m_pConnection;
	MYSQL_RES *m_resultSet;

	CVRDatabase( char* szHost,char* szUsername,char* szPassword,char* szDatabase );
	~CVRDatabase() { if ( m_pConnection != NULL ) Close();  };
	int		Connect();
	int		Close();
	int		SQLQuery( char* szSQLQuery );


	int ChkAuthorize( char* szUsername, char* szPassword );
	int GetMapCode( char* szUsername );
	int GetSuit( char* szUsername );
	int GetPosX( char* szUsername );
	int GetPosY( char* szUsername );

	int GetCountRow( char* szTable );
	DB_WRAP_INFO* GetWrapInfo( int nID );
	DB_MAP_INFO* GetMapInfo( int nID );
	DB_USER_INFO* GetUserInfo( char* szUsername );


	int UpdatePosition( char* szUsername, int nX, int nY );
	int UpdateMap( char* szUsername, UINT nMapCode );

};