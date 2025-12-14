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
#include "GLGfx.h"
#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library
#include "Util.h"
#include "Logger.h"

//==================Extension 1.3====================
#include <GL/glext.h>
//#include <GL/wglext.h>
//===================================================

// Constant
const D3DXMATRIX IMat = D3DXMATRIX( 1, 0, 0, 0,
									0, 1, 0, 0,
									0, 0, 1, 0,
									0, 0, 0, 1 );

// Init Static Variable
HDC   GLGfx::m_hDC  = NULL;	   // Private GDI Device Context
HGLRC GLGfx::m_hRC  = NULL;    // Permanent Rendering Context
HWND  GLGfx::m_hWnd = NULL;    // Holds Our Window Handle

// Matrix World, View and Projection
D3DXMATRIX GLGfx::m_MatWorld = IMat;
D3DXMATRIX GLGfx::m_MatView  = IMat;
D3DXMATRIX GLGfx::m_MatProj  = IMat;

D3DXMATRIX GLGfx::m_SaveMatWorld = IMat;
D3DXMATRIX GLGfx::m_SaveMatView  = IMat;
D3DXMATRIX GLGfx::m_SaveMatProj  = IMat;

// Engine Prompt State
BOOL       GLGfx::m_bGLGfxPrompt       = FALSE;

//================================================================
// Init Extension
//================================================================
#ifdef USE_WGL_ARB_buffer_region
	PFNWGLCREATEBUFFERREGIONARBPROC   GLGfx::CreateBufferRegionARB  = NULL;
	PFNWGLDELETEBUFFERREGIONARBPROC   GLGfx::DeleteBufferRegionARB  = NULL;
	PFNWGLSAVEBUFFERREGIONARBPROC     GLGfx::SaveBufferRegionARB    = NULL;
	PFNWGLRESTOREBUFFERREGIONARBPROC  GLGfx::RestoreBufferRegionARB = NULL;
#endif

#ifdef USE_GL_ARB_multitexture
	PFNGLACTIVETEXTUREARBPROC         GLGfx::ActiveTextureARB       = NULL;
	PFNGLCLIENTACTIVETEXTUREARBPROC   GLGfx::ClientActiveTextureARB = NULL;
	PFNGLMULTITEXCOORD1DARBPROC       GLGfx::MultiTexCoord1dARB     = NULL;
	PFNGLMULTITEXCOORD1DVARBPROC      GLGfx::MultiTexCoord1dvARB    = NULL;
	PFNGLMULTITEXCOORD1FARBPROC       GLGfx::MultiTexCoord1fARB     = NULL;     
	PFNGLMULTITEXCOORD1FVARBPROC      GLGfx::MultiTexCoord1fvARB    = NULL;
	PFNGLMULTITEXCOORD1IARBPROC       GLGfx::MultiTexCoord1iARB     = NULL;
	PFNGLMULTITEXCOORD1IVARBPROC      GLGfx::MultiTexCoord1ivARB    = NULL;
	PFNGLMULTITEXCOORD1SARBPROC       GLGfx::MultiTexCoord1sARB     = NULL;
	PFNGLMULTITEXCOORD1SVARBPROC      GLGfx::MultiTexCoord1svARB    = NULL;
	PFNGLMULTITEXCOORD2DARBPROC       GLGfx::MultiTexCoord2dARB     = NULL;
	PFNGLMULTITEXCOORD2DVARBPROC      GLGfx::MultiTexCoord2dvARB    = NULL;
	PFNGLMULTITEXCOORD2FARBPROC       GLGfx::MultiTexCoord2fARB     = NULL;
	PFNGLMULTITEXCOORD2FVARBPROC      GLGfx::MultiTexCoord2fvARB    = NULL; 
	PFNGLMULTITEXCOORD2IARBPROC       GLGfx::MultiTexCoord2iARB     = NULL;
	PFNGLMULTITEXCOORD2IVARBPROC      GLGfx::MultiTexCoord2ivARB    = NULL;
	PFNGLMULTITEXCOORD2SARBPROC       GLGfx::MultiTexCoord2sARB     = NULL;
	PFNGLMULTITEXCOORD2SVARBPROC      GLGfx::MultiTexCoord2svARB    = NULL;
	PFNGLMULTITEXCOORD3DARBPROC       GLGfx::MultiTexCoord3dARB     = NULL;
	PFNGLMULTITEXCOORD3DVARBPROC      GLGfx::MultiTexCoord3dvARB    = NULL;
	PFNGLMULTITEXCOORD3FARBPROC       GLGfx::MultiTexCoord3fARB     = NULL;
	PFNGLMULTITEXCOORD3FVARBPROC      GLGfx::MultiTexCoord3fvARB    = NULL;
	PFNGLMULTITEXCOORD3IARBPROC       GLGfx::MultiTexCoord3iARB     = NULL;
	PFNGLMULTITEXCOORD3IVARBPROC      GLGfx::MultiTexCoord3ivARB    = NULL; 
	PFNGLMULTITEXCOORD3SARBPROC       GLGfx::MultiTexCoord3sARB     = NULL;
	PFNGLMULTITEXCOORD3SVARBPROC      GLGfx::MultiTexCoord3svARB    = NULL;
	PFNGLMULTITEXCOORD4DARBPROC       GLGfx::MultiTexCoord4dARB     = NULL;
	PFNGLMULTITEXCOORD4DVARBPROC      GLGfx::MultiTexCoord4dvARB    = NULL;
	PFNGLMULTITEXCOORD4FARBPROC       GLGfx::MultiTexCoord4fARB     = NULL;
	PFNGLMULTITEXCOORD4FVARBPROC      GLGfx::MultiTexCoord4fvARB    = NULL;
	PFNGLMULTITEXCOORD4IARBPROC       GLGfx::MultiTexCoord4iARB     = NULL;
	PFNGLMULTITEXCOORD4IVARBPROC      GLGfx::MultiTexCoord4ivARB    = NULL;
	PFNGLMULTITEXCOORD4SARBPROC       GLGfx::MultiTexCoord4sARB     = NULL;
	PFNGLMULTITEXCOORD4SVARBPROC      GLGfx::MultiTexCoord4svARB    = NULL;
