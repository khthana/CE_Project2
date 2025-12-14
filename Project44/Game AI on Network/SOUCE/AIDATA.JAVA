//package Data;

	interface cardsequence{
		int	cardsequence[] = new int[6] ;
	 }
    
    public class AIdata
    {
        int	   bestpoint = 0;
        int[] percept = new int[16]; 
        int[] p1 = new int[7];
        int[] p2 = new int[7];
        int[] p3 = new int[7];
        int[] p4 = new int[7];
       	int tern = 0;
       	//int r = 0;
       	int firstplayer = 0;
        int[] round = new int[4];
        int[] playcard = new int[8]; 
    }