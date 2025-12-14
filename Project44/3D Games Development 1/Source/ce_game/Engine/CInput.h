#ifndef CINPUT_H
#define CINPUT_H

//#ifndef INITGUID
//#define INITGUID
//#endif

#include <dinput.h>
#include "CDynamicArray.h"

#define SAFE_DELETE(p)  { if(p) { delete (p);     (p)=NULL; } }
#define SAFE_RELEASE(p) { if(p) { (p)->Release(); (p)=NULL; } }
#define MainInput CIManager::getCIM ()
#define GetJoystickCount() CIManager::getCIM()->getjoystickCount() 
#define GetMouseCount() CIManager::getCIM()->getmouseCount()
#define GetKeyboardCount() CIManager::getCIM()->getkeyboardCount()
#define GetEnumCount() CIManager::getCIM()->getenumCount()

#define SetJoystickCount(c) CIManager::getCIM()->setjoystickCount(c) 
#define SetMouseCount(c) CIManager::getCIM()->setmouseCount(c)
#define SetKeyboardCount(c) CIManager::getCIM()->setkeyboardCount(c)
#define SetEnumCount(c) CIManager::getCIM()->setenumCount(c)

enum DEVICETYPE
{
    ALL_TYPE = 0,
    KEY_TYPE = 1,
    MOUSE_TYPE = 2,
    JOY_TYPE = 3,
};

class CIKeyboard;
class CINotKeyboard;
class CIMouse;
class CIJoystick;
class CIEffect;
class CIEffAgent;

extern HRESULT DInput_init(HWND const hwnd);
extern void DInput_cleanup();

extern HRESULT DInput_getDeviceNum(DWORD& num);
extern HRESULT DInput_getDeviceNum(DEVICETYPE const type,DWORD& num);

extern HRESULT DInput_createDevice(DWORD& keyNum,DWORD& mouseNum,DWORD& joystickNum);
extern void DInput_destroyDevice();

extern HRESULT DInput_getInfoGuidProduct(DEVICETYPE const type,DWORD const handle,GUID& guidProduct);
extern HRESULT DInput_getInfoGuidFFDriver(DEVICETYPE const type,DWORD const handle,GUID& guidFFDriver);
extern HRESULT DInput_getInfoInstanceName(DEVICETYPE const type,DWORD const handle,TCHAR* tszInstanceName);
extern HRESULT DInput_getInfoProductName(DEVICETYPE const type,DWORD const handle,TCHAR* tszProductName);
extern HRESULT DInput_getInfoDeviceMainType(DEVICETYPE const type,DWORD const handle,DWORD& manintype);
extern HRESULT DInput_getInfoDeviceSubType(DEVICETYPE const type,DWORD const handle,DWORD& subtype);
extern HRESULT DInput_getInfoDeviceType(DEVICETYPE const type,DWORD const handle,DWORD& alltype);

