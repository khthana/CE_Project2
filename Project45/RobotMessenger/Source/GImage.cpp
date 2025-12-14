// GImage.cpp: implementation of the CGImage class.
//
//////////////////////////////////////////////////////////////////////

#include "GImage.h"
#include <malloc.h>


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CGImage::CGImage()
{
	
}

CGImage::CGImage(BITMAPFILEHEADER fileheader, BITMAPINFOHEADER infoheader,RGBQUAD Palette)
{
	bmiHeader=infoheader; bmfHeader=fileheader;
	
	if(datapixel!=NULL) datapixel=new BYTE[bmiHeader.biHeight *bmiHeader.biWidth]; 
}

CGImage::CGImage( LONG Wd, LONG Ht,int color,WORD bpp)
{
	int extrabyte=(4-(Wd%4)%4);
	int bytesize=(Wd+extrabyte)*Ht;

	bmfHeader.bfType = 'MB';   // Bitmap header
	
	bmfHeader.bfReserved1 = 0;
	bmfHeader.bfReserved2 = 0;
	bmfHeader.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) + sizeof(RGBQUAD) * color;
	bmfHeader.bfSize =bmfHeader.bfOffBits +Wd*Ht;      // This can be 0 for BI_RGB bitmaps
	// Fill the bitmap info structure
	bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiHeader.biWidth = Wd;
	bmiHeader.biHeight = Ht;
	bmiHeader.biPlanes = 1;
	bmiHeader.biBitCount = bpp;            // 8 bit used in one pixel 
	bmiHeader.biCompression = BI_RGB;
	bmiHeader.biSizeImage = Wd*Ht;     // includes padding for 4 byte alignment
	bmiHeader.biXPelsPerMeter = 0;
	bmiHeader.biYPelsPerMeter = 0;
	bmiHeader.biClrUsed = color;/////////////
	bmiHeader.biClrImportant = 0;
		Palette=new RGBQUAD[color];
	
		int col;
	for (long i=0;i<color;i++){
		
			//col=
			Palette[i].rgbRed=Palette[i].rgbGreen=Palette[i].rgbBlue =255*i/(color-1);
			Palette[i].rgbReserved  =0;
			
	}
		
		datapixel=new BYTE[bmiHeader .biHeight *bmiHeader .biWidth ]; 
		

}

CGImage::CGImage(const CGImage &Scr)
{
		bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
		int color=bmiHeader.biClrUsed;
		Palette=new RGBQUAD[color];
	
		for (long i=0;i<color;i++){
			Palette[i]=Scr.Palette[i];
			
		}
		
		datapixel=new BYTE[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth ]; 
		for(i=0;i<Scr.bmiHeader.biHeight *Scr.bmiHeader.biWidth ;i++)
			datapixel[i]=Scr.datapixel [i];
	
}

CGImage::~CGImage()
{
	if(datapixel!=NULL) delete []datapixel;
	if(Palette!=NULL) delete []Palette;
}

bool CGImage::GetData(CString filename)
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
	file.Seek(54,CFile::begin);*/
	int color=bmiHeader.biClrUsed;
	/*if(Palette!=NULL) */
	Palette=new RGBQUAD[color];
		
	file.ReadHuge ((LPSTR)Palette,4*color );

	file.Seek (offset ,CFile::begin);
	/*if(datapixel!=NULL) */datapixel=new BYTE[Ht*Wd]; 
	file.ReadHuge((LPSTR)datapixel,Wd*Ht);	
	file.Close();
	return 1;
}	
	


BYTE CGImage::GetPixel(int x, int y)
{
	long i;

	i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 1;
	return datapixel[i];
}
BYTE CGImage::GetPixel(CPoint pt)
{
	return GetPixel(pt.x,pt.y);
}


bool CGImage::WriteToFile(CString filename)
{	
		CFile file;

		file.Open( filename, CFile::modeWrite|CFile::modeCreate|CFile::typeBinary);
		
		file.Write ((LPSTR)&bmfHeader,sizeof(bmfHeader));
		file.Write((LPSTR)&bmiHeader, sizeof(bmiHeader));

		file.Write((LPSTR)Palette,sizeof(RGBQUAD)*bmiHeader.biClrUsed );
		file.WriteHuge((LPSTR)datapixel,bmiHeader.biWidth *bmiHeader.biHeight );
		return 1;
}




bool CGImage::SetPixel(int x, int y, BYTE color)
{
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	
	datapixel[i]=color;
	return 0;
	
}




const CGImage &CGImage::operator =(const CGImage& Scr)
{
//	CGImage des;
		bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
		
		int color=bmiHeader.biClrUsed;
		if(Palette!=NULL)Palette=new RGBQUAD[color];
		for(int i=0;i<color;i++)
			Palette[i]=Scr.Palette[i];
	
		if(datapixel!=NULL)datapixel=new BYTE[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth ]; 
		for(i=0;i<Scr.bmiHeader.biHeight *Scr.bmiHeader.biWidth ;i++)
			datapixel[i]=Scr.datapixel [i];
	return *this;
		
}

void CGImage::Setdata( LONG Wd, LONG Ht,int color,WORD bpp)
{
	int extrabyte= (4 - Wd % 4) % 4;
	int bytesize=(Wd+extrabyte)*Ht;

	bmfHeader.bfType = 'MB';   // Bitmap header
	bmfHeader.bfSize = 0;      // This can be 0 for BI_RGB bitmaps
	bmfHeader.bfReserved1 = 0;
	bmfHeader.bfReserved2 = 0;
	bmfHeader.bfOffBits = sizeof(BITMAPFILEHEADER) + sizeof(BITMAPINFOHEADER) + sizeof(RGBQUAD) * color;

	// Fill the bitmap info structure
	bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
	bmiHeader.biWidth = Wd;
	bmiHeader.biHeight = Ht;
	bmiHeader.biPlanes = 1;
	bmiHeader.biBitCount = 8;//bpp            // 8 bit used in one pixel 
	bmiHeader.biCompression = BI_RGB;
	bmiHeader.biSizeImage = Wd*Ht/*+bmfHeader.bfOffBits */;     // includes padding for 4 byte alignment
	bmiHeader.biXPelsPerMeter = 0;
	bmiHeader.biYPelsPerMeter = 0;
	bmiHeader.biClrUsed = color;//color
	bmiHeader.biClrImportant = 0;

	Palette=new RGBQUAD[color];
	
	for (long i=0;i<color;i++){
	
			Palette[i].rgbRed=Palette[i].rgbGreen=Palette[i].rgbBlue =255*i/(color-1);
			Palette[i].rgbReserved  =0;
	
	}
		
		datapixel=new BYTE[bmiHeader .biHeight *bmiHeader .biWidth ]; 
		
}

