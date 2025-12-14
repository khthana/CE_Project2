// FImgProc.cpp: implementation of the FImgProc class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "math.h"
#include "FImgProc.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

FImgProc::FImgProc()
{
	m_blobcount = 0;
	m_blobs = NULL;
	m_imgmap = NULL;
}

FImgProc::~FImgProc()
{
	if (m_blobs != NULL) delete[] m_blobs;
	if (m_imgmap != NULL) delete[] m_imgmap;
}

int FImgProc::Threshold(FImage &Target, const F_RGBRANGE &Range)
{
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	// Iterate through image pixels
	while (pTrgPix < pTrgEnd)
	{
		if (pTrgPix->blue >= Range.blue_min)
			if (pTrgPix->blue <= Range.blue_max)
				if (pTrgPix->green >= Range.green_min)
					if (pTrgPix->green <= Range.green_max)
						if (pTrgPix->red >= Range.red_min)
							if (pTrgPix->red <= Range.red_max)	// If color within range, set to white
							{
								pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
								count++;
							}
							else
								pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
						else
							pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
					else
						pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				else
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			else
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		else
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;

		pTrgPix++;
	}

	return count;
}

int FImgProc::Threshold(const FImage &Source, FImage &Target, const F_RGBRANGE &Range)
{
	F_PIXEL *pSrcPix = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcPix + (Source.m_width * Source.m_height);
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	// Iterate through image pixels
	while (pSrcPix < pSrcEnd)
	{
		if (pSrcPix->blue >= Range.blue_min)
			if (pSrcPix->blue <= Range.blue_max)
				if (pSrcPix->green >= Range.green_min)
					if (pSrcPix->green <= Range.green_max)
						if (pSrcPix->red >= Range.red_min)
							if (pSrcPix->red <= Range.red_max)	// If color within range, set to white
							{
								pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
								count++;
							}
							else
								pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
						else
							pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
					else
						pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				else
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			else
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		else
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;

		pSrcPix++;
		pTrgPix++;
	}

	return count;
}

int FImgProc::Threshold(FImage &Target, const F_HSVRANGE &Range, int HueOffset)
{
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	int r, g, b;
	int h, s, v;
	int delta;
	int min, max;

	while (pTrgPix < pTrgEnd)
	{
		// Dereference data for fast accessing
		b = pTrgPix->blue;
		g = pTrgPix->green;
		r = pTrgPix->red;

		// Find max & min value using binary tree
		if (r > g)
			if (g > b) { max = r; min = b; }
			else
				if (r > b) { max = r; min = g; }
				else { max = b; min = g; }
		else
			if (g > b)
				if (r > b) { max  = g; min = b; }
				else { max = g; min = r; }
				else { max = b; min = r; }

		// Get & check value of intensity
		v = max;
		if ((Range.val_min > v) || (v > Range.val_max)) 
		{ 
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		}
		else 
		{
			// Get & check saturation			
			delta = max - min;
			if( delta != 0 )
				s = (delta * 255) / max;
			else {
				s = 0;
				h = 0;
			}
			if ((Range.sat_min > s) || (s > Range.sat_max))
			{
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			}
			else 
			{
				// Get & check hue
				if (delta != 0) {
					if (r == max)
						h = (60 * (g - b)) / delta;			// between yellow & magenta
					else if (g == max)
						h = 120 + ((60 * (b - r)) / delta);	// between cyan & yellow
					else
						h = 240 + ((60 * (r - g)) / delta);	// between magenta & cyan
					if( h < 0 ) h += 360;
					h = (h + HueOffset) % 360;
				}
				if ((Range.hue_min > h) || (h > Range.hue_max))
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				}
				else 
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
					count++;
				}
			}
		} 

		pTrgPix++;
	} 

	return count;
}

