/////////////////////////////////////////////////////////////////////////////
//
//	Copyright (c) 2001, Maetee Supreanruey and Anusorn Krasantisuk
//	All Rights Reserved.
//
//	This is UNPUBLISHED PROPRIETARY SOURCE CODE of Maetee Supreanruey 
//	and Anusorn Krasantisuk, the contents of this file may not be 
//	disclosed to third parties, copied or duplicated in any form, 
//	in whole or in part, without the prior written permission of 
//	Maetee Supreanruey and Anusorn Krasantisuk.
//
/////////////////////////////////////////////////////////////////////////////


#include "..\stdafx.h"
#include "Logger.h"

#include <direct.h>

/////////////////////////////////////////////////////////////////////////////

void Log(const char* szText)
{
	time_t ltime;
	struct tm* today;
	char szFile[32];

	/* Get UNIX-style time */
	time( &ltime );

	/* Convert to time structure and adjust for PM if necessary. */
	today = localtime( &ltime );

	/* Use strftime to build a customized time string. */
	strftime(szFile, 16, "%Y_%m_%d.log", today);


	char szPath[_MAX_PATH];

	/* Get the current working directory: */
	_getcwd(szPath, _MAX_PATH);

	strcat(szPath, "\\Log\\");
	strcat(szPath, szFile);


	FILE* stream;

	/* Open file in text mode: */
	if( (stream = fopen( szPath, "a+t" )) != NULL )
	{
		char szLog[250];

		/* Use strftime to build a customized time string. */
		strftime(szLog, 128, "%H:%M:%S     ", today);

		strncat(szLog, szText, 200);
		strcat(szLog, "\n");

		/* Write log message to stream */
		fwrite( szLog, sizeof( char ), strlen(szLog), stream );
		fclose( stream );
	}
	else
	{
		char szError[250];
		wsprintf(szError, "Logger: problem opening %s\nPlease make sure that the folder \\Log is exist under the current working directory.", szPath);

		AfxMessageBox(szError);
	}
}
