/*
	CUuenc.h
	Classe base per codifica/decodifica in formato UUENC (CRT).
	Luca Piergentili, 24/11/96
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CUUENC_H
#define _CUUENC_H 1

class CUuenc
{
public:
	CUuenc() {}
	virtual ~CUuenc() {}
	
	int Encode(const char*,const char*);
	int Decode(const char*,const char*);
};

#endif // _CUUENC_H