int FImgProc::Threshold(const FImage &Source, FImage &Target, const F_HSVRANGE &Range, int HueOffset)
{
	F_PIXEL *pSrcPix = Source.m_data;
	F_PIXEL *pSrcEnd = pSrcPix + (Source.m_width * Source.m_height);
	F_PIXEL *pTrgPix = Target.m_data;
	F_PIXEL *pTrgEnd = pTrgPix + (Target.m_width * Target.m_height);
	int count = 0;
	
	int r, g, b;
	int h, s, v;
	int delta;
	int min, max;

	while (pSrcPix < pSrcEnd)
	{
		// Dereference data for fast accessing
		b = pSrcPix->blue;
		g = pSrcPix->green;
		r = pSrcPix->red;

		// Find max & min value using binary tree
		if (r > g)
			if (g > b) { max = r; min = b; }
			else
				if (r > b) { max = r; min = g; }
				else { max = b; min = g; }
		else
			if (g > b)
				if (r > b) { max  = g; min = b; }
				else { max = g; min = r; }
				else { max = b; min = r; }

		// Get & check value of intensity
		v = max;
		if ((Range.val_min > v) || (v > Range.val_max)) 
		{ 
			pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
		}
		else 
		{
			// Get & check saturation			
			delta = max - min;
			if( delta != 0 )
				s = (delta * 255) / max;
			else {
				s = 0;
				h = 0;
			}
			if ((Range.sat_min > s) || (s > Range.sat_max))
			{
				pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
			}
			else 
			{
				// Get & check hue
				if (delta != 0) {
					if (r == max)
						h = (60 * (g - b)) / delta;			// between yellow & magenta
					else if (g == max)
						h = 120 + ((60 * (b - r)) / delta);	// between cyan & yellow
					else
						h = 240 + ((60 * (r - g)) / delta);	// between magenta & cyan
					if( h < 0 ) h += 360;
					h = (h + HueOffset) % 360;
				}
				if ((Range.hue_min > h) || (h > Range.hue_max))
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 0;
				}
				else 
				{
					pTrgPix->red = pTrgPix->green = pTrgPix->blue = 255;
					count++;
				}
			}
		} 

		pSrcPix++;
		pTrgPix++;
	} 

	return count;
}

int FImgProc::AnalyseBlob(const FImage &Source)
{
	int pixcount = Source.m_width * Source.m_height;

	// Source image
	F_PIXEL *pSrcImg = Source.m_data;
	int count = 0;

	// Stack
	int *pStackIndex = new int[pixcount];
	int stack = 0;	// Current stack size

	// Image map
	if (m_imgmap != NULL) delete[] m_imgmap;
	m_imgmap = new int[pixcount];
	memset(m_imgmap, -1, pixcount * sizeof(int));
	
	// Blobs array
	if (m_blobs != NULL) delete[] m_blobs;
	m_blobs = new F_BLOB[pixcount];

	// Iterate through image pixels
	int oldp, tmp;
	for (int p=0; p<pixcount; p++)
	{
		if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
		{
			// Push this pixel
			pStackIndex[stack] = p;
			stack++;
			m_blobs[count].size = 0;
			m_blobs[count].ffalse = 0;
			m_blobs[count].xmin = m_blobs[count].xmax = p % Source.m_width;
			m_blobs[count].ymin = m_blobs[count].ymax = p / Source.m_width;

			// Floodfill
			oldp = p;
			while (stack > 0)
			{
				// Pop stack
				stack--;
				p = pStackIndex[stack];

				// Update pixel & blob
				m_imgmap[p] = count;
				m_blobs[count].size++;
				tmp = p % Source.m_width;
				if (tmp < m_blobs[count].xmin) m_blobs[count].xmin = tmp;
				if (tmp > m_blobs[count].xmax) m_blobs[count].xmax = tmp;
				tmp = p / Source.m_width;
				if (tmp < m_blobs[count].ymin) m_blobs[count].ymin = tmp;
				if (tmp > m_blobs[count].ymax) m_blobs[count].ymax = tmp;

				// Push neighbors
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p -= Source.m_width;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}

			}
			p = oldp;

			count++;
		}
	}

	delete[] pStackIndex;

	m_blobcount = count;
	return count;
}

