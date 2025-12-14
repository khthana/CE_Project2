#include "Core_Global.h"
#include "cLandscape.h"
#include <stdlib.h>
#include <fstream.h>


//============================================================================
// Class : cFrustum
//============================================================================
BOOL cFrustum::Construct(cGraphics *Graphics, float ZDistance)
{
  D3DXMATRIX Matrix, matView, matProj;
  float      ZMin, Q;

  // Error checking
  if(Graphics == NULL || Graphics->GetDeviceCOM() == NULL)
    return FALSE;

  // Calculate FOV data
  Graphics->GetDeviceCOM()->GetTransform(D3DTS_PROJECTION, &matProj);
  if(ZDistance != 0.0f) {
    // Calculate new projection matrix based on distance provided
    ZMin = -matProj._43 / matProj._33;
    Q = ZDistance / (ZDistance - ZMin);
    matProj._33 = Q;
    matProj._43 = -Q * ZMin;
  }
  Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
  D3DXMatrixMultiply(&Matrix, &matView, &matProj);

  // Calculate the planes
  m_Planes[0].a = Matrix._14 + Matrix._13; // Near
  m_Planes[0].b = Matrix._24 + Matrix._23;
  m_Planes[0].c = Matrix._34 + Matrix._33;
  m_Planes[0].d = Matrix._44 + Matrix._43;
  D3DXPlaneNormalize(&m_Planes[0], &m_Planes[0]);

  m_Planes[1].a = Matrix._14 - Matrix._13; // Far
  m_Planes[1].b = Matrix._24 - Matrix._23;
  m_Planes[1].c = Matrix._34 - Matrix._33;
  m_Planes[1].d = Matrix._44 - Matrix._43;
  D3DXPlaneNormalize(&m_Planes[1], &m_Planes[1]);

  m_Planes[2].a = Matrix._14 + Matrix._11; // Left
  m_Planes[2].b = Matrix._24 + Matrix._21;
  m_Planes[2].c = Matrix._34 + Matrix._31;
  m_Planes[2].d = Matrix._44 + Matrix._41;
  D3DXPlaneNormalize(&m_Planes[2], &m_Planes[2]);

  m_Planes[3].a = Matrix._14 - Matrix._11; // Right
  m_Planes[3].b = Matrix._24 - Matrix._21;
  m_Planes[3].c = Matrix._34 - Matrix._31;
  m_Planes[3].d = Matrix._44 - Matrix._41;
  D3DXPlaneNormalize(&m_Planes[3], &m_Planes[3]);

  m_Planes[4].a = Matrix._14 - Matrix._12; // Top
  m_Planes[4].b = Matrix._24 - Matrix._22;
  m_Planes[4].c = Matrix._34 - Matrix._32;
  m_Planes[4].d = Matrix._44 - Matrix._42;
  D3DXPlaneNormalize(&m_Planes[4], &m_Planes[4]);

  m_Planes[5].a = Matrix._14 + Matrix._12; // Bottom
  m_Planes[5].b = Matrix._24 + Matrix._22;
  m_Planes[5].c = Matrix._34 + Matrix._32;
  m_Planes[5].d = Matrix._44 + Matrix._42;
  D3DXPlaneNormalize(&m_Planes[5], &m_Planes[5]);

  return TRUE;
}

BOOL cFrustum::CheckPoint(float XPos, float YPos, float ZPos)
{
  short i;

  // Make sure point is in frustum
  for(i=0;i<6;i++) {
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XPos, YPos, ZPos)) < 0.0f)
      return FALSE;
  }

  return TRUE;
}

BOOL cFrustum::CheckCube(float XCenter, float YCenter, float ZCenter, float Size)
{
  short i;

  // Make sure at least one point is completely in frustum
  for(i=0;i<6;i++) {
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-Size, YCenter-Size, ZCenter-Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+Size, YCenter-Size, ZCenter-Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-Size, YCenter+Size, ZCenter-Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+Size, YCenter+Size, ZCenter-Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-Size, YCenter-Size, ZCenter+Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+Size, YCenter-Size, ZCenter+Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-Size, YCenter+Size, ZCenter+Size)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+Size, YCenter+Size, ZCenter+Size)) >= 0.0f)
      continue;

    return FALSE;
  }

  return TRUE;
}

