/*
	CDateTime.cpp
	Classe base per data/ora (CRT).
	Luca Piergentili, 24/11/99
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include "macro.h"
#include "typedef.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <ctype.h>
#include <time.h>
#include "CDateTime.h"

static char* day_array[8] = {
	"Mon",
	"Tue",
	"Wed",
	"Thu",
	"Fri",
	"Sat",
	"Sun",
	"???"
};

static char* month_array[13] = {
	"Jan",
	"Feb",
	"Mar",
	"Apr",
	"May",
	"Jun",
	"Jul",
	"Aug",
	"Sep",
	"Oct",
	"Nov",
	"Dec",
	"???"
};

static int dayinmonth_array[13] = {
	/*Jan*/31,
	/*Feb*/28,
	/*Mar*/31,
	/*Apr*/30,
	/*May*/31,
	/*Jun*/30,
	/*Jul*/31,
	/*Aug*/31,
	/*Sep*/30,
	/*Oct*/31,
	/*Nov*/30,
	/*Dec*/31,
	/*???*/0
};

/*
	operator=(&)

	Copia dell'oggetto (per referenza)
*/
CDateTime& CDateTime::operator=(const CDateTime& d)
{
	Copy(this,&d);
	return(*this);
}

/*
	operator=(*)

	Copia dell'oggetto (per puntatore)
*/
CDateTime& CDateTime::operator=(const CDateTime* d)
{
	Copy(this,d);
	return(*this);
}

/*
	Copy()

	Copia un oggetto sull'altro.
*/
void CDateTime::Copy(CDateTime* d1,const CDateTime* d2)
{
	if(d1!=d2)
	{
		d1->m_Date.format    = d2->m_Date.format;
		strcpy(d1->m_Date.datestr,d2->m_Date.datestr);
		d1->m_Date.dayofweek = d2->m_Date.dayofweek;
		d1->m_Date.day       = d2->m_Date.day;
		d1->m_Date.month     = d2->m_Date.month;
		d1->m_Date.year      = d2->m_Date.year;
		strcpy(d1->m_Date.daystr,d2->m_Date.daystr);
		strcpy(d1->m_Date.monthstr,d2->m_Date.monthstr);
		strcpy(d1->m_Date.yearstr,d2->m_Date.yearstr);

		d1->m_Time.format = d2->m_Time.format;
		strcpy(d1->m_Time.timestr,d2->m_Time.timestr);
		d1->m_Time.hour   = d2->m_Time.hour;
		d1->m_Time.min    = d2->m_Time.min;
		d1->m_Time.sec    = d2->m_Time.sec;
		strcpy(d1->m_Time.hourstr,d2->m_Time.hourstr);
		strcpy(d1->m_Time.minstr,d2->m_Time.minstr);
		strcpy(d1->m_Time.secstr,d2->m_Time.secstr);
	}
}

/*
	CDateTime()

	Imposta le strutture interne con i parametri o ricavando data/ora di sistema.
*/
CDateTime::CDateTime(DATEFORMAT datefmt/*=UNKNOW_DATEFORMAT*/,TIMEFORMAT timefmt/*=UNKNOW_TIMEFORMAT*/,int dayofweek/*=-1*/,int day/*=-1*/,int month/*=-1*/,int year/*=-1*/,int hour/*=-1*/,int min/*=-1*/,int sec/*=-1*/)
{
	// inizializzazione
	Reset();

	// imposta data/ora (se chiamato senza parametri ricava data/ora di sistema)
	m_Date.format = (datefmt==UNKNOW_DATEFORMAT ? BRITISH : datefmt);
	SetDate(dayofweek,day,month,year);
	m_Time.format = (timefmt==UNKNOW_TIMEFORMAT ? HHMMSS : timefmt);
	SetTime(hour,min,sec);
}

CDateTime::CDateTime(const char* date,DATEFORMAT datefmt)
{
	// inizializzazione
	Reset();

	// imposta data/ora analizzando la stringa
	LoadFromString(date,datefmt);
}

/*
	Reset()

	Azzera l'oggetto.
*/
void CDateTime::Reset(void)
{
	// azzera le strutture interne
	memset(&m_Date,'\0',sizeof(DATE));
	m_Date.format = BRITISH;
	memset(&m_Time,'\0',sizeof(TIME));
	m_Time.format = HHMMSS;
}