#endif

#ifdef USE_WGL_ARB_pbuffer
	PFNWGLCREATEPBUFFERARBPROC        GLGfx::CreatePbufferARB       = NULL;
    PFNWGLGETPBUFFERDCARBPROC         GLGfx::GetPbufferDCARB        = NULL;
    PFNWGLRELEASEPBUFFERDCARBPROC     GLGfx::ReleasePbufferDCARB    = NULL;
	PFNWGLDESTROYPBUFFERARBPROC       GLGfx::DestroyPbufferARB      = NULL;
    PFNWGLQUERYPBUFFERARBPROC         GLGfx::QueryPbufferARB        = NULL;
#endif

#ifdef USE_WGL_ARB_pixel_format
    PFNWGLGETPIXELFORMATATTRIBIVARBPROC GLGfx::GetPixelFormatAttribivARB = NULL;
    PFNWGLGETPIXELFORMATATTRIBFVARBPROC GLGfx::GetPixelFormatAttribfvARB = NULL;
    PFNWGLCHOOSEPIXELFORMATARBPROC      GLGfx::ChoosePixelFormatARB      = NULL;
#endif

//================================================================
BOOL GLGfx::InitExtension()
{
#ifdef CANDID_GLGFX_LOG
	Log( "Begin(GLGfx::InitExtension)");
#endif

	char *extensions;	
	extensions = (char *)glGetString(GL_EXTENSIONS);
	int len=strlen(extensions);
	for (int i=0; i<len; i++)										// Separate It By Newline Instead Of Blank
	{
		if (extensions[i]==' ') extensions[i]='\n';
	}

	//===============Init GL Extension Here=======================
#ifdef USE_GL_ARB_multitexture

	// Log Message
#ifdef CANDID_GLGFX_LOG
	Log("	USE_GL_ARB_multitexture");
#endif

	if ( String::IsInString(extensions,"GL_ARB_multitexture") )			
	{	
		ActiveTextureARB       = (PFNGLACTIVETEXTUREARBPROC)      wglGetProcAddress("glActiveTextureARB");
		ClientActiveTextureARB = (PFNGLCLIENTACTIVETEXTUREARBPROC)wglGetProcAddress("glClientActiveTextureARB");

		MultiTexCoord1dARB      = (PFNGLMULTITEXCOORD1DARBPROC)    wglGetProcAddress("glMultiTexCoord1dARB");
		MultiTexCoord1dvARB     = (PFNGLMULTITEXCOORD1DVARBPROC)   wglGetProcAddress("glMultiTexCoord1dvARB");
		MultiTexCoord1fARB      = (PFNGLMULTITEXCOORD1FARBPROC)    wglGetProcAddress("glMultiTexCoord1fARB");		     
		MultiTexCoord1fvARB     = (PFNGLMULTITEXCOORD1FVARBPROC)   wglGetProcAddress("glMultiTexCoord1fvARB");			    
		MultiTexCoord1iARB      = (PFNGLMULTITEXCOORD1IARBPROC)    wglGetProcAddress("glMultiTexCoord1iARB");		
		MultiTexCoord1ivARB     = (PFNGLMULTITEXCOORD1IVARBPROC)   wglGetProcAddress("glMultiTexCoord1ivARB");			
		MultiTexCoord1sARB      = (PFNGLMULTITEXCOORD1SARBPROC)    wglGetProcAddress("glMultiTexCoord1sARB");		    
		MultiTexCoord1svARB     = (PFNGLMULTITEXCOORD1SVARBPROC)   wglGetProcAddress("glMultiTexCoord1svARB");		     
	
		MultiTexCoord2dARB      = (PFNGLMULTITEXCOORD2DARBPROC)    wglGetProcAddress("glMultiTexCoord2dARB");
		MultiTexCoord2dvARB     = (PFNGLMULTITEXCOORD2DVARBPROC)   wglGetProcAddress("glMultiTexCoord2dvARB");
		MultiTexCoord2fARB      = (PFNGLMULTITEXCOORD2FARBPROC)    wglGetProcAddress("glMultiTexCoord2fARB");		     
		MultiTexCoord2fvARB     = (PFNGLMULTITEXCOORD2FVARBPROC)   wglGetProcAddress("glMultiTexCoord2fvARB");			    
		MultiTexCoord2iARB      = (PFNGLMULTITEXCOORD2IARBPROC)    wglGetProcAddress("glMultiTexCoord2iARB");		
		MultiTexCoord2ivARB     = (PFNGLMULTITEXCOORD2IVARBPROC)   wglGetProcAddress("glMultiTexCoord2ivARB");			
		MultiTexCoord2sARB      = (PFNGLMULTITEXCOORD2SARBPROC)    wglGetProcAddress("glMultiTexCoord2sARB");		    
		MultiTexCoord2svARB     = (PFNGLMULTITEXCOORD2SVARBPROC)   wglGetProcAddress("glMultiTexCoord2svARB");
		
		MultiTexCoord3dARB      = (PFNGLMULTITEXCOORD3DARBPROC)    wglGetProcAddress("glMultiTexCoord3dARB");
		MultiTexCoord3dvARB     = (PFNGLMULTITEXCOORD3DVARBPROC)   wglGetProcAddress("glMultiTexCoord3dvARB");
		MultiTexCoord3fARB      = (PFNGLMULTITEXCOORD3FARBPROC)    wglGetProcAddress("glMultiTexCoord3fARB");		     
		MultiTexCoord3fvARB     = (PFNGLMULTITEXCOORD3FVARBPROC)   wglGetProcAddress("glMultiTexCoord3fvARB");			    
		MultiTexCoord3iARB      = (PFNGLMULTITEXCOORD3IARBPROC)    wglGetProcAddress("glMultiTexCoord3iARB");		
		MultiTexCoord3ivARB     = (PFNGLMULTITEXCOORD3IVARBPROC)   wglGetProcAddress("glMultiTexCoord3ivARB");			
		MultiTexCoord3sARB      = (PFNGLMULTITEXCOORD3SARBPROC)    wglGetProcAddress("glMultiTexCoord3sARB");		    
		MultiTexCoord3svARB     = (PFNGLMULTITEXCOORD3SVARBPROC)   wglGetProcAddress("glMultiTexCoord3svARB");

		MultiTexCoord4dARB      = (PFNGLMULTITEXCOORD4DARBPROC)    wglGetProcAddress("glMultiTexCoord4dARB");
		MultiTexCoord4dvARB     = (PFNGLMULTITEXCOORD4DVARBPROC)   wglGetProcAddress("glMultiTexCoord4dvARB");
		MultiTexCoord4fARB      = (PFNGLMULTITEXCOORD4FARBPROC)    wglGetProcAddress("glMultiTexCoord4fARB");		     
		MultiTexCoord4fvARB     = (PFNGLMULTITEXCOORD4FVARBPROC)   wglGetProcAddress("glMultiTexCoord4fvARB");			    
		MultiTexCoord4iARB      = (PFNGLMULTITEXCOORD4IARBPROC)    wglGetProcAddress("glMultiTexCoord4iARB");		
		MultiTexCoord4ivARB     = (PFNGLMULTITEXCOORD4IVARBPROC)   wglGetProcAddress("glMultiTexCoord4ivARB");			
		MultiTexCoord4sARB      = (PFNGLMULTITEXCOORD4SARBPROC)    wglGetProcAddress("glMultiTexCoord4sARB");		    
		MultiTexCoord4svARB     = (PFNGLMULTITEXCOORD4SVARBPROC)   wglGetProcAddress("glMultiTexCoord4svARB");
	}
#endif
	//============================================================
/*
	char *wextensions;
	int  wLen = 0;
	PFNWGLGETEXTENSIONSSTRINGARBPROC wglGetExtensionsStringARB = 0;
	wglGetExtensionsStringARB = (PFNWGLGETEXTENSIONSSTRINGARBPROC)wglGetProcAddress("wglGetExtensionsStringARB");
	if(wglGetExtensionsStringARB)
	{
		wextensions = (char *)wglGetExtensionsStringARB(wglGetCurrentDC());
		wLen        = strlen(wextensions);
	}
	for (i=0; i<wLen; i++)										// Separate It By Newline Instead Of Blank
	{
		if (extensions[i]==' ') extensions[i]='\n';
	}
*/
	//==============Init WGL Extension Here=======================
	// Init Buffer Region
#ifdef USE_WGL_ARB_buffer_region

#ifdef CANDID_GLGFX_LOG
	Log("	USE_WGL_ARB_buffer_region");
#endif

	if( String::IsInString( wextensions, "WGL_ARB_buffer_region" ) )
	{
		CreateBufferRegionARB  = (PFNWGLCREATEBUFFERREGIONARBPROC) wglGetProcAddress("wglCreateBufferRegionARB");
		DeleteBufferRegionARB  = (PFNWGLDELETEBUFFERREGIONARBPROC) wglGetProcAddress("wglDeleteBufferRegionARB");
		SaveBufferRegionARB    = (PFNWGLSAVEBUFFERREGIONARBPROC)   wglGetProcAddress("wglSaveBufferRegionARB");
		RestoreBufferRegionARB = (PFNWGLRESTOREBUFFERREGIONARBPROC)wglGetProcAddress("wglRestoreBufferRegionARB");

		ASSERT(CreateBufferRegionARB);
		ASSERT(DeleteBufferRegionARB);
		ASSERT(SaveBufferRegionARB);
		ASSERT(RestoreBufferRegionARB);
	}
	else
	{
		ASSERT(FALSE);
	}
#endif

#ifdef USE_WGL_ARB_pbuffer

#ifdef CANDID_GLGFX_LOG
	Log("	USE_WGL_ARB_pbuffer");
#endif

	if( String::IsInString( wextensions, "WGL_ARB_pbuffer" ) )
	{
		CreatePbufferARB     =  (PFNWGLCREATEPBUFFERARBPROC)    wglGetProcAddress("wglCreatePbufferARB");
		GetPbufferDCARB      =  (PFNWGLGETPBUFFERDCARBPROC)     wglGetProcAddress("wglGetPbufferDCARB");
        ReleasePbufferDCARB  =  (PFNWGLRELEASEPBUFFERDCARBPROC) wglGetProcAddress("wglReleasePbufferDCARB");   
        DestroyPbufferARB    =  (PFNWGLDESTROYPBUFFERARBPROC)   wglGetProcAddress("wglDestroyPbufferARB");   	     
        QueryPbufferARB      =  (PFNWGLQUERYPBUFFERARBPROC)     wglGetProcAddress("wglQueryPbufferARB");		   
	}
#endif

#ifdef USE_WGL_ARB_pixel_format

#ifdef CANDID_GLGFX_LOG
	Log("	WGL_ARB_pixel_format");
#endif

	if( String::IsInString( wextensions, "WGL_ARB_pixel_format" ) )
	{
        GetPixelFormatAttribivARB = (PFNWGLGETPIXELFORMATATTRIBIVARBPROC) wglGetProcAddress("wglGetPixelFormatAttribivARB");
        GetPixelFormatAttribfvARB = (PFNWGLGETPIXELFORMATATTRIBFVARBPROC) wglGetProcAddress("wglGetPixelFormatAttribfvARB");         
        ChoosePixelFormatARB      = (PFNWGLCHOOSEPIXELFORMATARBPROC)      wglGetProcAddress("wglChoosePixelFormatARB");          
	}
#endif

	//============================================================
#ifdef CANDID_GLGFX_LOG
	Log( "End(GLGfx::InitExtension)");
#endif 

	return TRUE;
}

