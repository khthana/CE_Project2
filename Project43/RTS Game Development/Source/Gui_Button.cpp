#include "Gui_Button.h"

void Gui_Button::setText(const char *t){
	HDC hdc;
	_graphics->GGetDC(&hdc);
	SIZE text_size;
	text_length=strlen(t);
	text=(char *)calloc(text_length, sizeof(char));
	strcpy(text,t);
	GetTextExtentPoint(hdc, text, strlen(text), &text_size);
	text_pos.x=static_cast<LONG>((_size.cx-text_size.cx)/2);
	text_pos.y=static_cast<LONG>((_size.cy-text_size.cy)/2);
	_graphics->GReleaseDC(hdc);
};
#define GUI_BUTTON_CLR1 RGB(255, 255, 0)
#define GUI_BUTTON_CLR2 RGB(255, 100, 100)

void Gui_Button::render(){

	HDC hdc;
	_graphics->Clear();
	_graphics->GGetDC(&hdc);
	switch(stat){
	case PRESSED:
		SetTextColor(hdc, GUI_BUTTON_CLR1);
		break;
	case RELEASED:
		SetTextColor(hdc, GUI_BUTTON_CLR2);
		break;
	}
	SetBkMode(hdc, TRANSPARENT);
	RECT rc={0,0,_size.cx-1, _size.cy-1};
	FillRect(hdc, &rc, (HBRUSH)GetStockObject(GRAY_BRUSH));
	TextOut(hdc, text_pos.x, text_pos.y, text, text_length);
	_graphics->GReleaseDC(hdc);
};

void Gui_Button::_onLeftButtonDown(POINT mPos, UINT keyFlags)
{
	stat=PRESSED;
	onLeftButtonDown(mPos, keyFlags);
};

void Gui_Button::_onLeftButtonUp(POINT mPos, UINT keyFlags)
{
	stat=RELEASED;
	onLeftButtonUp(mPos, keyFlags);
};