/*
	SetDate()

	Imposta la struttura interna con i parametri o con la data di sistema.
*/
void CDateTime::SetDate(int dayofweek/*=-1*/,int day/*=-1*/,int month/*=-1*/,int year/*=-1*/)
{
	// controlla i parametri
	if(dayofweek < 0 || dayofweek > 6)
		dayofweek = 0;
	if(day <= 0 || day > 31)
		day = -1;
	if(month <= 0 || month > 12)
		month = -1;
	if(year <= 0)
		year = -1;

	// il giorno della settimana e' a base 0
	m_Date.dayofweek = dayofweek;

	// se chiamata senza parametri ricava la data di sistema
	if(day==-1 || month==-1 || year==-1)
	{
		GetOsDate();
	}
	else
	{
		m_Date.day = day;
		_snprintf(m_Date.daystr,sizeof(m_Date.daystr)-1,"%.2d",m_Date.day);
		m_Date.month = month;
		_snprintf(m_Date.monthstr,sizeof(m_Date.monthstr)-1,"%.2d",m_Date.month);
		m_Date.year = year;
		_snprintf(m_Date.yearstr,sizeof(m_Date.yearstr)-1,"%.4d",m_Date.year);
	}
}

/*
	GetDate()

	Imposta i parametri con i valori della struttura interna.
*/
void CDateTime::GetDate(int& dayofweek,int& day,int& month,int& year)
{
	dayofweek = m_Date.dayofweek;
	day       = m_Date.day;
	month     = m_Date.month;
	year      = m_Date.year;
}

/*
	SetTime()

	Imposta la struttura interna con i parametri o con l'ora di sistema.
*/
void CDateTime::SetTime(int hour/*=-1*/,int min/*=-1*/,int sec/*=-1*/)
{
	// controlla i parametri
	if(sec < 0 || sec > 60)
		sec = -1;
	if(min < 0 || min > 60)
		min = -1;
	if(hour < 0 || hour > 24)
		hour = -1;

	// se chiamata senza parametri ricava l'ora di sistema
	if(sec==-1 || min==-1 || hour==-1)
	{
		GetOsTime();
	}
	else
	{
		m_Time.sec  = sec;
		_snprintf(m_Time.secstr,sizeof(m_Time.secstr)-1,"%.2d",m_Time.sec);
		m_Time.min  = min;
		_snprintf(m_Time.minstr,sizeof(m_Time.minstr)-1,"%.2d",m_Time.min);
		m_Time.hour = hour;
		_snprintf(m_Time.hourstr,sizeof(m_Time.hourstr)-1,"%.2d",m_Time.hour);
	}
}

/*
	GetTime()

	Imposta i parametri con i valori della struttura interna.
*/
void CDateTime::GetTime(int& hour,int& min,int& sec)
{
	hour = m_Time.hour;
	min  = m_Time.min;
	sec  = m_Time.sec;
}

/*
	Get12HourTime()

	Restituisce il puntatore all'ora nel formato hh:mm:ss <AM|PM>.
	Passando TRUE come parametro ricava l'ora di sistema (aggiornando la struttura interna), con FALSE si
	limita a riformattare l'ora presente nella struttura interna.
*/
const char* CDateTime::Get12HourTime(BOOL getsystime/*=TRUE*/)
{
	char ampm[]="AM\0";
	
	memset(&(m_Time.timestr),'\0',sizeof(m_Time.timestr));
	
	// ricava l'ora di sistema e la converte nell'ora locale
	if(getsystime)
	{
		time_t time_value;
		struct tm* local_time;

		::time(&time_value);
		local_time = localtime(&time_value);

		if(local_time->tm_hour > 12)
		{
			memcpy(ampm,"PM",2);
			local_time->tm_hour -= 12;
		}
		
		if(local_time->tm_hour==0)
			local_time->tm_hour = 12;
	
		_snprintf(m_Time.timestr,sizeof(m_Time.timestr)-1,"%.8s %s",asctime(local_time) + 11,ampm);
	}
	else
	{
		if(m_Time.hour > 12)
		{
			m_Time.hour -= 12;
			memcpy(ampm,"PM",2);
		}
		
		_snprintf(m_Time.timestr,sizeof(m_Time.timestr)-1,"%.2d:%.2d:%.2d %s",m_Time.hour,m_Time.min,m_Time.sec,ampm);
	}

	return(m_Time.timestr);
}