BOOL cFrustum::CheckRectangle(float XCenter, float YCenter, float ZCenter, float XSize, float YSize, float ZSize)
{
  short i;

  // Make sure at least one point is in frustum
  for(i=0;i<6;i++) {
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-XSize, YCenter-YSize, ZCenter-ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+XSize, YCenter-YSize, ZCenter-ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-XSize, YCenter+YSize, ZCenter-ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+XSize, YCenter+YSize, ZCenter-ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-XSize, YCenter-YSize, ZCenter+ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+XSize, YCenter-YSize, ZCenter+ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter-XSize, YCenter+YSize, ZCenter+ZSize)) >= 0.0f)
      continue;
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter+XSize, YCenter+YSize, ZCenter+ZSize)) >= 0.0f)
      continue;

    return FALSE;
  }

  return TRUE;
}

BOOL cFrustum::CheckSphere(float XCenter, float YCenter, float ZCenter, float Radius)
{
  short i;

  // Make sure radius is in frustum
  for(i=0;i<6;i++) {
    if(D3DXPlaneDotCoord(&m_Planes[i], &D3DXVECTOR3(XCenter, YCenter, ZCenter)) < -Radius)
      return FALSE;
  }
  return TRUE;
}

//============================================================================
// Class : cNodeTreeMesh
//============================================================================
cNodeTreeMesh::cNodeTreeMesh()
{
  m_TreeType    = OCTREE;

  m_Graphics    = NULL;

  m_ParentNode  = NULL;

  m_NumPolygons = 0;
  m_PolygonList = NULL;

  m_NumGroups   = 0;
  m_Groups      = NULL;

  m_Time        = 0;
}

cNodeTreeMesh::~cNodeTreeMesh()
{
  Free();
}

BOOL cNodeTreeMesh::Create(cGraphics *Graphics, cMesh *Mesh, 
                           int TreeType, 
                           float MaxSize, long MaxPolygons)
{
  ID3DXMesh      *LoadMesh;
  unsigned short *IndexPtr;
  DWORD          *Attributes;
  unsigned long   i;
  float           MaxX, MaxY, MaxZ;

  // Free a prior mesh
  Free();

  // Error checking
  if((m_Graphics = Graphics) == NULL)
    return FALSE;
  if(Mesh == NULL)
    return FALSE;
  if(!Mesh->GetParentMesh()->m_NumMaterials)
    return FALSE;

  // Get mesh info
  m_Mesh        = Mesh->GetParentMesh();
  LoadMesh      = m_Mesh->m_Mesh;
  m_VertexFVF   = LoadMesh->GetFVF();
  m_VertexSize  = D3DXGetFVFVertexSize(m_VertexFVF);
  m_NumPolygons = LoadMesh->GetNumFaces();
  m_MaxPolygons = MaxPolygons;
  m_TransparentBlack = Mesh->IsTransparentBlack();

  // Create the polygon list and groups
  m_PolygonList = new sPolygon[m_NumPolygons]();
  m_NumGroups   = m_Mesh->m_NumMaterials;
  m_Groups      = new sGroup[m_NumGroups]();

  // Lock vertex, index, and attribute buffers
  LoadMesh->LockIndexBuffer(D3DLOCK_READONLY, (BYTE**)&IndexPtr);
  LoadMesh->LockAttributeBuffer(D3DLOCK_READONLY, &Attributes);

  // Load polygon information into structures
  for(i=0;i<m_NumPolygons;i++) {
    m_PolygonList[i].Vertex[0] = *IndexPtr++;
    m_PolygonList[i].Vertex[1] = *IndexPtr++;
    m_PolygonList[i].Vertex[2] = *IndexPtr++;

    // Store the polygon texture group and count
    m_PolygonList[i].Group = Attributes[i];
    m_Groups[Attributes[i]].NumPolygons++;
  }

  // Unlock buffers and release them (including mesh)
  LoadMesh->UnlockIndexBuffer();
  LoadMesh->UnlockAttributeBuffer();

  // Build the group vertex buffers
  for(i=0;i<m_NumGroups;i++) {
    if(m_Groups[i].NumPolygons != 0)
      m_Groups[i].VertexBuffer.Create(m_Graphics, 
                                      m_Groups[i].NumPolygons * 3, 
                                      m_VertexFVF, m_VertexSize);
  }

  // Get the size of the bounding cube
  MaxX = (float)max(fabs(Mesh->GetParentMesh()->m_Min.x), 
                    fabs(Mesh->GetParentMesh()->m_Max.x));
  MaxY = (float)max(fabs(Mesh->GetParentMesh()->m_Min.y), 
                    fabs(Mesh->GetParentMesh()->m_Max.y));
  MaxZ = (float)max(fabs(Mesh->GetParentMesh()->m_Min.z), 
                    fabs(Mesh->GetParentMesh()->m_Max.z));
  m_Size    = max(MaxX, max(MaxY, MaxZ)) * 2.0f;
  m_MaxSize = MaxSize;

  //Get Tree Type
  m_TreeType = TreeType;

  // Create the parent node
  m_ParentNode = new sNode();

  // Sort polygons into nodes
  LoadMesh->LockVertexBuffer(D3DLOCK_READONLY, (BYTE**)&m_VertexPtr);
  SortNode(m_ParentNode, 0.0f, 0.0f, 0.0f, m_Size);
  LoadMesh->UnlockVertexBuffer();

  return TRUE;
}

