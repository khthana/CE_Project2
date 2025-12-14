// Stereopsis.cpp: implementation of the CStereopsis class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "Stereopsis1.h"
#include "Math.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CStereopsis::CStereopsis()
{
	
}

CStereopsis::~CStereopsis()
{

}

STR_CAMERA CStereopsis::GetCamera1(void)
{
	return m_cam1;
}

void CStereopsis::SetCamera1(const STR_CAMERA &cam1)
{
	m_cam1 = cam1;
}

STR_CAMERA CStereopsis::GetCamera2(void)
{
	return m_cam2;
}

void CStereopsis::SetCamera2(const STR_CAMERA &cam2)
{
	m_cam2 = cam2;
}

STR_CAMERA CStereopsis::GetCamera3(void)
{
	return m_cam3;
}

void CStereopsis::SetCamera3(const STR_CAMERA &cam3)
{
	m_cam3 = cam3;
}

STR_CAMERA CStereopsis::GetCamera4(void)
{
	return m_cam4;
}

void CStereopsis::SetCamera4(const STR_CAMERA &cam4)
{
	m_cam4 = cam4;
}

double CStereopsis::GetCam1ZetaAngle(void)
{

	double zeta = atan(m_cam1.y/m_cam1.x);
	return zeta;
}

double CStereopsis::GetCam2ZetaAngle(void)
{

	double zeta = atan(m_cam2.y/m_cam2.x);
	return zeta;
}

double CStereopsis::GetCam3ZetaAngle(void)
{

	double zeta = atan(m_cam3.y/m_cam3.x);
	return zeta;
}

double CStereopsis::GetCam4ZetaAngle(void)
{

	double zeta = atan(m_cam4.y/m_cam4.x);
	return zeta;
}
STR_WORLDCOOR CStereopsis::GetWorldCoordinate(const STR_IMAGECOOR &coorCam1, const STR_IMAGESIZE &szCam1, 
											  const STR_IMAGECOOR &coorCam2, const STR_IMAGESIZE &szCam2)
{
	STR_WORLDCOOR ret;
	
	ret.x = 0;
	ret.y = 0;
	ret.z = 0;

	// Find x , y Coordinate
	double zeta1 = atan(m_cam1.y/m_cam1.x);
	double zeta2 = atan(m_cam2.y/m_cam2.x);
	double xpiccoorCam1 = (double)coorCam1.x - ((double)szCam1.width/2);
	double xpiccoorCam2 = (double)coorCam2.x - ((double)szCam2.width/2);
	double dxCam1 = m_cam1.iwidth*(xpiccoorCam1/(double)szCam1.width);
	double dxCam2 = m_cam2.iwidth*(xpiccoorCam2/(double)szCam2.width);
	double alpha1 = atan(fabs(dxCam1)/m_cam1.focus);
	double alpha2 = atan(fabs(dxCam2)/m_cam2.focus);
	double m1=0, m2=0;
	if (dxCam1 >= 0)
		m1 = tan(zeta1 - alpha1);
	else
		m1= tan(zeta1 + alpha1);
	if (dxCam2 >= 0)
		m2 = tan(zeta2 - alpha2);
	else
		m2 = tan(zeta2 + alpha2);

	double c1 = (-m1*m_cam1.x) + m_cam1.y;
	double c2 = (-m2*m_cam2.x) + m_cam2.y;
	double xPos = (c2-c1)/(m1-m2);
	double yPos = (m1*xPos) + c1;

	// Find z coordinate
	double L = sqrt(((xPos - m_cam1.x)*(xPos - m_cam1.x)) + ((yPos - m_cam1.y)*(yPos - m_cam1.y)));
	double ypiccoorCam1 = (double)szCam1.height - coorCam1.y;  // - 1???
	double y2piccoorCam1 = ypiccoorCam1 - ((double)szCam1.height/2);
	double dz = m_cam1.iheight*(y2piccoorCam1/(double)szCam1.height);
	double zPos = (dz*L)/m_cam1.focus;

	ret.x = xPos;
	ret.y = yPos;
	ret.z = zPos;

	return ret;
}

STR_IMAGECOOR CStereopsis::GetCam1ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam1)
{
	STR_IMAGECOOR ret;

	ret.x = 0;
	ret.y = 0;

	// Find X image position
	double zeta  = atan(m_cam1.y/m_cam1.x);
	double m  =(coorWorld.y - m_cam1.y)/(coorWorld.x - m_cam1.x);
	double beta  = atan(m );
	double alpha  = 0;
	if (beta  >= zeta )
		alpha = beta  - zeta ;
	else
		alpha = zeta  - beta ;
	double dx = m_cam1.focus*tan(alpha );
	double xpixel = (dx *szCam1.width)/m_cam1.iwidth;
	double xImagePos = 0;
	if (beta  >= zeta )
		xImagePos = (szCam1.width/2) - xpixel;
	else
		xImagePos = (szCam1.width/2) + xpixel;

	// Find Y image position
	double L = sqrt(((coorWorld.x - m_cam1.x)*(coorWorld.x - m_cam1.x)) + ((coorWorld.y - m_cam1.y)*(coorWorld.y - m_cam1.y)));
	double dz = (coorWorld.z*m_cam1.focus)/L;
	double y2pixel = (dz*szCam1.height)/m_cam1.iheight;
	double ypixel = y2pixel + (szCam1.height/2);
	double yImagePos = szCam1.height - ypixel; // -1 ????

	ret.x = (int)xImagePos;
	ret.y = (int)yImagePos;

	return ret;
}