/*
	GetElapsedTime()

	Restituisce una stringa nel formato [[nn hours, ]nn min., ]nn.nn secs. relativa al tempo trascorso.
	Non considera ne modifica la struttura interna.
*/
const char* CDateTime::GetElapsedTime(float seconds)
{
	static char szElapsedTime[MAX_DATE_STRING+1];
	long lHour = 0L;
	long lMin = 0L;
	float fSecs = seconds;

	memset(szElapsedTime,'\0',sizeof(szElapsedTime));

	if(fSecs > 60.0f)
	{
		lMin  = (long)fSecs / 60L;
		fSecs = (float)fmod(fSecs,60.0f);
		if(lMin > 60L)
		{
			lHour = lMin / 60L;
			lMin  = lMin % 60L;
		}
	}

	if(lHour > 0L)
		_snprintf(szElapsedTime,sizeof(szElapsedTime)-1,"%ld hours, %ld min., %0.2f secs.",lHour,lMin,fSecs);
	else if(lMin > 0L)
		_snprintf(szElapsedTime,sizeof(szElapsedTime)-1,"%ld min., %0.2f secs.",lMin,fSecs);
	else if(fSecs >= 0.0f)
		_snprintf(szElapsedTime,sizeof(szElapsedTime)-1,"%0.2f secs.",fSecs);

	return(szElapsedTime);
}

/*
	GetFormattedDate()

	Restituisce il puntatore alla data formattata secondo il formato corrente.
	Passando TRUE come parametro ricava la data di sistema (aggiornando la struttura interna), con FALSE si
	limita a riformattare la data presente nella struttura interna.
*/
const char* CDateTime::GetFormattedDate(BOOL getsysdate/*=TRUE*/)
{
	// ricava la data di sistema
	if(getsysdate)
		GetOsDate();

	memset(&(m_Date.datestr),'\0',sizeof(m_Date.datestr));

	// imposta a seconda del formato corrente
	switch(m_Date.format)
	{
		// mm/dd/yyyy
		case AMERICAN:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d/%.2d/%.4d",
					m_Date.month,
					m_Date.day,
					m_Date.year);
			break;

		// ANSI yyyy.mm.dd, ANSI_SHORT yyyymmdd
		case ANSI:
		case ANSI_SHORT:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.4d%s%.2d%s%.2d",
					m_Date.year,
					m_Date.format==ANSI ? "." : (m_Date.format==ANSI_SHORT ? "" : "?"),
					m_Date.month,
					m_Date.format==ANSI ? "." : (m_Date.format==ANSI_SHORT ? "" : "?"),
					m_Date.day);
			break;

		// dd/mm/yyyy
		case BRITISH:
		case FRENCH:
		default:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d/%.2d/%.4d",
					m_Date.day,
					m_Date.month,
					m_Date.year);
			break;
	
		// dd.mm.yyyy
		case GERMAN:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d.%.2d.%.4d",
					m_Date.day,
					m_Date.month,
					m_Date.year);
			break;
	
		// dd-mm-yyyy
		case ITALIAN:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d-%.2d-%.4d",
					m_Date.day,
					m_Date.month,
					m_Date.year);
			break;
	
		// yyyy/mm/dd
		case JAPAN:
		case YMD:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.4d/%.2d/%.2d",
					m_Date.year,
					m_Date.month,
					m_Date.day);
			break;
	
		// mm-dd-yyyy
		case USA:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d-%.2d-%.4d",
					m_Date.month,
					m_Date.day,
					m_Date.year);
			break;
	
		// mm/dd/yyyy
		case MDY:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d/%.2d/%.4d",
					m_Date.month,
					m_Date.day,
					m_Date.year);
			break;
	
		// dd/mm/yyyy
		case DMY:
			_snprintf(m_Date.datestr,
					sizeof(m_Date.datestr)-1,
					"%.2d-%.2d-%.4d",
					m_Date.day,
					m_Date.month,
					m_Date.year);
			break;
	
		// GMT_SHORT	"Day, dd Mon yyyy hh:mm:ss" (assumendo GMT, ossia convertendo l'UTC in GMT)
		// GMT		"Day, dd Mon yyyy hh:mm:ss <-|+>nnnn" (con l'UTC, ossia il <-|+>nnnn, locale)
		// GMT_TZ		"Day, dd Mon yyyy hh:mm:ss <-|+>nnnn TZ" (con l'UTC, ossia il <-|+>nnnn, locale, dove TZ e' l'identificativo di tre caratteri per l'UTC)
		case GMT_SHORT:
		case GMT:
		case GMT_TZ:
		{
			int i = 0;

			// ricava data e ora e le converte nel formato locale
			if(getsysdate)
			{
				GetOsTime();

				// per GMT_SHORT deve convertire l'UTC (<-|+>nnnn) in assoluto (0), cambiando i valori di data/ora
				if(m_Date.format==GMT_SHORT)
				{
					// aggiunge/sottrae la differenza oraria per ottenere il valore assoluto (GMT)
					ModifyDateTime(HOUR,(int)((GetTimeZoneDiff()/60)/60));
				}
			}

			// formatta i valori di data e ora
			i = _snprintf(	m_Date.datestr,
						sizeof(m_Date.datestr)-1,
						"%s, %.2d %s %.4d %.2d:%.2d:%.2d",
						day_array[m_Date.dayofweek],
						m_Date.day,
						month_array[m_Date.month-1],
						m_Date.year,
						m_Time.hour,
						m_Time.min,
						m_Time.sec);

			if(m_Date.format!=GMT_SHORT)
			{
				// ricava la differenza oraria rispetto al GMT (divide i secondi in minuti ed i minuti in ore)
				long tzd = (GetTimeZoneDiff() / 60) / 60;

				_snprintf(m_Date.datestr+i,
						sizeof(m_Date.datestr)-(1+i),
						" %s0%d00%s%s",
						tzd==0 ? "" : (tzd > 0 ? "+" : "-"),
						/*tzd < 0 ? (int)tzd * -1 : (int)tzd,*/
						tzd,
						m_Date.format==GMT ? "" : " ",
						m_Date.format==GMT ? "" : GetTimeZoneName());
			}
		}
		
		break;
	}

	return(m_Date.datestr);
}