BOOL cNodeTreeMesh::Free()
{
  SAFE_DELETE(m_ParentNode);
  
  m_Graphics = NULL;

  m_NumPolygons = 0;
  
  SAFE_DELETE_ARRAY(m_PolygonList);

  m_NumGroups = 0;
  SAFE_DELETE_ARRAY(m_Groups);
  
  return TRUE;
}

void cNodeTreeMesh::SortNode(sNode *Node, 
                             float XPos, float YPos, float ZPos, 
                             float Size)
{
  unsigned long i, Num;
  float         XOff, YOff, ZOff;

  // Error checking
  if(Node == NULL || m_PolygonList == NULL)
    return;

  // Store node coordinates and size
  Node->XPos = XPos;
  Node->YPos = (m_TreeType==QUADTREE)?0.0f:YPos;
  Node->ZPos = ZPos;
  Node->Size = Size;

  // See if there are any polygons in the node
  if(!(Num = CountPolygons(XPos, YPos, ZPos, Size)))
    return;

  // Split node if size > maximum and too many polygons
  if(Size > m_MaxSize && Num > m_MaxPolygons) {
    for(i=0;i<(unsigned long)((m_TreeType==QUADTREE)?4:8);i++) {
      XOff = (((i % 2) < 1) ? -1.0f : 1.0f) * (Size / 4.0f);
      ZOff = (((i % 4) < 2) ? -1.0f : 1.0f) * (Size / 4.0f);
      YOff = (((i % 8) < 4) ? -1.0f : 1.0f) * (Size / 4.0f);

      // See if any polygons in new node bounding box
      if(CountPolygons(XPos+XOff,YPos+YOff,ZPos+ZOff,Size/2.0f)) {
        
        Node->Nodes[i] = new sNode();  // Create new child node

        // Sort the polygons with the new child node
        SortNode(Node->Nodes[i],XPos+XOff,YPos+YOff,ZPos+ZOff,Size/2.0f);
      }
    }

    return;
  }

  // Allocate space for polygon pointer list
  Node->NumPolygons = Num;
  Node->PolygonList = new sPolygon*[Num];

  // Scan through polygon list, storing pointers and assigning them
  Num = 0;
  for(i=0;i<m_NumPolygons;i++) {
    // Add polygon to node list if contained in 3-D space.
    if(IsPolygonContained(&m_PolygonList[i], 
                           XPos, YPos, ZPos, Size) == TRUE)
      Node->PolygonList[Num++] = &m_PolygonList[i];
  }
}

