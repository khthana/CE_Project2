#include "gui_plane.h"

void Gui_Plane::setParent(Gui_Plane * p){
	_parent=p;
};
Gui_Plane *Gui_Plane::getParent(){
	return _parent;
};
void Gui_Plane::setVisibility(bool v){
	b_Visibility=v;
};
bool Gui_Plane::getVisibility(){
	return b_Visibility;
};
//-----------------------------------------------------------
//	end: Window management control
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Coordination
//-----------------------------------------------------------
void Gui_Plane::setPos(int x, int y){
	_pos.x=x;
	_pos.y=y;
};
POINT Gui_Plane::getPos(){
	return _pos;
};
void Gui_Plane::setSize(int w, int h){
	_size.cx=(w>0)? w:0;
	_size.cy=(h>0)? h:0;
};
SIZE Gui_Plane::getSize(){
	return(_size);
};
bool Gui_Plane::isContain(POINT p){
	if(!(p.x>_pos.x&&p.x<_pos.x+_size.cx))
		return(false);
	if(!(p.y>_pos.y&&p.y<_pos.y+_size.cy))
		return(false);		
	return(true);
};
Gui_Plane * Gui_Plane::getObjectAtCoord(POINT p){
	return(this);
};
//-----------------------------------------------------------
//	end: Coordination
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Rendering
//-----------------------------------------------------------
Graphics *Gui_Plane::getGraphics(){
	return _graphics;
};
void Gui_Plane::render(){};
void Gui_Plane::refresh(){
	b_isRefreshing = true;
	render();
	b_isRefreshing = false;
};
bool Gui_Plane::isRefreshing(){
	return b_isRefreshing;
};
//-----------------------------------------------------------
//	end: Rendering
//-----------------------------------------------------------
//-----------------------------------------------------------
//	begin: Window Message Management
//-----------------------------------------------------------
void Gui_Plane::calcall(){};
void Gui_Plane::_onLeftButtonDown(POINT mPos, UINT keyFlags){
	onLeftButtonDown(mPos, keyFlags);
};
void Gui_Plane::_onLeftButtonUp(POINT mPos, UINT keyFlags){
	onLeftButtonUp(mPos, keyFlags);
};
void Gui_Plane::_onRightButtonDown(POINT mPos, UINT KeyFlags){
	onRightButtonDown(mPos, KeyFlags);
};
void Gui_Plane::_onRightButtonUp(POINT mPos, UINT KeyFlags){
	onRightButtonUp(mPos, KeyFlags);
};
void Gui_Plane::_onMouseMove(UINT par1, UINT par2){
	onMouseMove(par1, par2);
};
void Gui_Plane::_onKeyDown(UINT par1, UINT par2){
	onKeyDown(par1, par2);
};
void Gui_Plane::_onKeyUp(UINT par1, UINT par2){
	onKeyUp(par1, par2);
};
void Gui_Plane::onLeftButtonDown(POINT mPos, UINT keyFlags){};
void Gui_Plane::onLeftButtonUp(POINT mPos, UINT keyFlags){};
void Gui_Plane::onRightButtonDown(POINT mPos, UINT keyFlags){};
void Gui_Plane::onRightButtonUp(POINT mPos, UINT keyFlags){};
void Gui_Plane::onMouseMove(UINT par1, UINT par2){};
void Gui_Plane::onKeyDown(UINT par1, UINT par2){};
void Gui_Plane::onKeyUp(UINT par1, UINT par2){};
//-----------------------------------------------------------
//	end: Window Message Management
//-----------------------------------------------------------
Gui_Plane::Gui_Plane(int width, int height){
	setParent(NULL);
	setVisibility(false);
	setPos(0,0);
	setSize(width,height);
	_graphics=new Graphics(width ,height);
	b_isRefreshing = false;
};

void Gui_Plane::ReleaseAllObject(){
	_graphics->ReleaseAllObject();
};
