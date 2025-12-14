/*
	CDateTime.h
	Classe base per data/ora (CRT).
	Luca Piergentili, 24/11/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CDATETIME_H
#define _CDATETIME_H 1

#include "typedef.h"
#include <stdio.h>
#include <stdlib.h>

#define MAX_DATE_STRING	64	// dim. max per una stringa con la data
#define MAX_TIME_STRING	32	// dim. max per una stringa con l'ora
#define MAX_DATETIME_BUF	16	// dim. max per un elemento della data/ora

/*
	DAY
	tipo per i giorni della settimana
*/
enum DAY {
	MON = 0,
	TUE,
	WED,
	THU,
	FRI,
	SAT,
	SUN
};

/*
	MONTH
	tipi per i mesi dell'anno
*/
enum MONTH {
	JAN = 0,
	FEB,
	MAR,
	APR,
	MAY,
	JUN,
	JUL,
	AUG,
	SEP,
	OCT,
	NOV,
	DEC
};

/*
	DATETIMEOBJECT
	tipo per il tipo dell'oggetto
*/
enum DATETIMEOBJECT {
	YEAR,
	MONTH,
	DAY,
	HOUR,
	MINUTE,
	SECOND
};

//$ L'UTC E' SEMPRE LOCALE, OSSIA E' L'ORA GMT CONVERTITA IN LOCALE

/*
	DATEFORMAT
	tipo per i formati della data
*/
enum DATEFORMAT {
	AMERICAN = 0,		// "mm/dd/yyyy"
	ANSI,			// "yyyy.mm.dd"
	ANSI_SHORT,		// "yyyymmdd"
	BRITISH,			// "dd/mm/yyyy"
	FRENCH,			// "dd/mm/yyyy"
	GERMAN,			// "dd.mm.yyyy"
	ITALIAN,			// "dd-mm-yyyy"
	JAPAN,			// "yyyy/mm/dd"
	USA,				// "mm-dd-yyyy"
	MDY,				// "mm/dd/yyyy"
	DMY,				// "dd/mm/yyyy"
	YMD,				// "yyyy/mm/dd"
	GMT_SHORT,		// "Day, dd Mon yyyy hh:mm:ss" (assumendo GMT, ossia convertendo l'UTC in GMT)
	GMT,				// "Day, dd Mon yyyy hh:mm:ss <-|+>nnnn" (con l'UTC, ossia il <-|+>nnnn, locale)
	GMT_TZ,			// "Day, dd Mon yyyy hh:mm:ss <-|+>nnnn TZ" (con l'UTC, ossia il <-|+>nnnn, locale, dove TZ e' l'identificativo di tre caratteri per l'UTC)
	UNKNOW_DATEFORMAT	// ???
};

/*
	TIMEFORMAT
	tipo per i formati dell'ora
*/
enum TIMEFORMAT {
	HHMMSS = 0,		// "hh:mm:ss"
	HHMMSS_AMPM,		// "hh:mm:ss <AM|PM>"
	HHMMSS_SHORT,		// "hhmmss"
	HHMMSS_GMT_SHORT,	// "hh:mm:ss" (assumendo GMT, ossia convertendo l'UTC in GMT)
	HHMMSS_GMT,		// "hh:mm:ss <-|+>nnnn" (con l'UTC, ossia il <-|+>nnnn, locale)
	HHMMSS_GMT_TZ,		// "hh:mm:ss <-|+>nnnn TZ" (con l'UTC, ossia il <-|+>nnnn, locale, dove TZ e' l'identificativo di tre caratteri per l'UTC)
	UNKNOW_TIMEFORMAT	// ???
};

class CDateTime
{
public:
	// operatori
	CDateTime& operator=(const CDateTime& d);
	CDateTime& operator=(const CDateTime* d);

	// costruttori
	CDateTime(DATEFORMAT = UNKNOW_DATEFORMAT,TIMEFORMAT = UNKNOW_TIMEFORMAT,
			int dayofweek = -1,
			int day = -1, int month = -1,int year = -1,
			int hour = -1,int min = -1,  int sec = -1
			);
	CDateTime(const char* date,DATEFORMAT datefmt);

	// distruttore
	virtual ~CDateTime() {}
	
	// azzera l'oggetto
	void			Reset			(void);