BOOL cNodeTreeMesh::IsPolygonContained(sPolygon *Polygon, 
                                      float XPos, float YPos, float ZPos,
                                      float Size)
{
  float    XMin, XMax, YMin, YMax, ZMin, ZMax;
  sVertex *Vertex[3];

  // Get the polygon's vertices
  Vertex[0] = (sVertex*)&m_VertexPtr[m_VertexSize * Polygon->Vertex[0]];
  Vertex[1] = (sVertex*)&m_VertexPtr[m_VertexSize * Polygon->Vertex[1]];
  Vertex[2] = (sVertex*)&m_VertexPtr[m_VertexSize * Polygon->Vertex[2]];

  // Check against X axis of specified 3-D space
  XMin = min(Vertex[0]->x, min(Vertex[1]->x, Vertex[2]->x));
  XMax = max(Vertex[0]->x, max(Vertex[1]->x, Vertex[2]->x));
  if(XMax < (XPos - Size / 2.0f))
    return FALSE;
  if(XMin > (XPos + Size / 2.0f))
    return FALSE;

  // Check against Y axis of specified 3-D space (only if octree tree type)
  if(m_TreeType == OCTREE) {
    YMin = min(Vertex[0]->y, min(Vertex[1]->y, Vertex[2]->y));
    YMax = max(Vertex[0]->y, max(Vertex[1]->y, Vertex[2]->y));
    if(YMax < (YPos - Size / 2.0f))
      return FALSE;
    if(YMin > (YPos + Size / 2.0f))
      return FALSE;
  }

  // Check against Z axis of specified 3-D space
  ZMin = min(Vertex[0]->z, min(Vertex[1]->z, Vertex[2]->z));
  ZMax = max(Vertex[0]->z, max(Vertex[1]->z, Vertex[2]->z));
  if(ZMax < (ZPos - Size / 2.0f))
    return FALSE;
  if(ZMin > (ZPos + Size / 2.0f))
    return FALSE;

  return TRUE;
}

unsigned long cNodeTreeMesh::CountPolygons(
                  float XPos, float YPos, float ZPos, float Size)
{
  unsigned long i, Num;
 
   // Return if no polygons to process
  if(!m_NumPolygons)
    return 0;

  // Go through every polygon and keep count of those 
  // contained in the specified 3-D space.
  Num = 0;
  for(i=0;i<m_NumPolygons;i++) {
    if(IsPolygonContained(&m_PolygonList[i],XPos,YPos,ZPos,Size) == TRUE)
      Num++;
  }

  return Num;
}

BOOL cNodeTreeMesh::Render(cFrustum *Frustum, float ZDistance)
{
  D3DXMATRIX Matrix;     // Matrix used for calculations
  cFrustum ViewFrustum;  // Local viewing frustum

  // Error checking
  if(m_Graphics == NULL || m_ParentNode == NULL || !m_NumPolygons)
    return FALSE;

  // Construct the viewing frustum (if none passed)
  if((m_Frustum = Frustum) == NULL) {
    ViewFrustum.Construct(m_Graphics, ZDistance);
    m_Frustum = &ViewFrustum;
  }

  // Set the world transformation matrix to identity, so that
  // level mesh is rendered around the origin it was designed.
  D3DXMatrixIdentity(&Matrix);
  m_Graphics->GetDeviceCOM()->SetTransform(D3DTS_WORLD, &Matrix);

  // Lock vertex buffers 
  for(unsigned long i=0;i<m_NumGroups;i++) {
    m_Groups[i].VertexBuffer.Lock(0,0);
    m_Groups[i].VertexPtr = (char*)m_Groups[i].VertexBuffer.GetPtr();
    m_Groups[i].NumPolygonsToDraw = 0;
  }
  m_Mesh->m_Mesh->LockVertexBuffer(D3DLOCK_READONLY, (BYTE**)&m_VertexPtr);

  // Store current time of render
  m_Time = timeGetTime();

  // Add all polygons to vertex buffer
  AddNode(m_ParentNode);
  
  // Unlock vertex buffers and draw
  m_Mesh->m_Mesh->UnlockVertexBuffer();
  
  for(i=0;i<m_NumGroups;i++) {
    m_Groups[i].VertexBuffer.Unlock();
    if(m_Groups[i].NumPolygonsToDraw) {
      m_Graphics->GetDeviceCOM()->SetMaterial(&m_Mesh->m_Materials[i]);
      m_Graphics->GetDeviceCOM()->SetTexture(0, m_Mesh->m_Textures[i]);
    
      m_Groups[i].VertexBuffer.Render(0, m_Groups[i].NumPolygonsToDraw, D3DPT_TRIANGLELIST);
    }
  }
  
  return TRUE;
}

