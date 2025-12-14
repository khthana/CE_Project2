// LogFile.h: interface for the CLogFile class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_LOGFILE_H__29BAA59A_D01F_4BE8_A311_DE155AF96670__INCLUDED_)
#define AFX_LOGFILE_H__29BAA59A_D01F_4BE8_A311_DE155AF96670__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define CLOG_LEVEL_1	0x00000001L
#define CLOG_LEVEL_2	0x00000002L

class CLogFile  
{
public:
	void FileWrite(const char *buff);
	CLogFile();
	virtual ~CLogFile();

	void Write(const char *, ...);
	void Write2(const char *, ...);
	void Clear();

	void Level(int);

protected:
	void AddDate(char *);
	void ClearFile();
	void WriteInternal(const char *);
private:
	int m_Level;
};

#ifdef _DEBUG
#define C_LOG
#endif

#ifdef C_LOG

#define CLOG_FILENAME "Log.txt"

extern CLogFile g_cLog;

// debug logging functions
#define CLOG		g_cLog.Write
#define CLOG2		g_cLog.Write2
#define CLOGLEVEL	g_cLog.Level
#define CLOGCLEAR	g_cLog.Clear

#else

// just define it and let it go for a non-logging build
#define CLOG
#define CLOG2
#define CLOGSCREEN
#define CLOGLEVEL
#define CLOGCLEAR  (0)
#endif


#endif // !defined(AFX_LOGFILE_H__29BAA59A_D01F_4BE8_A311_DE155AF96670__INCLUDED_)