	// data/ora di sistema e impostazione campi della struttura interna
	void				SetDate			(int dayofweek = -1,int day = -1,int month = -1,int year = -1);
	inline void		SetDayofWeek		(int dayofweek)				{m_Date.dayofweek = dayofweek;}
	inline void		SetDay			(int day)						{m_Date.day = day;}
	inline void		SetMonth			(int month)					{m_Date.month = month;}
	inline void		SetYear			(int year)					{m_Date.year = year;}
	
	void				GetDate			(int& dayofweek,int& day,int& month,int& year);
	inline int		GetDayofWeek		(void)						{return(m_Date.dayofweek);}
	inline int		GetDay			(void)						{return(m_Date.day);}
	inline int		GetMonth			(void)						{return(m_Date.month);}
	inline int		GetYear			(void)						{return(m_Date.year);}

	void				SetTime			(int hour = -1,int min = -1,int sec = -1);
	inline void		SetHour			(int hour)					{m_Time.hour = hour;}
	inline void		SetMin			(int min)						{m_Time.min = min;}
	inline void		SetSec			(int sec)						{m_Time.sec = sec;}
	
	void				GetTime			(int& hour,int& min,int& sec);
	inline int		GetHour			(void)						{return(m_Time.hour);}
	inline int		GetMin			(void)						{return(m_Time.min);}
	inline int		GetSec			(void)						{return(m_Time.sec);}

	const char*		Get12HourTime		(BOOL getsystime = TRUE);
	inline const char*	GetElapsedTime		(long seconds)					{return(GetElapsedTime((float)seconds));}
	const char*		GetElapsedTime		(float seconds);

	// formato
	inline void		SetDateFormat		(DATEFORMAT format)				{m_Date.format = format;}
	inline DATEFORMAT	GetDateFormat		(void)						{return(m_Date.format);}
	const char*		GetFormattedDate	(BOOL getsysdate = TRUE);
	inline void		SetTimeFormat		(TIMEFORMAT format)				{m_Time.format = format;}
	inline TIMEFORMAT	GetTimeFormat		(void)						{return(m_Time.format);}
	inline const char*	GetFormattedTime	(BOOL getsystime = TRUE);

	// conversioni	
	const char*		ConvertDate		(DATEFORMAT fmtsrc,DATEFORMAT fmtdst,const char* pdate,const char* ptime);
	const char*		ConvertTime		(TIMEFORMAT fmtsrc,TIMEFORMAT fmtdst,const char* pdate,const char* ptime);

	// operazioni
	int				DaysInMonth		(int month,int year);
	void				ModifyDateTime		(DATETIMEOBJECT type,int qta);

	// time zone
	int				GetDSTZone		(void);
	long				GetTimeZoneDiff	(void);
	const char*		GetTimeZoneName	(void);
	const char*		GetDSTZoneName		(void);

	// impostano i campi della struct interna con data/ora di sistema
	const char*		GetSystemDate		(void);
	void				GetSystemDate		(int& day,int& month,int& year);
	const char*		GetSystemTime		(void);
	void				GetSystemTime		(int& hour,int& min,int& sec);

	// verifica se si tratta di un anno bisestile
	BOOL				IsLeapYear		(int year);

private:
	// copia un oggetto sull'altro
	void				Copy				(CDateTime* date1,const CDateTime* date2);

	// ricavano data/ora del sistema
	const char*		GetOsDate			(void);
	const char*		GetOsTime			(void);
	
	struct DATE {
		DATEFORMAT format;						// formato
		char		datestr[MAX_DATE_STRING + 1];		// buffer interno usato per le conversioni (volatile)
		int		dayofweek;					// giorno della settimana
		int		day;							// giorno, mese, anno
		int		month;
		int		year;
		char		daystr[MAX_DATETIME_BUF + 1];
		char		monthstr[MAX_DATETIME_BUF + 1];
		char		yearstr[MAX_DATETIME_BUF + 1];
	};

	struct TIME {
		TIMEFORMAT format;						// formato
		char		timestr[MAX_TIME_STRING + 1];		// buffer interno usato per le conversioni (volatile)
		int		hour;						// ore, minuti, secondi
		int		min;
		int		sec;
		char		hourstr[MAX_DATETIME_BUF + 1];
		char		minstr[MAX_DATETIME_BUF + 1];
		char		secstr[MAX_DATETIME_BUF + 1];
	};

	void				LoadFromString		(const char* pdate,DATEFORMAT datefmt = GMT_SHORT,TIMEFORMAT timefmt = HHMMSS_GMT_SHORT);

	DATE m_Date;
	TIME m_Time;
};

#endif // _CDATETIME_H
