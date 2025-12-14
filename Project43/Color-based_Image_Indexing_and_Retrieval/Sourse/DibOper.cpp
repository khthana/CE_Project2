/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
// GetPixel : use to get RGB value of 1 pixel (return RGBQUAD)
//
// Calculate : use to calculate HSV value of 1 pixel (return HSVQUAD)
//
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "dibapi.h"
#include "diboper.h"
#include <io.h>
#include <errno.h>

#define max(a, b)  (((a) > (b)) ? (a) : (b))  
#define min(a, b)  (((a) < (b)) ? (a) : (b))
/////////////////////////////////////////////////////////////////////
RGBQUAD WINAPI GetPixel(HDIB m_hDIB, CPalette* m_palDIB, int x, int y)
{
  static RGBQUAD pixColor = {0, 0, 0, 0};
  UINT RowByteCount;


//
// WARNING:   This function currently only supports 4, 8 and // 24 bpp bitmaps!!
//1
// This member function gets the RGB color of the pixel at // location
// x,y.  Where x = 0 is at the left of the image, x // increases to the right
// y = 0 at the top of the image, y increases to the bottom

// If the x,y spot is out of bounds, BLACK is returned
	
// Test for valid Bitmap and inbounds request
	LPSTR lpDIB = (LPSTR) ::GlobalLock((HGLOBAL) m_hDIB);
	
	if(x > (int)::DIBWidth(lpDIB) || y > (int)::DIBHeight(lpDIB) )
  {
    pixColor.rgbBlue = pixColor.rgbGreen = pixColor.rgbRed = 0;
    return pixColor;
  }


// Get starting address of pixel data and color table
	LPSTR lpDIBBits;

	lpDIBBits = ::FindDIBBits(lpDIB);

	BYTE * dibits = (BYTE *) lpDIBBits;//m_lpImage;
	LPRGBQUAD pDibQuad = (LPRGBQUAD) m_palDIB;//m_lpvColorTable;

// Now extract the color data

	int temp = (int)::BitCount(lpDIB);
	//char ch[31];
//	AfxMessageBox(_itoa(temp,ch,10));
	
	ULONG width = ::DIBWidth(lpDIB);
	ULONG height = 	::DIBHeight(lpDIB);
	::GlobalUnlock((HGLOBAL) m_hDIB);

	switch(temp)//(m_lpBMIH->biBitCount)
  {
	case 24:
// Calculate the number of bytes in a row
    RowByteCount = ((((width * 3) -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height - y) * RowByteCount;
// Move to the correct pixel address
    dibits += x * 3;
// Load up pixColor
    pixColor.rgbBlue = dibits[0];
    pixColor.rgbGreen = dibits[1];
    pixColor.rgbRed = dibits[2];
    break;
	case 8:
// Calculate the number of bytes in a row
    RowByteCount = (((width -1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height - y) * RowByteCount;
// Move to the correct pixel address
    dibits += x;
    pDibQuad += dibits[0];
    pixColor.rgbBlue = pDibQuad->rgbBlue;
    pixColor.rgbGreen = pDibQuad->rgbGreen;
    pixColor.rgbRed = pDibQuad->rgbRed;
    break;
  case 4:
// Calculate the number of bytes in a row
    RowByteCount = ((((width >> 1)-1) / 4) + 1) * 4;
// Move to the correct row (correct for bottom up DIB //storage)
    dibits += (height - y) * RowByteCount;
// Move to the correct pixel address
    dibits += (x >> 1);
    if(x%2) pDibQuad += dibits[0] & 0x0f;
    else pDibQuad += (dibits[0] & 0xf0) >> 4;
    pixColor.rgbBlue = pDibQuad->rgbBlue;
    pixColor.rgbGreen = pDibQuad->rgbGreen;
    pixColor.rgbRed = pDibQuad->rgbRed;
    break;
  default:
    AfxMessageBox("This BMP format is not supported!", 
      MB_ICONSTOP | MB_OK);
    pixColor.rgbBlue = pixColor.rgbGreen = pixColor.rgbRed = 0;
    break;
  }
	
  return pixColor;
}

/////////////////////////////////////////////////////////////////

HSVQUAD WINAPI findHSV(HDIB hDIB, CPalette* cPal, int pointX, int pointY)
{
	RGBQUAD in;
	HSVQUAD out;

	
	in = ::GetPixel(hDIB,cPal,pointX,pointY);

	// find HSV which H must find r' g' b' (0..1) first
	// 

	float tempb;
	float tempg;
	float tempr;
	float H;
	float b;
	float g;
	float r;
	float RGB;
	float S;
	float V;

	float MinValue;
    float  MaxValue;

    if (((float) in.rgbRed == (float)in.rgbGreen) && ((float)in.rgbRed == (float)in.rgbBlue))
	{
		if ((float)in.rgbRed > 191.25)
		{	out.Gray = 3;}
		else if ((float)in.rgbRed > 127.5)
		{	out.Gray = 2;}
		else if ((float)in.rgbRed > 63.75)
		{	out.Gray = 1;
		}
		else {out.Gray =0;}
		out.Saturation = 0;
	    out.Value = 255;  // not add in histogram
		out.Hue = 255;
	}
	else {
	RGB =  (float) in.rgbRed+(float)in.rgbGreen+(float)in.rgbBlue;						
	
		r =  (float)in.rgbRed/RGB;
		g =  (float)in.rgbGreen/RGB;
		b =  (float)in.rgbBlue/RGB; 			       //normalize
	
	MaxValue = max(r,g);
	MaxValue = max(b,MaxValue);
	V = MaxValue;           //find max of three value
	MinValue = min(r,g);
	MinValue = min(b,MinValue);    // find min of three value
	S = (V-MinValue)/V ; 
   
	tempr = (V-r)/(V-MinValue);
	tempg = (V-g)/(V-MinValue);
	tempb = (V-b)/(V-MinValue);

	if ((r == MaxValue) && (g == MinValue))
	{ H =  5+tempb;}
	else if ((r == MaxValue) && (g != MinValue))
	{ H = 1-tempg;}
	else if ((g == MaxValue) && (b == MinValue))
	{ H = 1+tempr;}
	else if ((g == MaxValue) && (b != MinValue))
	{ H = 3-tempb;}
	else if ((b == MaxValue) && (r == MinValue))
	{ H =  3+tempg;}
	else  { H = 5-tempr;}

	H = H/6;      // real Hvalue         
// End of transformation,Begin Quantization
	if (S > 0.333333)
		{ if (S >0.6666666)
			{ out.Saturation = 2;}
		  else { out.Saturation = 1;} }
	else { out.Saturation = 0;}				// get quantize S
    
	if (V > 0.3333333)
		{ if (V >0.6666666)
			{ out.Value = 2;}
		  else { out.Value = 1;} }
	else { out.Value = 0;}					// get quantize V

	if (H >= 0.5)
	  if (H >= 0.7777777)
		 if (H >= 0.8888888)
			{if (H >= 0.9444444)
				{ out.Hue = 17;
					if (H == 1)
					  out.Hue = 0;
				}		// >0.944->1.0
			 else {	out.Hue = 16;} }	// >0.888-0.944
		 else if (H >= 0.8333333)
					{ out.Hue = 15;}	// >0.833-0.888
			  else { out.Hue = 14;}		// >0.777-0.833

	  else if (H >= 0.6666666)
			{if (H >= 0.7222222)
				{ out.Hue = 13;}			// >0.722-0.777
			 else {	out.Hue = 12;} }		// >0.666-0.722
		   else if (H >= 0.5555555)		
				{ if (H >= 0.6111111)
					{ out.Hue = 11;}		// >0.611-0.666
				  else {out.Hue = 10;}} // >0.555-0.611
				else { out.Hue = 9;}		// >0.5-0.555
	 else if (H >= 0.2777777)
		    if (H >= 0.3888888)
				if (H >= 0.4444444)
					{ out.Hue = 8 ;}		// >0.444-0.5
				else { out.Hue = 7;}		// >0.388-0.444
			else if (H >= 0.3333333)
					{ out.Hue = 6;}		// >0.333-0.388
				 else { out.Hue = 5;}	// >0.277-0.333
		  else if (H >= 0.1666666)
				if (H >= 0.2222222)
					{ out.Hue = 4;}		// >0.222-0.277
				else {  out.Hue = 3;}		// >0.166-0.222
			   else if (H >= 0.0555555)
			   		{ if (H >= 0.1111111)
						{ out.Hue = 2 ;}	// >0.111-0.166
					  else {out.Hue = 1;} }	// >0.055-0.111
					else { out.Hue = 0;}		// <0.0-0.055
										// get quantize H
	out.Gray = 255;
	} // end else

	return out;
}

/////////////////////////////////////////////////////////////////
void SaveFile(HDIB hDIB, CString name, CString target0, CString target1, CString target2, CString target3, CString target4, CString target5)
{
	// if name not include filetype add it 
		if (name.Find(".bmp",0) == -1)
			if (name.Find(".BMP",0) == -1)
				name += ".bmp";
		// if has .BMP replace with .bmp
		name.Replace(".BMP",".bmp");

		// create fileSave to save picture
		CFile fileBMP(name,CFile::modeCreate|CFile::modeWrite);
		// save picture to DB (hisDB folder)
		::SaveDIB(hDIB, fileBMP);
		fileBMP.Close();

		// change file type to save histogram
		name.Replace(".bmp",".his");
		// create file to write hisFile
		
		CFile fileHis(name,CFile::modeCreate|CFile::modeWrite);
		// copy data to buffer
		CString fileBuff = target0;
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		fileBuff = target1;
		// write from buffer to file
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		// dieo modify write 5 part to file
		fileBuff = target2;
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		fileBuff = target3;
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		fileBuff = target4;
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		fileBuff = target5;
		fileHis.Write((LPCSTR)fileBuff,fileBuff.GetLength());
		fileHis.Close();
		// end dieo modify
}

ToScreen StoreHistogram(ToScreen bu,HSVQUAD value)
{
	//STORE HISTOGRAM TO BUFFER
	 //ToScreen bu;
	 //bu = bu1;
	switch(value.Hue) {      // store hue
		case 0: ++bu.hue[0];break;
		case 1: ++bu.hue[1];break;
		case 2: ++bu.hue[2];break;
		case 3: ++bu.hue[3];break;
		case 4: ++bu.hue[4];break;
		case 5: ++bu.hue[5];break;
		case 6: ++bu.hue[6];break;
		case 7: ++bu.hue[7];break;
		case 8: ++bu.hue[8];break;
		case 9: ++bu.hue[9];break;
		case 10: ++bu.hue[10];break;
		case 11: ++bu.hue[11];break;
		case 12: ++bu.hue[12];break;
		case 13: ++bu.hue[13];break;
		case 14: ++bu.hue[14];break;
		case 15: ++bu.hue[15];break;
		case 16: ++bu.hue[16];break;
		case 17: ++bu.hue[17];break;
		default: ++bu.hue[18];
	}
				
	switch (value.Saturation){  //store Saturation
		case 0 : ++bu.sat[0];break;
		case 1 : ++bu.sat[1];break;
		case 2 : ++bu.sat[2];break;
		default : ++bu.sat[3];
	}
	switch (value.Value){		//store Value
		case 0 : ++bu.val[0];break;
		case 1 : ++bu.val[1];break;
		case 2 : ++bu.val[2];break;
		default : ++bu.val[3];
	}
	switch (value.Gray){		//store Gray
		case 0 : ++bu.gra[0];break;
		case 1 : ++bu.gra[1];break;
		case 2 : ++bu.gra[2];break;
		case 3 : ++bu.gra[3];break;
		default : ++bu.gra[4];
	}

	return bu;
// END STORE HISTOGRAM TO BUFFER (each point per loop)
}

