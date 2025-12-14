// Stereopsis.cpp : Defines the entry point for the DLL application.
//

#include "stdafx.h"
#include "Stereopsis1.h"

CStereopsis stereo;
double zoffset = 0; 

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{

    return TRUE;
}

STR_CAMERA WINAPI STR_GetCamera1(void)
{
	return stereo.GetCamera1();
}

void WINAPI STR_SetCamera1(const STR_CAMERA &cam1)
{
	stereo.SetCamera1(cam1);
}

STR_CAMERA WINAPI STR_GetCamera2(void)
{
	return stereo.GetCamera2();
}

void WINAPI STR_SetCamera2(const STR_CAMERA &cam2)
{
	stereo.SetCamera2(cam2);
}

STR_CAMERA WINAPI STR_GetCamera3(void)
{
	return stereo.GetCamera3();
}

void WINAPI STR_SetCamera3(const STR_CAMERA &cam3)
{
	stereo.SetCamera3(cam3);
}

STR_CAMERA WINAPI STR_GetCamera4(void)
{
	return stereo.GetCamera4();
}

void WINAPI STR_SetCamera4(const STR_CAMERA &cam4)
{
	stereo.SetCamera4(cam4);
}

STR_WORLDCOOR WINAPI STR_GetWorldCoordinate(const STR_IMAGECOOR &coorCam1, const STR_IMAGESIZE &szCam1, 
											const STR_IMAGECOOR &coorCam2, const STR_IMAGESIZE &szCam2)
{
	STR_WORLDCOOR ret = stereo.GetWorldCoordinate(coorCam1, szCam1, coorCam2, szCam2);
	ret.z += zoffset;
	return ret;
}

STR_IMAGECOOR WINAPI STR_GetCam1ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam1)
{
	return stereo.GetCam1ImageCoordinate(coorWorld, szCam1);
}

STR_IMAGECOOR WINAPI STR_GetCam2ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam2)
{
	return stereo.GetCam2ImageCoordinate(coorWorld, szCam2);
}

STR_IMAGECOOR WINAPI STR_GetCam3ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam3)
{
	return stereo.GetCam3ImageCoordinate(coorWorld, szCam3);
}

STR_IMAGECOOR WINAPI STR_GetCam4ImageCoordinate(const STR_WORLDCOOR &coorWorld, const STR_IMAGESIZE &szCam4)
{
	return stereo.GetCam4ImageCoordinate(coorWorld, szCam4);
}

void WINAPI STR_SetZOffset(double Offset)
{
	zoffset = Offset;
}

double WINAPI STR_GetZOffset()
{
	return zoffset;
}

