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
#include "Windows.h"

#include <gl\gl.h>			// Header File For The OpenGL32 Library
#include <gl\glu.h>			// Header File For The GLu32 Library
#include <gl\glaux.h>		// Header File For The Glaux Library
#include <gl\glext.h>
//#include <gl\wglext.h>
#include "d3dx8.h"

//========================LOG===============================================================================
// #define CANDID_GLGFX_LOG
//==========================================================================================================

//========================Extension Define==================================================================
//#define USE_WGL_ARB_buffer_region

#define USE_CANDID_SCREEN_BUFFER
#define CANDID_SCREEN_BUFFER_COLOR
#define CANDID_SCREEN_BUFFER_DEPTH
//#define CANDID_SCREEN_BUFFER_STENCIL

#define USE_GL_ARB_multitexture

//#define USE_WGL_ARB_pbuffer
//#define USE_WGL_ARB_pixel_format

//==========================================================================================================

//=========================================Draw Mode========================================================
namespace GLDrawMode
{
	const DWORD POINTS           =  GL_POINTS;
	const DWORD LINES            =  GL_LINES;
    const DWORD LINE_LOOP        =  GL_LINE_LOOP;
    const DWORD LINE_STRIP       =  GL_LINE_STRIP;
    const DWORD TRIANGLES        =  GL_TRIANGLES;
    const DWORD TRIANGLE_STRIP   =  GL_TRIANGLE_STRIP;
    const DWORD TRIANGLE_FAN     =  GL_TRIANGLE_FAN;
    const DWORD QUADS            =  GL_QUADS;
    const DWORD QUAD_STRIP       =  GL_QUAD_STRIP;
    const DWORD POLYGON          =  GL_POLYGON;
}
//==========================================================================================================

//======================================PBuffer=============================================================
#ifdef USE_WGL_ARB_pbuffer
#ifdef USE_WGL_ARB_pixel_format
	#define MAX_PFORMATS 256
	#define MAX_ATTRIBS  32

	//======================================================================================================
	#define PBUFFER_MODE_RGB			0
	#define PBUFFER_MODE_RGBA			PBUFFER_MODE_RGB
	#define PBUFFER_MODE_INDEX			1
	#define PBUFFER_MODE_SINGLE			0
	#define PBUFFER_MODE_DOUBLE			2
	#define PBUFFER_MODE_ACCUM			4
	#define PBUFFER_MODE_DEPTH			16
	#define PBUFFER_MODE_STENCIL	    32

	#define PBUFFER_MODE_NORMAL         PBUFFER_MODE_RGBA|PBUFFER_MODE_SINGLE|PBUFFER_MODE_DEPTH
	//======================================================================================================

	class PBuffer
	{
	private:
		HDC          myDC;      // Handle to a device context.
		HGLRC        myGLctx;   // Handle to a GL context.
		HPBUFFERARB  buffer;    // Handle to a pbuffer.
		unsigned int mode;      // Flags indicating the type of pbuffer.
	public:
		int          width;
		int          height;
		PBuffer();
		PBuffer( int width, int height, unsigned int mode );
		~PBuffer();

		void SetPBuffer( int w, int h, unsigned int _mode );    
		void HandleModeSwitch();
		void MakeCurrent();

	public:
		void Initialize(bool share = false);
		void Destroy();
	};
#endif
#endif
//==========================================================================================================

//==========================================================================================================
// OpenGL Graphics Engine
//==========================================================================================================
class GLGfx
{	
private:
	// Internal Data for OpenGL Rendering
	static HDC        m_hDC;		        // Private GDI Device Context
	static HGLRC      m_hRC;		        // Permanent Rendering Context
	static HWND       m_hWnd;	            // Holds Our Render Window Handle

	// OpenGL State
	// Matrix World, View and Projection
	static D3DXMATRIX m_MatWorld;
	static D3DXMATRIX m_MatView;
	static D3DXMATRIX m_MatProj;

	// Keep Matrix
	static D3DXMATRIX m_SaveMatWorld;
	static D3DXMATRIX m_SaveMatView;
	static D3DXMATRIX m_SaveMatProj;

	// Engine Prompt State
	static BOOL m_bGLGfxPrompt;

private:
	// Init Extension
	static BOOL InitExtension();

public:
	// Init and Release
	static HRESULT InitGL( HWND hWnd, int ColorBits = 16 /*16 32*/ );
	static HRESULT ReleaseGL();

