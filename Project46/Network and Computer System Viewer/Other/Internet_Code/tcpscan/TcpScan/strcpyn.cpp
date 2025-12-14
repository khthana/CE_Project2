/*
	strcpyn.cpp
	Copia con controllo sulla dimensione (CRT).
	Luca Piergentili, 15/05/98
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#include "env.h"
#include "pragma.h"
#include <string.h>
#include "strcpyn.h"

/*
	strcpyn()

	Passare sizeof, copia sizeof - 1, dimensionare quindi il buffer con la quantita' + 1:
	char s1[DIM+1];
	char* p = "...";
	strcpyn(s1,p,DIM+1); -> s1[DIM+1] = 0
*/
char* strcpyn(char* s1,const char *s2,int size)
{
	if(!s1)
		return(NULL);

	if(!s2 || !*s2)
	{
		memset(s1,'\0',size);
		return(NULL);
	}

	char* p = strncpy(s1,s2,size);
	s1[size-1] = '\0';

	return(p);
}