void cNodeTreeMesh::AddNode(sNode *Node)
{
  unsigned long i, Group;
  short         Num;

  // Perform frustum check based on tree type
  if(m_TreeType == QUADTREE) {
    if(m_Frustum->CheckRectangle(
           Node->XPos,        0.0f,          Node->ZPos, 
           Node->Size / 2.0f, m_Size / 2.0f, Node->Size / 2.0f) == FALSE)
      return;
  } else {
    if(m_Frustum->CheckRectangle(
           Node->XPos,        Node->YPos,        Node->ZPos, 
           Node->Size / 2.0f, Node->Size / 2.0f, Node->Size / 2.0f) == FALSE)
      return;
  }

  // Scan other nodes
  Num = 0;
  for(i=0;i<(unsigned long)((m_TreeType==QUADTREE)?4:8);i++) {
    if(Node->Nodes[i] != NULL) {
      Num++;
      AddNode(Node->Nodes[i]);
    }
  }

  // Don't need to go on if there was other nodes
  if(Num)
    return;

  // Add contained polygons (if any)
  if(Node->NumPolygons != 0) {
    for(i=0;i<Node->NumPolygons;i++) {

      // If a polygon hasn't yet been drawn and it has a 
      // valid texture group value, then process it.
      if(Node->PolygonList[i]->Time != m_Time && (Group = Node->PolygonList[i]->Group) < m_NumGroups) {

        // Only draw polygons that are visible 
        // ie: have a material alpha value of > 0.0
        if(m_Mesh->m_Materials[Node->PolygonList[i]->Group].Diffuse.a != 0.0f) {
          
          // Copy over vertex data from source mesh
          memcpy(m_Groups[Group].VertexPtr, &m_VertexPtr[m_VertexSize * Node->PolygonList[i]->Vertex[0]], m_VertexSize);
          m_Groups[Group].VertexPtr += m_VertexSize;
          memcpy(m_Groups[Group].VertexPtr, &m_VertexPtr[m_VertexSize * Node->PolygonList[i]->Vertex[1]], m_VertexSize);
          m_Groups[Group].VertexPtr += m_VertexSize;
          memcpy(m_Groups[Group].VertexPtr, &m_VertexPtr[m_VertexSize * Node->PolygonList[i]->Vertex[2]], m_VertexSize);
          m_Groups[Group].VertexPtr += m_VertexSize;

          m_Groups[Group].NumPolygonsToDraw++;
        }

        // Mark polygon as processed this time segment
        Node->PolygonList[i]->Time = m_Time;
      }
    }
  }
}

float cNodeTreeMesh::GetHeight(float XPos, float ZPos)
{
  BOOL  Hit;
  float u, v, Dist;
  DWORD FaceIndex;
  LPD3DXBUFFER ppAllHits;
  DWORD pCountOfHits;

  // Ray from y=-50 upward
  D3DXIntersect(m_Mesh->m_Mesh,
                &D3DXVECTOR3(XPos, -50.0f ,ZPos),
                &D3DXVECTOR3(0.0f, 1.0f, 0.0f),
                &Hit, &FaceIndex, &u, &v, &Dist, &ppAllHits, &pCountOfHits);
  if(Hit == TRUE)
	  return Dist - 50.0f;

  return -50.0f;
}

BOOL cNodeTreeMesh::CheckIntersect(float XStart, float YStart, float ZStart,
                                   float XEnd,   float YEnd,   float ZEnd,
                                   float *Length)
{
  BOOL  Hit;
  float u, v, Dist;
  float XDiff, YDiff, ZDiff, Size;
  DWORD FaceIndex;
  D3DXVECTOR3 vecDir;
  LPD3DXBUFFER ppAllHits;
  DWORD pCountOfHits;

  XDiff = XEnd - XStart;
  YDiff = YEnd - YStart;
  ZDiff = ZEnd - ZStart;

  D3DXVec3Normalize(&vecDir, &D3DXVECTOR3(XDiff, YDiff, ZDiff));
  D3DXIntersect(m_Mesh->m_Mesh, 
                &D3DXVECTOR3(XStart,YStart,ZStart), &vecDir,
                &Hit, &FaceIndex, &u, &v, &Dist, &ppAllHits, &pCountOfHits);

  if(Hit == TRUE) {
    Size = (float)sqrt(XDiff*XDiff+YDiff*YDiff+ZDiff*ZDiff);
    if(Dist > Size)
      Hit = FALSE;
    else {
      if(Length != NULL)
        *Length = Dist;
    }
  }

  return Hit;
}