/*
	GetFormattedTime()

	Restituisce il puntatore all'ora formattata secondo il formato hh:mm:ss.
	Passando TRUE come parametro ricava l'ora di sistema (aggiornando la struttura interna), con FALSE si
	limita a formattare l'ora presente nella struttura interna.
*/
const char* CDateTime::GetFormattedTime(BOOL getsystime/*=TRUE*/)
{
	// ricava la data di sistema
	if(getsystime)
		GetOsTime();

	memset(&(m_Time.timestr),'\0',sizeof(m_Time.timestr));

	// imposta a seconda del formato corrente
	switch(m_Time.format)
	{
		// "hh:mm:ss", "hhmmss"
		case HHMMSS:
		case HHMMSS_SHORT:
			_snprintf(m_Time.timestr,
					sizeof(m_Time.timestr)-1,
					"%.2d%s%.2d%s%.2d",
					m_Time.hour,
					m_Time.format==HHMMSS ? ":" : (m_Time.format==HHMMSS_SHORT ? "" : "?"),
					m_Time.min,
					m_Time.format==HHMMSS ? ":" : (m_Time.format==HHMMSS_SHORT ? "" : "?"),
					m_Time.sec);
			break;
		
		// "hh:mm:ss <AM|PM>"
		case HHMMSS_AMPM:
		{
			char ampm[]="AM\0";
			
			if(m_Time.hour > 12)
			{
				m_Time.hour -= 12;
				memcpy(ampm,"PM",2);
			}
			
			_snprintf(m_Time.timestr,
					sizeof(m_Time.timestr)-1,
					"%.2d:%.2d:%.2d %s",
					m_Time.hour,
					m_Time.min,
					m_Time.sec,
					ampm);
			
			break;
		}

		// "hh:mm:ss" (assumendo GMT, ossia convertendo l'UTC in GMT)
		case HHMMSS_GMT_SHORT:
			break;
		
		// "hh:mm:ss <-|+>nnnn" (con l'UTC, ossia il <-|+>nnnn, locale)
		case HHMMSS_GMT:
			break;
		
		// "hh:mm:ss <-|+>nnnn TZ" (con l'UTC, ossia il <-|+>nnnn, locale, dove TZ e' l'identificativo di tre caratteri per l'UTC)
		case HHMMSS_GMT_TZ:
			break;
	}

	return(m_Time.timestr);
}

