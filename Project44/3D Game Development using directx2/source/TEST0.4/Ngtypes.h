#ifndef	__NGTYPES_H
#define __NGTYPES_H

#include <d3d8.h>
#include <d3d8types.h>
#include <d3dx8math.h>

#include <vector>

using namespace std;

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

typedef pair <string, int> String_Pair;
typedef pair <string, LPVOID> Pointer_Pair;

template <class type>
struct StaticList
{
private:
	type*	data;
	int		size;
	int		length;

public:

	StaticList()
	{
		data	= NULL;
		size	= 0;
		length	= 0;
	};
	~StaticList()
	{
		data	= NULL;
		size	= 0;
		length	= 0;
	};
	
	void	Reserve(DWORD s)
	{
		if (data!=NULL)
			return;
		data	= new type[s];
		length	= s;
		size	= 0;
	};

	void	Add(type& d)
	{
		if (size==length)
		return -1;
		data[size+1]	= d;
		size++;
	};

	void	Remove(type& d)
	{
		for (int i=0; i<size; i++)
		{
			if (data[i]==d)
			{
				data[i]	= data[size];
				size--;
			}
		}
	};

	void	RomoveID(DWORD i)
	{
		if (i>size)
			return;
		data[i] == data[size];
		size--;
	}
		
	bool	Empty()	{ return (size==0);};
	bool	Full()	{ return (size==length);};
	int		Size()	{ return size;};
	int		Length(){ return length;};
	
	type&	operator[] (DWORD d)
	{
		if (d>size)
			throw NGException();
		return data[d];
	}
};

template <class type>
struct ArrayList
{
private:
	vector<type>	data;

public:

	VOID	Reserve(DWORD size)
	{
		data.resize(size);
	}

	VOID	Delete()
	{
		data.clear();
	}

	INT		Length()
	{
		return data.size();
	}

	BOOL	Empty()
	{
		return data.empty();
	}

	/*VOID	Add(type& d)
	{
		data.push_back(d);
	}*/

	VOID	Add(type d)
	{
		data.push_back(d);
	}

	type&	operator[] (DWORD d)
	{
		if (d>=data.size())
			throw NGException();
		return data.at(d);
	}

	type&	Front()
	{
		return data.front();
	}

	type&	Back()
	{
		return data.back();
	}

	type ToArray()
	{
		type* temp = new type[data.size()];
		memcpy(temp, &data.front(), sizeof(type)*data.size());
		return *temp;
	}
};

#define NGFVF_PNT1		(D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_TEX0)
#define NGFVF_PNT2		(D3DFVF_XYZ | D3DFVF_NORMAL | D3DFVF_TEX0 | D3DFVF_TEX1)
#define NGFVF_PNT1B4	(D3DFVF_XYZB4 | D3DFVF_LASTBETA_UBYTE4 | D3DFVF_NORMAL | D3DFVF_TEX0)
#define NGFVF_PNT2B4	(D3DFVF_XYZB4 | D3DFVF_LASTBETA_UBYTE4 | D3DFVF_NORMAL | D3DFVF_TEX0 | D3DFVF_TEX1)
#define NGFVF_PRHWDT1	(D3DFVF_XYZRHW | D3DFVF_DIFFUSE | D3DFVF_TEX0)

typedef enum _NGFVFTYPE
{
	NGFT_PNT1		= NGFVF_PNT1,
	NGFT_PNT2		= NGFVF_PNT2,
	NGFT_PNT1B4		= NGFVF_PNT1B4,
	NGFT_PNT2B4		= NGFVF_PNT2B4,
	NGFT_PRHWDT1	= NGFVF_PRHWDT1
} NGFVFTYPE;

typedef struct _NGBLEND4
{
	union
	{
		struct
		{
			FLOAT b1;	FLOAT b2;	FLOAT b3;	FLOAT b4;
		};
		FLOAT b[4];
	};

	union
	{
		struct
		{
			BYTE i1;	BYTE i2;	BYTE i3;	BYTE i4;
		};
		BYTE i[4];
	};

	_NGBLEND4()
	{
		b[0] = 0.f;	b[1] = 0.f; b[2] = 0.f; b[3] = 0.f;
		i[0] = 0;	i[1] = 0;	i[2] = 0;	i[3] = 0;
	};
} NGBLEND4;

typedef struct _NGVB_PNT1
{
	D3DXVECTOR3	p;
	D3DXVECTOR3	n;
	D3DXVECTOR2	t;

	_NGVB_PNT1()
	{
		p	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		n	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		t	= D3DXVECTOR2(0.0f,0.0f);
	}
}	NGVB_PNT1;

typedef struct _NGVB_PNT2
{
	D3DXVECTOR3	p;
	D3DXVECTOR3	n;
	D3DXVECTOR2	t0;
	D3DXVECTOR2	t1;

	_NGVB_PNT2()
	{
		p	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		n	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		t0	= D3DXVECTOR2(0.0f,0.0f);
		t1	= D3DXVECTOR2(0.0f,0.0f);
	}
}	NGVB_PNT2;

typedef struct _NGVB_PNT1B4
{
	D3DXVECTOR3	p;
	NGBLEND4	b;
	D3DXVECTOR3	n;
	D3DXVECTOR2	t;

	_NGVB_PNT1B4()
	{
		p	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		b	= NGBLEND4();
		n	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		t	= D3DXVECTOR2(0.0f,0.0f);
	}
}	NGVB_PNT1B4;

typedef struct _NGVB_PNT2B4
{
	D3DXVECTOR3	p;
	NGBLEND4	b;
	D3DXVECTOR3	n;
	D3DXVECTOR2	t0;
	D3DXVECTOR2	t1;

	_NGVB_PNT2B4()
	{
		p	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		b	= NGBLEND4();
		n	= D3DXVECTOR3(0.0f,0.0f,0.0f);
		t0	= D3DXVECTOR2(0.0f,0.0f);
		t1	= D3DXVECTOR2(0.0f,0.0f);
	}
}	NGVB_PNT2B4;

typedef struct _NGVB_PRHWDT1
{
	D3DXVECTOR4	p;
	DWORD		d;
	D3DXVECTOR2	t;
}	NGVB_PRHWDT1;

struct NGFACE
{
	union
	{
		struct
		{
			WORD	f1;
			WORD	f2;
			WORD	f3;
		};
		WORD	f[3];
	};

	NGFACE()
	{
		ZeroMemory(f, sizeof(f));
	}
};

union LPVERTEX
{
	LPVOID					pUnknown;
	vector<NGVB_PNT1>*		pPNT1;
	vector<NGVB_PNT2>*		pPNT2;
	vector<NGVB_PNT1B4>*	pPNT1B4;
	vector<NGVB_PNT2B4>*	pPNT2B4;
	vector<NGFACE>*			pFace16;
};

typedef struct _NGUPDATEMATRIX
{
	BOOL		update;
	D3DXMATRIX	matrix;
} NGMATRIX;

class NGObject
{
protected:
	BOOL			update;
	D3DXMATRIX		matrix;

public:
	NGObject();
	VOID		Reset();
	BOOL		Ready()	{return update;};
	virtual	BOOL Update();
	D3DXMATRIX*	GetMatrix()	{return &matrix;};
};



#endif