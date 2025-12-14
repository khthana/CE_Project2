/*
	CBase64.h
	Classe base per codifica/decodifica base64 (CRT).
	Luca Piergentili, 14/09/96
	lpiergentili@yahoo.com
	http://www.geocities.com/lpiergentili/
*/
#ifndef _CBASE64_H
#define _CBASE64_H 1

class CBase64
{
public:
	CBase64() {}
	virtual ~CBase64() {}

	int Encode(const char* lpcszPlainFile,const char* lpcszEncodedFile);
	int Decode(const char* lpcszEncodedFile,const char* lpcszPlainFile);

private:
	int ConvertToAscii(unsigned char cChar);
};

#endif // _CBASE64_H
