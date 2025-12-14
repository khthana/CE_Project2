#define STRICT
#include "gamemain.h"

INT WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPSTR, int)
{
	static GameMain gm;
	if (!gm.Create(hInstance))
		return 0;

	return gm.Run();
}