const char* CDateTime::ConvertDate(DATEFORMAT fmtsrc,DATEFORMAT fmtdst,const char* pdate,const char* ptime)
{
	char buf[MAX_DATE_STRING+1] = {0};
	
	memset(&(m_Date.datestr),'\0',sizeof(m_Date.datestr));

	switch(fmtsrc)
	{
		case AMERICAN:
			break;
	
		case ANSI:
			break;

		case ANSI_SHORT:
		{
			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate,4);
			m_Date.year = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+4,2);
			m_Date.month = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+6,2);
			m_Date.day = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,ptime,2);
			m_Time.hour = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,ptime+2,2);
			m_Time.min = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,ptime+4,2);
			m_Time.sec = atoi(buf);

			break;
		}
	
		case BRITISH:
			break;
	
		case FRENCH:
			break;

		case GERMAN:
			break;
	
		case ITALIAN:
			break;
	
		case JAPAN:
			break;
	
		case USA:
			break;
	
		case MDY:
			break;
	
		case DMY:
			break;
	
		case YMD:
			break;
	
		case GMT_SHORT:
		case GMT:
		case GMT_TZ:
		{
			int i;
			char* p = (char*)pdate;

			// salta fino al giorno (numerico)
			while(*p && !isdigit(*p))
				p++;

			// ricava il giorno
			if(*p && isdigit(*p))
			{
				memset(buf,'\0',sizeof(buf));
				for(i = 0; i < sizeof(buf) && *p && isdigit(*p); i++)
					buf[i] = *p++;
				m_Date.day = atoi(buf);
			}

			// salta fino al mese (stringa)
			while(isspace(*p) || *p=='-')
				p++;

			// ricava il mese
			if(*p)
			{
				memset(buf,'\0',sizeof(buf));
				for(i = 0; i < sizeof(buf) && *p && isalpha(*p) && *p!=' ' && *p!='-'; i++)
					buf[i] = *p++;
				for(i = 0; i < ARRAY_SIZE(month_array); i++)
					if(strcmp(buf,month_array[i])==0)
						break;
				if(i < ARRAY_SIZE(month_array))
					m_Date.month = ++i;
			}

			// salta fino all'anno (numerico)
			while(*p && isspace(*p) || *p=='-')
				p++;

			// ricava l'anno
			if(*p)
			{
				memset(buf,'\0',sizeof(buf));
				for(i = 0; i < sizeof(buf) && *p && isdigit(*p); i++)
					buf[i] = *p++;
				m_Date.year = atoi(buf);
				if(strlen(buf) <= 2)
					m_Date.year += 2000;
			}

			// salta fino all'ora (numerico)
			while(*p && isspace(*p))
				p++;

			// ricava l'ora
			if(*p)
			{
				if(strlen(p) >= 8)
				{
					memset(m_Time.hourstr,'\0',sizeof(m_Time.hourstr));
					memset(m_Time.minstr,'\0',sizeof(m_Time.minstr));
					memset(m_Time.secstr,'\0',sizeof(m_Time.secstr));
					m_Time.hourstr[0] = *p++;
					m_Time.hourstr[1] = *p++;
					p++;
					m_Time.minstr[0] = *p++;
					m_Time.minstr[1] = *p++;
					p++;
					m_Time.secstr[0] = *p++;
					m_Time.secstr[1] = *p++;

					m_Time.hour = atoi(m_Time.hourstr);
					m_Time.min = atoi(m_Time.minstr);
					m_Time.sec = atoi(m_Time.secstr);
				}
			}
			
			// aggiunge/sottrae la differenza oraria per ottenere il valore assoluto (GMT)
			if(fmtsrc==GMT_SHORT)
				ModifyDateTime(HOUR,(int)((GetTimeZoneDiff()/60)/60));

			break;
		}
	}

	switch(fmtdst)
	{
		case AMERICAN:
			break;
	
		case ANSI:
			break;

		case ANSI_SHORT:
			_snprintf(m_Date.datestr,sizeof(m_Date.datestr)-1,"%04d%02d%02d",m_Date.year,m_Date.month,m_Date.day);
			break;
	
		case BRITISH:
			break;
	
		case FRENCH:
			break;

		case GERMAN:
			break;
	
		case ITALIAN:
			break;
	
		case JAPAN:
			break;
	
		case USA:
			break;
	
		case MDY:
			break;
	
		case DMY:
			break;
	
		case YMD:
			break;
	
		case GMT_SHORT:
			break;
	
		case GMT:
		{
			DATEFORMAT df = m_Date.format;
			m_Date.format = GMT;
			GetFormattedDate(FALSE);
			m_Date.format = df;
			break;
		}

		case GMT_TZ:
			break;
	}

	return(m_Date.datestr);
}

