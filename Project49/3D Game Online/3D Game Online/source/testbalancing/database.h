#ifndef databaseh
#define databaseh

#include <mysql.h>

#endif

class Database
{
friend class Packet;
private:
	MYSQL *link;
    MYSQL_RES *result;
protected:
public:
	Database()
	{
		link = mysql_init(NULL);
	}
	~Database()
	{
		mysql_close(link);
	}
	int connectDatabase()
	{
		mysql_real_connect(link,"161.246.6.92","root","12345","newdatabase",0,NULL,0);
		if (link == NULL) {return -1;}
		return 0;
	}
	void doData(char query[])
	{
		mysql_free_result(result);
		mysql_query(link,query);
		result = mysql_store_result(link);
	}
	MYSQL_RES* getData()
	{
		return result;
	}
	int getNumOfRow()
	{
		int countRow = 0;
		countRow = mysql_num_rows(result);
		return countRow;
	}
	int getNumOfColumn()
	{
		int countColumn = 0;
		countColumn = mysql_num_fields(result);
		return countColumn;
	}
};