//================================================================
// Init OpenGL
//================================================================
HRESULT GLGfx::InitGL( HWND hWnd, int ColorDepth/*16 32*/ )
{
#ifdef CANDID_GLGFX_LOG
	Log( "Begin(GLGfx::InitGL)");
#endif

	// Assign Windows handle
	m_hWnd = hWnd;

	// Holds The Results After Searching For A Match
	GLuint		PixelFormat;	

	// pfd Tells Windows How We Want Things To Be
	PIXELFORMATDESCRIPTOR pfd =				
	{
		sizeof(PIXELFORMATDESCRIPTOR),				// Size Of This Pixel Format Descriptor
		1,											// Version Number
		PFD_DRAW_TO_WINDOW |						// Format Must Support Window
		PFD_SUPPORT_OPENGL |						// Format Must Support OpenGL
		PFD_DOUBLEBUFFER,							// Must Support Double Buffering
		PFD_TYPE_RGBA,								// Request An RGBA Format
		ColorDepth,									// Select Our Color Depth
		0, 0, 0, 0, 0, 0,							// Color Bits Ignored
		0,											// No Alpha Buffer
		0,											// Shift Bit Ignored
		0,											// No Accumulation Buffer
		0, 0, 0, 0,									// Accumulation Bits Ignored
		32,											// 16Bit Z-Buffer (Depth Buffer)  
		16,											// 16Bit Stencil Buffer
		0,											// No Auxiliary Buffer
		PFD_MAIN_PLANE,								// Main Drawing Layer
		0,											// Reserved
		0, 0, 0										// Layer Masks Ignored
	};
	
	// Try to Get Device Context
	if (!(m_hDC = ::GetDC(m_hWnd)))							
	{
		Log("	Error:Can't Create A GL Device Context");
		MessageBox(NULL,"Can't Create A GL Device Context.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ReleaseGL();
		return E_FAIL;
	}

	if (!(PixelFormat = ::ChoosePixelFormat(m_hDC,&pfd)))	// Did Windows Find A Matching Pixel Format?
	{
		Log("	Error:Can't Find A Suitable PixelFormat");
		MessageBox(NULL,"Can't Find A Suitable PixelFormat.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ReleaseGL();
		return E_FAIL;
	}

	if(!SetPixelFormat(m_hDC,PixelFormat,&pfd))			// Are We Able To Set The Pixel Format?
	{
		Log("	Error:Can't Set The PixelFormat");
		MessageBox(NULL,"Can't Set The PixelFormat.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ReleaseGL();
		return E_FAIL;
	}

	if (!(m_hRC=wglCreateContext(m_hDC)))				// Are We Able To Get A Rendering Context?
	{
		Log("	Error:Can't Create A GL Rendering Context");
		MessageBox(NULL,"Can't Create A GL Rendering Context.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ReleaseGL();
		return E_FAIL;
	}

	if(!wglMakeCurrent(m_hDC,m_hRC))					// Try To Activate The Rendering Context
	{
		Log("	Error:Can't Activate The GL Rendering Context");
		MessageBox(NULL,"Can't Activate The GL Rendering Context.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ReleaseGL();
		return E_FAIL;
	}
	
	//==================Check Extension=============================================
	if( atof((char *)glGetString(GL_VERSION)) < 1.3f )
	{
		Log("	Error:OpenGL Version is Invalid");
		MessageBox(NULL,"Error:OpenGL Version is Invalid.","ERROR",MB_OK|MB_ICONEXCLAMATION);
		ASSERT( FALSE );
		return E_FAIL;
	}

	//==============================================================================

	char sz[255];
	wsprintf( sz, "	OpenGL version = %s", (char *)glGetString(GL_VERSION));

#ifdef CANDID_GLGFX_LOG
	Log( sz );		
#endif

	TRACE(sz);
	//==============================================================================

	//==================Init Extension==============================================
	InitExtension();
	
#ifdef USE_CANDID_SCREEN_BUFFER
	#ifdef CANDID_GLGFX_LOG
		Log("	USE_CANDID_SCREEN_BUFFER"); 
	#endif
#endif

	//==============================================================================
	// Set Default OpenGL Option
	glShadeModel(GL_SMOOTH);							// Enable Smooth Shading
	glClearColor(0.0f, 0.0f, 0.0f, 0.5f);				// Black Background
	glClearDepth(1.0f);									// Depth Buffer Setup
	glEnable(GL_DEPTH_TEST);							// Enables Depth Testing
	glDepthFunc(GL_LEQUAL);								// The Type Of Depth Testing To Do
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);	// Really Nice Perspective Calculations

	// Set Start Matrix
	m_MatWorld = IMat;
	m_MatView  = IMat;
	m_MatProj  = IMat;

	// Set Start Matrix
	m_SaveMatWorld = IMat;
	m_SaveMatView  = IMat;
	m_SaveMatProj  = IMat;

	m_bGLGfxPrompt = TRUE;

#ifdef CANDID_GLGFX_LOG
	Log( "End(GLGfx::InitGL)");
#endif

	return S_OK;
}

//================================================================
// Release OpenGL
//================================================================
HRESULT GLGfx::ReleaseGL()
{
	ASSERT( m_bGLGfxPrompt );

#ifdef CANDID_GLGFX_LOG
	Log("Begin(GLGfx::ReleaseGL)");
#endif

	m_bGLGfxPrompt = FALSE;

#ifdef USE_CANDID_SCREEN_BUFFER
	//DeleteScreenBuffer();
#endif

	if (m_hRC)											// Do We Have A Rendering Context?
	{
		if (!wglMakeCurrent(NULL,NULL))					// Are We Able To Release The DC And RC Contexts?
		{
			Log("	Error:Release Of DC And RC Failed");
			MessageBox(NULL,"Release Of DC And RC Failed.","SHUTDOWN ERROR",MB_OK | MB_ICONINFORMATION);
			return E_FAIL;
		}

		if (!wglDeleteContext(m_hRC))						// Are We Able To Delete The RC?
		{
			Log("	Error:Release Rendering Context Failed");
			MessageBox(NULL,"Release Rendering Context Failed.","SHUTDOWN ERROR",MB_OK | MB_ICONINFORMATION);
			return E_FAIL;
		}

		m_hRC=NULL;										// Set RC To NULL
	}

	if (m_hDC && !ReleaseDC(m_hWnd,m_hDC))					// Are We Able To Release The DC
	{
		Log("	Error:Release Device Context Failed");
		MessageBox(NULL,"Release Device Context Failed.","SHUTDOWN ERROR",MB_OK | MB_ICONINFORMATION);
		m_hDC=NULL;										// Set DC To NULL
		return E_FAIL;
	}

	// Make sure to NULL before Success
	m_hDC  = NULL;
	m_hWnd = NULL;

#ifdef CANDID_GLGFX_LOG
	Log("End(GLGfx::ReleaseGL)");
#endif

	return S_OK;
}

//================================================================
// ClearScene
//================================================================
HRESULT GLGfx::Clear( GLbitfield mask )
{
	ASSERT( m_bGLGfxPrompt );
	glClear( mask );
	return S_OK;
}

//================================================================
// BeginDraw
//================================================================
HRESULT GLGfx::BeginDraw( GLenum mode )
{
	ASSERT( m_bGLGfxPrompt );
	glBegin( mode );
	return S_OK;
}

//================================================================
// EndDraw
//================================================================
HRESULT GLGfx::EndDraw()
{
	ASSERT( m_bGLGfxPrompt );
	glEnd();
	return S_OK;
}

//================================================================
// SwapBuffers to target device context
//================================================================
BOOL GLGfx::SwapBuffers( HDC TargetDC )
{
	ASSERT( m_bGLGfxPrompt );
	if( TargetDC == NULL )
	{
		::SwapBuffers( m_hDC );
	}
	else
	{
		::SwapBuffers( TargetDC );		
	}

	return S_OK;
}

//================================================================
// MakeCurrent
//================================================================
BOOL GLGfx::MakeCurrent( HDC hDC, HGLRC hRC )
{
	return wglMakeCurrent( hDC, hRC );
}

//================================================================
// Set and Get Matrix
//================================================================
BOOL GLGfx::SetMatWorld( const D3DXMATRIX* pMatWorld )
{
	ASSERT( m_bGLGfxPrompt );

	// Matrix World
	m_MatWorld = *pMatWorld;

	// Matrix World View
	D3DXMATRIX MatWorldView;
	D3DXMatrixMultiply( &MatWorldView, &m_MatWorld, &m_MatView );

	// Convert to GL Coordinate
	D3DXMatrixMultiply( &MatWorldView, &MatWorldView, &(cs::MatDXToGL) );

	// Load Matrix
	glMatrixMode( GL_MODELVIEW );
	glLoadMatrixf( (float *)MatWorldView );
	
	return TRUE;
}

BOOL GLGfx::SetMatView ( const D3DXMATRIX *pMatView  )
{
	ASSERT( m_bGLGfxPrompt );

	// Matrix World
	m_MatView = *pMatView;

	// Matrix World View
	D3DXMATRIX MatWorldView;
	D3DXMatrixMultiply( &MatWorldView, &m_MatWorld, &m_MatView );

	// Convert to GL Coordinate
	D3DXMatrixMultiply( &MatWorldView, &MatWorldView, &(cs::MatDXToGL) );

	// Load Matrix
	glMatrixMode( GL_MODELVIEW );
	glLoadMatrixf( (float *)MatWorldView );
	
	return TRUE;
}

BOOL GLGfx::SetMatProj ( const D3DXMATRIX *pMatProj  )
{
	ASSERT( m_bGLGfxPrompt );
	m_MatProj = *pMatProj;

	// Convert to GL Coordinate ( LH to RH )
	D3DXMATRIX MatProjGL;
	MatProjGL = m_MatProj;

	MatProjGL._31 *= -1;
	MatProjGL._32 *= -1;
	MatProjGL._33 *= -1;
	MatProjGL._34 *= -1;

	glMatrixMode( GL_PROJECTION ); // Select The Projection Matrix
	glLoadMatrixf( (float *)MatProjGL );
	
	return TRUE;
}

void GLGfx::GetMatWorld( D3DXMATRIX* pMatWorld )
{
	ASSERT( m_bGLGfxPrompt );
	*pMatWorld = m_MatWorld;
}

void GLGfx::GetMatView ( D3DXMATRIX* pMatView )
{
	ASSERT( m_bGLGfxPrompt );
	*pMatView  = m_MatView;
}

void GLGfx::GetMatProj ( D3DXMATRIX* pMatProj )
{
	ASSERT( m_bGLGfxPrompt );
	*pMatProj  = m_MatProj;
}

//======================================PreRender Depth Buffer=================================================
#ifdef USE_WGL_ARB_buffer_region
	#ifdef USE_CANDID_SCREEN_BUFFER
		HANDLE     GLGfx::m_hScreenBuffer       = NULL;
		BOOL       GLGfx::m_bScreenBufferPrompt = FALSE;
		int        GLGfx::m_nScreenBufferWidth  = 0;
		int        GLGfx::m_nScreenBufferHeight = 0;
		BOOL GLGfx::CreateScreenBuffer()
		{
			if( !m_bScreenBufferPrompt )
			{
				RECT Rect;
				::GetClientRect( m_hWnd, &Rect );
				m_nScreenBufferWidth  = Rect.right  - Rect.left;
				m_nScreenBufferHeight = Rect.bottom - Rect.top;

				HDC hdc = wglGetCurrentDC();

				DWORD ScreenBufferMode = 0;

				// Color Buffer
				#ifdef CANDID_SCREEN_BUFFER_COLOR
					ScreenBufferMode = ScreenBufferMode|WGL_BACK_COLOR_BUFFER_BIT_ARB;
				#endif

				// Depth Buffer
				#ifdef CANDID_SCREEN_BUFFER_DEPTH
					ScreenBufferMode = ScreenBufferMode|WGL_DEPTH_BUFFER_BIT_ARB;
				#endif

				// Stencil Buffer
				#ifdef CANDID_SCREEN_BUFFER_STENCIL
					ScreenBufferMode = ScreenBufferMode|WGL_STENCIL_BUFFER_BIT_ARB;
				#endif

				ASSERT( ScreenBufferMode != 0 );
				m_hScreenBuffer = GLGfx::CreateBufferRegionARB( hdc,
															    0,
															    ScreenBufferMode );
				ASSERT( m_hScreenBuffer );

				m_bScreenBufferPrompt = TRUE;
				return TRUE;
			}

			return FALSE;
		}

		BOOL GLGfx::DeleteScreenBuffer()
		{
			if( m_bScreenBufferPrompt )
			{
				DeleteBufferRegionARB( m_hScreenBuffer );

				m_hScreenBuffer = NULL;
				m_bScreenBufferPrompt = FALSE;
				m_nScreenBufferWidth  = 0;
				m_nScreenBufferHeight = 0;
				return TRUE;
			}

			return FALSE;
		}

		BOOL GLGfx::SaveScreenBuffer()
		{
			ASSERT( m_bScreenBufferPrompt );
			SaveBufferRegionARB( m_hScreenBuffer, 0, 0, m_nScreenBufferWidth, m_nScreenBufferHeight );
			return TRUE;
		}

		BOOL GLGfx::RestoreScreenBuffer()
		{
			ASSERT( m_bScreenBufferPrompt );
			RestoreBufferRegionARB ( m_hScreenBuffer, 0, 0, m_nScreenBufferWidth, m_nScreenBufferHeight, 0, 0 );	
			return TRUE;
		}
	#endif
#endif
//=============================================================================================================

//=========================================PBuffer=============================================================
#ifdef USE_WGL_ARB_pbuffer
#ifdef USE_WGL_ARB_pixel_format

	#define PBUFFER_DEBUGGING 0

	PBuffer::PBuffer() : width(0), height(0), mode(0)
	{
		buffer = NULL;
	}

	PBuffer::PBuffer( int w, int h, unsigned int mode ) : width(w), height(h), mode(mode), myDC(NULL), myGLctx(NULL), buffer(NULL)
	{
		buffer = NULL;
	}

	PBuffer::~PBuffer()
	{
		Destroy();
	}

	void PBuffer::Destroy()
	{
		if ( buffer )
		{
			wglDeleteContext( myGLctx );
			GLGfx::ReleasePbufferDCARB( buffer, myDC );
			GLGfx::DestroyPbufferARB( buffer );
			buffer = NULL;
		}
	}

	void PBuffer::SetPBuffer( int w, int h, unsigned int _mode )
	{
		width  = w;
		height = h;
		mode   = _mode;
	}

	// Check to see if the pbuffer was lost.
	// If it was lost, destroy it and then recreate it.
	void PBuffer::HandleModeSwitch()
	{
		int lost = 0;

		GLGfx::QueryPbufferARB( buffer, WGL_PBUFFER_LOST_ARB, &lost );

		if( lost )
		{
			Initialize();
		}
	}

	// This function actually does the creation of the p-buffer.
	// It can only be called once a window has already been created.
	void PBuffer::Initialize(bool share)
	{
		if(buffer) 
		{
			Destroy();
		}

	#if PBUFFER_DEBUGGING
		FILE *fp = fopen( "Log\\PBuffer_Debug.txt", "w" );
		if ( !fp )
		{
			fprintf( stderr, "Couldn't open file: PBuffer_Debug.txt\n" );
			exit( -1 );
		}
	#endif

		HDC hdc = wglGetCurrentDC();
		HGLRC hglrc = wglGetCurrentContext();

		// Query for a suitable pixel format based on the specified mode.
		int   iattributes[2*MAX_ATTRIBS];
		float fattributes[2*MAX_ATTRIBS];
		int nfattribs = 0;
		int niattribs = 0;

		// Attribute arrays must be "0" terminated - for simplicity, first
		// just zero-out the array entire, then fill from left to right.
		for ( int a = 0; a < 2*MAX_ATTRIBS; a++ )
		{
			iattributes[a] = 0;
			fattributes[a] = 0;
		}

		// Since we are trying to create a pbuffer, the pixel format we
		// request (and subsequently use) must be "p-buffer capable".
		iattributes[2*niattribs  ] = WGL_DRAW_TO_PBUFFER_ARB;
		iattributes[2*niattribs+1] = true;
		niattribs++;

		if ( mode & PBUFFER_MODE_INDEX )
		{
			iattributes[2*niattribs  ] = WGL_PIXEL_TYPE_ARB;
			iattributes[2*niattribs+1] = WGL_TYPE_COLORINDEX_ARB;  // Yikes!
			niattribs++;
		}
		else
		{
			iattributes[2*niattribs  ] = WGL_PIXEL_TYPE_ARB;
			iattributes[2*niattribs+1] = WGL_TYPE_RGBA_ARB;
			niattribs++;
		}

		if ( mode & PBUFFER_MODE_DOUBLE )
		{
			iattributes[2*niattribs  ] = WGL_DOUBLE_BUFFER_ARB;
			iattributes[2*niattribs+1] = true;
			niattribs++;
		}

		if ( mode & PBUFFER_MODE_DEPTH )
		{
			iattributes[2*niattribs  ] = WGL_DEPTH_BITS_ARB;
			iattributes[2*niattribs+1] = 1;
			niattribs++;
		}

		if ( mode & PBUFFER_MODE_STENCIL )
		{
			iattributes[2*niattribs  ] = WGL_STENCIL_BITS_ARB;
			iattributes[2*niattribs+1] = 1;
			niattribs++;
		}

		if ( mode & PBUFFER_MODE_ACCUM )
		{
			iattributes[2*niattribs  ] = WGL_ACCUM_BITS_ARB;
			iattributes[2*niattribs+1] = 1;
			niattribs++;
		}

		iattributes[2*niattribs  ] = WGL_SUPPORT_OPENGL_ARB;
		iattributes[2*niattribs+1] = true;
		niattribs++;

		int format;
		int pformat[MAX_PFORMATS];
		unsigned int nformats;
		if ( !GLGfx::ChoosePixelFormatARB( hdc, iattributes, fattributes, MAX_PFORMATS, pformat, &nformats ) )
		{
			fprintf( stderr, "pbuffer creation error:  wglChoosePixelFormatARB() failed.\n" );
			exit( -1 );
		}
		if ( nformats <= 0 )
		{
			fprintf( stderr, "pbuffer creation error:  Couldn't find a suitable pixel format.\n" );
			exit( -1 );
		}

		format = pformat[0];


	#if PBUFFER_DEBUGGING
		fprintf( fp, "nformats = %d\n\n", nformats );
		int values[MAX_ATTRIBS];
		int iatr[MAX_ATTRIBS] = { WGL_PIXEL_TYPE_ARB, WGL_COLOR_BITS_ARB,
								  WGL_RED_BITS_ARB, WGL_GREEN_BITS_ARB, WGL_BLUE_BITS_ARB,
								  WGL_ALPHA_BITS_ARB, WGL_DEPTH_BITS_ARB, WGL_STENCIL_BITS_ARB, WGL_ACCUM_BITS_ARB,
								  WGL_DOUBLE_BUFFER_ARB, WGL_SUPPORT_OPENGL_ARB, WGL_ACCELERATION_ARB };
		int niatr = 12;
		for ( int j = 0; j < MAX_ATTRIBS; j++ )
		{
			values[j] = false;
			iattributes[j] = iattributes[2*j];
		}
		for ( unsigned int i = 0; i < nformats; i++ )
		{
			if ( !wglGetPixelFormatAttribivARB( hdc, pformat[i], 0, niatr, iatr, values ) )
			{
				fprintf( stderr, "pbuffer creation error:  wglGetPixelFormatAttribiv() failed\n" );
				exit( -1 );
			}
			fprintf( fp, "%d. pformat = %d\n", i, pformat[i] );
			fprintf( fp, "--------------------\n" );
			for ( int k = 0; k < niatr; k++ )
			{
				if ( iatr[k] == WGL_PIXEL_TYPE_ARB )
				{
					if ( values[k] == WGL_TYPE_COLORINDEX_ARB )
						fprintf( fp, " Pixel type = WGL_TYPE_COLORINDEX_ARB\n" );
					if ( values[k] == WGL_TYPE_RGBA_ARB )
						fprintf( fp, " Pixel type = WGL_TYPE_RGBA_ARB\n" );
				}
				if ( iatr[k] == WGL_COLOR_BITS_ARB )
				{
					fprintf( fp, " Color bits = %d\n", values[k] );
				}
				if ( iatr[k] == WGL_RED_BITS_ARB )
				{
					fprintf( fp, "      red         %d\n", values[k] );
				}
				if ( iatr[k] == WGL_GREEN_BITS_ARB )
				{
					fprintf( fp, "      green       %d\n", values[k] );
				}
				if ( iatr[k] == WGL_BLUE_BITS_ARB )
				{
					fprintf( fp, "      blue        %d\n", values[k] );
				}
				if ( iatr[k] == WGL_ALPHA_BITS_ARB )
				{
					fprintf( fp, "      alpha       %d\n", values[k] );
				}
				if ( iatr[k] == WGL_DEPTH_BITS_ARB )
				{
					fprintf( fp, " Depth bits =   %d\n", values[k] );
				}
				if ( iatr[k] == WGL_STENCIL_BITS_ARB )
				{
					fprintf( fp, " Stencil bits = %d\n", values[k] );
				}
				if ( iatr[k] == WGL_ACCUM_BITS_ARB )
				{
					fprintf( fp, " Accum bits =   %d\n", values[k] );
				}
				if ( iatr[k] == WGL_DOUBLE_BUFFER_ARB )
				{
					fprintf( fp, " Double Buffer  = %d\n", values[k] );
				}
				if ( iatr[k] == WGL_SUPPORT_OPENGL_ARB )
				{
					fprintf( fp, " Support OpenGL = %d\n", values[k] );
				}
				if ( iatr[k] == WGL_ACCELERATION_ARB )
				{
					if ( values[k] == WGL_FULL_ACCELERATION_ARB )
						fprintf( fp, " Acceleration   = WGL_FULL_ACCELERATION_ARB\n" );
					if ( values[k] == WGL_GENERIC_ACCELERATION_ARB )
						fprintf( fp, " Acceleration   = WGL_GENERIC_ACCELERATION_ARB\n" );
				}
			}
			fprintf( fp, "\n" );
		}
		fprintf( fp, "selected pformat = %d\n", format );
	#endif

		// Create the p-buffer.
		iattributes[0] = 0;
		buffer = GLGfx::CreatePbufferARB( hdc, format, width, height, iattributes );
		if ( !buffer )
		{
			DWORD err = GetLastError();
			fprintf( stderr, "pbuffer creation error:  wglCreatePbufferARB() failed\n" );
			if ( err == ERROR_INVALID_PIXEL_FORMAT )
			{
				fprintf( stderr, "error:  ERROR_INVALID_PIXEL_FORMAT\n" );
			}
			else if ( err == ERROR_NO_SYSTEM_RESOURCES )
			{
				fprintf( stderr, "error:  ERROR_NO_SYSTEM_RESOURCES\n" );
			}
			else if ( err == ERROR_INVALID_DATA )
			{
				fprintf( stderr, "error:  ERROR_INVALID_DATA\n" );
			}
			exit( -1 );
		}

		// Get the device context.
		myDC = GLGfx::GetPbufferDCARB( buffer );
		if ( !myDC )
		{
			fprintf( stderr, "pbuffer creation error:  wglGetPbufferDCARB() failed\n" );
			exit( -1 );
		}

		// Create a gl context for the p-buffer.
		myGLctx = wglCreateContext( myDC );
		if ( !myGLctx )
		{
			fprintf( stderr, "pbuffer creation error:  wglCreateContext() failed\n" );
			exit( -1 );
		}

		if( share )
		{
			if( !wglShareLists(hglrc, myGLctx) )
			{
				fprintf( stderr, "pbuffer: wglShareLists() failed\n" );
				exit( -1 );
			}
		}

		// Determine the actual width and height we were able to create.
		GLGfx::QueryPbufferARB( buffer, WGL_PBUFFER_WIDTH_ARB, &width );
		GLGfx::QueryPbufferARB( buffer, WGL_PBUFFER_HEIGHT_ARB, &height );

		fprintf( stderr, "Created a %d x %d pbuffer\n", width, height );

	#if PBUFFER_DEBUGGING
		fclose( fp );
	#endif

	}

	void PBuffer::MakeCurrent()
	{
		if ( !wglMakeCurrent( myDC, myGLctx ) )
		{
			fprintf( stderr, "PBuffer::MakeCurrent() failed.\n" );
			exit( -1 );
		}
	}

#endif
#endif