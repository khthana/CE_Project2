#include "stdafx.h"
#include "ngfile.h"

NGFILE::NGFILE() :
	m_fp(NULL)
{
	// nothing to do
}

NGFILE::~NGFILE()
{
	// double check to make sure the user closed the file.
	if (m_fp != NULL)
	{
		Close();
	}
}

bool NGFILE::Create(const char* filename)
{
	// Create the file handle
	m_fp = fopen(filename, "w+b");

	// make sure everything went well
	if (m_fp == NULL)
	{
		return false;
	}

	m_filename = string(filename);

	return true;
}

bool NGFILE::Append(const char* filename)
{
	// Create the file handle
	m_fp = fopen( filename, "ab" );

	// make sure everything went well
	if( m_fp == NULL )
	{
		return false;
	}

	m_filename = string( filename );

	return true;
}

bool NGFILE::Open(const char* filename)
{
	// Create the file handle
	m_fp = fopen(filename, "r+b");

	// make sure everything went well
	if (m_fp == NULL)
	{
		return false;
	}

	m_filename = string(filename);

	return true;
}

bool NGFILE::Close()
{
	if (m_fp == NULL)
		return false; // the file is already closed

	if (0 != fclose(m_fp))
	{
		return false;
	}

	m_fp = NULL;

	return true;
}

bool NGFILE::Exists( const char* filename )
{
	// try to open the file.  if we can't, it must not exist
	NGFILE temp;

	temp.m_fp = fopen(filename, "r");

	// make sure everything went well
	if (temp.m_fp == NULL)
	{
		return false;
	}
	temp.Close();
	return true;
}


bool NGFILE::ReadBuff(void* pBuffer, int buffSize, int itemCount)
{
	if (m_fp == NULL)
	{
		throw NGException();
		return false; // error
	}

	int numRead = fread(pBuffer, buffSize, itemCount/*1*/, m_fp);

	if (numRead != itemCount)
	{
		if (0 != feof(m_fp))
		{
			throw NGException();
			return false;
		}
		else if (ferror(m_fp))
		{
			throw NGException();
			return false;
		}
		else
		{
			int foo = 0;
		}
	}

	return true;
}


bool NGFILE::WriteBuff(void* pBuffer, int buffSize, int itemCount)
{
	if (m_fp == NULL)
		return false; // error

	int numWritten = fwrite(pBuffer, buffSize, itemCount, m_fp);

	if (numWritten != itemCount)
	{
		return false;
	}

	return true;
}

string NGFILE::ReadLine()
{
	//char delChar[4] = {'{','}',';',','};
	char delChar[4] = {'\"','\'',';',','};	// delete character
	char currChar;
	bool done = false;

	int nRead = 0;

	string out;

	while (!done)
	{
		if (ReadBuff(&currChar, 1))
			nRead++;
		
		/*
		// read one char form file
		if (ReadBuff( &currChar, 1 ))
			nRead++;
		else
		{
			out.assign("EOF");
			break;
		}
		*/
		// delete character
		bool	b	= false;
		b	|= (currChar==delChar[0]);
		b	|= (currChar==delChar[1]);
		b	|= (currChar==delChar[2]);
		b	|= (currChar==delChar[3]);
		b	|= (currChar=='\0');
		b	|= (currChar=='\n');
		b	|= (currChar=='\r');
		b	|= (currChar==' ');
		
		if (b)
		{
			if (nRead>1)
				break;
			nRead = 0;
		}
		else
			out += currChar;

		if (feof(m_fp))
		{
			done = true;
			break;
		}
	}
	return out;
}

bool NGFILE::TokenizeNextNCLine(queue< string >* pList, char commentChar)
{
	while (1)
	{
		string str;
		while(1)
		{
			str = ReadLine();

			if (feof(m_fp))
				return true;

			/*
			if (str == "EOF")
			{
				pList->push(str);
				return true;
			}
			*/

			if (str[0]!=commentChar)
				break;
		}
	
		// now curr has our string.
		// first, strip off any comments on the end.
		//DP1("parsing [%s]\n", str.c_str() );
		unsigned int commentLoc = str.find(commentChar,0);
	
		if (commentLoc != str.npos)
		{
			str = str.erase(commentLoc);
		}
	
		char sep[] = " \t\n\r\"";
	
		unsigned int tokStart = str.find_first_not_of((char*)sep, 0);
		unsigned int tokEnd;
		while (tokStart != str.npos)
		{
			tokEnd = str.find_first_of((char*)sep, tokStart);
			string token = str.substr(tokStart, tokEnd-tokStart);
			pList->push( token );
	
			tokStart = str.find_first_not_of((char*)sep, tokEnd);
		}
	}
	return false;
}


bool NGFILE::ReadString(string& str)
{
	BYTE length;
	char buff[256];

	ReadBuff(&length, sizeof(BYTE));
	ReadBuff(buff, sizeof(char)*length);

	if (length==0)
	{
		str="null";
		return true;
	}

	buff[length] = '\0';

	str = buff;

	return true;
}

