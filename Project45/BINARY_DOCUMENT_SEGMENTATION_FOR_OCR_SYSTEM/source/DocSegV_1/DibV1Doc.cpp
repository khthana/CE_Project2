// DibV1Doc.cpp : implementation of the CDibV1Doc class
//

#include "stdafx.h"
#include "DibV1.h"

#include "DibV1Doc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDibV1Doc

IMPLEMENT_DYNCREATE(CDibV1Doc, CDocument)

BEGIN_MESSAGE_MAP(CDibV1Doc, CDocument)
	//{{AFX_MSG_MAP(CDibV1Doc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDibV1Doc construction/destruction

CDibV1Doc::CDibV1Doc()
{
	// TODO: add one-time construction code here
	ST_PictureIN =false;
	NewPic = false;
}

CDibV1Doc::~CDibV1Doc()
{
}

BOOL CDibV1Doc::OnNewDocument()
{
	if (!CDocument::OnNewDocument())
		return FALSE;

	// TODO: add reinitialization code here
	// (SDI documents will reuse this document)

	return TRUE;
}



/////////////////////////////////////////////////////////////////////////////
// CDibV1Doc serialization

void CDibV1Doc::Serialize(CArchive& ar)
{
	if (ar.IsStoring())
	{
		// TODO: add storing code here
	/*	
	CFile* pFile = ar.GetFile();
        ASSERT( pFile );
        ar.Flush();
		CString FileAddress(pFile->GetFilePath() + pFile->GetFileName());
		CStdioFile file(FileAddress,CFile::modeCreate | CFile::modeWrite);
		file.WriteString("aaaa");		
		*/
	}
	else
	{
		// TODO: add loading code here
		CFile* pFile = ar.GetFile();
        ASSERT( pFile );
        ar.Flush();
		
		// Variable Care
		if (ST_PictureIN)
		{
			delete[] bmInfo;
			delete[] bmPixel;
		}

		pFile->Read(&bmFileHeader, sizeof(bmFileHeader));
		pFile->Read(&bmInfoHeader, sizeof(bmInfoHeader));

		int ColorTable = 256*sizeof(RGBQUAD);
        int bmInfoSize = sizeof(BITMAPINFOHEADER) + ColorTable;
		bmInfo = (BITMAPINFO*)new BYTE[bmInfoSize];
		memcpy( bmInfo, &bmInfoHeader, sizeof(BITMAPINFOHEADER) );
		pFile->Read( ((BYTE*)bmInfo) + sizeof(BITMAPINFOHEADER),
                     ColorTable );


		pFile->Seek(bmFileHeader.bfOffBits,CFile::begin);
		Pixelsize = bmFileHeader.bfSize - bmFileHeader.bfOffBits;

        bmPixel = new BYTE[Pixelsize];
		pFile->Read( ((BYTE*)bmPixel),Pixelsize);

		ST_PictureIN = true;
		UpdateAllViews( NULL );

		//Initial each load Bitmap
		NewPic = true;

		//End Initial each load Bitmap
		
		//Clear Pointer
	
	}
}

/////////////////////////////////////////////////////////////////////////////
// CDibV1Doc diagnostics

#ifdef _DEBUG
void CDibV1Doc::AssertValid() const
{
	CDocument::AssertValid();
}

void CDibV1Doc::Dump(CDumpContext& dc) const
{
	CDocument::Dump(dc);
}
#endif //_DEBUG

/////////////////////////////////////////////////////////////////////////////
// CDibV1Doc commands