void cNodeTreeMesh::CheckIntersect(D3DXVECTOR3* vecRay, D3DXVECTOR3* vecDir, 
								   BOOL* Hit, DWORD* Face, float* u, float* v, float* Dist){
  LPD3DXBUFFER ppAllHits;
  DWORD pCountOfHits;
  D3DXIntersect(m_Mesh->m_Mesh, vecRay, vecDir, 
				Hit, Face, u, v, Dist, &ppAllHits, &pCountOfHits);
}


//============================================================================
// Class : cLandscape
//============================================================================
cLandscape::cLandscape()
{
  m_Graphics    = NULL;
  m_Frustum		= NULL;		
  m_LandMesh	= NULL;		
  m_DecorMesh	= NULL;		
  m_LandNode	= NULL;		
  m_DecorNode	= NULL;
  m_MouseOnVB	= NULL;
  m_MouseOnTex	= NULL;
  m_DrawMouseOn	= FALSE;
  m_CanMove		= FALSE;
  m_MID = -1;
}

cLandscape::~cLandscape()
{
  Free();
}

BOOL cLandscape::Free()
{
  SAFE_DELETE(m_LandNode);
  SAFE_DELETE(m_DecorNode);
  SAFE_DELETE(m_LandMesh);
  SAFE_DELETE(m_DecorMesh);

  SAFE_DELETE(m_MouseOnVB);
  SAFE_DELETE(m_MouseOnTex);

  SAFE_DELETE(m_Frustum);

  m_DrawMouseOn	= FALSE;
  m_CanMove		= FALSE;

  m_Graphics = NULL;
  
  return TRUE;
}

BOOL cLandscape::Create(cGraphics *Graphics, int MID)
{
  Free();

  if(Graphics == NULL)
    return FALSE;

  // Get D3D COM
  m_Graphics = Graphics;

  // Create Frustum
  m_Frustum = new cFrustum();

  // Temp string of filename
  char szTemp[127];
  
  // Create Land & Decorate Mesh
  m_LandMesh = new cMesh();
  sprintf(szTemp, "Data\\Map%d.x", MID);
  if(m_LandMesh->Load(m_Graphics, szTemp, "Data\\", FALSE) == FALSE)
	  return FALSE;
  m_DecorMesh = new cMesh();
  sprintf(szTemp, "Data\\Decor%d.x", MID);
  if(m_DecorMesh->Load(m_Graphics, szTemp, "Data\\", TRUE) == FALSE)
	  return FALSE;

  // Create Land & Decorate NodeTreeMesh Object
  m_LandNode = new cNodeTreeMesh();
  if(m_LandNode->Create(m_Graphics, m_LandMesh, QUADTREE, 64) == FALSE)
	  return FALSE;
  m_DecorNode = new cNodeTreeMesh();
  if(m_DecorNode->Create(m_Graphics, m_DecorMesh, QUADTREE, 64) == FALSE)
	  return FALSE;
  
  // Create mouseOn vertexBuffer & texture
  m_MouseOnVB = new cVertexBuffer();
  if(m_MouseOnVB->Create(m_Graphics, 4, D3DFVF_XYZ|D3DFVF_DIFFUSE|D3DFVF_TEX1 ,sizeof(sVertex)) == FALSE)
	  return FALSE;
  
  sVertex MouseOnVetex[4] = 
  {
	  { 0.0f, 0.0f, 0.0f, 0xccffffff, 0.0f, 1.0f },
	  { 0.0f, 0.0f, 1.0f, 0xccffffff, 0.0f, 0.0f },
	  { 1.0f, 0.0f, 0.0f, 0xccffffff, 1.0f, 1.0f },
	  { 1.0f, 0.0f, 1.0f, 0xccffffff, 1.0f, 0.0f },
  };
  if(m_MouseOnVB->Set(0, 4, &MouseOnVetex) == FALSE)
	  return FALSE;
 
  m_MouseOnTex = new cTexture();
  if(m_MouseOnTex->Load(m_Graphics, "Data\\Foot.bmp", 0xff000000) == FALSE)
	  return FALSE;
	
  // Get map array from file
  sprintf(szTemp, "Data\\Map%d.txt", MID);
  fstream mapFile( szTemp, ios::in | ios::binary );
  if( !mapFile )
      return false;
  const unsigned int BUFF_SIZE = 122;
  unsigned char buff[ BUFF_SIZE ];
  int line = 119;
  while( !mapFile.eof() && line >=0){
	  mapFile.read( ( char* )buff, BUFF_SIZE );
	  unsigned int buffsize = mapFile.gcount();
	  for(int i=0 ; i<120 ; i++){
		  if (buff[i] == '0')
			  m_MapArray[i][line] = 0;
		  else if (buff[i] == '1')
			  m_MapArray[i][line] = 1;
	  }
	  line--;
  }

  m_MID = MID;

  return TRUE;
}

