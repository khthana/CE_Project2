#ifndef storemesh
#define storemesh
#include "test.h"
//#include "statusx.h"
class StoreMesh
{
private:
protected:
	
public:
	FLOAT x;
	FLOAT y;//position
	FLOAT z;
	FLOAT ry;//rotation
	character *player;//keep all status EX. hp mp
	//int hp;
	DWORD time;//temporary time to control
	DWORD timeatk;//temporary time to control atk
	DWORD delaystatus;//delay of walk
	DWORD delaystatus2;//delay of atk
	DWORD timedie;
	LPCSTR name;//name mesh use for seach
	char action;//action code to know what is this mesh
	StoreMesh *nextmesh;
	StoreMesh *parent;
	DWORD timeperhit;//time use per one hit milisec
	DWORD timeperdie;//time use per one die milisec
	DWORD timechange;//time to change position
	CXAnimationController	*Animations;
	int status;//tell you what is mesh do
	int target;//0 is donot have target , 1 is have
	int range;//0 is in array, 1 is out of range & get out of array
	float desx;//walk to x
	float desz;//walk to z
	DWORD countdown;//time to revive. If alive is 0
	int zone;//area of monster
	int number;
	int flag;
	StoreMesh();
	void renderall(LPDIRECT3DDEVICE9 g_pd3dDevice,loadresource g,float scale);
	VOID SetupMatrices(LPDIRECT3DDEVICE9 g_pd3dDevice);
	VOID SetupMatricesani(LPDIRECT3DDEVICE9 g_pd3dDevice,float scale);
	void rendermesh(LPDIRECT3DDEVICE9 g_pd3dDevice,loadresource g);
	void position(FLOAT xx,FLOAT yy,FLOAT zz);
	StoreMesh* addmesh(LPCSTR addname,float x,float z,int y,int w);
	void delmesh();
	StoreMesh* findmesh(LPCSTR findname);
};

//---------------------------------------------------------------------------------
StoreMesh::StoreMesh()
{ x = 0.0;
flag = 0;
y = 0.0;
z = 0.0;
ry = 0.0;
status = 0;
name = "player";
action = 'a';
time = 0;
timeatk = 0;
timedie = 0;
delaystatus = 0;
countdown = 0;
zone = 0;
number = 0;
//hp = 3;
nextmesh = NULL;
parent = NULL;
player = new character();
target = 0;
range = 0;
desx=0.0f;desz=0.0f;
const int bug = RAND_MAX/2000;
int r;
do r=rand()/bug;
while(r>=2000);
timechange = 6000+r;
//poiter = NULL;
}

StoreMesh* StoreMesh::addmesh(LPCSTR addname,float x,float z,int y,int w)//y calstatus w zone
{//StoreMesh *poiter;
	if (nextmesh != NULL)
	{//poiter = nextmesh;
	return nextmesh->addmesh(addname,x,z,y,w);}
	else {nextmesh = new StoreMesh();
	nextmesh->zone = w;
	nextmesh->x=x;nextmesh->z=z;
	nextmesh->name=addname;
	nextmesh->player->calstatus(y);
	nextmesh->parent=this;
	return nextmesh;}
}
void StoreMesh::delmesh()
{while(this->nextmesh)
{this->nextmesh->delmesh();}
	if(this->parent!=NULL)
	{this->parent->nextmesh=NULL;
	}
	delete this;

}
StoreMesh* StoreMesh::findmesh(LPCSTR findname)
{	if(nextmesh == NULL)
	return NULL;
	if(nextmesh->name != findname)
	{return nextmesh->findmesh(findname);}
	else return nextmesh;
}
VOID StoreMesh::SetupMatrices(LPDIRECT3DDEVICE9 g_pd3dDevice)
{
    if (ry > 360.0 || ry < -360.0) ry = 0;
    D3DXMATRIXA16 matWorld;
	D3DXMATRIXA16 matWorld1;
	D3DXMATRIXA16 matWorld2;
	D3DXMATRIXA16 matWorld3;
	D3DXMATRIX Result,Result2;
	D3DXMatrixIdentity(&Result);
	D3DXMatrixIdentity(&Result2);
	FLOAT Angle = D3DXToRadian(-90);
	FLOAT Angle2 = D3DXToRadian(-90+ry);
	D3DXMatrixRotationX(&Result, Angle);
	D3DXMatrixRotationY(&Result2, Angle2);
	D3DXMatrixTranslation(&matWorld1,x, y, z);
	D3DXMatrixScaling(&matWorld2,1.05,1.05,1.05);
	D3DXMatrixMultiply(&matWorld,&Result,&Result2);
	D3DXMatrixMultiply(&matWorld3,&matWorld,&matWorld2);
	D3DXMatrixMultiply(&matWorld,&matWorld3,&matWorld1);
    g_pd3dDevice->SetTransform( D3DTS_WORLD, &matWorld );

    
    D3DXMATRIXA16 matProj;
    D3DXMatrixPerspectiveFovLH( &matProj, D3DX_PI/4, 1.0f, 1.0f, 100.0f );
    g_pd3dDevice->SetTransform( D3DTS_PROJECTION, &matProj );
}

