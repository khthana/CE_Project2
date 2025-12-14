#ifndef __NGMISC_H
#define __NGMISC_H

#include <d3d8.h>

#define STR_WINDOWNAME	_T("The Gaia Story")
#define STR_ENGINE		_T("Numaza Game Engine")
#define STR_VERSION		_T("1.00 beta 1 build 210")

#define REL(x) if (x) {(x)->Release();(x)=NULL;}
#define DEL(x) if (x) {delete(x);(x)=NULL;}
#define ALL(x) if (x) {delete[] (x);(x)=NULL;}

#define PI		3.1415926
#define PI_180	0.0174533
#define PI_2	1.5707963

#define DEVICE_ERR_NOSUPPORTDEVICE	0x51000001
#define DEVICE_DEFAULT				0x50000001
#define DEVICE_FORMFILE				0x50000002
#define DEVICE_USERDEFINED			0x50000003

#define	MB_D3D_OK							"No error occurred.\n"
#define MB_DEVICE_ERR_NOSUPPORTDEVICE		"Your device can not run this program. \n"
#define	MB_D3DERR_CONFLICTINGRENDERSTATE	"The currently set render states cannot be used together. \n"
#define MB_D3DERR_CONFLICTINGTEXTUREFILTER  "The current texture filters cannot be used together. \n"
#define MB_D3DERR_CONFLICTINGTEXTUREPALETTE "The current textures cannot be used simultaneously. \n This generally occurs when a multitexture device \n requires that all palletized textures simultaneously enabled \nalso share the same palette. \n"
#define MB_D3DERR_DEVICELOST				"The device is lost and cannot be restored at the current time, \n so rendering is not possible. \n"
#define MB_D3DERR_DEVICENOTRESET			"The device cannot be reset. \n"
#define MB_D3DERR_DRIVERINTERNALERROR		"Internal driver error. \n"
#define MB_D3DERR_INVALIDCALL				"The method call is invalid. \n For example, \n a method's parameter may have an invalid value. \n"
#define MB_D3DERR_INVALIDDEVICE				"The requested device type is not valid. \n"
#define MB_D3DERR_MOREDATA					"There is more data available than the specified buffer size can hold. \n"
#define MB_D3DERR_NOTAVAILABLE				"This device does not support the queried technique. \n"
#define MB_D3DERR_NOTFOUND					"The requested item was not found. \n"
#define MB_D3DERR_OUTOFVIDEOMEMORY			"Direct3D does not have enough display memory to perform the operation. \n"
#define MB_D3DERR_TOOMANYOPERATIONS			"The application is requesting more texture-filtering operations \n than the device supports. \n"
#define MB_D3DERR_UNSUPPORTEDALPHAARG		"The device does not support a specified texture-blending argument \n for the alpha channel. \n"
#define MB_D3DERR_UNSUPPORTEDALPHAOPERATION "The device does not support a specified texture-blending operation \n for the alpha channel. \n"
#define MB_D3DERR_UNSUPPORTEDCOLORARG		"The device does not support a specified texture-blending argument \n for color values. \n"
#define MB_D3DERR_UNSUPPORTEDCOLOROPERATION "The device does not support a specified texture-blending operation \n for color values. \n"
#define MB_D3DERR_UNSUPPORTEDFACTORVALUE	"The device does not support the specified texture factor value. \n"
#define MB_D3DERR_UNSUPPORTEDTEXTUREFILTER	"The device does not support the specified texture filter. \n"
#define MB_D3DERR_WRONGTEXTUREFORMAT		"The pixel format of the texture surface is not valid. \n"
#define MB_E_FAIL							"An undetermined error occurred inside the Direct3D subsystem. \n"
#define MB_E_INVALIDARG						"An invalid parameter was passed to the returning function. \n"
#define MB_E_INVALIDCALL					"The method call is invalid. \n For example, \n a method's parameter may have an invalid value.\n" 
#define MB_E_OUTOFMEMORY					"Direct3D could not allocate sufficient memory to complete the call. \n"
#define MB_S_OK								"No error occurred \n"

#define DP( a )\
{\
	char buff[1024];\
	sprintf( buff, a );\
	OutputDebugString( buff );\
}

#define DP0 DP

#define DP1( a, b )\
{\
	char buff[1024];\
	sprintf( buff, a, b );\
	OutputDebugString( buff );\
}

HRESULT	CheckError(HRESULT,char* buffer = NULL);
void	MB();
void	CenterRect(RECT rcWindow,RECT* rcRect);

DWORD	GetBitDepth(D3DFORMAT);

#endif