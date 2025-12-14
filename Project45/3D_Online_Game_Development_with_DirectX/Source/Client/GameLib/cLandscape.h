#ifndef _CLANSCAPE_H_
#define _CLANSCAPE_H_

//============================================================================
// Class : cFrustum
//============================================================================
class cFrustum
{
  private:
    D3DXPLANE m_Planes[6];

  public:
    BOOL Construct(cGraphics *Graphics, float ZDistance = 0.0f);
    BOOL CheckPoint(float XPos, float YPos, float ZPos);
    BOOL CheckCube(float XCenter, float YCenter, float ZCenter, float Size);
    BOOL CheckRectangle(float XCenter, float YCenter, float ZCenter, float XSize, float YSize, float ZSize);
    BOOL CheckSphere(float XCenter, float YCenter, float ZCenter, float Radius);
};

//============================================================================
// Class : cNodeTreeMesh
//============================================================================
// Enumerate the two types of tree structures
enum TreeTypes { QUADTREE = 0, OCTREE };

class cNodeTreeMesh
{
  private:
    // The sVertex structure is a custom vertex structure that
    // contains only the 3-D coordinates. This is used to
    // retrieve coordinate info from a mesh's vertex buffer.
    typedef struct sVertex { float x, y, z; } sVertex;

    // The polygon structure maintains a texture group (by #)
    // the time it was last drawn (so you don't redraw it
    // many times over per frame), and the three vertices
    // used to render the polygon (which you'll read on later).
    typedef struct sPolygon {
      unsigned long  Group;     // Texture group
      unsigned long  Time;      // Time last drawn
      unsigned short Vertex[3]; // Vertex index #'s

      sPolygon() { Group = Time = 0; } // Clear data
    } sPolygon;

    // The node structure keeps count of the # of polygons in
    // its 3-D space, an array of sPolygon structures, the
    // 3-D coordinates of the node (as well as the size, which
    // is the distance from the center to one edge making the node
    // a perfect cube), and pointers to the child nodes.
    typedef struct sNode {
      unsigned long   NumPolygons;      // # of polygons in node
      sPolygon      **PolygonList;      // List of polygon data
      float           XPos, YPos, ZPos; // Center coordinate of node
      float           Size;             // Size of node
      sNode          *Nodes[8];         // Child nodes 4=quad, 8=oct

      // Constructor used to clear out variables
      sNode()
      {
        NumPolygons = 0;        // Set to no polygons in node
        PolygonList = NULL;     // Clear polygon list
        XPos = YPos = ZPos = Size = 0.0f; // Position and size
        for(short i=0;i<8;i++)  // Quadtrees only uses first 4
          Nodes[i] = NULL;      // Clear out child node pointers
      }

      // Destructor to clear child nodes and variables
      ~sNode()
      {
        delete [] PolygonList;  // Delete polygon list array
        for(short i=0;i<8;i++)
          delete Nodes[i];      // Delete child nodes
      }
    } sNode;

    // The texture group structure uses a cVertexBuffer class
    // from the Graphics Core to store polygons that need to
    // be rendered in a single frame, also it maintains the
    // number of polygons in a texture group and how many
    // polygons to draw each frame.
    typedef struct sGroup {
      cVertexBuffer  VertexBuffer; // Vertex data to draw
      char          *VertexPtr;    // Pointer to vertex data
      unsigned long  NumPolygons;  // # polygons in group
      unsigned long  NumPolygonsToDraw; // # polygon to draw

      sGroup()  { NumPolygons = 0;     }  // Clear # polygons
      ~sGroup() { VertexBuffer.Free(); }  // Free vertex buffer
    } sGroup;

    int            m_TreeType;     // Type of nodetree
                                   // QUADTREE or OCTREE

    cGraphics     *m_Graphics;     // Parent cGraphics object
    cFrustum      *m_Frustum;      // Viewing frustum

    unsigned long  m_Time;         // Time of current render

    float          m_Size;         // Size of world cube
    float          m_MaxSize;      // Maximum node size

    sNode         *m_ParentNode;   // Node linked list parent

    unsigned long  m_NumGroups;    // # of texture groups
    sGroup        *m_Groups;       // Texture groups

