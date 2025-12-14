//    package Data;

    // Basic node stored in AVL trees
    // Note that this class is not accessible outside
    // of package DataStructures

    class ANode
    {
            // Constructors
        ANode()
        {
            this(null );
        }

        ANode(ANode pr )
        {
            
            prev     = pr;
        }

     
    // Friendly data; accessible by other package routines
		boolean isroot = false;
		int[] childcard = new int[7];
		ANode[] childptr = new ANode[6];
		int    numchild = 0;
		int	   bestpoint = 0;
        int[]	percept= new int[16]; 
        int[] p1 = new int[7] ;
        int[] p2 = new int[7] ;
        int[] p3 = new int[7] ;
        int[] p4 = new int[7] ;
        int tern = 0; 
        //int r = 0;
        int firstplayer = 0;
        int[] round = new int[4];
        int[] playcard = new int[8];
       				     		// The data in the node
        ANode     prev;         // previous child
        ANode     best;       	// bestway child
        
    }
