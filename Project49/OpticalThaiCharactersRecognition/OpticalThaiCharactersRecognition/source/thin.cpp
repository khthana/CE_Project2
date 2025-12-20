#include <vector>
#include <iostream>

#define BKGRND 0
#define FRONT 255

using namespace std;  

 int kernel[][] = new int[][] 
 {
    {0,0,0,2,1,2,1,1,1},
      {2,0,0,1,1,0,2,1,2},
	{1,2,0,1,1,0,1,2,0},
	  {2,1,2,1,1,0,2,0,0},
	    {1,1,1,2,1,2,0,0,0},
	      {2,1,2,0,1,1,0,0,2},
		{0,2,1,0,1,1,0,2,1},
		  {0,0,2,0,1,1,2,1,2}
		    };

//private static final int COLOR_BACKGROUND = BKGRND; // Background color (white)
 // private static final int COLOR_FOREGROUND = FRONT; // Foreground color (black)



BOOL ThinBinaryRep2(int *b,int w,int h,int *kernel)
 {
    CPoint p;
    vector<CPoint> result;       //HashSet result = new HashSet();
    vector<CPoint> inputSet;     //HashSet inputHashSet = new HashSet();

    for(int j=0;j<h;++j)
	{
		for(int i=0;i<w;++i)
		{
	         if(b[i+j*w]==FRONT)
			 {
	              //inputHashSet.add(new CPoint(i,j));
				 inputSet.push_back(CPoint(i,j));
			 }
		}
   }

    BOOL bo=FALSE;
    result = HitMissVector(b,w,h,inputSet, kernel);
    vector<CPoint>::iterator it = result.begin();//result.iterator();
	int i = 0;
    while(it != result.end())
	{								 //it.hasNext()
      p = it[i];					 //CPoint((Point) it.next());
      //make p a background pixel
      b[p.x + p.y * w]=BKGRND;
      bo=TRUE;
	  ++i;
	  ++it;
    }
    return bo;
  }//end of ThinBinaryRep2

  
 vector HitMissVector(int *b,int w,int h,vector input,int *kernel)
 {
    vector<CPoint> output; //HashSet output = new HashSet();
    vector<CPoint>::iterator it;	//Iterator it = input.begin();
	int i = 0;
	it = input.begin(); 
    while(it != input.end())		//it.hasNext()
	{
      CPoint p = it[i];				//(Point) it.next();
      if(kernelMatch( p, b, w, h, kernel))
	  {
		//System.out.println("Match "+p.x+" "+p.y);
		output.push_back(p);
      }
	  ++it;
	  ++i;
    }
    //System.out.println(output.size());
    return output;
  }//end of HitMissHashSet
  
  BOOL kernelMatch(CPoint p, int *pixels,int w, int h, int *kernel)
  {
    int matched = 0;
    for(int j=-1;j<2;++j)
	{
      for(int i=-1;i<2;++i)
	  {
	     if(kernel[((j+1)*3)+(i+1)]==2)
		 {
			++matched;
	     }
		 else if((p.x+i>=0)&&(p.x+i<w)&&(p.y+j>=0)&&(p.y+j<h)&&
	            (((pixels[(p.x+i)+w*(p.y+j)]==FRONT)&&
	            (kernel[((j+1)*3)+(i+1)]==1))||
	            ((pixels[(p.x+i)+w*(p.y+j)]==BKGRND)&&
	            (kernel[((j+1)*3)+(i+1)]==0))))
		 {
			++matched;
		 }
      }
    }
    if(matched==9)
	{
      return true;
    }
    else 
		return false;
  }
  int *skeleton_image(int *binary,int w,int h) 
  {
      BOOL forward = TRUE;
      while(forward)
	  {
        forward = FALSE;
        BOOL changed = ThinBinaryRep2(binary,w,h,kernel[0]);
        forward = forward || changed;
        changed = ThinBinaryRep2(binary,w,h,kernel[1]);
        forward = forward || changed;
        //applying a new kenel by 90° rotating original kernel
        changed = ThinBinaryRep2(binary,w,h,kernel[2]);
        forward = forward || changed;
        changed = ThinBinaryRep2(binary,w,h,kernel[3]);
        forward = forward || changed;
        //applying a new kenel by 180° rotating original kernel
        changed = ThinBinaryRep2(binary,w,h,kernel[4]);
        forward = forward || changed;
        changed = ThinBinaryRep2(binary,w,h,kernel[5]);
        forward = forward || changed;
        //applying a new kenel by 270° rotating original kernel
        changed = ThinBinaryRep2(binary,w,h,kernel[6]);
        forward = forward || changed;
        changed = ThinBinaryRep2(binary,w,h,kernel[7]);
        forward = forward || changed;
      }

    return binary;
  }