const char* CDateTime::ConvertTime(TIMEFORMAT fmtsrc,TIMEFORMAT fmtdst,const char* pdate,const char* /*ptime*/)
{
	char buf[MAX_TIME_STRING+1] = {0};

	memset(&(m_Time.timestr),'\0',sizeof(m_Time.timestr));

	switch(fmtsrc)
	{
		case HHMMSS:
			break;
	
		case HHMMSS_AMPM:
			break;
	
		case HHMMSS_SHORT:
			break;

		case HHMMSS_GMT_SHORT:
		case HHMMSS_GMT:
		case HHMMSS_GMT_TZ:
		{
			char* p = (char*)pdate;

			// salta fino alla ora (cerca il ':')
			while(*p && *p!=':')
				p++;

			// retrocede
			if(*p && *p==':')
			{
				p -= 2;
				memcpy(buf,p,2);
				m_Time.hour = atoi(buf);
				memcpy(buf,p+3,2);
				m_Time.min = atoi(buf);
				memcpy(buf,p+6,2);
				m_Time.sec = atoi(buf);
			}
			
			break;
		}
	}

	switch(fmtdst)
	{
		case HHMMSS_AMPM:
			break;

		case HHMMSS:
		case HHMMSS_SHORT:
			_snprintf(m_Time.timestr,
					sizeof(m_Time.timestr)-1,
					"%02d%02d%02d",
					m_Time.hour,
					m_Time.min,
					m_Time.sec);
			break;

		case HHMMSS_GMT_SHORT:
		case HHMMSS_GMT:
		case HHMMSS_GMT_TZ:
			break;
	}

	return(m_Time.timestr);
}
/*
	ANSI_SHORT,		// "yyyymmdd"

	ANSI,			// "yyyy.mm.dd"
	JAPAN,			// "yyyy/mm/dd"
	YMD,				// "yyyy/mm/dd"

	BRITISH,			// "dd/mm/yyyy"
	FRENCH,			// "dd/mm/yyyy"
	GERMAN,			// "dd.mm.yyyy"
	ITALIAN,			// "dd-mm-yyyy"
	DMY,				// "dd/mm/yyyy"

	AMERICAN = 0,		// "mm/dd/yyyy"
	USA,				// "mm-dd-yyyy"
	MDY,				// "mm/dd/yyyy"

	GMT_SHORT,		// "Day, dd Mon yyyy hh:mm:ss" (assumendo GMT, ossia convertendo l'UTC in GMT)
	GMT,				// "Day, dd Mon yyyy hh:mm:ss <-|+>nnnn" (con l'UTC, ossia il <-|+>nnnn, locale)
	GMT_TZ,			// "Day, dd Mon yyyy hh:mm:ss <-|+>nnnn TZ" (con l'UTC, ossia il <-|+>nnnn, locale, dove TZ e' l'identificativo di tre caratteri per l'UTC)
*/
void CDateTime::LoadFromString(const char* pdate,DATEFORMAT datefmt,TIMEFORMAT timefmt)
{
	char buf[MAX_DATE_STRING+1] = {0};
	
	Reset();
	m_Date.format = datefmt;
	m_Time.format = timefmt;

	switch(datefmt)
	{
		case ANSI_SHORT:
		{
			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate,4);
			m_Date.year = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+4,2);
			m_Date.month = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+6,2);
			m_Date.day = atoi(buf);

			break;
		}

		case ANSI:
		case JAPAN:
		case YMD:
		{
			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate,4);
			m_Date.year = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+5,2);
			m_Date.month = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+8,2);
			m_Date.day = atoi(buf);

			break;
		}

		case BRITISH:
		case FRENCH:
		case GERMAN:
		case ITALIAN:
		case DMY:
		{
			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate,2);
			m_Date.day = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+3,2);
			m_Date.month = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+6,4);
			m_Date.year = atoi(buf);

			break;
		}

		case AMERICAN:
		case USA:
		case MDY:
		{
			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate,2);
			m_Date.month = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+3,2);
			m_Date.day = atoi(buf);

			memset(buf,'\0',sizeof(buf));
			memcpy(buf,pdate+6,4);
			m_Date.year = atoi(buf);

			break;
		}
	
		case GMT_SHORT:
		case GMT:
		case GMT_TZ:
		{
			int i;
			char* p = (char*)pdate;

			// salta fino al giorno (numerico)
			while(*p && !isdigit(*p))
				p++;

			// ricava il giorno
			memset(buf,'\0',sizeof(buf));
			if(isdigit(*p))
				for(i = 0; i < sizeof(buf) && isdigit(*p); i++)
					buf[i] = *p++;
			m_Date.day = atoi(buf);
			
			// salta fino al mese (stringa)
			while(isspace(*p))
				p++;

			// ricava il mese
			memset(buf,'\0',sizeof(buf));
			for(i = 0; i < sizeof(buf) && isalpha(*p); i++)
				buf[i] = *p++;
			for(i = 0; i < ARRAY_SIZE(month_array); i++)
				if(strcmp(buf,month_array[i])==0)
					break;
			if(i < ARRAY_SIZE(month_array))
				m_Date.month = ++i;
			
			// salta fino all'anno (numerico)
			while(isspace(*p))
				p++;

			// ricava l'anno
			memset(buf,'\0',sizeof(buf));
			for(i = 0; i < sizeof(buf) && isdigit(*p); i++)
				buf[i] = *p++;
			m_Date.year = atoi(buf);

			// salta fino alla ora (numerico)
			while(isspace(*p))
				p++;

			if(*p && isdigit(*p))
			{
				memset(buf,'\0',sizeof(buf));
				memcpy(buf,p,2);
				m_Time.hour = atoi(buf);
				memcpy(buf,p+3,2);
				m_Time.min = atoi(buf);
				memcpy(buf,p+6,2);
				m_Time.sec = atoi(buf);
			}

			break;
		}
	}
}