STR_IMAGECOOR CStereopsis::GetCam2ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam2)
{
	STR_IMAGECOOR ret;

	ret.x = 0;
	ret.y = 0;

	// Find X image position
	double zeta = atan(m_cam2.y/m_cam2.x);
	double m =(coorWorld.y - m_cam2.y)/(coorWorld.x - m_cam2.x);
	double beta = atan(m );
	double alpha = 0;
	if (beta  >= zeta )
		alpha = beta  - zeta ;
	else
		alpha = zeta  - beta ;
	double dx = m_cam2.focus*tan(alpha );
	double xpixel = (dx *szCam2.width)/m_cam2.iwidth;
	double xImagePos = 0;
	if (beta  >= zeta )
		xImagePos = (szCam2.width/2) - xpixel;
	else
		xImagePos = (szCam2.width/2) + xpixel;

	// Find Y image position
	double L = sqrt(((coorWorld.x - m_cam2.x)*(coorWorld.x - m_cam2.x)) + ((coorWorld.y - m_cam2.y)*(coorWorld.y - m_cam2.y)));
	double dz = (coorWorld.z*m_cam2.focus)/L;
	double y2pixel = (dz*szCam2.height)/m_cam2.iheight;
	double ypixel = y2pixel + (szCam2.height/2);
	double yImagePos = szCam2.height - ypixel; // -1 ????

	ret.x = (int)xImagePos;
	ret.y = (int)yImagePos;
	return ret;
}


STR_IMAGECOOR CStereopsis::GetCam3ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam3)
{
	STR_IMAGECOOR ret;

	ret.x = 0;
	ret.y = 0;

	// Find X image position
	double zeta  = atan(m_cam3.y/m_cam3.x);
	double m  =(coorWorld.y - m_cam3.y)/(coorWorld.x - m_cam3.x);
	double beta  = atan(m );
	double alpha  = 0;
	if (beta  >= zeta )
		alpha = beta  - zeta ;
	else
		alpha = zeta  - beta ;
	double dx = m_cam3.focus*tan(alpha );
	double xpixel = (dx *szCam3.width)/m_cam3.iwidth;
	double xImagePos = 0;
	if (beta  >= zeta )
		xImagePos = (szCam3.width/2) - xpixel;
	else
		xImagePos = (szCam3.width/2) + xpixel;

	// Find Y image position
	double L = sqrt(((coorWorld.x - m_cam3.x)*(coorWorld.x - m_cam3.x)) + ((coorWorld.y - m_cam3.y)*(coorWorld.y - m_cam3.y)));
	double dz = (coorWorld.z*m_cam3.focus)/L;
	double y2pixel = (dz*szCam3.height)/m_cam3.iheight;
	double ypixel = y2pixel + (szCam3.height/2);
	double yImagePos = szCam3.height - ypixel; // -1 ????

	ret.x = (int)xImagePos;
	ret.y = (int)yImagePos;

	return ret;
}

STR_IMAGECOOR CStereopsis::GetCam4ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam4)
{
	STR_IMAGECOOR ret;

	ret.x = 0;
	ret.y = 0;

	// Find X image position
	double zeta = atan(m_cam4.y/m_cam4.x);
	double m =(coorWorld.y - m_cam4.y)/(coorWorld.x - m_cam4.x);
	double beta = atan(m );
	double alpha = 0;
	if (beta  >= zeta )
		alpha = beta  - zeta ;
	else
		alpha = zeta  - beta ;
	double dx = m_cam4.focus*tan(alpha );
	double xpixel = (dx *szCam4.width)/m_cam4.iwidth;
	double xImagePos = 0;
	if (beta  >= zeta )
		xImagePos = (szCam4.width/2) - xpixel;
	else
		xImagePos = (szCam4.width/2) + xpixel;

	// Find Y image position
	double L = sqrt(((coorWorld.x - m_cam4.x)*(coorWorld.x - m_cam4.x)) + ((coorWorld.y - m_cam4.y)*(coorWorld.y - m_cam4.y)));
	double dz = (coorWorld.z*m_cam2.focus)/L;
	double y2pixel = (dz*szCam4.height)/m_cam4.iheight;
	double ypixel = y2pixel + (szCam4.height/2);
	double yImagePos = szCam4.height - ypixel; // -1 ????

	ret.x = (int)xImagePos;
	ret.y = (int)yImagePos;
	return ret;
}