	// Clear
	static HRESULT Clear( GLbitfield mask = GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
	
	// BeginDraw and EndDraw
	static HRESULT BeginDraw( GLenum mode );
	static HRESULT EndDraw();

	// SwapBuffers 
	static BOOL    SwapBuffers( HDC TargetDC = NULL );
	static BOOL    MakeCurrent( HDC hDC,  HGLRC hRC );

	// Set and Get Matrix
	// Return True is Set OK
	static BOOL SetMatWorld( const D3DXMATRIX *pMatWorld );
	static BOOL SetMatView ( const D3DXMATRIX *pMatView  );
	static BOOL SetMatProj ( const D3DXMATRIX *pMatProj  );

	static void GetMatWorld( D3DXMATRIX* pMatWorld );
	static void GetMatView ( D3DXMATRIX* pMatView  );
	static void GetMatProj ( D3DXMATRIX* pMatProj  );

	inline static BOOL IsGLPrompt(){ return m_bGLGfxPrompt; };

//=========================================Extension=========================================================
#ifdef USE_WGL_ARB_buffer_region
	public:
		// WGL_ARB_buffer_region
		static PFNWGLCREATEBUFFERREGIONARBPROC   CreateBufferRegionARB;
		static PFNWGLDELETEBUFFERREGIONARBPROC   DeleteBufferRegionARB;
		static PFNWGLSAVEBUFFERREGIONARBPROC     SaveBufferRegionARB;	
		static PFNWGLRESTOREBUFFERREGIONARBPROC  RestoreBufferRegionARB;

//==============================Buffer Region Function=======================================================
// HANDLE CreateBufferRegionARB  ( HDC hDC, int iLayerPlane, UINT uType )
// VOID   DeleteBufferRegionARB  ( HANDLE hRegion )
// BOOL   SaveBufferRegionARB    ( HANDLE hRegion, int x, int y, int width, int height )
// BOOL   RestoreBufferRegionARB ( HANDLE hRegion, int x, int y, int width, int height, int xSrc, int ySrc)
//===========================================================================================================
//==============================Buffer Retion Param==========================================================
// WGL_FRONT_COLOR_BUFFER_BIT_ARB
// WGL_BACK_COLOR_BUFFER_BIT_ARB
// WGL_DEPTH_BUFFER_BIT_ARB
// WGL_STENCIL_BUFFER_BIT_ARB
//===========================================================================================================

//===========================================================================================================
	#ifdef USE_CANDID_SCREEN_BUFFER
		private:
			// for PreRender Depth Buffer
			static HANDLE m_hScreenBuffer;
			static BOOL   m_bScreenBufferPrompt;
			static int    m_nScreenBufferWidth;
			static int    m_nScreenBufferHeight;
		
		public:
			static BOOL   CreateScreenBuffer();
			static BOOL   DeleteScreenBuffer();
			static BOOL   SaveScreenBuffer();
			static BOOL   RestoreScreenBuffer();
	#endif
//===========================================================================================================
#endif
	
#ifdef USE_GL_ARB_multitexture
	public:
		static PFNGLACTIVETEXTUREARBPROC       ActiveTextureARB;
		static PFNGLCLIENTACTIVETEXTUREARBPROC ClientActiveTextureARB;
		static PFNGLMULTITEXCOORD1DARBPROC     MultiTexCoord1dARB;
		static PFNGLMULTITEXCOORD1DVARBPROC    MultiTexCoord1dvARB;
		static PFNGLMULTITEXCOORD1FARBPROC     MultiTexCoord1fARB;     
		static PFNGLMULTITEXCOORD1FVARBPROC    MultiTexCoord1fvARB;
		static PFNGLMULTITEXCOORD1IARBPROC     MultiTexCoord1iARB;
		static PFNGLMULTITEXCOORD1IVARBPROC    MultiTexCoord1ivARB;
		static PFNGLMULTITEXCOORD1SARBPROC     MultiTexCoord1sARB;
		static PFNGLMULTITEXCOORD1SVARBPROC    MultiTexCoord1svARB;
		static PFNGLMULTITEXCOORD2DARBPROC     MultiTexCoord2dARB;
		static PFNGLMULTITEXCOORD2DVARBPROC    MultiTexCoord2dvARB;
		static PFNGLMULTITEXCOORD2FARBPROC     MultiTexCoord2fARB;
		static PFNGLMULTITEXCOORD2FVARBPROC    MultiTexCoord2fvARB; 
		static PFNGLMULTITEXCOORD2IARBPROC     MultiTexCoord2iARB;
		static PFNGLMULTITEXCOORD2IVARBPROC    MultiTexCoord2ivARB;
		static PFNGLMULTITEXCOORD2SARBPROC     MultiTexCoord2sARB;
		static PFNGLMULTITEXCOORD2SVARBPROC    MultiTexCoord2svARB;
		static PFNGLMULTITEXCOORD3DARBPROC     MultiTexCoord3dARB;
		static PFNGLMULTITEXCOORD3DVARBPROC    MultiTexCoord3dvARB;
		static PFNGLMULTITEXCOORD3FARBPROC     MultiTexCoord3fARB;
		static PFNGLMULTITEXCOORD3FVARBPROC    MultiTexCoord3fvARB;
		static PFNGLMULTITEXCOORD3IARBPROC     MultiTexCoord3iARB;
		static PFNGLMULTITEXCOORD3IVARBPROC    MultiTexCoord3ivARB; 
		static PFNGLMULTITEXCOORD3SARBPROC     MultiTexCoord3sARB;
		static PFNGLMULTITEXCOORD3SVARBPROC    MultiTexCoord3svARB;
		static PFNGLMULTITEXCOORD4DARBPROC     MultiTexCoord4dARB;
		static PFNGLMULTITEXCOORD4DVARBPROC    MultiTexCoord4dvARB;
		static PFNGLMULTITEXCOORD4FARBPROC     MultiTexCoord4fARB;
		static PFNGLMULTITEXCOORD4FVARBPROC    MultiTexCoord4fvARB;
		static PFNGLMULTITEXCOORD4IARBPROC     MultiTexCoord4iARB;
		static PFNGLMULTITEXCOORD4IVARBPROC    MultiTexCoord4ivARB;
		static PFNGLMULTITEXCOORD4SARBPROC     MultiTexCoord4sARB;
		static PFNGLMULTITEXCOORD4SVARBPROC    MultiTexCoord4svARB;
	
//======================MultiTexture Function===============================================================
// void MultiTexCoordARB*;
// void ActiveTextureARB (GLenum);        // Sets Active Texel-Pipeline
// void ClientActiveTextureARB (GLenum);  // Sets Active Texel-Pipeline For The Pointer-Array-Commands
//==========================================================================================================
//======================MultiTexture Param==================================================================
//GL_ACTIVE_TEXTURE_ARB               
//GL_CLIENT_ACTIVE_TEXTURE_ARB        
//GL_MAX_TEXTURE_UNITS_ARB             //Ex : glGetIntegerv(GL_MAX_TEXTURE_UNITS_ARB,&maxTexelUnits);      
//GL_TEXTURE0_ARB To GL_TEXTURE31_ARB                    
//==========================================================================================================
#endif

#ifdef USE_WGL_ARB_pbuffer
	public:
		static PFNWGLCREATEPBUFFERARBPROC    CreatePbufferARB;
        static PFNWGLGETPBUFFERDCARBPROC     GetPbufferDCARB;
	    static PFNWGLRELEASEPBUFFERDCARBPROC ReleasePbufferDCARB;
		static PFNWGLDESTROYPBUFFERARBPROC   DestroyPbufferARB;
        static PFNWGLQUERYPBUFFERARBPROC     QueryPbufferARB;
#endif

#ifdef USE_WGL_ARB_pixel_format
	public:
        static PFNWGLGETPIXELFORMATATTRIBIVARBPROC GetPixelFormatAttribivARB;
        static PFNWGLGETPIXELFORMATATTRIBFVARBPROC GetPixelFormatAttribfvARB;
        static PFNWGLCHOOSEPIXELFORMATARBPROC      ChoosePixelFormatARB;
#endif

//===============================PBuffer Function===========================================================
// HPBUFFERARB CreatePbufferARB( HDC hDC,
//							     int iPixelFormat,
//								 int iWidth,
//								 int iHeight,
//								 const int *piAttribList );
//
// HDC  GetPbufferDCARB( HPBUFFERARB hPbuffer );
//
// int  ReleasePbufferDCARB( HPBUFFERARB hPbuffer, HDC hDC );
//
// BOOL DestroyPbufferARB( HPBUFFERARB hPbuffer );
//
// BOOL QueryPbufferARB( HPBUFFERARB hPbuffer, int iAttribute, int *piValue );
//==========================================================================================================
//===============================PBuffer Attribute==========================================================
// WGL_DRAW_TO_PBUFFER_ARB        
// WGL_MAX_PBUFFER_PIXELS_ARB     
// WGL_MAX_PBUFFER_WIDTH_ARB      
// WGL_MAX_PBUFFER_HEIGHT_ARB     
// WGL_PBUFFER_LARGEST_ARB        
// WGL_PBUFFER_WIDTH_ARB          
// WGL_PBUFFER_HEIGHT_ARB         
// WGL_PBUFFER_LOST_ARB           
//==========================================================================================================

//==========================================================================================================
// BOOL wglGetPixelFormatAttribivARB( HDC hdc,int iPixelFormat,
//	  							      int iLayerPlane,UINT nAttributes,
//								      const int *piAttributes,int *piValues );
//
// BOOL wglGetPixelFormatAttribfvARB( HDC hdc,int iPixelFormat,int iLayerPlane,
//								      UINT nAttributes,const int *piAttributes,
//								      FLOAT *pfValues );
// BOOL wglChoosePixelFormatARB( HDC hdc,const int *piAttribIList, const FLOAT *pfAttribFList,
//								 UINT nMaxFormats, int *piFormats, UINT *nNumFormats );
//==========================================================================================================
};