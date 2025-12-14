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

#pragma once

#include <d3d8.h>			// Header File For The Direct3D8 Library

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library

#include "Abtree.h"			// Header File For Use CAbtree
#include "Abstract.h"		// Header File For Use CAbstact
#include "GLGfx.h"          // Header File For Use CGLGfx  (check InitDeviceObjects promt )

#include "Util.h"
#include "Logger.h"
#include "Math.h"

/////////////////////////////////////////////////////////////////////////////
//	User Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class		CUseTexture
//
//	Function		CUseTexture.Use(const CString strFileName);
//	Function		CUseTexture.UnUse();
//
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
//	User static Interface
/////////////////////////////////////////////////////////////////////////////
//
//	Class	CTextureManage
//
//	Static Function CTextureManage::StaticInitDeviceObject();
//	Static Function CTextureManage::StaticDeleteDeviceObject();
//	Static Function CTextureManage::StaticFinalCleanUp();
//
/////////////////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////////////////
// Private for code only ( not access )
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////
// Class CTexture
/////////////////////////////////////////////////////////////////////

class CTexture : public CAbstract  
{
private:
	GLuint m_Texture;
	BOOL  m_bUseMipmap;
	int  m_nNumber;

/*
	AUX_RGBImageRec *LoadBMP( const CString& strName)				// Loads A Bitmap Image
	{
		FILE *File=NULL;									// File Handle

		if (strName.IsEmpty())										// Make Sure A Filename Was Given
		{
			return NULL;									// If Not Return NULL
		}

		File=fopen(LPCSTR(strName),"r");							// Check To See If The File Exists

		if (File)											// Does The File Exist?
		{
			fclose(File);									// Close The Handle
			return auxDIBImageLoad(LPCSTR(strName));				// Load The Bitmap And Return A Pointer
		}
			
		return NULL;										// If Load Failed Return NULL
	}
*/
	int LoadGLTextures(const CString& strName)									// Load Bitmaps And Convert To Textures
	{
		int Status=FALSE;							// Status Indicator
		TGAFILE *TextureImage[1];					// Create Storage Space For The Texture
		TextureImage[0] = (TGAFILE*)malloc(sizeof(TGAFILE));
		
		if (Image::LoadTGAFile(strName,TextureImage[0]))
		{
			Status=TRUE;									// Set The Status To TRUE

			glGenTextures(1, &m_Texture);					// Create The Texture

			// Typical Texture Generation Using Data From The Bitmap
			glBindTexture(GL_TEXTURE_2D, m_Texture );

			int ColorMode;
			if( TextureImage[0]->bitCount == 32 )
			{
				ColorMode = GL_RGBA;
			}
			else if ( TextureImage[0]->bitCount == 24 )
			{
				ColorMode = GL_RGB;	
			}
			else
			{
				Log("Error In  LoadGLTextures( CString strName)");
				ASSERT(FALSE);
			}
	
			int nWidth  = TextureImage[0]->imageWidth;
			int nHeight = TextureImage[0]->imageHeight;

/* commented by AJ
			BOOL bTypeTest = FALSE;

			for (int nCount = 0 ; nCount <= 10  ; nCount++)
			{
				if ( float(nWidth) == (float(pow(2,nCount)))  )
				{
					bTypeTest = TRUE;
				}
			}

			if ( ! bTypeTest )
			{
				Log("Size of texture error !");
				ASSERT(FALSE);
			}
*/

			if ( m_bUseMipmap )
			{
				glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
				glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR_MIPMAP_LINEAR/*GL_NEAREST_MIPMAP_LINEAR*/);
				gluBuild2DMipmaps(GL_TEXTURE_2D,ColorMode, nWidth , 
												  nHeight,
												  ColorMode, 
												  GL_UNSIGNED_BYTE, 
												  TextureImage[0]->imageData );
			}
			else
			{
				glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
				glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
				glTexImage2D(GL_TEXTURE_2D, 0, ColorMode, nWidth , 
												  nHeight, 
												  0, 
												  ColorMode, 
												  GL_UNSIGNED_BYTE, 
												  TextureImage[0]->imageData );
			}

		}