    unsigned long  m_NumPolygons;  // # of polygons in mesh
    unsigned long  m_MaxPolygons;  // Maximum polygons in node
    sPolygon      *m_PolygonList;  // Polygon data array

    sMesh         *m_Mesh;         // Parent mesh
    char          *m_VertexPtr;    // Pointer to mesh vertices
    unsigned long  m_VertexFVF;    // Mesh vertex FVF
    unsigned long  m_VertexSize;   // Size of mesh vertex

	BOOL	m_TransparentBlack;

    // SortNode groups the polygons into nodes and splits
    // the nodes into child nodes as needed.
    void           SortNode(sNode *Node,                      \
                         float XPos, float YPos, float ZPos,  \
                         float Size);

    // AddNode adds a node into the list of nodes to draw.
    void           AddNode(sNode *Node);

    // IsPolygonContained return TRUE if a polygon's bounding
    // box intersects with the specified cube space.
    BOOL           IsPolygonContained(sPolygon *Polygon,      \
                         float XPos, float YPos, float ZPos,  \
                         float Size);

    // CountPolygons returns the # of polygons in a 3-D cube.
    unsigned long  CountPolygons(                             \
                         float XPos, float YPos, float ZPos,  \
                         float Size);

  public:
    cNodeTreeMesh();   // Constructor
    ~cNodeTreeMesh();  // Destructor

    // Functions to create and free a node/tree mesh from
    // a source cMesh object, specifying the maximum # of
    // polygons in an area that is larger than a specific
    // size (forcing node splits).
    BOOL Create(cGraphics *Graphics, cMesh *Mesh,             \
              int TreeType = OCTREE,                          \
              float MaxSize = 256.0f, long MaxPolygons = 32);
    BOOL Free();

    // Render the current view using the current view
    // transformation and overloaded distance of view.
    // Also specify to use a pre-calculate frustum or
    // force a calculation of own frustum.
    BOOL Render(cFrustum *Frustum = NULL, float ZDistance = 0.0f);

    // Get closest height above or below point
    float GetHeight(float XPos, float ZPos);

    // Check if a polygon blocks path from start to end
    BOOL CheckIntersect(float XStart, float YStart, float ZStart,
                        float XEnd,   float YEnd,   float ZEnd,
                        float *Length);

	void CheckIntersect(D3DXVECTOR3* vecRay, D3DXVECTOR3* vecDir, 
						BOOL* Hit, DWORD* Face, float* u, float* v, float* Dist);
};

//============================================================================
// Class : cLandscape
//============================================================================
class cLandscape
{
private:
	cGraphics		*m_Graphics;	// Parent cGraphics object
    cFrustum		*m_Frustum;		// Viewing frustum

	cMesh			*m_LandMesh;	// Land Mesh
	cMesh			*m_DecorMesh;	// Decorate Mesh
	cNodeTreeMesh	*m_LandNode;	// Land NodeTreemesh Object
	cNodeTreeMesh   *m_DecorNode;	// Decorate NodeTreemesh Object

	int m_MID;

	typedef struct sVertex{
		FLOAT x, y, z;
		DWORD color;
		FLOAT u,v;
	} sVertex;

	cVertexBuffer	*m_MouseOnVB;
	cTexture		*m_MouseOnTex;
	BOOL			m_DrawMouseOn;	// to disable or enable mouse draw manaully
	BOOL			m_CanMove;		// to disable mouseOn draw automatically
									// when mouse on position that cannot move to

	BYTE			m_MapArray[120][120];	// Array of Map

	BOOL ConvertMouseTo3D(long MouseX, long MouseY, D3DVECTOR* target); // Use for mouse to find position in 3D world

public:
	cLandscape();	// Constructor
	~cLandscape();	// Destructor

	BOOL Create(cGraphics *Graphics, int MID);
	BOOL Free();

	BOOL Render();

	// Get Y value at (XPos, ZPos)
	float GetHeight(float XPos, float ZPos);

	// Draw MouseOn on land
	// return position on map (center of grid)
	// and whether player can move over it
	BOOL MouseOnMap(long MouseX, long MouseY, D3DVECTOR* position);
	BOOL CanMove(float XPos, float ZPos);

	void DisableMouseOver()		{ m_DrawMouseOn = FALSE; }
	void EnableMouseOver()		{ m_DrawMouseOn = TRUE; }	// Default is Disable
};

#endif
