// FImage.h: interface for the FImage class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_FIMAGE_H__E65F5550_8042_432D_ABDC_571F9F13DB15__INCLUDED_)
#define AFX_FIMAGE_H__E65F5550_8042_432D_ABDC_571F9F13DB15__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

typedef struct	// Pixel color structure
{
	BYTE blue;
	BYTE green;
	BYTE red;
} F_PIXEL;

// ----------------------------------------------------------------------

class FImage  
{
public:
	friend class FImgProc;

	FImage();
	FImage(F_PIXEL*, int , int);	// Init image with existing data
	virtual ~FImage();

	void Create(F_PIXEL*, int , int);	// Allocate image (same as Constructor FImage(F_PIXEL*, int , int);)

public:
	F_PIXEL *m_data;
	int m_width;
	int m_height;
};

#endif // !defined(AFX_FIMAGE_H__E65F5550_8042_432D_ABDC_571F9F13DB15__INCLUDED_)
