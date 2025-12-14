// Game.h: interface for the CGame class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_GAME_H__687221F3_ACFF_4D66_97DB_88AB70E0CA59__INCLUDED_)
#define AFX_GAME_H__687221F3_ACFF_4D66_97DB_88AB70E0CA59__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include <d3dx8.h>
#include <dinput.h>
#include <d3dx8tex.h>
#include <conio.h>

#include "Base.h"

#include "Cuboid.h"
#include "Terrain.h"
#include "Sphere.h"
#include "Cone.h"
#include "Cylinder.h"
#include "Mesh.h"
#include "Font.h"
#include "Sound.h"

#include "hwinterfacedrv.h"

class CGame : public CBase
{
public:
	bool Initialise(HWND hWnd, HINSTANCE hInst, UINT nWidth, UINT nHeight);
	void GameLoop();
	void CleanUpDirectInput();
	void CleanUpDirectAudio();
	LPDIRECT3DDEVICE8 GetDevice();
	CGame();
	virtual ~CGame();

private:
	bool InitialiseLights();
	D3DFORMAT CheckDisplayMode(UINT nWidth, UINT nHeight, UINT nDepth);
	bool InitialiseGame();
	bool InitialiseD3D(HWND hWnd, UINT nWidth, UINT nHeight);
	
	bool InitialiseDirectAudio(HWND hWnd);
	IDirectMusicPerformance8* m_pDirectAudioPerformance;
	IDirectMusicLoader8* m_pDirectAudioLoader;

	void Render();
	LPDIRECT3D8 m_pD3D;
	LPDIRECT3DDEVICE8 m_pD3DDevice;

	LPDIRECTINPUT8 m_pDirectInput;
	LPDIRECTINPUTDEVICE8 m_pKeyboard;
	void ProcessKeyboard();
	bool InitialiseDirectInput(HWND hWnd, HINSTANCE hInst);
	void Setup2DCamera();
	void RenderText();
	void CheckCollision();
	void CheckBridge();
	void CheckObstacle();
	void PulseMotor();

	float m_rRotataX;
	float m_rRotataY;
	float m_rRotataZ;

	float m_rCamPosX;
	float m_rCamPosY;
	float m_rCamPosZ;

	float m_rZoom;

	float g_fAngleX;    // Rotation angle for the x-axis
	float g_fAngleY;    // Rotation angle for the y-axis
	float g_fPosX;    // Camera position on the x-axis
	float g_fPosY;    // Camera position on the y-axis
	float g_fPosZ;    // Camera position on the z-axis

	float Moving_Speed;
	float KEYBOARD_MOVING_SPEED;
	float KEYBOARD_ROTATION_SPEED;

	void Setup3DCamera();
	void Render3D();
	void RenderSkyBox();
	
	DWORD m_dwFrames;
	DWORD m_dwStartTime;
	DWORD m_dwEndTime;
	DWORD m_dwTotalPolygons;
	int m_nScreenWidth;
	int m_nScreenHeight;

	CMesh* m_pMeshWorld;
	CMesh* m_pMeshTulip;
	CMesh* m_pMeshSakuraso;
	CMesh* m_pMeshPalm;
	CMesh* m_pMeshPalm1;
	CMesh* m_pMeshSun;
	CMesh* m_pMeshFence;
	CMesh* m_pMeshBridge;
	
	CFont* m_pFont;
	CFont* m_pFontBig;
	CCuboid* m_pCube1;
	CCuboid* m_pCube2;
	CCuboid* m_pBuilding;
	CTerrain* m_pTerrain1;
	CCuboid* m_pWall1;
	CCuboid* m_pWall2;
	CCuboid* m_pWall3;
	CCuboid* m_pWall4;
	CCuboid* m_pBrickWall;
	CCuboid* m_pBrickWall2;
	CCuboid* m_pBrickWall3;
	CCuboid* m_pBrickWall4;
	CCuboid* m_pBrickWall5;


	float UpDown; //Camera Position: UpDown Status
	float UpDownDist; //Camera Position: UpDown Distance

	bool collide;

	//below is the Skybox
	CMesh* m_pMeshSkyBox;

	//hardware interface
	//printio
	bool InitialiseParallelPort();
	HANDLE h;
	
	//parport
	void outport(int PortAddress, int data);
	int inport(int PortAddress);
	int Opendriver(void);
	void Closedriver(void);
	HANDLE hdriver;

	void ProcessIO();

	int Rvary;//for left/right control
	int Sensor;//for move forward
	int OldSensor;
	DWORD OldFrame;

	float CenterAngle;
	float Oldg_fPosY; //check edge of Kor Klang TaNon

	CSound* m_pSoundBG;
	CSound* m_pSound1;

	bool Toggle_Koh;
	bool Toggle_Bump;

};

#endif // !defined(AFX_GAME_H__687221F3_ACFF_4D66_97DB_88AB70E0CA59__INCLUDED_)
