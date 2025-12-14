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

#include "Text2D.h"
#include "Util.h"


CUseTexture    CText2D::Texture[6];


// put character;
void CText2D::PutChar(	int ascii,
                        float X1,//Start Position of picture on X Axis
	                    float Y1,//Start Position of picture on Y Axis
	                    float Z //Position of z
                        )
{
	float Tu1,Tv1;

	CUseTexture * surface;

	if ((ascii>=65)&&(ascii<90))	surface = &Texture[1]; else 
	if ((ascii>=97)&&(ascii<122))	surface = &Texture[2]; else 
	if ((ascii>=161)&&(ascii<=185))	surface = &Texture[3]; else 
	if ((ascii>=186)&&(ascii<=210)) surface = &Texture[4]; else 
	if ((ascii>=211)&&(ascii<=236)) surface = &Texture[5]; else 
								    surface = &Texture[0];

	if ((ascii>=65)&&(ascii<90)){
		Tu1=((ascii-65)%5)*0.2f;
		Tv1=(int((ascii-65)/5))*0.2f;
	}else
	if ((ascii>=97)&&(ascii<122)){
		Tu1=((ascii-97)%5)*0.2f;
		Tv1=(int((ascii-97)/5))*0.2f;
	}else
	if ((ascii>=161)&&(ascii<=185)){
		Tu1=((ascii-161)%5)*0.2f;
		Tv1=(int((ascii-161)/5))*0.2f;
	}else
	if ((ascii>=186)&&(ascii<=210)){
		Tu1=((ascii-186)%5)*0.2f;
		Tv1=(int((ascii-186)/5))*0.2f;
	}else
	if ((ascii>=211)&&(ascii<=217)){
		Tu1=((ascii-211)%5)*0.2f;
		Tv1=(int((ascii-211)/5))*0.2f;
	}else
	if ((ascii>=224)&&(ascii<=228)){
		Tu1=((ascii-217)%5)*0.2f;
		Tv1=(int((ascii-217)/5))*0.2f;
	}else
	if ((ascii>=230)&&(ascii<=236)){
		Tu1=((ascii-218)%5)*0.2f;
		Tv1=(int((ascii-218)/5))*0.2f;
	}else
	if ((ascii>=46)&&(ascii<=58)){
		Tu1=((ascii-42)%5)*0.2f;
		Tv1=(int((ascii-42)/5))*0.2f;
	}else{
		switch (ascii){
		case 33:  Tu1=0.0f;Tv1=0.0f; break;// !			
		case 34:  Tu1=0.2f;Tv1=0.0f; break;// "
		case 39:  Tu1=0.4f;Tv1=0.0f; break;// '
		case 42:  Tu1=0.2f;Tv1=0.8f; break;// *
		case 43:  Tu1=0.6f;Tv1=0.6f; break;// +
		case 44:  Tu1=0.6f;Tv1=0.0f; break;// ,
		case 45:  Tu1=0.8f;Tv1=0.6f; break;// ,
		case 61:  Tu1=0.0f;Tv1=0.8f; break;// =
		case 63:  Tu1=0.4f;Tv1=0.6f; break;// ,
		case 90:  Tu1=0.6f;Tv1=0.8f; break;// Z
		case 122: Tu1=0.8f;Tv1=0.8f; break;// z
		default: return;
		};
	};

	PutPictureIn2D(surface,X1,Y1,X1+Const_WidthChar,Y1+Const_HeightChar-0.001f,Z,
					Tu1/*+0.001f*/,Tv1+0.0f,Tu1+0.197f,Tv1+0.195f);

};




// use to create surface for text 
void CText2D::CreateCharSurface()
{
	Texture[0].CUseTexture::Use("Resource\\Texture\\SignalandNumber.tga");
	Texture[1].CUseTexture::Use("Resource\\Texture\\EngBig.tga");
	Texture[2].CUseTexture::Use("Resource\\Texture\\EngSmall.tga");
	Texture[3].CUseTexture::Use("Resource\\Texture\\Thai_161_185.tga");
	Texture[4].CUseTexture::Use("Resource\\Texture\\Thai_186_210.tga");
	Texture[5].CUseTexture::Use("Resource\\Texture\\Thai_211_236.tga");
		
};// end createSurface




//-----------------------------------------------------------------------------
// Name: Putstring
// Desc: Function use to put String 2D in 3D World
//-----------------------------------------------------------------------------
void CText2D::Putstring(
							 const CString& strString ,         // Number to put on screen 
							 float X,               // Position on X Axis
							 float Y,               // Position on Y Axis
							 float Z,          // Position on Z Axis
							 DWORD color  // color of fonts
							 )	      

