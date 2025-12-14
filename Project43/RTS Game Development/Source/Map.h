#ifndef _Map_header_
#define _Map_header_

class Map{
public:
	bool pointExist(int x, int y);
	int getWidth();
	int getHeight();
protected:
	Map();
	Map(int w, int h);
	int width;
	int height;
};

#endif _Map_header_