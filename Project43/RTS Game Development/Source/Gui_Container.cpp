#include "Gui_Container.h"

//-------------------------------------------------------------
// method: add(Gui_Plane *aComp)
// note: only add it if it isn't already in our window list.
//-------------------------------------------------------------
int Gui_Container::add(Gui_Plane *aComp){
	if (!aComp) return(-1);
	list<Gui_Plane *>::iterator current=subComponents.begin();
	list<Gui_Plane *>::iterator last=subComponents.end();
	while(current!=last)
	  if(*current==aComp) return(0);
	  else current++;
	subComponents.push_back(aComp);
	aComp->setParent(this);
	return(0);
};

int Gui_Container::remove(Gui_Plane * aComp){
	if(!aComp) return(-1);
	list<Gui_Plane *>::iterator current=subComponents.begin();
	list<Gui_Plane *>::iterator last=subComponents.end();
	while(current!=last)
	{
	  if(*current==aComp)
	  {
		aComp->setParent(NULL);
		subComponents.erase(current);
		return(0);
	  }
	  else current++;
	}
	return(0);
};

Gui_Plane * Gui_Container::getObjectAtCoord(POINT relPoint){
	Gui_Plane *result=findChildAtCoord(relPoint);
	if(result==NULL)
		return this;
	return(result);
};

Gui_Plane * Gui_Container::findChildAtCoord(POINT relPoint){
	if((int)subComponents.size()>0)
	{
		list<Gui_Plane *>::iterator current=subComponents.end();
		int n=subComponents.size();
		Gui_Plane *aComp;
		do{
			--n;
			aComp=*(--current);
		    if (aComp->getVisibility()&&aComp->isContain(relPoint))
				return aComp;
		}while(n!=0);
	}
	return(NULL);
};

void Gui_Container::render(){
	renderSub();
	renderSelf();
};

void Gui_Container::renderSelf(){
};

void Gui_Container::renderSub(){
	list<Gui_Plane *>::iterator current=subComponents.begin();
	list<Gui_Plane *>::iterator last=subComponents.end();
	POINT pos;
	Gui_Plane *sub;
	while(current!=last){
		sub=(*current++);
		if(sub->getVisibility()==true){
			sub->refresh();
			pos=sub->getPos();
				_graphics->GraphicsBlt(sub->getGraphics(), pos.x, pos.y, NULL);
		}
	}
};

void Gui_Container::_onLeftButtonDown(POINT mPos, UINT keyFlags){
	Gui_Plane *aChild=findChildAtCoord(mPos);
	if(aChild==NULL){
		onLeftButtonDown(mPos, keyFlags);
	}else{
		POINT newp=aChild->getPos();
		POINT newMPos={mPos.x-newp.x,mPos.y-newp.y};
		aChild->_onLeftButtonDown(newMPos, keyFlags);
	}
};

void Gui_Container::_onLeftButtonUp(POINT mPos, UINT keyFlags){
	Gui_Plane *aChild=findChildAtCoord(mPos);
	if(aChild==NULL){
		onLeftButtonUp(mPos, keyFlags);
	}else{
		POINT newp=aChild->getPos();
		POINT newMPos={mPos.x-newp.x,mPos.y-newp.y};
		aChild->_onLeftButtonUp(newMPos, keyFlags);
	}
};

void Gui_Container::_onRightButtonDown(POINT mPos, UINT keyFlags){
	Gui_Plane *aChild=findChildAtCoord(mPos);
	if(aChild==NULL){
		onRightButtonDown(mPos, keyFlags);
	}else{
		POINT newp=aChild->getPos();
		POINT newMPos={mPos.x-newp.x,mPos.y-newp.y};
		aChild->_onRightButtonDown(newMPos, keyFlags);
	}
};

void Gui_Container::_onRightButtonUp(POINT mPos, UINT keyFlags){
	Gui_Plane *aChild=findChildAtCoord(mPos);
	if(aChild==NULL){
		onRightButtonUp(mPos, keyFlags);
	}else{
		POINT newp=aChild->getPos();
		POINT newMPos={mPos.x-newp.x,mPos.y-newp.y};
		aChild->_onRightButtonUp(newMPos, keyFlags);
	}
};

void Gui_Container::ReleaseAllObject()
{
	list<Gui_Plane *>::iterator current=subComponents.begin();
	list<Gui_Plane *>::iterator last=subComponents.end();
	Gui_Plane *sub;
	while(current!=last){
		sub=(*current++);
		sub->ReleaseAllObject();
	}
	_graphics->ReleaseAllObject();
};