int FImgProc::AnalyseBlob(const FImage &Source, F_BLOB *blobs, int blob_count)
{
	int pixcount = Source.m_width * Source.m_height;

	// Source image
	F_PIXEL *pSrcImg = Source.m_data;
	int count = 0;

	// Stack
	int *pStackIndex = new int[pixcount];
	int stack = 0;	// Current stack size

	// Image map
	if (m_imgmap != NULL) delete[] m_imgmap;
	m_imgmap = new int[pixcount];
	memset(m_imgmap, -1, pixcount * sizeof(int));
	
	// Blobs array
	//if (blobs != NULL) delete[] blobs;
	//blobs = new F_BLOB[pixcount];

	// Iterate through image pixels
	int oldp, tmp;
	for (int p=0; p<pixcount; p++)
	{
		if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
		{
			// Push this pixel
			pStackIndex[stack] = p;
			stack++;
			blobs[count].size = 0;
			blobs[count].ffalse = 0;
			blobs[count].xmin = blobs[count].xmax = p % Source.m_width;
			blobs[count].ymin = blobs[count].ymax = p / Source.m_width;

			// Floodfill
			oldp = p;
			while (stack > 0)
			{
				// Pop stack
				stack--;
				p = pStackIndex[stack];

				// Update pixel & blob
				m_imgmap[p] = count;
				blobs[count].size++;
				tmp = p % Source.m_width;
				if (tmp < blobs[count].xmin) blobs[count].xmin = tmp;
				if (tmp > blobs[count].xmax) blobs[count].xmax = tmp;
				tmp = p / Source.m_width;
				if (tmp < blobs[count].ymin) blobs[count].ymin = tmp;
				if (tmp > blobs[count].ymax) blobs[count].ymax = tmp;

				// Push neighbors
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p -= Source.m_width;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p--;
				if (p > 0)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p += Source.m_width;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}
				p++;
				if (p < pixcount)
					if ((pSrcImg[p].blue == 255) && (m_imgmap[p] < 0))
					{
						pStackIndex[stack] = p;
						stack++;
						m_imgmap[p] = 0;
					}

			}
			p = oldp;

			count++;
			// Check buffer size. If empty, then exit loop
			if (count >= blob_count) break;
		}
	}

	delete[] m_imgmap;
	delete[] pStackIndex;

	//m_blobcount = count;
	return count;
}

BOOL FImgProc::PutFloodfillBorder(FImage &Target)
{
	F_PIXEL *pTrgImg = Target.m_data;
	F_PIXEL *pTrgBorderL = pTrgImg;
	F_PIXEL *pTrgBorderR = pTrgImg + Target.m_width - 1;
	
	// Fill row
	memset(pTrgImg, 0, Target.m_width * sizeof(F_PIXEL));
	memset(pTrgImg + (Target.m_width * (Target.m_height - 1)), 0, Target.m_width * sizeof(F_PIXEL));

	// Fill column
	for (int i=0; i<Target.m_height; i++)
	{
		pTrgBorderL->blue = pTrgBorderL->green = pTrgBorderL->red = 0;
		pTrgBorderR->blue = pTrgBorderR->green = pTrgBorderR->red = 0;
		pTrgBorderL += Target.m_width;
		pTrgBorderR += Target.m_width;
	}

	return TRUE;
}

void FImgProc::BlobMoveFirst(void)
{
	m_curblob = 0;
}

int FImgProc::BlobGetNext(F_BLOB &Blob)
{
	if (m_curblob >= m_blobcount) return -1;
	Blob = m_blobs[m_curblob];
	m_curblob++;
	return m_curblob - 1;
}

int FImgProc::BlobGetNext(F_BLOB &Blob, int SizeMin, int SizeMax)
{
	while (m_curblob < m_blobcount)
	{
		if ((m_blobs[m_curblob].size >= SizeMin) && (m_blobs[m_curblob].size <= SizeMax))
		{
			Blob = m_blobs[m_curblob];
			m_curblob++;
			return m_curblob - 1;
		}
		m_curblob++;
	} 
	return -1;
}

BOOL FImgProc::BlobGetData(F_BLOB &Blob, int Index)
{
	if ((Index < 0) || (Index >= m_blobcount)) return FALSE;

	Blob = m_blobs[Index];

	return TRUE;
}

int FImgProc::BlobGetData(F_BLOB& Blob, int x, int y)
{
	if (m_curblob >= m_blobcount) return -1;
	
	// Get 1st blob
	double minlen, tmplen, blobx, bloby;
	int minblob = m_curblob;
	blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
	bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
	blobx = blobx - x;
	bloby = bloby - y;
	minlen = sqrt((blobx * blobx) + (bloby * bloby));
	m_curblob++;
	while (m_curblob < m_blobcount)
	{
		// Calc length
		blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
		bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
		blobx = blobx - x;
		bloby = bloby - y;
		tmplen = sqrt((blobx * blobx) + (bloby * bloby));

		// Compare
		if (tmplen < minlen)
		{
			minblob = m_curblob;
			minlen = tmplen;
		}
		m_curblob++;
	}

	// Return
	Blob = m_blobs[minblob];
	return minblob;
}