{   
	//glEnable(GL_BLEND);									// Enable Blending
	//glBlendFunc(GL_SRC_ALPHA,GL_ONE);					// Select The Type Of Blending
	BOOL IsBlend = glIsEnabled(GL_BLEND);

	glEnable(GL_BLEND);
	//glEnable(GL_ALPHA_TEST);
	glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);	// Select The Type Of Blending
	//glAlphaFunc(GL_GREATER,0.0f);

	glColor4f( (color>>24)/255.0f ,
		((color>>16)&0xff)/255.0f,
		((color>>8)&0xff)/255.0f,
		((color)&0xff)/255.0f
		);

	//glColor3f( 1.0f,1.0f,1.0f);

	const char * string = LPCTSTR(strString);


	int old_1=97;
	int old_2=97;
	
	float nowX=X,nowY=Y;

	for(unsigned int i=0;i<strlen(string);i++){

	int Nextascii=(i>=strlen(string))?0:byte(string[i+1]);
	int ascii=byte(string[i]);

		
		float const_x=aryFont[ascii].X;
		float const_y=aryFont[ascii].Y;

		if (isBigThai(old_1) && (isUpperThai1(ascii)||isUpperThai2(ascii)) )
		const_x-=Value3D_W(7);
		
		if ( isUpperThai1(old_1)&&(isUpperThai2(ascii))){
			const_y-=Value3D_H(15);
		};
		if ((Nextascii==211)&&(isUpperThai2(ascii))){
			const_y-=Value3D_H(15);
		};

		if ( isBigThai(old_2) &&
			 ( isUpperThai1(old_1)||isLowerThai1(old_1) ) &&
			 isUpperThai2(ascii)
		   ) 
			const_x-=Value3D_W(7);

		PutChar( ascii, 
				     nowX+const_x ,nowY+const_y,     //x1,y1                      
					 Z);

		if (ascii==211)	{
		PutChar( (ascii-1),
				     nowX ,nowY ,     //x1,y1                      
					 Z);
		};

	
    	nowX+=aryFont[ascii].Width;

			old_2=old_1;
			old_1=ascii;
	};


	if ( ! IsBlend )
	{
		glDisable(GL_BLEND);
	}
};

//Function return Width of String
float CText2D::GetWidthStr(char string[80])
{

	float Sumwidth=0.0f; 
	int i=0;	

	while(i<byte(strlen(string)))
	{
		Sumwidth+=aryFont[byte(string[i])].Width;
		i++;
	};

	return(Sumwidth);
};


// put picture in 2D
void CText2D::PutPictureIn2D (   
					CUseTexture * pTexture,//surface of picture
					float X1,//Start Position of picture on X Axis
					float Y1,//Start Position of picture on Y Axis
					float X2,//End Position of picture on X Axis
					float Y2,//End Position of picture on Y Axis
					float Z, //Position of z
					float TU_1,// start TU
					float TV_1,// start TU
					float TU_2,// start TU
					float TV_2// start TU
					)//Destridestnation Blend
{
							// Enable Texture Mapping ( NEW )

	BOOL bTex2D = glIsEnabled(GL_TEXTURE_2D);

	if ( pTexture != NULL )
	{
		glBindTexture(GL_TEXTURE_2D, pTexture->Get() );
		glEnable(GL_TEXTURE_2D);
	}
	else
	{
		glDisable(GL_TEXTURE_2D);
	}

	GLGfx::BeginDraw( GLDrawMode::QUADS  );

	//Front Face		
	glTexCoord2f(TU_1, -TV_1 );   glVertex3f( (-0.5f+X1), (0.5f-Y1),  1.204f+Z);
	glTexCoord2f(TU_2, -TV_1 );   glVertex3f( (-0.5f+X2), (0.5f-Y1),  1.204f+Z);
	glTexCoord2f(TU_2, -TV_2 );   glVertex3f( (-0.5f+X2), (0.5f-Y2),  1.204f+Z);
	glTexCoord2f(TU_1, -TV_2 );   glVertex3f( (-0.5f+X1), (0.5f-Y2),  1.204f+Z);

	GLGfx::EndDraw();

	if ( bTex2D )
	{
		glEnable(GL_TEXTURE_2D);
	}
	else
	{
		glDisable(GL_TEXTURE_2D);
	}

};

