//dib.h
//header file for the CDIBitmap class.

#ifndef __DIB__
#define __DIB__

class CDIBitmap : public CObject
{
	DECLARE_SERIAL(CDIBitmap)

public :
	CDIBitmap();
	~CDIBitmap();
//protected :
	BITMAPINFO* m_pBMI;
	BYTE* m_pBits;

public :
	BITMAPINFO* GetBMHdrPtr() { return m_pBMI; }
	BYTE* GetBMBitsPtr() { return m_pBits; }
	RGBQUAD* GetBMColorTabPtr();
	int GetNumClrEntries();
	int GetBMWidth();
	int GetBMHeight();
	virtual BOOL LoadDIB(CFile* fp);
	virtual void Serialize(CArchive& ar);
	virtual void DrawBitmap(CDC* pDC, int x, int y);
};

#endif // __DIB__