int FImgProc::BlobGetData(F_BLOB& Blob, int SizeMin, int SizeMax, int x, int y)
{
	if (m_curblob >= m_blobcount) return -1;
	
	// Get 1st blob
	while ((m_blobs[m_curblob].size < SizeMin) || (m_blobs[m_curblob].size > SizeMax))
	{
		m_curblob++;
		if (m_curblob >= m_blobcount) return -1;
	}
	double minlen, tmplen, blobx, bloby;
	int minblob = m_curblob;
	blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
	bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
	blobx = blobx - x;
	bloby = bloby - y;
	minlen = sqrt((blobx * blobx) + (bloby * bloby));
	m_curblob++;
	while (m_curblob < m_blobcount)
	{
		if ((m_blobs[m_curblob].size >= SizeMin) && (m_blobs[m_curblob].size <= SizeMax))
		{
			// Calc length
			blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
			bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
			blobx = blobx - x;
			bloby = bloby - y;
			tmplen = sqrt((blobx * blobx) + (bloby * bloby));

			// Compare
			if (tmplen < minlen)
			{
				minblob = m_curblob;
				minlen = tmplen;
			}
		}
		m_curblob++;
	}

	// Return
	Blob = m_blobs[minblob];
	return minblob;
}

int FImgProc::BlobGetData(F_BLOB& Blob, int SizeMin, int SizeMax, int x, int y, int radius)
{
	if (m_curblob >= m_blobcount) return -1;

	double minlen, tmplen, blobx, bloby;
	int minblob = m_curblob;

	// Get 1st blob
	do {
		while ((m_blobs[m_curblob].size < SizeMin) || (m_blobs[m_curblob].size > SizeMax))
		{
			m_curblob++;
			if (m_curblob >= m_blobcount) return -1;
		}

		blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
		bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
		blobx = blobx - x;
		bloby = bloby - y;
		tmplen = sqrt((blobx * blobx) + (bloby * bloby));

		m_curblob++;
	} while (tmplen > radius);
	minlen = tmplen;
	minblob = m_curblob - 1;

	// Compare with others
	while (m_curblob < m_blobcount)
	{
		if ((m_blobs[m_curblob].size >= SizeMin) && (m_blobs[m_curblob].size <= SizeMax))
		{
			// Calc length
			blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
			bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
			blobx = blobx - x;
			bloby = bloby - y;
			tmplen = sqrt((blobx * blobx) + (bloby * bloby));

			// Compare
			if (tmplen < minlen)	// Guarantee that tmplen must <= radius
			{
				minblob = m_curblob;
				minlen = tmplen;
			}
		}
		m_curblob++;
	}

	// Return
	Blob = m_blobs[minblob];
	return minblob;
}

BOOL FImgProc::PutBlobMask(FImage &Target, int Index, F_PIXEL &Color)
{
	if ((m_imgmap == NULL) || (Index < 0) || (Index >= m_blobcount)) return FALSE;
	int pixcount = Target.m_width * Target.m_height;

	// Source image
	F_PIXEL *pSrcImg = Target.m_data;
	BOOL ret = FALSE;

	// Iterate through image pixels
	for (int p=0; p<pixcount; p++)
	{
		if (m_imgmap[p] == Index)
		{
			pSrcImg[p] = Color;
			ret = TRUE;
		}
	}
	return ret;
}

void FImgProc::BlobMarkFalse(int Index)
{
	if ((Index < 0) || (Index >= m_blobcount)) return;

	m_blobs[Index].ffalse = 1;
}

int FImgProc::BlobGetNext(F_BLOB& Blob, int SizeMin, int SizeMax, int x, int y, int radius)
{
	if (m_curblob >= m_blobcount) return -1;

	double minlen, tmplen, blobx, bloby;
	int minblob = m_curblob;

	// Get 1st blob
	do {
		while ((m_blobs[m_curblob].size < SizeMin) || (m_blobs[m_curblob].size > SizeMax))
		{
			m_curblob++;
			if (m_curblob >= m_blobcount) return -1;
		}

		blobx = (m_blobs[m_curblob].xmin + m_blobs[m_curblob].xmax) / 2;
		bloby = (m_blobs[m_curblob].ymin + m_blobs[m_curblob].ymax) / 2;
		blobx = blobx - x;
		bloby = bloby - y;
		tmplen = sqrt((blobx * blobx) + (bloby * bloby));

		m_curblob++;
	} while (tmplen > radius);
	minlen = tmplen;
	minblob = m_curblob - 1;

	// Return
	Blob = m_blobs[minblob];
	return minblob;
}

void FImgProc::SetBlobData(F_BLOB *blobs, int blob_count)
{
	// Store old
	m_oldblobs = m_blobs;
	m_oldblobcount = m_blobcount;
	m_oldcurblob = m_curblob;

	// Set to new
	m_blobs = blobs;
	m_blobcount = blob_count;
}

void FImgProc::UnsetBlobData() 
{
	// Restore
	m_blobs = m_oldblobs;
	m_blobcount = m_oldblobcount;
	m_curblob = m_oldcurblob;
}