VOID StoreMesh::SetupMatricesani(LPDIRECT3DDEVICE9 g_pd3dDevice,float scale)
{
    if (ry > 360.0 || ry < -360.0) ry = 0;
    D3DXMATRIXA16 matWorld;
	D3DXMATRIXA16 matWorld1;
	D3DXMATRIXA16 matWorld2;
	D3DXMATRIX Result;
	D3DXMatrixIdentity(&Result);
	FLOAT Angle2 = D3DXToRadian(ry + 90);
	if (action == 'n'||action == 'w'||action == 'x'|| action == 'b')
	{Angle2 = D3DXToRadian(ry - 90);}
	D3DXMatrixRotationY(&Result, Angle2);
	D3DXMatrixTranslation(&matWorld1,x, y, z);
	if(action == 'w'||action == 'x')D3DXMatrixScaling(&matWorld2,1.00,1.00,1.00);
	else if (action == 'n'||action == 'b')
	{D3DXMatrixScaling(&matWorld2,1.00,1.00,1.00);}
	else if (action == 'z'||action == 'a')
	{D3DXMatrixScaling(&matWorld2,0.7,0.7,0.7);}
	else if(action == 'm')
	{D3DXMatrixScaling(&matWorld2,scale,scale,scale);}
	else if (action == 'r')
	{D3DXMatrixScaling(&matWorld2,0.02,0.02,0.02);}
	matWorld = matWorld2*Result*matWorld1;
    g_pd3dDevice->SetTransform( D3DTS_WORLD, &matWorld );

    
    D3DXMATRIXA16 matProj;
    D3DXMatrixPerspectiveFovLH( &matProj, D3DX_PI/4, 1.0f, 1.0f, 500.0f );
    g_pd3dDevice->SetTransform( D3DTS_PROJECTION, &matProj );
}
void StoreMesh::rendermesh(LPDIRECT3DDEVICE9 g_pd3dDevice,loadresource g)
{
		SetupMatrices(g_pd3dDevice);
        for( DWORD i=0; i<g.g_dwNumMaterials; i++ )
        {	 g_pd3dDevice->SetMaterial( &g.g_pMeshMaterials[i] );
	         g_pd3dDevice->SetTexture( 0, g.g_pMeshTextures[i] );
			 g.g_pMesh->DrawSubset( i );
			
        }
}
void StoreMesh::renderall(LPDIRECT3DDEVICE9 g_pd3dDevice,loadresource g,float scale)
{		SetupMatricesani(g_pd3dDevice,scale);
		
		if (action != g.action)
			{
			Animations = new CXAnimationController(g.g_Mesh->m_pFrames);
			*Animations = *g.g_Animations;
			action = g.action;
			status=0;
			if(action == 'w'||action == 'x')
			{timeperhit = 700;timeperdie=0;}else if(action == 'n' || action == 'z' || action == 'b'||action == 'a')
			{timeperhit = 666;timeperdie=500;}else if(action == 'r')
			{timeperhit = 700;timeperdie=0;}
			}
		D3DXMATRIX Mat;
		D3DXMatrixIdentity(&Mat);
if(action == 'r')
{		if (status == 1)//Archer walk
		{	if(Animations->m_CurrentTime<4300)
				{Animations->Update(5,0);}
			else {Animations->Start();
				Animations->Update(5,0);}
			if(timeGetTime() - delaystatus > 400)
			status = 0;
		} else if(status == 0)//Archer stand
		{	if(Animations->m_CurrentTime<14000 && Animations->m_CurrentTime>10000)
				{Animations->Update(3,10000);}
			else {Animations->Start();
				Animations->Update(3,10000);}		
		}else if(status == 2)//Archer atk
		{	if(Animations->m_CurrentTime<=9900 && Animations->m_CurrentTime>=5000)
				{Animations->Update(7,5000);}
			else {Animations->Start();
				Animations->Update(7,5000);}
			if ((timeGetTime() - time) > timeperhit)
			status = 0;
		}
}
if(action == 'w'||action == 'x')
{		if(status == 0)//ninja stand
		{	if(Animations->m_CurrentTime<=45000 && Animations->m_CurrentTime>=35000)
				{Animations->Update(3,35000);}
			else {Animations->Start();
				Animations->Update(3,35000);}
		}else if(status == 1)//ninja walk
		{	if(Animations->m_CurrentTime<2000)
				{Animations->Update(3,0);}
			else {Animations->Start();
				Animations->Update(3,0);}
			if(timeGetTime() - delaystatus > 300)
			status = 0;
		}else if(status == 2)//ninja atk
		{	if(Animations->m_CurrentTime<=10000 && Animations->m_CurrentTime>=8000)
				{Animations->Update(3,8000);}
			else {Animations->Start();
				Animations->Update(3,8000);}
			if ((timeGetTime() - delaystatus2) > 666)
			status = 0;
		}else if(status == 3)//ninja die
		{	if(Animations->m_CurrentTime<=33500 && Animations->m_CurrentTime>=32000)
				{Animations->Update(2,32000);}
			else {Animations->Start();
				Animations->Update(2,32000);}
		}
}
if(action == 'n'||action == 'b')
{		if(status == 0)//ninja stand
		{	Animations->Start();
			Animations->Update(1,0);
		}else if(status == 1)//ninja walk
		{	if(Animations->m_CurrentTime<2300)
				{Animations->Update(3,0);}
			else {Animations->Start();
				Animations->Update(3,0);}
			if(timeGetTime() - delaystatus > 1000)
			status = 0;
		}else if(status == 2)//ninja atk
		{	if(Animations->m_CurrentTime<=10000 && Animations->m_CurrentTime>=8000)
				{Animations->Update(3,8000);}
			else {Animations->Start();
				Animations->Update(3,8000);}
			if ((timeGetTime() - delaystatus2) > 666)
			status = 0;
		}else if(status == 3)//ninja die
		{	if(Animations->m_CurrentTime<=33000 && Animations->m_CurrentTime>=32000)
				{Animations->Update(2,32000);}
			else {Animations->Start();
				Animations->Update(2,32000);}
		}
}
if(action == 'z'||action == 'a')
{		if(status == 0)//ninja stand
		{	Animations->Start();
			Animations->Update(1,0);
		}else if(status == 1)//ninja walk
		{	if(Animations->m_CurrentTime<2300)
				{Animations->Update(3,0);}
			else {Animations->Start();
				Animations->Update(3,0);}
			if(timeGetTime() - delaystatus > 1000)
			status = 0;
		}else if(status == 2)//ninja atk
		{	if(Animations->m_CurrentTime<=20500 && Animations->m_CurrentTime>=16500)
				{Animations->Update(3,16500);}
			else {Animations->Start();
				Animations->Update(3,16500);}
			if ((timeGetTime() - delaystatus2) > 666)
			status = 0;
		}else if(status == 3)//ninja die
		{	if(Animations->m_CurrentTime<=16500 && Animations->m_CurrentTime>=10000)
				{Animations->Update(2,10000);}
			else {Animations->Start();
				Animations->Update(2,10000);}
		}
}
		g.g_Mesh->SetTransform(&Mat);
		g.g_Mesh->Render();
}
void StoreMesh::position(FLOAT xx,FLOAT yy,FLOAT zz)
{x=xx;
y=yy;
z=zz;
}

#endif