extern HRESULT DInput_isAttatch(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_enableDevice(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_disibleDevice(DEVICETYPE const type,DWORD const handle);

extern HRESULT DInput_getFFSupport(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFPause(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFContinue(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFStop(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFReset(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFActuatorsON(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_setFFActuatorsOFF(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_getFFPause(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_getFFActuatorsON(DEVICETYPE const type,DWORD const handle);
extern HRESULT DInput_getFFActuatorsOFF(DEVICETYPE const type,DWORD const handle);

extern HRESULT DInput_getInfoAxes(DEVICETYPE const type,DWORD const handle,DWORD& numAxes);
extern HRESULT DInput_getInfoPOVs(DEVICETYPE const type,DWORD const handle,DWORD& numPOVs);
extern HRESULT DInput_getInfoButtons(DEVICETYPE const type,DWORD const handle,DWORD& numButtons);
extern HRESULT DInput_setRange(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRange(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setDeadZone(DEVICETYPE const type,DWORD const handle,LONG const deadzone);
extern HRESULT DInput_getDeadZone(DEVICETYPE const type,DWORD const handle,LONG& deadzone);
extern HRESULT DInput_setSaturation(DEVICETYPE const type,DWORD const handle,LONG const saturation);
extern HRESULT DInput_getSaturation(DEVICETYPE const type,DWORD const handle,LONG& saturation);

extern HRESULT DInput_setRangeX(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeX(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setRangeY(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeY(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setRangeZ(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeZ(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setRangeRX(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeRX(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setRangeRY(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeRY(DEVICETYPE const type,DWORD const handle,LONG& range);
extern HRESULT DInput_setRangeRZ(DEVICETYPE const type,DWORD const handle,LONG const range);
extern HRESULT DInput_getRangeRZ(DEVICETYPE const type,DWORD const handle,LONG& range);

extern HRESULT DInput_getState(DWORD const handle,BYTE* pBuffer);
extern HRESULT DInput_getState(DWORD const handle,DIMOUSESTATE2& buffer);
extern HRESULT DInput_getState(DWORD const handle,DIJOYSTATE2& buffer);

extern HRESULT DInput_createFFEffect(DEVICETYPE const type,DWORD const handle,TCHAR* name,TCHAR* filename,CIEffAgent& agent);
extern HRESULT DInput_destroyFFEffect(TCHAR* name);
extern HRESULT DInput_cloneFFEffectAgent(TCHAR* name,CIEffAgent& agent);
extern HRESULT DInput_playFFEffect(TCHAR* name);
extern HRESULT DInput_setloopFFEffect(TCHAR* name);
extern HRESULT DInput_setloopFFEffect(TCHAR* name,DWORD const dloop);
extern HRESULT DInput_resetloopFFEffect(TCHAR* name);
extern HRESULT DInput_isPlayFFEffect(TCHAR* name);
extern HRESULT DInput_checkFFEffect(TCHAR* name);

struct CIEFFECT_ROWS
{
    CIEffect* pCIEffect;
    TCHAR EffName[MAX_PATH] ;
};

class CIManager
{
public:
	CIManager();
	HRESULT init(HWND const hwnd);
	void cleanup();

	IDirectInput8* getDirectInput(){return g_pInput;};
	static CIManager* getCIM();//{return *CAM;};

    DWORD getjoystickCount() {return joystickCount;};
    DWORD getmouseCount(){return mouseCount;};
    DWORD getkeyboardCount(){return keyboardCount;};
	DWORD getenumCount() {return enumCount;};

	void setjoystickCount(DWORD count) {joystickCount = count;};
	void setmouseCount(DWORD count){mouseCount = count;};
	void setkeyboardCount(DWORD count){keyboardCount = count;};
	void setenumCount(DWORD count) {enumCount = count;};

	UINT addArrKeyboard(CIKeyboard* keyboard) {return ArrKeyboard.add(keyboard);};
	UINT addArrMouse(CIMouse* mouse) {return ArrMouse.add(mouse);};
	UINT addArrJoystick(CIJoystick* joystick) {return ArrJoystick.add(joystick);};

	UINT getArrKeyboardSize() {return ArrKeyboard.size();};
	UINT getArrMouseSize() {return ArrMouse.size();};
	UINT getArrJoystickSize() {return ArrJoystick.size();};

	void clearArrKeyboard() {ArrKeyboard.clear();};
	void clearArrMouse() {ArrMouse.clear();};
	void clearArrJoystick() {ArrJoystick.clear();};

	CIKeyboard* toKeyboard(DWORD handle) {return ArrKeyboard[handle];};
	CIMouse* toMouse(DWORD handle) {return ArrMouse[handle];};
	CIJoystick* toJoystick(DWORD handle) {return ArrJoystick[handle];};

	void setHWND(HWND const hwnd) {m_hWnd = hwnd;};
	HWND getHWND() {return m_hWnd;};

	CIEffect* findCIEffect(TCHAR* name,UINT& index);
	HRESULT getCIEffectName(CIEffect* pEffect,TCHAR* name);

	UINT addCIEffectTable(TCHAR* name,CIEffect* const pCIEffect);
	UINT removeCIEffectTable(UINT const index);
	void clearCIEffectTable() {CIEffectTable.clear();};
	UINT getCIEffectTableSize() {return CIEffectTable.size();};
private:
	static CIManager* CIM;
	IDirectInput8* g_pInput;

	DWORD joystickCount;
	DWORD mouseCount;
	DWORD keyboardCount;
	DWORD enumCount;

	typedef CDynamicArray<CIKeyboard*> Arr_Keyboard;
	typedef CDynamicArray<CIMouse*> Arr_Mouse;
	typedef CDynamicArray<CIJoystick*> Arr_Joystick;
	Arr_Keyboard ArrKeyboard;
	Arr_Mouse ArrMouse;
	Arr_Joystick ArrJoystick;

	typedef CDynamicArray<CIEFFECT_ROWS> Arr_CIEffect;
	Arr_CIEffect CIEffectTable;

	HWND m_hWnd;
};

class CIDevice
{
public:
	CIDevice();
	HRESULT init();
	void cleanup();

	//pass
	HRESULT start();
	HRESULT stop();
	//pass

	//pass
	HRESULT getInfoGuidProduct(GUID& guidProduct);
	HRESULT getInfoGuidFFDriver(GUID& guidFFDriver);
	HRESULT getInfoInstanceName(TCHAR* tszInstanceName); 
    HRESULT getInfoProductName(TCHAR* tszProductName);
	
	HRESULT getInfoDeviceMainType(DWORD& manintype);
	HRESULT getInfoDeviceSubType(DWORD& subtype);
	HRESULT getInfoDeviceType(DWORD& type);
	//pass

	IDirectInputDevice8* getDevice() {return g_pDevice;};

	// pass
	BOOL isAttatch();
	BOOL isFFSupport();
	// pass

	//pass
	HRESULT setFFPause();
	HRESULT setFFContinue();
	HRESULT setFFStop();
	HRESULT setFFReset();
	HRESULT setFFActuatorsON();
	HRESULT setFFActuatorsOFF();

	HRESULT getFFPause();
	HRESULT getFFActuatorsON();
	HRESULT getFFActuatorsOFF();
	//pass

protected:
	//not pass
	HRESULT setFFFunction(DWORD const flag);
	HRESULT getFFFunction(DWORD const flag);
	//not pass

	static LPDIRECTINPUT8 getDirectInput();
	//static BOOL CALLBACK  EnumDeviceCallback(const DIDEVICEINSTANCE* pdidInstance,
    //                                    VOID* pContext );
	IDirectInputDevice8*  g_pDevice;
};

class CINotKeyboard:public CIDevice
{
public:
	//Joy and Mouse
	//pass
	HRESULT getInfoAxes(DWORD& numAxes);
	HRESULT getInfoPOVs(DWORD& numPOVs);
	HRESULT getInfoButtons(DWORD& numButtons);
	//pass

	//pass
	HRESULT setRange(LONG const range);
	HRESULT getRange(LONG& range);
	HRESULT setDeadZone(LONG const deadzone);
	HRESULT getDeadZone(LONG& deadzone);
	HRESULT setSaturation(LONG const saturation);
	HRESULT getSaturation(LONG& saturation);
	//pass
protected:


	//pass
	HRESULT turnAutocenterOFF();
	HRESULT turnAutocenterON();
	//pass
};

class CIKeyboard:public CIDevice
{	
public:
	//CIKeyboard();
	HRESULT init();
	void cleanup();

	HRESULT getState(BYTE* pBuffer); //[256]

protected:
	static BOOL CALLBACK  EnumKeyboardCallback(const DIDEVICEINSTANCE* pdidInstance,
                                        VOID* pContext );
};

class CIMouse:public CINotKeyboard
{
public:
	//CIMouse();
	HRESULT init();
	void cleanup();

	//HRESULT setRange(LONG const range);
	HRESULT setRangeX(LONG const range);
	HRESULT getRangeX(LONG& range);
	HRESULT setRangeY(LONG const range);
	HRESULT getRangeY(LONG& range);
	HRESULT setRangeZ(LONG const range);
	HRESULT getRangeZ(LONG& range);

	HRESULT getState(DIMOUSESTATE2 &buffer);

protected:
	static BOOL CALLBACK  EnumMouseCallback(const DIDEVICEINSTANCE* pdidInstance,
                                        VOID* pContext );
};

class CIJoystick:public CINotKeyboard
{
public:
	//CIJoystick();
	HRESULT init();
	void cleanup();

	HRESULT start();

	HRESULT setRangeX(LONG const range);
	HRESULT getRangeX(LONG& range);
	HRESULT setRangeY(LONG const range);
	HRESULT getRangeY(LONG& range);
	HRESULT setRangeZ(LONG const range);
	HRESULT getRangeZ(LONG& range);
	HRESULT setRangeRX(LONG const range);
	HRESULT getRangeRX(LONG& range);
	HRESULT setRangeRY(LONG const range);
	HRESULT getRangeRY(LONG& range);
	HRESULT setRangeRZ(LONG const range);
	HRESULT getRangeRZ(LONG& range);
	//pass

	HRESULT getState(DIJOYSTATE2 &buffer);

protected:
	static BOOL CALLBACK  EnumJoystickCallback(const DIDEVICEINSTANCE* pdidInstance,
                                        VOID* pContext );
};

struct EFFECTS_NODE
{
    LPDIRECTINPUTEFFECT pDIEffect;
    EFFECTS_NODE*       pNext;
};

class CIEffect
{
public:
	CIEffect();
	HRESULT init(CIDevice* const FFDevice,TCHAR* filename);
	void cleanup();
	HRESULT play();

	HRESULT setloop();
	HRESULT setloop(DWORD const dloop);
	HRESULT resetloop();

	HRESULT isPlay();

	void removeAgent(CIEffAgent* const pToEffAgent);
	void addAgent(CIEffAgent* const pToEffAgent);
	BOOL findAgent(CIEffAgent* const pToEffAgent);
	void cleanupAgent();
protected:
	DWORD loop;
private:
	EFFECTS_NODE m_pEffectsList;

	static BOOL CALLBACK EnumEffectsCallback(LPCDIFILEEFFECT pDIFileEffect, VOID* pvRef );
	HRESULT ReadFile(CIDevice* const FFDevice,TCHAR* filename);
	void EmptyEffectList();

	typedef CDynamicArray<CIEffAgent*> Arr_EffAgent;
	Arr_EffAgent ArrEffAgent;
};

class CIEffAgent
{
public:
	CIEffAgent();
	void cleanup();

	HRESULT play();
	HRESULT setloop();
	HRESULT setloop(DWORD const dloop);
	HRESULT resetloop();
	HRESULT isPlay();

	HRESULT dupEffAgent(CIEffAgent& agent);
	HRESULT getName(TCHAR* name);
	HRESULT settoCIEffect(TCHAR* name);
private:
	CIEffect* pCIEffect;
};

#endif