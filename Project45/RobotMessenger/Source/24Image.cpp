// Image.cpp: implementation of the C24Image class.
//
//////////////////////////////////////////////////////////////////////

#include "24Image.h"
#include <malloc.h>


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

C24Image::C24Image()
{
	
}

C24Image::C24Image(BITMAPFILEHEADER fileheader, BITMAPINFOHEADER infoheader)
{
	bmiHeader=infoheader; bmfHeader=fileheader;
	
		
	if(datapixel!=NULL) datapixel=new CColor[bmiHeader.biHeight *bmiHeader.biWidth]; 
}

C24Image::C24Image( LONG Wd, LONG Ht,WORD bpp)
{
	int extrabyte=(4-(Wd*3)%4)%4;
	int bytesize=(Wd*3+extrabyte)*Ht;

	bmfHeader.bfType = 'MB';   // Bitmap header
	bmfHeader.bfSize = 0;      // This can be 0 for BI_RGB bitmaps
	bmfHeader.bfReserved1 = 0;
	bmfHeader.bfReserved2 = 0;
	bmfHeader.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) ;
	
	// Fill the bitmap info structure
	bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiHeader.biWidth = Wd;
	bmiHeader.biHeight = Ht;
	bmiHeader.biPlanes = 1;
	bmiHeader.biBitCount = bpp;            // 8 bit used in one pixel 
	bmiHeader.biCompression = BI_RGB;
	bmiHeader.biSizeImage = Wd*Ht ;// includes padding for 4 byte alignment
	bmiHeader.biXPelsPerMeter = 0;
	bmiHeader.biYPelsPerMeter = 0;
	bmiHeader.biClrUsed = 0;
	bmiHeader.biClrImportant = 0;
	
	datapixel=new CColor[bmiHeader .biHeight *bmiHeader .biWidth ]; 
	
}

C24Image::C24Image(const C24Image &Scr)
{
	bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
	/*	int rem=Scr.bmfHeader.bfOffBits-54 ;
		remain=new BYTE[rem];
		
		for (long i=0;i<rem;i++)
			remain=Scr.remain ;*/
		
		datapixel=new CColor[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth ]; 
				datapixel=Scr.datapixel ;
	
}

C24Image::~C24Image()
{

	delete []datapixel;
}

bool C24Image::GetData(CString filename)
{//	int rem;
	CFile file;


	if( !file.Open( filename, CFile::modeRead|CFile::typeBinary) )
		return 0;//Cannot find file
	file.Read((LPSTR)&bmfHeader, sizeof(bmfHeader));//Read bitmap file header
	if (bmfHeader.bfType != ((WORD) ('M' << 8) | 'B'))
		return 0;//Not Bitmap file
	file.Read((LPSTR)&bmiHeader, sizeof(bmiHeader));//Read bitmap info header

	int offset=bmfHeader.bfOffBits ;
	int Wd=bmiHeader.biWidth  ;
	int Ht=bmiHeader.biHeight;

	
	/*rem=offset -54;
	file.Seek(54,CFile::begin);
	if(remain!=NULL) remain=new BYTE[rem];
	file.Read ((LPSTR)remain,rem);*/
	
	
	file.Seek (offset ,CFile::begin);
	
	
	if(datapixel!=NULL) datapixel=new CColor[Ht*Wd]; 
	

	file.ReadHuge((LPSTR)datapixel,3*Ht*Wd);	
	
				
	
	file.Close();
	return 1;
}	
	


CColor C24Image::GetPixel(int x, int y)
{
	long i;
	CColor a;
	a.Bpixel =255;a.Rpixel =255;a.Gpixel =255;
	if (x<0 ||x>bmiHeader.biWidth -1|| y<0 || y>bmiHeader.biHeight-1 ) return a;
	i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	return datapixel[i];
}


bool C24Image::WriteToFile(CString filename)
{	
		CFile file;

		file.Open( filename, CFile::modeWrite|CFile::modeCreate|CFile::typeBinary);
		
		file.Write ((LPSTR)&bmfHeader,sizeof(bmfHeader));
		file.Write((LPSTR)&bmiHeader, sizeof(bmiHeader));
				file.WriteHuge((LPSTR)datapixel,3*bmiHeader.biHeight*bmiHeader.biWidth);
		return 1;
}

int C24Image::GetRed(int x, int y)
{
	if (x<0 ||x>bmiHeader.biWidth -1|| y<0 || y>bmiHeader.biHeight-1 ) return 255;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	return (int)datapixel[i].Rpixel ;
}

int C24Image::GetBlue(int x, int y)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 255;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	return (int)datapixel[i].Bpixel ;
}

int C24Image::GetGreen(int x, int y)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight-1 ) return 255;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	return (int)datapixel[i].Gpixel ;
}
bool C24Image::SetBlue(int x, int y, int colour)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight-1 ) return 255;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	datapixel[i].Bpixel =colour;
	return 1;
}

bool C24Image::SetRed(int x, int y, int colour)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	datapixel[i].Rpixel =colour;
	return 1;
}

bool C24Image::SetGreen(int x, int y, int colour)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	datapixel[i].Gpixel =colour;
	return 1;
}



bool C24Image::SetPixel(int x, int y, BYTE R, BYTE G, BYTE B)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	
	datapixel[i].Bpixel =B;
	datapixel[i].Gpixel =G ;
	datapixel[i].Rpixel =R;

	
}

//long C24Image::Geti(int x, int y){ return (bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;}

bool C24Image::SetPixel(int x, int y, CColor color)
{	

	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	
	datapixel[i].Bpixel =color.Bpixel;
	datapixel[i].Gpixel =color.Gpixel ;
	datapixel[i].Rpixel =color.Rpixel ;
	
}

const C24Image &C24Image::operator =(const C24Image& Scr)
{
//	C24Image des;
		bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
		/*int rem=Scr.bmfHeader.bfOffBits-54 ;
		remain=new BYTE[rem];
		
		for (long i=0;i<rem;i++)
			remain=Scr.remain ;*/
		
		datapixel=new CColor[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth ]; 
				datapixel=Scr.datapixel ;
	return *this;
		
}