int CDateTime::DaysInMonth(int month,int year)
{
	int days = 0;
	
	if(month >= 1 && month <= 12)
	{
		if(month==2 && IsLeapYear(year))
			days = 29;
		else
			days = dayinmonth_array[month-1];
	}

	return(days);
}

void CDateTime::ModifyDateTime(DATETIMEOBJECT type,int qta)
{
	if(qta==0)
		return;

	int diff = 0;

	if(m_Date.year < 0)
		m_Date.year = 1965;
	if(m_Date.month < 1 || m_Date.month > 12)
		m_Date.month = 8;
	if(m_Date.day < 1 || m_Date.day > 30) //$
		m_Date.day = 26;
	if(m_Time.hour < 0 || m_Time.hour > 24)
		m_Time.hour = 5;
	if(m_Time.min < 0 || m_Time.min > 60)
		m_Time.min = 30;
	if(m_Time.sec < 0 || m_Time.sec > 60)
		m_Time.sec = 0;

	switch(type)
	{
		case SECOND:
			diff = m_Time.sec - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Time.sec += qta;
			goto calc_secs;
		case MINUTE:
			diff = m_Time.min - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Time.min += qta;
			goto calc_min;
		case HOUR:
			diff = m_Time.hour - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Time.hour += qta;
			goto calc_hour;
		case DAY:
			diff = m_Date.day - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Date.day += qta;
			goto calc_day;
		case MONTH:
			diff = m_Date.month - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Date.month += qta;
			goto calc_mon;
		case YEAR:
			diff = m_Date.year - (qta > 0 ? qta : (qta*-1));
			diff = diff < 0 ? (diff*-1) : diff;
			m_Date.year += qta;
			goto done;
		default:
			goto done;
	}
	
calc_secs:
	if(m_Time.sec > 60)
	{
		m_Time.sec = m_Time.sec - 60;
		m_Time.min++;
	}
	else if(m_Time.sec < 1)
	{
		m_Time.sec = 60 - diff;
		m_Time.min--;
	}
	diff=0;

calc_min:
	if(m_Time.min > 60)
	{
		m_Time.min = m_Time.min - 60;
		m_Time.hour++;
	}
	else if(m_Time.min < 1)
	{
		m_Time.min = 60 - diff;
		m_Time.hour--;
	}
	diff=0;

calc_hour:
	if(m_Time.hour > 24)
	{
		m_Time.hour = m_Time.hour - 24;
		m_Date.day++;
	}
	else if(m_Time.hour < 1)
	{
		m_Time.hour = 24 - diff;
		m_Date.day--;
	}
	diff=0;

calc_day:
	//$
	if(m_Date.day > 30)
	{
		m_Date.day = m_Date.day - 30;
		m_Date.month++;
	}
	else if(m_Date.day < 1)
	{
		m_Date.day = 30 - diff;
		m_Date.month--;
	}
	diff=0;

calc_mon:
	if(m_Date.month > 12)
	{
		m_Date.month = m_Date.month - 12;
		m_Date.year++;
	}
	else if(m_Date.month < 1)
	{
		m_Date.month = 12 - diff;
		m_Date.year--;
	}
	diff=0;

done:

	return;
}

/*
	GetDSTZone()

	Nonzero if daylight-saving-time zone (DST) is specified in TZ; otherwise 0, default value is 1.
	Non considera ne modifica la struttura interna.
*/
int CDateTime::GetDSTZone(void)
{
    _tzset();
	return(_daylight);
}

/*
	GetTimeZoneDiff()

	Difference, in seconds, between coordinated universal time and local time (default value is 28,800).
	Non considera ne modifica la struttura interna.
*/
long CDateTime::GetTimeZoneDiff(void)
{
	// mi piacerebbe sapere perche' cazzo il valore restituito e' al contrario
	// (negativo quando positivo e viceversa)
    _tzset();
	return(_timezone * -1);
}

