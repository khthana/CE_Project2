#include "CInput.h"

HRESULT DInput_init(HWND const hwnd)
{
	HRESULT hr;
	DWORD t1,t2,t3;
	if (FAILED(hr = MainInput->init(hwnd))) return E_FAIL;
	return DInput_createDevice(t1,t2,t3);
}

void DInput_cleanup()
{
	DInput_destroyDevice();
	MainInput->cleanup();
}

HRESULT DInput_getDeviceNum(DWORD& num)
{
	num = GetJoystickCount() + GetMouseCount() + GetKeyboardCount() ;
	return S_OK;
}

HRESULT DInput_getDeviceNum(DEVICETYPE const type,DWORD& num)
{
	switch(type)
	{
	case KEY_TYPE :
		num = GetKeyboardCount();
		break;
	case MOUSE_TYPE :
		num = GetMouseCount();
		break;
	case JOY_TYPE :
		num = GetJoystickCount();
		break;
	default :
		num = GetJoystickCount() + GetMouseCount() + GetKeyboardCount() ;
		break;
	}
	return S_OK;
}

HRESULT DInput_createDevice(DWORD& keyNum,DWORD& mouseNum,DWORD& joystickNum)
{
	HRESULT hr;
	DInput_destroyDevice();
	do 
	{
		CIKeyboard* t_keyboard = new CIKeyboard;
		hr = t_keyboard->init();
		if (hr == S_OK)
			MainInput->addArrKeyboard(t_keyboard);
	}while (hr == S_OK);
	do
	{
		CIMouse* t_mouse = new CIMouse;
		hr = t_mouse->init();
		if (hr == S_OK)
			MainInput->addArrMouse(t_mouse);
	}while (hr == S_OK);
	do
	{
		CIJoystick* t_joystick = new CIJoystick;
		hr = t_joystick->init();
		if (hr == S_OK)
			MainInput->addArrJoystick(t_joystick);
	} while (hr == S_OK);

	keyNum = GetKeyboardCount();
	mouseNum = GetMouseCount();
	joystickNum = GetJoystickCount();
	return S_OK;
}

void DInput_destroyDevice()
{
	while (GetKeyboardCount() > 0)
	{
		if (MainInput->toKeyboard(GetKeyboardCount() - 1) != NULL)
			MainInput->toKeyboard(GetKeyboardCount() - 1)->cleanup();
	};
	MainInput->clearArrKeyboard();
	while (GetMouseCount() > 0)
	{
		if (MainInput->toMouse(GetMouseCount() - 1) != NULL)
			MainInput->toMouse(GetMouseCount() - 1)->cleanup();

	};
	MainInput->clearArrMouse();
	while (GetJoystickCount() > 0)
	{
		if (MainInput->toJoystick(GetJoystickCount() - 1) != NULL)
			MainInput->toJoystick(GetJoystickCount() - 1)->cleanup();

	};
	MainInput->clearArrJoystick();
}

HRESULT DInput_getInfoGuidProduct(DEVICETYPE const type,DWORD const handle,GUID& guidProduct)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoGuidProduct(guidProduct)))
				return E_FAIL;
			else return S_OK;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoGuidProduct(guidProduct)))
				return E_FAIL;
			else return S_OK;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoGuidProduct(guidProduct)))
				return E_FAIL;
			else return S_OK;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoGuidFFDriver(DEVICETYPE const type,DWORD const handle,GUID& guidFFDriver)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoGuidFFDriver(guidFFDriver)))
				return E_FAIL;
			else return S_OK;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoGuidFFDriver(guidFFDriver)))
				return E_FAIL;
			else return S_OK;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoGuidFFDriver(guidFFDriver)))
				return E_FAIL;
			else return S_OK;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoInstanceName(DEVICETYPE const type,DWORD const handle,TCHAR* tszInstanceName)
{
	HRESULT hr;
	TCHAR* t_str;
	t_str = "";
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoInstanceName(t_str)))
				return E_FAIL;
			else break;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoInstanceName(t_str)))
				return E_FAIL;
			else break;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoInstanceName(t_str)))
				return E_FAIL;
			else break;
	default :return E_FAIL;
	}
	strcpy(tszInstanceName,t_str);
	return S_OK;
}

HRESULT DInput_getInfoProductName(DEVICETYPE const type,DWORD const handle,TCHAR* tszProductName)
{
	HRESULT hr;
	TCHAR* t_str;
	t_str = "";
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoProductName(t_str)))
				return E_FAIL;
			else break;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoProductName(t_str)))
				return E_FAIL;
			else break;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoProductName(t_str)))
				return E_FAIL;
			else break;
	default :return E_FAIL;
	}
	strcpy(tszProductName,t_str);
	return S_OK;
}

