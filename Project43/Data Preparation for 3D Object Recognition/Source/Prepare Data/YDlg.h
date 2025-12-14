// YDlg.h : header file
//

#if !defined(AFX_YDLG_H__135FAD47_50BF_11D4_AC8A_89198591D15E__INCLUDED_)
#define AFX_YDLG_H__135FAD47_50BF_11D4_AC8A_89198591D15E__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CYDlg dialog

class CYDlg : public CDialog
{
// Construction
public:
	CYDlg(CWnd* pParent = NULL);	// standard constructor
	

	void Group2(int Number,int *Edge,int *Picture);
	void OnePixel(int *object,int Input);
	int SurroundPixel(int *object);
	void GetFile(CString Name,int *PointImage);

	///////// Show /////////////
	int *Show,*Image1,*EdgeT,*EdgeL,*EdgeR;
	int ShowID;
	CString Caption;
	int Bx,By,Sx,Sy;
	int WINID;
	///////// Function /////////
	int NumberThreshold;
	int Threshold(int *Object);
	void Color1(int *Object1,int *Object2,int *Object3);
	///////// Save ////////
	int SurroundPixel1(int *object);

	void XYZ(double X,double D);
	void Slope(int *Object);
	void MaxMin4(int *E1,int *E2,int *E3);
	void Color(int *object,int *E);
	void SaveInput();
	int aaa;
	double C1,C2,C3,C4,C5,C6,C7,C8;
	double X,DX,SizeX,Y,DY,SizeY;
	double Size,MST[10];
	int *EdgeOut;
	CString Name;
	CString Index;
	CString NameReal;


	//////////////// Free ////////////
	int *F1,*F2,*F3,*F4,*F5;
	/////////////////////////////////

	int Direct0,Direct2,Direct4,Direct6;
	int threshold,wpic,hpic;


	int Xmax,Xmin,Ymax,Ymin,w,h;

	int *savepic,*savepic2,*SavePicT;
	int *edgeL,*edgeR,*edgeT;

	int *ObjectR;
	int *objectT;

	




	int protectData;
	void  Group(int *input,int g);	
	// Dialog Data
	//{{AFX_DATA(CYDlg)
	enum { IDD = IDD_Y_DIALOG };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CYDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;
	int i,j;
	int *k;
	int *newpic1;
	
	// Generated message map functions
	//{{AFX_MSG(CYDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnEdge();
	afx_msg void OnLeft();
	afx_msg void OnHistogram();
	afx_msg void OnEdgeGradient();
	afx_msg void OnSaveFiledata();
	afx_msg void OnFileOpen3image();
	afx_msg void OnPgmHis();
	afx_msg void OnImageprocessingShowedge();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnImageprocessingShowedgeout();
	afx_msg void OnImageprocessingColorobjectarea();
	afx_msg void OnImageprocessingShowimage();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};



//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_YDLG_H__135FAD47_50BF_11D4_AC8A_89198591D15E__INCLUDED_)
