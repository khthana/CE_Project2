// GImage.cpp: implementation of the C2Image class.
//
//////////////////////////////////////////////////////////////////////

#include "2Image.h"
#include <malloc.h>
#include <math.h>


//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

C2Image::C2Image()
{
	
}

C2Image::C2Image(BITMAPFILEHEADER fileheader, BITMAPINFOHEADER infoheader)
{
	bmiHeader=infoheader; bmfHeader=fileheader;
	
	if(datapixel!=NULL) datapixel=new BYTE[bmiHeader.biHeight *bmiHeader.biWidth/8]; 
}

C2Image::C2Image( LONG Wd, LONG Ht)
{
	int extrabyte=(4-(Wd%4)%4);
	int bytesize=(Wd+extrabyte)*Ht;
	int color=2;
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
	bmiHeader.biBitCount = 1;            // 8 bit used in one pixel 
	bmiHeader.biCompression = BI_RGB;
	bmiHeader.biSizeImage = Wd*Ht/8;//bytesize;     // includes padding for 4 byte alignment
	bmiHeader.biXPelsPerMeter = 0;
	bmiHeader.biYPelsPerMeter = 0;
	bmiHeader.biClrUsed = color;
	bmiHeader.biClrImportant = 0;

	Palette=new RGBQUAD[color];
	
	for (long i=0;i<color;i++){
			
			Palette[i].rgbRed=Palette[i].rgbGreen=Palette[i].rgbBlue =255*i/(color-1);
			Palette[i].rgbReserved  =0;
			
	}
		
		datapixel=new BYTE[bmiHeader .biHeight *bmiHeader .biWidth /8]; 
		

}

C2Image::C2Image(const C2Image &Scr)
{
		bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
		int color=bmiHeader.biClrUsed;
		Palette=new RGBQUAD[color];
	
		for (long i=0;i<color;i++){
			Palette[i]=Scr.Palette[i];
			
		}
		
		datapixel=new BYTE[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth /8]; 
		for (i=0;i<Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth/8;i++)
				datapixel[i]=Scr.datapixel[i] ;
	
}

C2Image::~C2Image()
{
	if(Palette!=NULL) delete []Palette;
	if(datapixel!=NULL) delete []datapixel;
}

bool C2Image::GetData(CString filename)
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
	if(Palette!=NULL) Palette=new RGBQUAD[color];
		for (long i=0;i<color;i++){
			file.Read ((LPSTR)&Palette,4);
		}
	
	
	file.Seek (offset ,CFile::begin);
	if(datapixel!=NULL) datapixel=new BYTE[Ht*Wd/8]; 
	for ( i=0;i<Ht*Wd;i++)file.Read((LPSTR)&datapixel[i],1);	
	file.Close();
	return 1;
}	
	


BYTE C2Image::GetPixel(int x, int y)
{
	long i;
	int offset;
	int ret;

	i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
	offset=7-i%8;	i/=8;
	ret=datapixel[i] & (BYTE)pow(2,offset);
/*	ret>>offset;

	return ret;*/
	if(ret>0) return 1;
	else return 0;
} 
BYTE C2Image::GetPixel(CPoint pt)
{

	return GetPixel(pt.x ,pt.y);
}


bool C2Image::SetPixel(int x, int y, BYTE color)
{
	int offset;
	BYTE set,t;
	
	if (x<0 ||x>bmiHeader.biWidth-1 || y<0 || y>bmiHeader.biHeight -1) return 0;
	long i=(bmiHeader.biHeight-y-1)*bmiHeader.biWidth+x;
			offset=7-i%8;i=i/8;
 	
	if(color==0){
		set = (BYTE)pow(2,offset)*!color;
		set=255-set;
		datapixel[i]=datapixel[i]&set;
		return 0;
	}

		set = (BYTE)pow(2,offset)*color;
		datapixel[i]=datapixel[i]|set;
		return 0;
	
	
}



bool C2Image::WriteToFile(CString filename)
{	
		CFile file;

		file.Open( filename, CFile::modeWrite|CFile::modeCreate|CFile::typeBinary);
		
		file.Write ((LPSTR)&bmfHeader,sizeof(bmfHeader));
		file.Write((LPSTR)&bmiHeader, sizeof(bmiHeader));
		
		file.Write((LPSTR)Palette,sizeof(RGBQUAD)*bmiHeader.biClrUsed );
			
		
//	for (int i=0;i<bmiHeader.biHeight *bmiHeader.biWidth/8 ;i++)
				file.Write((LPSTR)datapixel,bmiHeader.biHeight *bmiHeader.biWidth/8 );
		return 1;
}






const C2Image &C2Image::operator =(const C2Image& Scr)
{
	//C2Image des;
		bmiHeader=Scr.bmiHeader ;
		bmfHeader=Scr.bmfHeader;
		
		int color=bmiHeader.biClrUsed;
		Palette=new RGBQUAD[color];
		for (long i=0;i<color;i++){
			Palette[i]=Scr.Palette[i];
			
		}
		
		datapixel=new BYTE[Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth/8 ]; 
		for (i=0;i<Scr.bmiHeader .biHeight *Scr.bmiHeader .biWidth/8;i++)
				datapixel[i]=Scr.datapixel[i] ;
	return *this;
		
}

void C2Image::Setdata( LONG Wd, LONG Ht)
{
	int extrabyte=(4-(Wd%4)%4);
	int bytesize=(Wd+extrabyte)*Ht;
	int color=2;
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
	bmiHeader.biBitCount = 1;            // 8 bit used in one pixel 
	bmiHeader.biCompression = BI_RGB;
	bmiHeader.biSizeImage = Wd*Ht/8;//bytesize;     // includes padding for 4 byte alignment
	bmiHeader.biXPelsPerMeter = 0;
	bmiHeader.biYPelsPerMeter = 0;
	bmiHeader.biClrUsed = color;
	bmiHeader.biClrImportant = 0;

	Palette=new RGBQUAD[color];
	
/*	for (long i=0;i<color;i++){
		if(i==0){*/
			Palette[0].rgbBlue =0;
			Palette[0].rgbGreen =0;
			Palette[0].rgbRed =0;
			Palette[0].rgbReserved  =0;
	/*	}
		if(i==1){*/
			Palette[1].rgbBlue =255;
			Palette[1].rgbGreen =255;
			Palette[1].rgbRed =255;
			Palette[1].rgbReserved  =0;
	/*	}
			
	}*/
		
		datapixel=new BYTE[bmiHeader .biHeight *bmiHeader .biWidth /8]; 
		
}


