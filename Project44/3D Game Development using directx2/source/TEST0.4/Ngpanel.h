#pragma warning(disable:4786)
#ifndef __NGPANEL_H
#define __NGPANEL_H

#include "ng3d.h"
#include "ngtypes.h"
#include "ngmisc.h"
#include "ngtexture.h"
#include "ngframe.h"
#include "ngrender.h"

#include <vector>
#include <string>
#include <queue>
#include <deque>

using namespace std;

typedef enum NGDOCKTYPE
{
	DOCK_TOP	= 0,
	DOCK_BOTTOM	= 1,
	DOCK_LEFT	= 2,
	DOCK_RIGHT	= 3,
	DOCK_FILL	= 4,
	DOCK_NONE	= 5
};

struct DOCKTYPE
{
	NGDOCKTYPE	top;
	NGDOCKTYPE	bottom;
	NGDOCKTYPE	left;
	NGDOCKTYPE	right;
	NGDOCKTYPE	none;

	DOCKTYPE()
	{
		top		= DOCK_TOP;
		bottom	= DOCK_BOTTOM;
		left	= DOCK_LEFT;
		right	= DOCK_RIGHT;
		none	= DOCK_NONE;
	};
};

const static DOCKTYPE	DockType;

class NGPanel;
class NGTextureBox;

struct NGPANELCREATE
{
	NGPanel*		pParent;
	INT				sx;	// specific 
	INT				sy;
	INT				px;
	INT				py;
	string			name;
	NGDOCKTYPE		dock;
	BOOL			bAlwaysTop;

	NGPANELCREATE()
	{
		pParent	= NULL;
		sx		= 0;	// specific
		sy		= 0;	
		px		= 0;
		py		= 0;
		dock	= DockType.none;
		bAlwaysTop = 0;
	}
};

class NGPanel
{
protected:
	NGPANELCREATE	m_desc;
	DWORD			m_handle;
	BOOL			m_show;

	INT				m_sx; // real 
	INT				m_sy;
	INT				m_px;
	INT				m_py;
					
	INT				m_asx;
	INT				m_asy;
	INT				m_apx;
	INT				m_apy;

	ArrayList<NGPanel*>			m_child;

	NGPanel(DWORD,DWORD,DWORD,DWORD);
	VOID	UpdateSize();

	friend class NGPanelControl;
	friend class NGPanel;

	BOOL			m_update;

public:
	NGPanel();
	NGPanel(NGPANELCREATE*);

	BOOL	SetSize(DWORD, DWORD);
	BOOL	SetPosition(DWORD, DWORD);
	BOOL	SetDock(NGDOCKTYPE);
	VOID	SetParent(NGPanel*);
	virtual VOID	Update(BOOL);

	VOID	Create(NGPANELCREATE*);
	
	VOID	AddChild(NGPanel*);
	VOID	RemoveChild(NGPanel*);

	NGPANELCREATE* GetDesc()	{ return &m_desc;};
	inline	INT		GetPosX()	{ return m_px;};
	inline	INT		GetPosY()	{ return m_py;};
	inline	INT		GetSizeX()	{ return m_sx;};
	inline	INT		GetSizeY()	{ return m_sy;};
};

class NGPanelControl
{
private:
	NGPanel*		m_deskTop;
	NGPanel*		m_default;
	DWORD			m_curHandle;

	static NGPanelControl*	m_this;
	NGPanelControl();

public:
	NGPanelControl*	InitialCtrl(DWORD, DWORD, DWORD, DWORD);

	VOID			Clear();
	VOID			Update();
	NGPANELCREATE	GetClientParam()		{return m_default->m_desc;};
	NGPanel*		GetDesktop()			{return m_default;};
	VOID			SetDesktop(NGPanel*);

	static NGPanelControl*	CreatePanelCtrl(DWORD sizex, DWORD sizey, DWORD posx, DWORD posy);
	static NGPanelControl*	GetPanelCtrl()	{ return m_this;};
};

inline NGPanelControl* PanelControl()
{
	return NGPanelControl::GetPanelCtrl();
};




class NGTextureBox : public NGPanel
{
protected:
	NGRENDERDESC	m_rdesc;
	D3DXVECTOR2		m_ts;
	D3DXVECTOR2		m_tz;
	FLOAT			m_Level;
	

	NGVB_PRHWDT1	m_vertex[4];
	DWORD			m_color[4];

	VOID			GenerateVertex();
	string			m_Texname;
	INT				m_TexID;

	friend	class	NGText;

public:
	NGTextureBox(NGPANELCREATE*);
	VOID			SetColor(DWORD, DWORD, DWORD, DWORD);
	VOID			SetColor(DWORD);
	VOID			SetLevel(FLOAT);
	VOID			SetTexture(string);
	VOID			Update(BOOL);
	NGVB_PRHWDT1*	GetVertex()	{return m_vertex;};
	NGRENDERDESC*	GetRenderDesc() { return &m_rdesc;};
};

class NGText
{
private:
	NGPANELCREATE	m_create;
	NGTextureBox*	m_textBox[4];

	string			m_Texname;
	INT				m_TexID;
	NGIMAGE*		m_image;

	string			m_strFont;            // Font properties
    DWORD			m_dwFontHeight;
    DWORD			m_dwFontFlags;
	HFONT			m_hFont;
	HDC				m_hDC;
	BYTE*			m_pBmpBits;
	HBITMAP			m_hBitmap;
	DWORD			m_color;

	NGRes2d*		m_res2d;

	string			m_text;

	
	BOOL			Generate();

public:
	NGText(NGPanel*, INT, INT);
	NGText(NGPanel*, INT, INT, string, DWORD);
	VOID			SetRes2d(NGRes2d*);
	VOID			SetText(string);
	VOID			SetTextColorx(DWORD);
	VOID			SetBGColorx(DWORD);
	VOID			SetColor(DWORD);
	VOID			Update(BOOL);
	BOOL			Create(NGRes2d*);

	VOID			AddToBuffer(NGRenderBuffer*);

	NGTextureBox**	GetTextureBox()	{ return m_textBox;};
};



BOOL	CreatePanelCtrl(NGPanelControl*&, DWORD sizex, DWORD sizey, DWORD posx, DWORD posy);
BOOL	CreatePanel(NGPANELCREATE*, NGPanel*&);
BOOL	ClosePanel(DWORD handle);
BOOL	ShowPanel(DWORD handle, BOOL show);
/*

//------------------------------------------------- Implement class
class NGWindow
{
private:

	//	|----|	
	//	|	 |
	//	|----|	
	
	NGPanel*	m_root;
	union
	{
		struct
		{
			NGTextureBox*	_11;
			NGTextureBox*	_12;
			NGTextureBox*	_13;
			NGTextureBox*	_21;
			NGTextureBox*	_22;
			NGTextureBox*	_23;
			NGTextureBox*	_31;
			NGTextureBox*	_32;
			NGTextureBox*	_33;
		};
		NGTextureBox*	m_txtBox[9];
	};

public:
							// left, right, top, bottom
	NGWindow();
	~NGWindow();

	BOOL	Create(NGPANELCREATE*, DWORD, DWORD, DWORD, DWORD);
	BOOL	Initial(NGRenderBuffer*);

	VOID	SetColor(DWORD, DWORD);
	VOID	SetParent(NGPanel*);
};
*/
#endif