#ifndef	__NGTYPES_H
#define __NGTYPES_H

#include <d3d8.h>
#include <d3d8types.h>
#include <d3dx8math.h>
#include <vector>
#include <string>
#include <queue>

using namespace std;

typedef D3DXVECTOR4	NGVERTEX4;
/*typedef D3DXCOLOR	NGCOLOR;
*/
// file header
typedef struct _NGMODELINFO
{
	DWORD	dwNumModel;
	DWORD	dwIndexType;
} NGMODELINFO, *LPNGMODELINFO;

typedef struct _NGANIMEINFO
{
	DWORD	dwNumAnime;
} NGANIMEINFO, *LPNGANIMEINFO;

typedef struct _NGMODELFILEHEADER
{
	DWORD		dwHeader;
	DWORD		dwVersion;
	NGMODELINFO	ngModelInfo;
	NGANIMEINFO	ngAnimeInfo;
} NGMODELFILEHEADER, *LPNGMODELFILEHEADER;

typedef struct _NGMODEINFO
{
	DWORD			dwWidth;
	DWORD			dwHeight;
	DWORD			dwBehavior; 
	D3DFORMAT		d3dFormat;
    D3DFORMAT		d3dStencilFormat;
} NGMODEINFO, *LPNGMODEINFO;

typedef struct _NGDEVICEINFO
{
	D3DDEVTYPE		d3dDeviceType;   
    D3DCAPS8		d3dCaps;      
    BOOL			bCanDoWindow; 
	BOOL			bDesktopWindow;
} NGDEVICEINFO, *LPNGDEVICEINFO;

typedef struct _NGADAPTERINFO
{
	D3DADAPTER_IDENTIFIER8	d3dAdapterID;
	D3DDISPLAYMODE			d3ddmDesktop;
	D3DMULTISAMPLE_TYPE		d3dMultiSampleType;
	D3DMULTISAMPLE_TYPE		d3dWindowMultiSampleType;

	NGDEVICEINFO			devices;

	DWORD					dwNumModes;
    NGMODEINFO				modes[100];
} NGADAPTERINFO, *LPNGADAPTERINFO;

typedef struct _NGCREATEINFO
{
	HWND	hWnd;

	DWORD	dwAdapter;
	DWORD	dwWidth;
	DWORD	dwHeight;
	DWORD	dwMode;

	DWORD	dwMinDepthBits;
	DWORD	dwMinStencilBits;
	DWORD	dwNumDepthBuffer;

	BOOL	bWindow;
	BOOL	bCursor;
	BOOL	bUseDepthBuffer;
} NGCREATEINFO, *LPNGCREATEINFO;

// Mesh data storage define
typedef struct _NGVERTEXNT
{
	union
	{
		struct 
		{
			FLOAT x;
			FLOAT y;
			FLOAT z;
		};
		FLOAT v[3];
	};

	union
	{
		struct
		{
			FLOAT nx;
			FLOAT ny;
			FLOAT nz;
		};
		FLOAT n[3];
	};

	union
	{
		struct
		{
			FLOAT tu;
			FLOAT tv;
		};
		FLOAT t[2];
	};
} NGVERTEX, *LPNGVERTEX;

typedef struct _NGBLENDDATA
{
	DWORD	index;
	FLOAT	weight;

	_NGBLENDDATA()
	{
		weight	= 0.0f;
		index	= -1;
	};

	_NGBLENDDATA(DWORD i)
	{
		weight	= 0.0f;
		index	= i;
	};
} NGBLENDDATA, *LPNGBLENDDATA;

typedef struct _NGVERTEXBLEND4
{
	union
	{
		struct 
		{
			FLOAT x;
			FLOAT y;
			FLOAT z;
		};
		FLOAT v[3];
	};

	union
	{
		struct
		{
			FLOAT b1;
			FLOAT b2;
			FLOAT b3;
			FLOAT b4;
		};
		FLOAT b[4];
	};

	union
	{
		struct
		{
			BYTE i1;
			BYTE i2;
			BYTE i3;
			BYTE i4;
		};
		BYTE i[4];
	};

	union
	{
		struct
		{
			FLOAT nx;
			FLOAT ny;
			FLOAT nz;
		};
		FLOAT n[3];
	};

	union
	{
		struct
		{
			FLOAT tu;
			FLOAT tv;
		};
		FLOAT t[2];
	};
} NGVERTEXBLEND4;


/*
typedef struct _NGFACE32
{
	union
	{
		struct
		{
			DWORD f1;
			DWORD f2;
			DWORD f3;
		};
		DWORD f[3];
	};
} NGFACE32;*/

typedef enum _NGINDEX_TYPE
{
	NGINDEXTYPE_16	= D3DFMT_INDEX16,
	NGINDEXTYPE_32	= D3DFMT_INDEX32
} NGINDEX_TYPE;

typedef enum _NGPOLYGON_TYPE
{
	NGPOLYGON_DEFAULT	= 0,
	NGPOLYGON_BLEND2	= 1,
	NGPOLYGON_BLEND4	= 2,
	NGPOLYGON_BLENDX	= 3
} NGPOLYGON_TYPE;

typedef enum _NGANIMESETTYPE
{
	NGTYPE_ROTATE	= 0,
	NGTYPE_SCALE	= 1,
	NGTYPE_MOVE		= 2,
	NGTYPE_MATRIX	= 3,
	NGTYPE_DEFAULT	= 0xFFFFFFFF
} NGANIMESETTYPE;

typedef struct _NGKEY3
{
	DWORD		dwTime;
	D3DXVECTOR3	key;
} NGKEY3;

typedef struct _NGKEY4
{
	DWORD		dwTime;
	D3DXQUATERNION key;
} NGKEY4;

typedef struct _NGKEY16
{
	DWORD		dwTime;
	D3DXMATRIX	key;
} NGKEY16;

typedef struct _NGJOINT
{
	string		name;
	D3DXMATRIX	matrixOffset;
	LPVOID		pJoint;

	_NGJOINT()
	{
		pJoint = NULL;
	};
} NGJOINT;

typedef struct _NGJOINTDESC
{
	DWORD		maxBonePerVertex;
	DWORD		maxBonePerFace;
	DWORD		numBones;
} NGJOINTDESC;

#endif