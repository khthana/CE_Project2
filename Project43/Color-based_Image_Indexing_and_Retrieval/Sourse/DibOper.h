#ifndef _INC_DIBOPER
#define _INC_DIBOPER

/* Handle to a DIB */
//DECLARE_HANDLE(HDIB);

typedef struct 
{
	int Hue;
	int Saturation;
	int Value;
	int	Gray;
}HSVQUAD;


typedef struct    //**** must change to support size of real picture
{
   int   hue[19];         
   int   sat[4];		
   int   val[4];
   int   gra[5];
} ToScreen; 

/* Function prototypes */
RGBQUAD	WINAPI GetPixel(HDIB m_hDIB, CPalette* m_palDIB, int x, int y);
HSVQUAD	WINAPI findHSV(HDIB hDIB, CPalette* cPal, int x, int y);

void SaveFile(HDIB hDIB, CString name, CString target0, CString target1,CString target2,CString target3,CString target4,CString target5);
ToScreen StoreHistogram(ToScreen bu,HSVQUAD value);

#endif