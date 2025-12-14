#include <tchar.h>
#include <d3d9.h>
#include <d3dx9.h>


//-----------------------------------------------------------------------------
// Name: class CMesh
// Desc: Application class. The base class (CD3DApplication) provides the 
//       generic functionality needed in all Direct3D samples. CMyD3DApplication 
//       adds functionality specific to this sample program.
//-----------------------------------------------------------------------------


class CMesh
{
public:

	CMesh();
	~CMesh();

    HRESULT Create( LPDIRECT3DDEVICE9 m_pd3dDevice, TCHAR* strFilename );

    HRESULT Render( LPDIRECT3DDEVICE9 m_pd3dDevice );

    HRESULT InvalidateDeviceObjects();

private:
//	ID3DXMesh*   m_pMesh;
	ID3DXBuffer* m_pAdjBuffer;
	ID3DXBuffer* m_pMtrlBuffer;
	DWORD        m_dwNumMtrls;
	ID3DXMesh*   m_pMesh;
};