BOOL cLandscape::Render()
{
  if(m_Graphics == NULL || m_Frustum == NULL)
	  return FALSE;
  if(m_LandNode == NULL || m_DecorNode == NULL)
	  return FALSE;
  if((m_MouseOnVB->IsLoaded() == FALSE)||(m_MouseOnTex->IsLoaded() == FALSE))
	  return FALSE;
  
  if(m_Frustum->Construct(m_Graphics) == FALSE)
	  return FALSE;
 
  if(m_LandNode->Render(m_Frustum) == FALSE)
	  return FALSE;

  m_Graphics->EnableAlphaTesting(TRUE);
  m_Graphics->EnableAlphaBlending(TRUE);
  
  if(m_DecorNode->Render(m_Frustum) == FALSE)
	  return FALSE;

  if(m_DrawMouseOn == TRUE && m_CanMove == TRUE){
	  m_Graphics->SetTexture(0, m_MouseOnTex);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG2, D3DTA_DIFFUSE);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP,	D3DTOP_MODULATE);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_COLOROP,   D3DTOP_DISABLE);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(1, D3DTSS_ALPHAOP,   D3DTOP_DISABLE);
	  m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 1);
	  m_MouseOnVB->Render(0, 2, D3DPT_TRIANGLESTRIP);
	  m_Graphics->GetDeviceCOM()->SetRenderState(D3DRS_ZBIAS, 0);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAARG1, D3DTA_TEXTURE);
	  m_Graphics->GetDeviceCOM()->SetTextureStageState(0, D3DTSS_ALPHAOP, D3DTOP_SELECTARG1);
  }

  m_Graphics->EnableAlphaBlending(FALSE);
  m_Graphics->EnableAlphaTesting(FALSE);

  return TRUE;  
}

float cLandscape::GetHeight(float XPos, float ZPos){
	if (m_LandNode == NULL)
		return -50.0f;
	
	return m_LandNode->GetHeight(XPos, ZPos);
}

BOOL cLandscape::ConvertMouseTo3D(long MouseX, long MouseY, D3DVECTOR* target){
	if (m_LandNode == NULL)
		return FALSE;

	D3DXMATRIX matProj;
	D3DXMATRIX matView, matInvView;
	D3DXVECTOR3 vecRay, vec, vecDir;

	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_PROJECTION, &matProj);
	m_Graphics->GetDeviceCOM()->GetTransform(D3DTS_VIEW, &matView);
	D3DXMatrixInverse(&matInvView, NULL, &matView);

	vec.x =  ( ( ( 2.0f * MouseX ) / m_Graphics->GetWidth() ) - 1 ) / matProj._11;
	vec.y = -( ( ( 2.0f * MouseY ) / m_Graphics->GetHeight() ) - 1 ) / matProj._22;
	vec.z =  1.0f;

	vecRay.x = matInvView._41;
	vecRay.y = matInvView._42;
	vecRay.z = matInvView._43;

	vecDir.x  = vec.x*matInvView._11 + vec.y*matInvView._21 + vec.z*matInvView._31;
	vecDir.y  = vec.x*matInvView._12 + vec.y*matInvView._22 + vec.z*matInvView._32;
	vecDir.z  = vec.x*matInvView._13 + vec.y*matInvView._23 + vec.z*matInvView._33;

	BOOL Hit;
	DWORD Face;
	float u, v ,Dist;

	m_LandNode->CheckIntersect(&vecRay, &vecDir, &Hit, &Face, &u, &v, &Dist);

	if(Hit == TRUE){
		D3DXVECTOR3 vecTarget;
		D3DXVec3Scale(&vecTarget, &vecDir, Dist);
		D3DXVec3Add(&vecTarget, &vecRay, &vecTarget);

		target->x = vecTarget.x;
		target->y = vecTarget.y;
		target->z = vecTarget.z;

		return TRUE;
	}else{
		return FALSE;
	}
}

