#ifndef bitmaph
#define bitmaph
#endif

class Picture2D
{
public:
//	Picture2D();
	HRESULT Init(LPDIRECT3DDEVICE9 g_pd3dDevice,LPD3DXSPRITE& lpSprite);
	void Load(LPDIRECT3DDEVICE9 g_pd3dDevice);
	void Draw(LPD3DXSPRITE lpSprite);
	void Draw2(LPD3DXSPRITE lpSprite);
	void Draw3(LPD3DXSPRITE lpSprite);
	void DrawStatus(LPD3DXSPRITE lpSprite);
	void DrawMenu(LPD3DXSPRITE lpSprite);
	void DrawHP(LPD3DXSPRITE lpSprite,double percent);
	void DrawEXP(LPD3DXSPRITE lpSprite,double percent);
	void DrawBG(LPD3DXSPRITE lpSprite);
private:
	LPDIRECT3DTEXTURE9 pTexture[8];
};

HRESULT Picture2D::Init(LPDIRECT3DDEVICE9 g_pd3dDevice,LPD3DXSPRITE& lpSprite)
{
	HRESULT hrl;
	hrl = D3DXCreateSprite(g_pd3dDevice,&lpSprite);
    if(hrl != D3D_OK)
	{
		 MessageBox(NULL, "Could not create lpSprite", "Meshes.exe", MB_OK);
		 return hrl;
	}
}

void Picture2D::Load(LPDIRECT3DDEVICE9 g_pd3dDevice)
{
	HRESULT hrl;
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"hp2.png",250,50,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[0]))
	{
		MessageBox(NULL, "Could not load image hp2", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"red.png",166,16,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[1]))
	{
		MessageBox(NULL, "Could not load image red", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"green.png",165,6,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[2]))
	{
		MessageBox(NULL, "Could not load image green", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"quit.jpg",140,30,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[3]))
	{
		MessageBox(NULL, "Could not load image green", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"interface1.jpg",1024,768,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[4]))
	{
		MessageBox(NULL, "Could not load image interface1.jpg", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"interface2.jpg",1024,768,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[5]))
	{
		MessageBox(NULL, "Could not load image interface2.jpg", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"status.png",490,505,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[6]))
	{
		MessageBox(NULL, "Could not load image status.jpg", "Meshes.exe", MB_OK);
	}
	if (D3D_OK != D3DXCreateTextureFromFileEx(g_pd3dDevice,"interface3.jpg",1024,768,1,D3DPOOL_DEFAULT,D3DFMT_UNKNOWN,
									D3DPOOL_DEFAULT,D3DX_DEFAULT,D3DX_DEFAULT,
									D3DCOLOR_COLORVALUE(0.0f, 0.0f, 0.0f, 1.0f), NULL,NULL,&pTexture[7]))
	{
		MessageBox(NULL, "Could not load image interface3.jpg", "Meshes.exe", MB_OK);
	}
}

void Picture2D::Draw(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(0.0f, 0.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 768;
    srcRect.right     = 1024;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[4],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}

void Picture2D::Draw2(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(0.0f, 0.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 768;
    srcRect.right     = 1024;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[5],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}

void Picture2D::DrawStatus(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(0.0f, 0.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 50;
    srcRect.right     = 250;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[0],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}


void Picture2D::DrawMenu(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(250.0f, 0.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 30;
    srcRect.right     = 140;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[3],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}

void Picture2D::DrawHP(LPD3DXSPRITE lpSprite,double percent_hp)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(28.0f, 5.0f,0.0f );
	int width = 166*percent_hp;
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 16;//y
    srcRect.right     = width;//x

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[1],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}

void Picture2D::DrawEXP(LPD3DXSPRITE lpSprite,double percent_exp)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(28.0f, 39.0f,0.0f );
	int width = 165*percent_exp;
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 6;
    srcRect.right     = width;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[2],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}
void Picture2D::Draw3(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(30.0f, 60.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 505;
    srcRect.right     = 490;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[6],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}

void Picture2D::DrawBG(LPD3DXSPRITE lpSprite)
{
	D3DXVECTOR3 Center( 0.0f, 0.0f, 0.0f );
    D3DXVECTOR3 Position(0.0f, 0.0f,0.0f );
    RECT srcRect ;
    srcRect.top       = 0;
    srcRect.left      = 0;
    srcRect.bottom    = 768;
    srcRect.right     = 1024;

	lpSprite->Begin( D3DXSPRITE_ALPHABLEND );
	lpSprite->Draw( pTexture[7],&srcRect,&Center,&Position,0xFFFFFFFF);
	lpSprite->End();
}