		if (TextureImage[0])									// If Texture Exists
		{
			if (TextureImage[0]->imageData)							// If Texture Image Exists
			{
				free(TextureImage[0]->imageData);					// Free The Texture Image Memory
			}

			free(TextureImage[0]);								// Free The Image Structure
		}

		return Status;										// Return The Status

	}


	//function to implement
	void _OneTime()
	{
		//Do Create data from  member "m_strKey" to "m_Texture"
	}

	void _FinalClean()
	{
		//Do Delete data from "m_Texture"
		//don't forget set m_Texture to NULL if it is Pointer
	}
	
	void _InitDevice()
	{
		//Do Create data from  member "m_strKey" to "m_Texture"
		LoadGLTextures(m_strKey);
	}

	void _DeleteDevice()
	{
		//Do Delete data from "m_Texture"
		//don't forget set m_Texture to NULL if it is Pointer
		glDeleteTextures(1, &m_Texture);
		m_Texture = NULL;
	}

public:
	CTexture(const CString& strName,BOOL bUseMipMap);
	virtual ~CTexture();

public:
	virtual HRESULT DeleteDeviceObjects();
	virtual HRESULT InitDeviceObjects();
	virtual HRESULT OneTimeSceneInit();
	virtual HRESULT FinalCleanup();

	int		DeleteTexture();
	BOOL	AddTexture();
	
	GLuint GetTexture() { return (m_nNumber>0)?m_Texture:0; }
};

/////////////////////////////////////////////////////////////////////
// Class CTextureManage
/////////////////////////////////////////////////////////////////////
class CTextureManage 
{
private :
	static CAbTree AbTree;

public:

	// Static for Implementation this Class
	static void StaticInitDeviceObjects();
	static void StaticDeleteDeviceObjects();
	static void StaticFinalCleanUp();

	static int GetSize(){return AbTree.GetSize();}

private:
	// User Interface
	static GLuint Add( const CString& pName, BOOL bUseMipMap);
	static GLuint GetTexture( const CString& pName);
	static CTexture *	GetpTexture( const CString& pName);
	static void Remove( const CString& pName);

	friend class CUseTexture;

};



/////////////////////////////////////////////////////////////////////
// Class CUseTexture 
// Desc : User interface class
/////////////////////////////////////////////////////////////////////
class CUseTexture
{
public:
	CUseTexture() { m_bCreate = FALSE; pTexture = NULL; }
	//CUseTexture( const CString pName ) { m_bCreate = FALSE; pTexture = NULL; Use(pName); }
	~CUseTexture() { UnUse(); }

private :
	CString m_strKey;
	BOOL m_bCreate;
	CTexture * pTexture;

public:

	void UnUse()
	{
		if ( m_bCreate )
		{
			m_bCreate = FALSE;
			CTextureManage::Remove(m_strKey);
		}
		m_strKey.Empty();
		pTexture = NULL;
	}

	void Use( const CString& pName ,BOOL bUseMipMap = TRUE )
	{
		if (pName.IsEmpty()) return; // check error

		if ( m_bCreate )
		{
			if (pName == m_strKey) return;
			CTextureManage::Add(pName, bUseMipMap);
			CTextureManage::Remove(m_strKey);

			m_strKey = pName;					
			pTexture = CTextureManage::GetpTexture(m_strKey);
		}
		else
		{

			m_bCreate = TRUE;
			m_strKey = pName;

			CTextureManage::Add(m_strKey, bUseMipMap);
			pTexture = CTextureManage::GetpTexture(m_strKey);
		}
	}

	GLuint Get()
	{
		return ( pTexture != NULL ) ? pTexture->GetTexture():NULL;
	}

};