BOOL cLandscape::MouseOnMap(long MouseX, long MouseY, D3DVECTOR* position){
	if(m_LandNode == NULL || m_DecorNode == NULL)
		return FALSE;
	if((m_MouseOnVB->IsLoaded() == FALSE) || (m_MouseOnTex->IsLoaded() == FALSE))
		return FALSE;

	D3DXVECTOR3 vTarget;

	m_CanMove = FALSE;

	if(ConvertMouseTo3D(MouseX, MouseY, &vTarget) == FALSE)
		return FALSE;

	int xMap, zMap;		// For Map Array
	xMap = (int)(vTarget.x + 60.0f);
	zMap = (int)(vTarget.z + 60.0f);
	
	// Out Bound
	if(xMap < 0 || zMap < 0 || xMap >= 120 || zMap >= 120)
		return FALSE;

	// Compare with mapArray whether position can move to or not
	if (m_MapArray[xMap][zMap] != 0)
		return FALSE;

	float x, z;
	x = (float)xMap - 60.0f;
	z = (float)zMap - 60.0f;

	if (m_MouseOnVB->Lock(0,4) == FALSE)
		return FALSE;

	// Find height of land of 4 position for change vertex pos
	sVertex *MouseOnVetex = (sVertex*)m_MouseOnVB->GetPtr();

	float tempY1, tempY2;

	tempY1 = m_LandNode->GetHeight(x, z);
	tempY2 = m_DecorNode->GetHeight(x, z);
	if (tempY2 > tempY1)
		MouseOnVetex[0].y = tempY2 + 0.05f;
	else
		MouseOnVetex[0].y = tempY1 + 0.05f;

	tempY1 = m_LandNode->GetHeight(x, z + 1.0f);
	tempY2 = m_DecorNode->GetHeight(x, z + 1.0f);
	if (tempY2 > tempY1)
		MouseOnVetex[1].y = tempY2 + 0.05f;
	else
		MouseOnVetex[1].y = tempY1 + 0.05f;

	tempY1 = m_LandNode->GetHeight(x + 1.0f, z);
	tempY2 = m_DecorNode->GetHeight(x + 1.0f, z);
	if (tempY2 > tempY1)
		MouseOnVetex[2].y = tempY2 + 0.05f;
	else
		MouseOnVetex[2].y = tempY1 + 0.05f;

	tempY1 = m_LandNode->GetHeight(x + 1.0f, z + 1.0f);
	tempY2 = m_DecorNode->GetHeight(x + 1.0f, z + 1.0f);
	if (tempY2 > tempY1)
		MouseOnVetex[3].y = tempY2 + 0.05f;
	else
		MouseOnVetex[3].y = tempY1 + 0.05f;

	MouseOnVetex[0].x = x;			MouseOnVetex[0].z = z;
	MouseOnVetex[1].x = x;			MouseOnVetex[1].z = z + 1.0f;
	MouseOnVetex[2].x = x + 1.0f;	MouseOnVetex[2].z = z;
	MouseOnVetex[3].x = x + 1.0f;	MouseOnVetex[3].z = z + 1.0f;

	m_MouseOnVB->Unlock();

	position->x = x;
	position->z = z;
	position->y = GetHeight( position->x, position->z ); 

	m_CanMove = TRUE;

	return TRUE;
}

BOOL cLandscape::CanMove(float XPos, float ZPos){
	int xMap, zMap;		// For Map Array
	xMap = (int)(XPos + 60.0f);
	zMap = (int)(ZPos + 60.0f);

	// Out Bound
	if(xMap < 0 || zMap < 0 || xMap >= 120 || zMap >= 120)
		return FALSE;

		// Compare with mapArray whether position can move to or not
	if (m_MapArray[xMap][zMap] != 0)
		return FALSE;

	return TRUE;
}


