//Include this header in your projets to use skeletal animation

//Once included, here's an example of how to load a skinned mesh and
//play an animation

//CXSkinnedMesh *g_Mesh = NULL;
//CXAnimationController *g_Animations = NULL;
//***** Then load a skinned mesh as follows

//g_Mesh = new CXSkinnedMesh(m_pd3dDevice);
//g_Mesh->LoadFromFile("tiny.x");
//g_Animations = new CXAnimationController(g_Mesh->m_pFrames);
//g_Animations->LoadFromFile("tiny.x");
//g_Animations->Start();

//***** Then on every frame

//D3DXMATRIX Mat;
//D3DXMatrixIdentity(&Mat);
//g_Animations->Update();
//g_Mesh->SetTransform(&Mat);
//g_Mesh->Render();
#ifndef ske
#define ske
#include "XFiles.h"
#include "SkinnedMeshBase.h"
#include "SkinnedMesh.h"
#include "Animation.h"
#endif