HRESULT DInput_getInfoDeviceMainType(DEVICETYPE const type,DWORD const handle,DWORD& manintype)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoDeviceMainType(manintype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoDeviceMainType(manintype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoDeviceMainType(manintype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoDeviceSubType(DEVICETYPE const type,DWORD const handle,DWORD& subtype)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoDeviceSubType(subtype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoDeviceSubType(subtype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoDeviceSubType(subtype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoDeviceType(DEVICETYPE const type,DWORD const handle,DWORD& alltype)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getInfoDeviceType(alltype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoDeviceType(alltype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoDeviceType(alltype)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_isAttatch(DEVICETYPE const type,DWORD const handle)
{
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FALSE == MainInput->toKeyboard(handle)->isAttatch())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FALSE == MainInput->toMouse(handle)->isAttatch())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FALSE == MainInput->toJoystick(handle)->isAttatch())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}


HRESULT DInput_enableDevice(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->start()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->start()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->start()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_disibleDevice(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->stop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->stop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->stop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getFFSupport(DEVICETYPE const type,DWORD const handle)
{
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FALSE == MainInput->toKeyboard(handle)->isFFSupport())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FALSE == MainInput->toMouse(handle)->isFFSupport())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FALSE == MainInput->toJoystick(handle)->isFFSupport())
				return S_FALSE;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFPause(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFContinue(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFContinue()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFContinue()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFContinue()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFStop(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFStop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFStop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFStop()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFReset(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFReset()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFReset()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFReset()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFActuatorsON(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setFFActuatorsOFF(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->setFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getFFPause(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getFFPause()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getFFActuatorsON(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getFFActuatorsON()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getFFActuatorsOFF(DEVICETYPE const type,DWORD const handle)
{
	HRESULT hr;
	switch(type)
	{
	case KEY_TYPE:
		if ((handle >= 0) || (handle < GetKeyboardCount()))
			if (FAILED(hr = MainInput->toKeyboard(handle)->getFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getFFActuatorsOFF()))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoAxes(DEVICETYPE const type,DWORD const handle,DWORD& numAxes)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoAxes(numAxes)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoAxes(numAxes)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoPOVs(DEVICETYPE const type,DWORD const handle,DWORD& numPOVs)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoPOVs(numPOVs)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoPOVs(numPOVs)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getInfoButtons(DEVICETYPE const type,DWORD const handle,DWORD& numButtons)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getInfoButtons(numButtons)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getInfoButtons(numButtons)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRange(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setRange(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRange(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRange(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getRange(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRange(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setDeadZone(DEVICETYPE const type,DWORD const handle,LONG const deadzone)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setDeadZone(deadzone)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setDeadZone(deadzone)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getDeadZone(DEVICETYPE const type,DWORD const handle,LONG& deadzone)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getDeadZone(deadzone)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getDeadZone(deadzone)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setSaturation(DEVICETYPE const type,DWORD const handle,LONG const saturation)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setSaturation(saturation)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setSaturation(saturation)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getSaturation(DEVICETYPE const type,DWORD const handle,LONG& saturation)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getSaturation(saturation)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getSaturation(saturation)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeX(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setRangeX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeX(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getRangeX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeY(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setRangeY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeY(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getRangeY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeZ(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->setRangeZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeZ(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case MOUSE_TYPE:
		if ((handle >= 0) || (handle < GetMouseCount()))
			if (FAILED(hr = MainInput->toMouse(handle)->getRangeZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
		break;
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeRX(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeRX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeRX(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeRX(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeRY(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeRY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeRY(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeRY(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_setRangeRZ(DEVICETYPE const type,DWORD const handle,LONG const range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->setRangeRZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getRangeRZ(DEVICETYPE const type,DWORD const handle,LONG& range)
{
	HRESULT hr;
	switch(type)
	{
	case JOY_TYPE:
		if ((handle >= 0) || (handle < GetJoystickCount()))
			if (FAILED(hr = MainInput->toJoystick(handle)->getRangeRZ(range)))
				return E_FAIL;
			else return S_OK;
		else return E_FAIL;
	default :return E_FAIL;
	}
}

HRESULT DInput_getState(DWORD const handle,BYTE* pBuffer)
{
	HRESULT hr;
	if ((handle >= 0) || (handle < GetKeyboardCount()))
		if (FAILED(hr = MainInput->toKeyboard(handle)->getState(pBuffer)))
			return E_FAIL;
		else return S_OK;
	else return E_FAIL;
}

HRESULT DInput_getState(DWORD const handle,DIMOUSESTATE2& buffer)
{
	HRESULT hr;
	if ((handle >= 0) || (handle < GetMouseCount()))
		if (FAILED(hr = MainInput->toMouse(handle)->getState(buffer)))
			return E_FAIL;
		else return S_OK;
	else return E_FAIL;
}

HRESULT DInput_getState(DWORD const handle,DIJOYSTATE2& buffer)
{
	HRESULT hr;
	if ((handle >= 0) || (handle < GetJoystickCount()))
		if (FAILED(hr = MainInput->toJoystick(handle)->getState(buffer)))
			return E_FAIL;
		else return S_OK;
	else return E_FAIL;
}

HRESULT DInput_createFFEffect(DEVICETYPE const type,DWORD const handle,TCHAR* name,TCHAR* filename,CIEffAgent& agent)
{
	HRESULT hr;
	//CIEffect t_Effect;
	//CIEffAgent t_Agent;
	CIEffAgent* t_Agent = new CIEffAgent;
	CIEffect* t_Effect = new CIEffect;
	switch(type)
	{
	case KEY_TYPE:
		if (FAILED(hr = t_Effect->init(MainInput->toKeyboard(handle),filename))) return E_FAIL;
		break;
	case MOUSE_TYPE:
		if (FAILED(hr = t_Effect->init(MainInput->toMouse(handle),filename))) return E_FAIL;
		break;
	case JOY_TYPE:
		if (FAILED(hr = t_Effect->init(MainInput->toJoystick(handle),filename))) return E_FAIL;
		break;
	default:return E_FAIL;
	}
	MainInput->addCIEffectTable(name,t_Effect);
	if (FAILED(hr = t_Agent->settoCIEffect(name))) return E_FAIL;
	else 
	{
		agent = *t_Agent;
		return S_OK;
	};
}

HRESULT DInput_destroyFFEffect(TCHAR* name)
{
	CIEffect* t_Effect;
	UINT t_index;

	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect == NULL) return E_FAIL;
	t_Effect->cleanupAgent();
	MainInput->removeCIEffectTable(t_index);
	return S_OK;
}

HRESULT DInput_cloneFFEffectAgent(TCHAR* name,CIEffAgent& agent)
{
	HRESULT hr;
	CIEffect* t_Effect;
	UINT t_index;
	CIEffAgent t_Agent;

	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect == NULL) return E_FAIL;
	if (FAILED(hr = t_Agent.settoCIEffect(name))) return E_FAIL;
	else 
	{
		agent = t_Agent;
		return S_OK;
	}
}

HRESULT DInput_playFFEffect(TCHAR* name)
{
	UINT t_index;
	CIEffect* t_Effect;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL)
	{
		t_Effect->play();
		return S_OK;
	}
	else return E_FAIL;
}

HRESULT DInput_setloopFFEffect(TCHAR* name)
{
	UINT t_index;
	CIEffect* t_Effect;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL)
	{
		t_Effect->setloop();
		return S_OK;
	}
	else return E_FAIL;
}

HRESULT DInput_setloopFFEffect(TCHAR* name,DWORD const dloop)
{
	UINT t_index;
	CIEffect* t_Effect;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL)
	{
		t_Effect->setloop(dloop);
		return S_OK;
	}
	else return E_FAIL;
}

HRESULT DInput_resetloopFFEffect(TCHAR* name)
{
	UINT t_index;
	CIEffect* t_Effect;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL)
	{
		t_Effect->resetloop();
		return S_OK;
	}
	else return E_FAIL;
}

HRESULT DInput_isPlayFFEffect(TCHAR* name)
{
	UINT t_index;
	CIEffect* t_Effect;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL)
	{
		t_Effect->isPlay();
		return S_OK;
	}
	else return E_FAIL;
}

HRESULT DInput_checkFFEffect(TCHAR* name)
{
	CIEffect* t_Effect;
	UINT t_index;
	t_Effect = MainInput->findCIEffect(name,t_index);
	if (t_Effect != NULL) return S_OK;
	else return E_FAIL;
}

CIManager* CIManager::CIM=NULL;
CIManager::	CIManager(){
	CIM=this;
	g_pInput = NULL;
	joystickCount = 0;
	mouseCount = 0;
	keyboardCount = 0;
	enumCount =0;
	MainInput->clearArrKeyboard();
	MainInput->clearArrMouse();
	MainInput->clearArrJoystick();
	MainInput->clearCIEffectTable();
};

CIManager *CIManager::getCIM()
{
	if(NULL==CIM){
		CIM=new CIManager();
	}
	return CIM;
}

HRESULT CIManager::init (HWND const hwnd)
{
	HRESULT hr;
	hr = DirectInput8Create(GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
			    IID_IDirectInput8, (void**)&g_pInput, NULL); 
	if ((g_pInput == NULL) || (FAILED(hr)))
	{ 
		return E_FAIL;
	}
	MainInput->setHWND(hwnd);
	return S_OK;
}

void CIManager::cleanup()
{
	SAFE_RELEASE(g_pInput);
	joystickCount = 0;
	mouseCount = 0;
	keyboardCount = 0;
	enumCount =0;
	MainInput->clearArrKeyboard();
	MainInput->clearArrMouse();
	MainInput->clearArrJoystick();
	MainInput->clearCIEffectTable();
}

CIEffect* CIManager::findCIEffect(TCHAR* name,UINT& index)
{
	CIEFFECT_ROWS t_row;
	TCHAR t_name[MAX_PATH];
	for (UINT i=0;i<getCIEffectTableSize();i++)
	{
		t_row = CIEffectTable[i];
		strcpy(t_name,name);
		if (strcmp(t_row.EffName ,t_name) == 0)
		{
			index = i;
			return CIEffectTable[i].pCIEffect;
		}
	}
	return NULL;
}

HRESULT CIManager::getCIEffectName(CIEffect* pEffect,TCHAR* name)
{
	CIEFFECT_ROWS t_row;
	CIEffect* t_pEffect;
	for (UINT i=0;i<getCIEffectTableSize();i++)
	{
		t_row = CIEffectTable[i];
		t_pEffect = t_row.pCIEffect;
		if (t_pEffect == pEffect)
		{
			strcpy(name,t_row.EffName);
			return S_OK;
		}
	}
	return E_FAIL;
}

UINT CIManager::addCIEffectTable(TCHAR* name,CIEffect* const pCIEffect)
{
	CIEFFECT_ROWS t_CIEffectRow;
	t_CIEffectRow.pCIEffect = pCIEffect;
	strcpy(t_CIEffectRow.EffName,name);
	CIEffectTable.add(t_CIEffectRow);
	return CIEffectTable.size();
}

UINT CIManager::removeCIEffectTable(UINT const index)
{
	CDynamicArray<CIEFFECT_ROWS> t_CIEffectTable;
	for (UINT i=index;i<getCIEffectTableSize();i++)
		t_CIEffectTable.add(CIEffectTable[i]);
	
	CIEffectTable.setSize(getCIEffectTableSize() -1);

	for (UINT j=0;i<t_CIEffectTable.size();i++)
		CIEffectTable.add(t_CIEffectTable[i]);
	return getCIEffectTableSize();
}

CIDevice::CIDevice()
{
	g_pDevice = NULL;
}

LPDIRECTINPUT8 CIDevice::getDirectInput ()
{
	HRESULT hr;
	LPDIRECTINPUT8  g_pInput = NULL;
	hr = DirectInput8Create(GetModuleHandle(NULL), DIRECTINPUT_VERSION, 
			    IID_IDirectInput8, (void**)&g_pInput, NULL); 
	if ((g_pInput == NULL) || (FAILED(hr)))
	{ 
		return NULL; 
	}
	return g_pInput;
}

void CIDevice::cleanup ()
{
	if (g_pDevice != NULL)
	{
		g_pDevice->Unacquire(); 
		SAFE_RELEASE(g_pDevice);
	};
}

HRESULT CIDevice::start()
{
	HRESULT hr;
	if (g_pDevice != NULL)
		hr = g_pDevice->Acquire();
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIDevice::stop()
{
	HRESULT hr;
	if (g_pDevice != NULL)
		hr = g_pDevice->Unacquire();
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::start()
{
	HRESULT hr;
	if (g_pDevice != NULL)
		hr = g_pDevice->Acquire();
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		//if (FAILED(hr = g_pDevice->Poll())) return E_FAIL;
		//else return S_OK;
		return S_OK;
	}
}

HRESULT CIKeyboard::init ()
{
	HRESULT hr;
	if (MainInput->getDirectInput()== NULL) return E_FAIL;					

	SetEnumCount(0);
	hr = MainInput->getDirectInput()->EnumDevices(DI8DEVCLASS_KEYBOARD , EnumKeyboardCallback,
                       (void*)&g_pDevice, DIEDFL_ALLDEVICES );
	SetEnumCount(0);
	if (FAILED(hr) || g_pDevice == NULL)
		return E_FAIL;

	hr = g_pDevice->SetDataFormat(&c_dfDIKeyboard); 
	if (FAILED(hr))	
	{
		SetKeyboardCount(GetKeyboardCount() -1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}

	hr = g_pDevice->SetCooperativeLevel(MainInput->getHWND(),DISCL_NONEXCLUSIVE | DISCL_FOREGROUND | DISCL_NOWINKEY);
	if (FAILED(hr))
	{
		SetKeyboardCount(GetKeyboardCount() -1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}
	else return S_OK;
}

BOOL CALLBACK CIKeyboard::EnumKeyboardCallback(LPCDIDEVICEINSTANCE pdidInstance, 
                              LPVOID pvRef) 
{
    HRESULT hr;
	SetEnumCount(GetEnumCount() +1);
	if (GetEnumCount() <= (GetKeyboardCount()))
		return DIENUM_CONTINUE;
	IDirectInputDevice8** ppInputDevice = (IDirectInputDevice8**)pvRef;

	hr = MainInput->getDirectInput()->CreateDevice(pdidInstance->guidInstance, ppInputDevice, NULL);
	if (FAILED(hr)) return DIENUM_STOP;
	SetKeyboardCount(GetKeyboardCount() +1);
	(*ppInputDevice)->Initialize(::GetModuleHandle(NULL), DIRECTINPUT_VERSION, pdidInstance->guidInstance);
	return DIENUM_STOP;
}

void CIKeyboard::cleanup ()
{
	SAFE_RELEASE(g_pDevice);
	SetKeyboardCount(GetKeyboardCount() -1);
}

HRESULT CIMouse::init ()
{
	HRESULT hr;
	if (MainInput->getDirectInput() == NULL) return E_FAIL;					

	SetEnumCount(0);
	hr = MainInput->getDirectInput()->EnumDevices(DI8DEVCLASS_POINTER  , EnumMouseCallback,
                       (void*)&g_pDevice, DIEDFL_ALLDEVICES );
	SetEnumCount(0);
	if (FAILED(hr) || g_pDevice == NULL)
		return E_FAIL;

	hr = g_pDevice->SetDataFormat(&c_dfDIMouse); 
	if (FAILED(hr))	
	{
		SetMouseCount(GetMouseCount() - 1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}
	hr = g_pDevice->SetCooperativeLevel(MainInput->getHWND(),DISCL_EXCLUSIVE | DISCL_FOREGROUND);
	if (FAILED(hr))
	{
		SetMouseCount(GetMouseCount() - 1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}
	else 
	{
		turnAutocenterOFF();
		return S_OK;
	}
}

BOOL CALLBACK CIMouse::EnumMouseCallback(LPCDIDEVICEINSTANCE pdidInstance, 
                              LPVOID pvRef) 
{
    HRESULT hr;
	SetEnumCount(GetEnumCount() +1);
	if (GetEnumCount() <= (GetMouseCount()))
		return DIENUM_CONTINUE;
	IDirectInputDevice8** ppInputDevice = (IDirectInputDevice8**)pvRef;
	hr = MainInput->getDirectInput()->CreateDevice(pdidInstance->guidInstance, ppInputDevice, NULL);
	if (FAILED(hr)) return DIENUM_STOP;
	SetMouseCount(GetMouseCount() + 1);
	//mouseCount++;
	(*ppInputDevice)->Initialize(::GetModuleHandle(NULL), DIRECTINPUT_VERSION, pdidInstance->guidInstance);
	return DIENUM_STOP;
}

void CIMouse::cleanup ()
{
	SAFE_RELEASE(g_pDevice);
	SetMouseCount(GetMouseCount() - 1);
}

HRESULT CIJoystick::init ()
{
	HRESULT hr;
	if (MainInput->getDirectInput() == NULL) return E_FAIL;					

	SetEnumCount(0);
	hr = MainInput->getDirectInput()->EnumDevices(DI8DEVCLASS_GAMECTRL  , EnumJoystickCallback,
                       (void*)&g_pDevice, DIEDFL_ALLDEVICES );
	SetEnumCount(0);
	if (FAILED(hr) || g_pDevice == NULL)
		return E_FAIL;

	hr = g_pDevice->SetDataFormat(&c_dfDIJoystick2); 
	if (FAILED(hr))	
	{
		SetJoystickCount(GetJoystickCount() - 1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}
	hr = g_pDevice->SetCooperativeLevel(MainInput->getHWND(),DISCL_EXCLUSIVE | DISCL_BACKGROUND);//DISCL_FOREGROUND);
	if (FAILED(hr))
	{
		SetJoystickCount(GetJoystickCount() - 1);
		SAFE_RELEASE(g_pDevice);
		return E_FAIL;
	}
	else 
	{
		turnAutocenterOFF();
		return S_OK;
	}
}

BOOL CALLBACK CIJoystick::EnumJoystickCallback(LPCDIDEVICEINSTANCE pdidInstance, 
                              LPVOID pvRef) 
{
    HRESULT hr;
	SetEnumCount(GetEnumCount() +1);
	IDirectInputDevice8** ppInputDevice = (IDirectInputDevice8**)pvRef;
	if (GetEnumCount() <= (GetJoystickCount()))
		return DIENUM_CONTINUE;
	hr = MainInput->getDirectInput()->CreateDevice(pdidInstance->guidInstance, ppInputDevice, NULL);
	if (FAILED(hr)) return DIENUM_STOP;
	SetJoystickCount(GetJoystickCount() + 1);
	hr = (*ppInputDevice)->Initialize(::GetModuleHandle(NULL), DIRECTINPUT_VERSION, pdidInstance->guidInstance);
	return DIENUM_STOP;
}

void CIJoystick::cleanup ()
{
	SAFE_RELEASE(g_pDevice);
	SetJoystickCount(GetJoystickCount() - 1);
}


HRESULT CIKeyboard::getState(BYTE* pBuffer)
{
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	//hr = g_pDevice->Poll();
	//if (FAILED(hr)) return E_FAIL;	
	hr = g_pDevice->GetDeviceState(256, pBuffer);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		return S_OK;
	}
}

HRESULT CIMouse::getState(DIMOUSESTATE2& buffer)
{
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	//hr = g_pDevice->Poll();
	//if (FAILED(hr)) return E_FAIL;	
	hr = g_pDevice->GetDeviceState(sizeof(DIMOUSESTATE2),&buffer); 
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getState(DIJOYSTATE2& buffer)
{
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->Poll();
	if (FAILED(hr)) return E_FAIL;	
	hr = g_pDevice->GetDeviceState(sizeof(DIJOYSTATE2),&buffer); 
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIDevice::getInfoGuidProduct(GUID& guidProduct)
{
	DIDEVICEINSTANCE pdidi;
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	pdidi.dwSize = sizeof(DIDEVICEINSTANCE);
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else
	{
	guidProduct = pdidi.guidProduct;
	return S_OK;
	};
}

HRESULT CIDevice::getInfoGuidFFDriver(GUID& guidFFDriver)
{
	DIDEVICEINSTANCE pdidi;
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	pdidi.dwSize = sizeof(DIDEVICEINSTANCE);
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else
	{
	guidFFDriver = pdidi.guidFFDriver;
	return S_OK;
	};
}

HRESULT CIDevice::getInfoInstanceName(TCHAR* tszInstanceName)
{
	DIDEVICEINSTANCE pdidi;
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	pdidi.dwSize = sizeof(DIDEVICEINSTANCE);
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else
	{
	strcpy(tszInstanceName,pdidi.tszInstanceName);
	return S_OK;
	};
}

HRESULT CIDevice::getInfoProductName(TCHAR* tszProductName)
{
	DIDEVICEINSTANCE pdidi;
	HRESULT hr;
	if (g_pDevice == NULL) return E_FAIL;
	pdidi.dwSize = sizeof(DIDEVICEINSTANCE);
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else
	{
	strcpy(tszProductName,pdidi.tszProductName);
	return S_OK;
	};
}

HRESULT CIDevice::getInfoDeviceType(DWORD& type)
{
	HRESULT hr;
	DIDEVICEINSTANCE pdidi;
	pdidi.dwSize = sizeof(DIDEVICEINSTANCE);
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		type = pdidi.dwDevType ;
		return S_OK;
	}
}

HRESULT CIDevice::getInfoDeviceSubType(DWORD& subtype)
{
	HRESULT hr;
	WORD tmp_type;
	DIDEVICEINSTANCE pdidi;
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		tmp_type = LOWORD(pdidi.dwDevType);
		subtype = tmp_type;
		return S_OK;
	}
}

HRESULT CIDevice::getInfoDeviceMainType(DWORD& maintype)
{
	HRESULT hr;
	WORD tmp_type;
	DIDEVICEINSTANCE pdidi;
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetDeviceInfo(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		tmp_type = HIWORD(pdidi.dwDevType);
		maintype = tmp_type;
		return S_OK;
	}
}

BOOL CIDevice::isAttatch()
{
	HRESULT hr;
	DIDEVCAPS pdidi;
	DWORD t_flag,r_flag;
	pdidi.dwSize = sizeof(DIDEVCAPS);
	if (g_pDevice == NULL) return FALSE;
	hr = g_pDevice->GetCapabilities(&pdidi);
	if (FAILED(hr)) return FALSE;
	else 
	{
		t_flag = pdidi.dwFlags;
		r_flag = t_flag & DIDC_ATTACHED;
		if (r_flag != 0) return TRUE;
		else return FALSE;
	}
}


BOOL CIDevice::isFFSupport()
{
	HRESULT hr;
	DIDEVCAPS pdidi;
	DWORD t_flag,r_flag;
	pdidi.dwSize = sizeof(DIDEVCAPS);
	if (g_pDevice == NULL) return FALSE;
	hr = g_pDevice->GetCapabilities(&pdidi);
	if (FAILED(hr)) return FALSE;
	else 
	{
		t_flag = pdidi.dwFlags;
		r_flag = t_flag & DIDC_FORCEFEEDBACK;
		if (r_flag != 0) return TRUE;
		else return FALSE;
	}
}

HRESULT CIDevice::setFFFunction(DWORD const flag)
{
	HRESULT hr;
	if ((g_pDevice == NULL) || (isFFSupport() == FALSE)) return E_FAIL;
	if (FAILED(hr = g_pDevice->SendForceFeedbackCommand(flag)))
		return E_FAIL;
	else return S_OK;
}

HRESULT CIDevice::getFFFunction(DWORD const flag)
{
	HRESULT hr;
	DWORD t_flag;
	if ((g_pDevice == NULL) || (isFFSupport() == FALSE)) return E_FAIL;
	if (FAILED(hr = g_pDevice->GetForceFeedbackState(&t_flag)))
		return E_FAIL;
	else 
	{
		t_flag = t_flag & flag;
		if (t_flag != 0) return S_FALSE;
		else return S_OK;
	}
}

HRESULT CIDevice::setFFPause()
{
	return setFFFunction(DISFFC_PAUSE);
}

HRESULT CIDevice::setFFContinue()
{
	return setFFFunction(DISFFC_CONTINUE);
}

HRESULT CIDevice::setFFStop()
{
	return setFFFunction(DISFFC_STOPALL);
}

HRESULT CIDevice::setFFReset()
{
	return setFFFunction(DISFFC_RESET );

}
HRESULT CIDevice::setFFActuatorsON()
{
	return setFFFunction(DISFFC_SETACTUATORSON);

}

HRESULT CIDevice::setFFActuatorsOFF()
{
	return setFFFunction(DISFFC_SETACTUATORSOFF);
}

HRESULT CIDevice::getFFPause()
{
	return getFFFunction(DIGFFS_PAUSED);
}

HRESULT CIDevice::getFFActuatorsON()
{
	return getFFFunction(DIGFFS_ACTUATORSON);
}

HRESULT CIDevice::getFFActuatorsOFF()
{
	return getFFFunction(DIGFFS_ACTUATORSOFF);
}

HRESULT CINotKeyboard::getInfoAxes(DWORD& numAxes)
{
	HRESULT hr;
	DIDEVCAPS pdidi;
	pdidi.dwSize = sizeof(DIDEVCAPS);
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetCapabilities(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		numAxes = pdidi.dwAxes;
		return S_OK;
	}
}

HRESULT CINotKeyboard::getInfoPOVs(DWORD& numPOVs)
{
	HRESULT hr;
	DIDEVCAPS pdidi;
	pdidi.dwSize = sizeof(DIDEVCAPS);
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetCapabilities(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		numPOVs = pdidi.dwPOVs;
		return S_OK;
	}
}

HRESULT CINotKeyboard::getInfoButtons(DWORD& numButtons)
{
	HRESULT hr;
	DIDEVCAPS pdidi;
	pdidi.dwSize = sizeof(DIDEVCAPS);
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetCapabilities(&pdidi);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		numButtons = pdidi.dwButtons;
		return S_OK;
	}
}

HRESULT CINotKeyboard::turnAutocenterOFF()
{
	DIPROPDWORD dipdw;
	HRESULT hr;
    dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
    dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
    dipdw.diph.dwObj        = 0;
    dipdw.diph.dwHow        = DIPH_DEVICE;
    dipdw.dwData            = DIPROPAUTOCENTER_OFF;

	if (g_pDevice == NULL) return E_FAIL;
    if( FAILED( hr = g_pDevice->SetProperty( DIPROP_AUTOCENTER, &dipdw.diph ) ) )
        return E_FAIL;
	else return S_OK;
}

HRESULT CINotKeyboard::turnAutocenterON()
{
	DIPROPDWORD dipdw;
	HRESULT hr;
    dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
    dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
    dipdw.diph.dwObj        = 0;
    dipdw.diph.dwHow        = DIPH_DEVICE;
    dipdw.dwData            = DIPROPAUTOCENTER_ON;

	if (g_pDevice == NULL) return E_FAIL;
    if( FAILED( hr = g_pDevice->SetProperty( DIPROP_AUTOCENTER, &dipdw.diph ) ) )
        return E_FAIL;
	else return S_OK;
}

HRESULT CINotKeyboard::setDeadZone(LONG const deadzone)
{
	DIPROPDWORD dipdw;
	HRESULT hr;
	DWORD tmp_deadzone;

	if (g_pDevice == NULL) return E_FAIL;
	tmp_deadzone = deadzone;
    dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
    dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
    dipdw.diph.dwObj        = 0;
    dipdw.diph.dwHow        = DIPH_DEVICE;	
    dipdw.dwData            = tmp_deadzone;

    if( FAILED( hr = g_pDevice->SetProperty( DIPROP_DEADZONE , &dipdw.diph ) ) )
        return E_FAIL;
	else return S_OK;
}

HRESULT CINotKeyboard::getDeadZone(LONG& deadzone)
{
	DIPROPDWORD dipdw;
	HRESULT hr;
	LONG tmp_range =0;
	if (g_pDevice == NULL) return E_FAIL;
    if( FAILED( hr = g_pDevice->GetProperty( DIPROP_DEADZONE , &dipdw.diph ) ) )
        return E_FAIL;
	else 
	{
		deadzone = dipdw.dwData;
		return S_OK;
	}
}

HRESULT CINotKeyboard::setSaturation(LONG const saturation)
{
	DIPROPDWORD dipdw;
	HRESULT hr;
	DWORD tmp_saturation;

	if (g_pDevice == NULL) return E_FAIL;
	tmp_saturation = saturation;
    dipdw.diph.dwSize       = sizeof(DIPROPDWORD);
    dipdw.diph.dwHeaderSize = sizeof(DIPROPHEADER);
    dipdw.diph.dwObj        = 0;
    dipdw.diph.dwHow        = DIPH_DEVICE;		
    dipdw.dwData            = tmp_saturation;

    if( FAILED( hr = g_pDevice->SetProperty( DIPROP_SATURATION , &dipdw.diph ) ) )
        return E_FAIL;
	else return S_OK;
}

HRESULT CINotKeyboard::getSaturation(LONG& saturation)
{
	DIPROPDWORD dipdw;
	HRESULT hr;
	LONG tmp_range =0;
	if (g_pDevice == NULL) return E_FAIL;
    if( FAILED( hr = g_pDevice->GetProperty( DIPROP_SATURATION , &dipdw.diph ) ) )
        return E_FAIL;
	else 
	{
		saturation = dipdw.dwData;
		return S_OK;
	}
}

HRESULT CINotKeyboard::setRange(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_DEVICE; 
	diprg.diph.dwObj        = 0; 
	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CINotKeyboard::getRange(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_DEVICE; 
	diprg.diph.dwObj        = 0; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIMouse::setRangeX(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_X; 
	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIMouse::getRangeX(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_X; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIMouse::setRangeY(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_Y; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIMouse::getRangeY(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_Y; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIMouse::setRangeZ(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_Z; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIMouse::getRangeZ(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIMOFS_Z; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeX(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_X ; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeX(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_X ; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeY(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_Y ; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeY(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_Y ; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeZ(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_Z; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeZ(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_Z; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeRX(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RX  ; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeRX(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RX  ; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeRY(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RY ; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeRY(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RY ; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

HRESULT CIJoystick::setRangeRZ(LONG const range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;
	
	if (range >= 0) tmp_range = range;
	else tmp_range = -range;
	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RZ; 

	diprg.lMin              = -tmp_range; 
	diprg.lMax              = +tmp_range; 
	
	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->SetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else return S_OK;
}

HRESULT CIJoystick::getRangeRZ(LONG& range)
{
	DIPROPRANGE diprg; 
	HRESULT hr;
	DWORD type =0;
	LONG tmp_range =0;

	diprg.diph.dwSize       = sizeof(DIPROPRANGE); 
	diprg.diph.dwHeaderSize = sizeof(DIPROPHEADER); 
	diprg.diph.dwHow        = DIPH_BYOFFSET; 
	diprg.diph.dwObj        = DIJOFS_RZ; 

	if (g_pDevice == NULL) return E_FAIL;
	hr = g_pDevice->GetProperty(DIPROP_RANGE, &diprg.diph);
	if (FAILED(hr)) return E_FAIL;
	else 
	{
		range = diprg.lMax;
		return S_OK;
	};
}

CIEffect::CIEffect()
{
    ZeroMemory( &m_pEffectsList, sizeof( EFFECTS_NODE ) );
    m_pEffectsList.pNext = &m_pEffectsList;
	loop = 1;
	ArrEffAgent.clear();
}

HRESULT CIEffect::init(CIDevice* const pFFDevice,TCHAR* filename)
{
	HRESULT hr;
	if ((pFFDevice->getDevice() == NULL) || (pFFDevice->isFFSupport() == FALSE)) return E_FAIL;
	if (FAILED(hr = ReadFile(pFFDevice,filename))) return E_FAIL;
	else 
	{
		return S_OK;
	}
}

HRESULT CIEffect::ReadFile(CIDevice* const FFDevice,TCHAR* filename)
{
	HRESULT hr;
	VOID* pvArr[2];
	pvArr[0] = FFDevice;
	pvArr[1] = &m_pEffectsList;
    EmptyEffectList();
	if(FAILED(hr = FFDevice->getDevice()->EnumEffectsInFile( filename, 
													EnumEffectsCallback, 
                                                    (void*)pvArr , 0 ) ) )
		return E_FAIL;
	else return S_OK;
}

BOOL CALLBACK CIEffect::EnumEffectsCallback(LPCDIFILEEFFECT pDIFileEffect, VOID* pvRef)
{
    HRESULT hr;
    LPDIRECTINPUTEFFECT pDIEffect = NULL;

	CIDevice* pDevice = (CIDevice*)((void**) pvRef)[0];
	EFFECTS_NODE* pEffectList = (EFFECTS_NODE*)((void**) pvRef)[1];

    if( FAILED( hr = (pDevice)->getDevice()->CreateEffect( pDIFileEffect->GuidEffect, 
												pDIFileEffect->lpDiEffect, 
                                                &pDIEffect, NULL ) ) )
        return DIENUM_CONTINUE;

    EFFECTS_NODE* pEffectNode = new EFFECTS_NODE;
    if( NULL == pEffectNode )
        return DIENUM_STOP;

    ZeroMemory( pEffectNode, sizeof( EFFECTS_NODE ) );
    pEffectNode->pDIEffect         = pDIEffect;
    pEffectNode->pNext  = pEffectList->pNext;
    pEffectList->pNext = pEffectNode;

    return DIENUM_CONTINUE;
}

void CIEffect::EmptyEffectList()
{
    EFFECTS_NODE* pEffectNode = m_pEffectsList.pNext;
    EFFECTS_NODE* pEffectDelete;

    while ( pEffectNode != &m_pEffectsList )
    {
        pEffectDelete = pEffectNode;       
        pEffectNode = pEffectNode->pNext;

        SAFE_RELEASE( pEffectDelete->pDIEffect );
        SAFE_DELETE( pEffectDelete );
    }

    m_pEffectsList.pNext = &m_pEffectsList;
}

void CIEffect::cleanup ()
{
    EmptyEffectList();
	loop = 1;
	cleanupAgent();
	ArrEffAgent.clear();
}

HRESULT CIEffect::play()
{
    EFFECTS_NODE*       pEffectNode = m_pEffectsList.pNext;
    LPDIRECTINPUTEFFECT pDIEffect   = NULL;
    HRESULT             hr;

    while ( pEffectNode != &m_pEffectsList )
    {
        pDIEffect = pEffectNode->pDIEffect;
        if( NULL != pDIEffect )
        {
            if( FAILED( hr = pDIEffect->Start(loop, 0 ) ) )
                return E_FAIL;
        }
        pEffectNode = pEffectNode->pNext;
    }
    return S_OK;
}

HRESULT CIEffect::setloop()
{
	loop = INFINITE;
	return S_OK;
}

HRESULT CIEffect::setloop(DWORD const dloop)
{
	loop = dloop;
	return S_OK;
}

HRESULT CIEffect::resetloop()
{
	loop = 1;
	return S_OK;
}

HRESULT CIEffect::isPlay()
{
	DWORD pdwFlags;
	DWORD result;
	if (m_pEffectsList.pDIEffect == NULL) return E_FAIL;
	if (FAILED(m_pEffectsList.pDIEffect->GetEffectStatus(&pdwFlags))) return E_FAIL;
	else
		{ 
		result = pdwFlags & DIEGES_PLAYING ;
		if (result != 0) return S_OK;
		else return E_FAIL;
		};
}

void CIEffect::cleanupAgent()
{
	while (ArrEffAgent.size() > 0)
	{
		if (ArrEffAgent[ArrEffAgent.size() -1] != NULL)
		{
			ArrEffAgent[ArrEffAgent.size() -1]->cleanup();
			ArrEffAgent.setSize(ArrEffAgent.size() -1);
		}
	};
	ArrEffAgent.clear();
}

void CIEffect::removeAgent(CIEffAgent* const pToEffAgent)
{
	for (UINT i=0;i<ArrEffAgent.size();i++);
	{
		if (ArrEffAgent[i] == pToEffAgent)
		{
			CDynamicArray<CIEffAgent*> t_ArrEffAgent;
			for (UINT j=i;j<ArrEffAgent.size();j++)
				t_ArrEffAgent.add(ArrEffAgent[j]);
	
			ArrEffAgent.setSize(ArrEffAgent.size() -1);

			for (UINT k=0;k<t_ArrEffAgent.size();k++)
				ArrEffAgent.add(t_ArrEffAgent[k]);
		}
	}
}

void CIEffect::addAgent(CIEffAgent* const pToEffAgent)
{
	ArrEffAgent.add(pToEffAgent);
}

BOOL CIEffect::findAgent(CIEffAgent* const pToEffAgent)
{
	for (UINT i=0;i<ArrEffAgent.size();i++)
		if (ArrEffAgent[i] == pToEffAgent) return TRUE;
	return FALSE;
}

CIEffAgent::CIEffAgent()
{
	pCIEffect = NULL;
}

HRESULT CIEffAgent::settoCIEffect(TCHAR* name)
{
	CIEffect* t_pEffect;
	UINT t_index;
	t_pEffect = MainInput->findCIEffect(name,t_index);
	if (t_pEffect != NULL)
	{
		if (t_pEffect->findAgent(this) == TRUE) return E_FAIL;
		t_pEffect->addAgent(this);
		pCIEffect = t_pEffect;
		return S_OK;
	}
	else return E_FAIL;
}

//HRESULT CIEffAgent::settoCIEffect(CIEffect* pToCIEffect)
//{
//	pCIEffect = pToCIEffect;
//	return S_OK;
//}

void CIEffAgent::cleanup()
{
	if (pCIEffect != NULL)
	{
		pCIEffect->removeAgent(this);
		pCIEffect=NULL;
	}
}

HRESULT CIEffAgent::play()
{
	if (pCIEffect != NULL)
		return pCIEffect->play();
	else return E_FAIL;
}

HRESULT CIEffAgent::setloop()
{
	if (pCIEffect != NULL)
		return pCIEffect->setloop();
	else return E_FAIL;
}

HRESULT CIEffAgent::setloop(DWORD const dloop)
{
	if (pCIEffect != NULL)
		return pCIEffect->setloop(dloop);
	else return E_FAIL;
}

HRESULT CIEffAgent::resetloop()
{
	if (pCIEffect != NULL)
		return pCIEffect->resetloop();
	else return E_FAIL;
}

HRESULT CIEffAgent::isPlay()
{
	if (pCIEffect != NULL)
		return pCIEffect->isPlay();
	else return E_FAIL;
}

HRESULT CIEffAgent::dupEffAgent(CIEffAgent& t_agent)
{
	HRESULT hr;
	CIEffAgent temp_agent;
	TCHAR t_name[MAX_PATH];
	if (pCIEffect == NULL) return E_FAIL;
	if (FAILED(hr = getName(t_name))) return E_FAIL;
	if (FAILED(hr = temp_agent.settoCIEffect(t_name))) return E_FAIL;
	t_agent = temp_agent;
	return S_OK;
}

HRESULT CIEffAgent::getName(TCHAR* name)
{
	if (MainInput->getCIEffectName(pCIEffect,name) != S_OK) return E_FAIL;
	else return S_OK;
}
