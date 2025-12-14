// Stereopsis.h: interface for the CStereopsis class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_STEREOPSIS_H__021749F9_CF6A_492D_98BF_4435B18C8DA5__INCLUDED_)
#define AFX_STEREOPSIS_H__021749F9_CF6A_492D_98BF_4435B18C8DA5__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

struct STR_CAMERA	// Camera's parameters
{
	double x;		// Camera position (metres)
	double y;
	double z;
	double focus;	// Focal length (metres)
	double iwidth;	// Image plane size (metres)
	double iheight;	
};

struct STR_WORLDCOOR	// World coordinate
{
	double x;
	double y;
	double z;
};

struct STR_IMAGECOOR	// Image coordinate
{
	int x;
	int y;
};

struct STR_IMAGESIZE	// Image size
{
	int width;
	int height;
};

// --------------------------------------------------------------------------------

class CStereopsis  
{
public:

	CStereopsis();
	virtual ~CStereopsis();

	// Get/Set Properties
	STR_CAMERA GetCamera1(void);
	void SetCamera1(const STR_CAMERA&);
	STR_CAMERA GetCamera2(void);
	void SetCamera2(const STR_CAMERA&);
	STR_CAMERA GetCamera3(void);
	void SetCamera3(const STR_CAMERA&);
	STR_CAMERA GetCamera4(void);
	void SetCamera4(const STR_CAMERA&);
	// Get camera angle
	double GetCam1ZetaAngle(void);
	double GetCam2ZetaAngle(void);
	double GetCam3ZetaAngle(void);
	double GetCam4ZetaAngle(void);

	// Forward calculation
	STR_WORLDCOOR GetWorldCoordinate(const STR_IMAGECOOR&, const STR_IMAGESIZE&, 
		const STR_IMAGECOOR&, const STR_IMAGESIZE&);

	// Backward calculation
	STR_IMAGECOOR GetCam1ImageCoordinate(const STR_WORLDCOOR&, const STR_IMAGESIZE&);
	STR_IMAGECOOR GetCam2ImageCoordinate(const STR_WORLDCOOR&, const STR_IMAGESIZE&);
	STR_IMAGECOOR GetCam3ImageCoordinate(const STR_WORLDCOOR&, const STR_IMAGESIZE&);
	STR_IMAGECOOR GetCam4ImageCoordinate(const STR_WORLDCOOR&, const STR_IMAGESIZE&);

protected:
	STR_CAMERA	m_cam1;	// camera1 parameters
	STR_CAMERA	m_cam2;	// camera2 parameters
	STR_CAMERA	m_cam3;	// camera3 parameters
	STR_CAMERA	m_cam4;	// camera4 parameters

};

#endif // !defined(AFX_STEREOPSIS_H__021749F9_CF6A_492D_98BF_4435B18C8DA5__INCLUDED_)