/*
	GetTimeZoneName()

	Three-letter time-zone name derived from TZ environment variable.
	Non considera ne modifica la struttura interna.
*/
const char* CDateTime::GetTimeZoneName(void)
{
    _tzset();
	return(_tzname[0]);
}

/*
	GetDSTZoneName()

	Three-letter DST zone name derived from TZ environment variable, default value is PDT (Pacific daylight
	time), if DST zone is omitted from TZ, _tzname[1] is empty string.
	Non considera ne modifica la struttura interna.
*/
const char* CDateTime::GetDSTZoneName(void)
{
    _tzset();
	return(_tzname[1]);
}

/*
	GetSystemDate()

	Ricava la data di sistema, imposta la struttura interna su tale valore e restituisce il puntatore
	alla data nel formato mm/dd/yy.
*/
const char* CDateTime::GetSystemDate(void)
{
	return(GetOsDate());
}

/*
	GetSystemDate()

	Come sopra, oltre ad impostare i parametri ricevuti.
*/
void CDateTime::GetSystemDate(int& day,int& month,int& year)
{
	GetOsDate();

	day   = m_Date.day;
	month = m_Date.month;
	year  = m_Date.year;
}

/*
	GetSystemTime()

	Ricava l'ora di sistema, imposta la struttura interna su tale valore e restituisce il puntatore
	all'ora nel formato hh:mm:ss.
*/
const char* CDateTime::GetSystemTime(void)
{
	return(GetOsTime());
}

/*
	GetSystemTime()

	Come sopra, oltre ad impostare i parametri ricevuti.
*/
void CDateTime::GetSystemTime(int& hour,int& min,int& sec)
{
	GetOsTime();

	hour = m_Time.hour;
	min  = m_Time.min;
	sec  = m_Time.sec;
}

/*
	GetOsDate()

	Ricava la data di sistema impostando la struttura interna.
*/
const char* CDateTime::GetOsDate(void)
{
	time_t time_value;
	::time(&time_value);
	struct tm* local_time;
	local_time = localtime(&time_value);
	char year[MAX_DATETIME_BUF + 1];

	memset(m_Date.daystr,'\0',MAX_DATETIME_BUF + 1);
	m_Date.day = local_time->tm_mday;
	_snprintf(m_Date.daystr,sizeof(m_Date.daystr)-1,"%.2d",m_Date.day);

	memset(m_Date.monthstr,'\0',MAX_DATETIME_BUF + 1);
	m_Date.month = local_time->tm_mon + 1;
	_snprintf(m_Date.monthstr,sizeof(m_Date.monthstr)-1,"%.2d",m_Date.month);

	m_Date.year = local_time->tm_year + 1900;
	memset(year,'\0',MAX_DATETIME_BUF + 1);
	_snprintf(year,sizeof(year)-1,"%.2d",m_Date.year);

	memset(m_Date.yearstr,'\0',MAX_DATETIME_BUF + 1);
	memcpy(m_Date.yearstr,year+2,2);

	_snprintf(m_Date.datestr,sizeof(m_Date.datestr)-1,"%.2d/%.2d/%s",m_Date.day,m_Date.month,m_Date.yearstr);  // mm/dd/yy

	return(m_Date.datestr);
}

/*
	GetOsTime()

	Ricava l'ora di sistema impostando la struttura interna.
*/
const char* CDateTime::GetOsTime(void)
{
	_strtime(m_Time.timestr); // hh:mm:ss

	memset(m_Time.hourstr,'\0',MAX_DATETIME_BUF + 1);
	memcpy(m_Time.hourstr,m_Time.timestr,2);
	m_Time.hour = atoi(m_Time.hourstr);

	memset(m_Time.minstr,'\0',MAX_DATETIME_BUF + 1);
	memcpy(m_Time.minstr,(m_Time.timestr)+3,2);
	m_Time.min = atoi(m_Time.minstr);

	memset(m_Time.secstr,'\0',MAX_DATETIME_BUF + 1);
	memcpy(m_Time.secstr,(m_Time.timestr)+6,2);
	m_Time.sec = atoi(m_Time.secstr);

	return(m_Time.timestr);
}

/*
	IsLeapYear()

	Verifica se l'anno e' bisestile.
	Non considera ne modifica la struttura interna.
*/
BOOL CDateTime::IsLeapYear(int year)
{
	if(year % 4)		return FALSE;	// if not divisible by 4, not leap
	if(year < 1582)	return TRUE;	// before this year, all were leap
	if(year % 100)		return TRUE;	// by 4, but not by 100 is leap
	if(year % 400)		return FALSE;	// not by 100 and not by 400 not leap
	return TRUE;
}
