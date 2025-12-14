package routersim;
import java.util.Vector;
import java.lang.String;

public class Ospf extends Thread implements java.io.Serializable{
  Router r;
 Ospf (Router r){
   this.r = r;
 }
 public void run(){
   sendHelloPackage(r);
   flooding(r);
   shortest_path(r);
   try{
         sleep(r.getTime());
         //sleep(100);
         if (!NewRouter.singleMode){
           run();
         }
         else{
           this.suspend();
           System.out.println(r.getName()+" is suspend");
         }//single mode
      }
   catch(InterruptedException e){
   }
 }
  public void sendHelloPackage(Router rin)
 {
  for (int aa=0;aa<rin.getVInt().size();aa++)
  {
       Interface This_intf = (Interface)rin.getVInt().elementAt(aa);
       if (This_intf.getStatus().equalsIgnoreCase("up"))
       {
       //for (int bb=0;bb<User.vRouter.size();bb++){
         int bb=0;
         while ((bb<NewRouter.vRouter.size())&&(rin.getFlag()=='o'))
         {
           Router rVrouter =(Router)NewRouter.vRouter.elementAt(bb);
           for (int cc=0;cc<rVrouter.getVInt().size();cc++)
           {
             Interface new_intf = (Interface)rVrouter.getVInt().elementAt(cc);
             if (new_intf.getStatus().equalsIgnoreCase("up"))
             {
               if ((This_intf.getNetAddress().equalsIgnoreCase(new_intf.getNetAddress()))&&(This_intf.getIpAddress()!=new_intf.getIpAddress()))
               {
                 if (!checkRedunce(rin.getHello(),rVrouter))
                 {
                   rin.getHello().addElement(new Hello(rin,rVrouter,10));
                 }else{};
               }else{};
             }
           }//for cc
           bb++;
         }//for bb
       }
   }//for aa
 }// End sendHelloPackage
 private boolean checkRedunce(Vector v,Router r){
   boolean check=false;
   int i=0;
   while  ((i<v.size())&&(!check)){
     Hello h=(Hello)v.elementAt(i);
     if (h.getDesRouter().getName().equalsIgnoreCase(r.getName())){
       check=true;
     }
     else{
     }
     i++;
   }
   return check;
 }
 private void updateVhello(Router r){
   for (int i=0;i<r.getVHello().size();i++){
     Vector vh = (Vector)r.getVHello().elementAt(i);
     if(vh.size()!=0)
     {
     Hello h = (Hello)vh.elementAt(0);
     if (h.getStartRouter().getName().equalsIgnoreCase(r.getName())){
       r.getVHello().removeElementAt(i);
     }
     }//end if
   }
 }
 public void flooding(Router rin)
 {
   updateVhello(rin);
   rin.getVHello().addElement(rin.getHello());
   for (int i=0;i < rin.getVInt().size(); i++)
   {
     Interface oldInt = (Interface)rin.getVInt().elementAt(i);
     if (oldInt.getStatus().equalsIgnoreCase("up"))
     {
       for (int j=0; j < NewRouter.vRouter.size();j++)
       {
         Router r = (Router)NewRouter.vRouter.elementAt(j);
         if (r.getFlag()=='o')
         {
           for (int k=0; k < r.getVInt().size();k++)
           {
             Interface newInt = (Interface)r.getVInt().elementAt(k);
             if (newInt.getStatus().equalsIgnoreCase("up"))
             {
               //  if adjacent it recieve table
               if (oldInt.getNetAddress().equalsIgnoreCase(newInt.getNetAddress()))
               {
                 if (!(r.getName().equalsIgnoreCase(rin.getName())))
                 {
                   r.recieveHelloTable(rin.getVHello(),find(rin.getName()));
                 }
               }
             }
           }//for (int j=0; j < User.vRouter.size();j++)
         }//if (r.getOspfFag())
       }//for (int j=0; j < User.vRouter.size();j++)
     }//if (oldInt.getStatus().equalsIgnoreCase("up"))
   }//router
 }// End flooding
 public void shortest_path(Router rin){
   int maxW = 800;
   int w  = NewRouter.vRouter.size();
   int[][] arr = new int[w][w];
   init(arr,w,0);
   Router rr = (Router)NewRouter.vRouter.lastElement() ;
   //Router rr =rin;
   setWeightInArray(rr,arr,w);
   int[][] Q = new int[w][w];
   int[][] path = new int[w][w];
   initFloid(arr,Q,w);
   floidAlgo(Q,path,w);
   NewRouter.pathx = new Vector[w][w];
   finalFindPath(path,w);
   adjustPathX(NewRouter.pathx,Q,w);
   printPathX(NewRouter.pathx,w);
 }
 private void setWeightInArray(Router rr,int[][] arr,int w){
   for (int ii=0;ii<rr.getVHello().size();ii++){
     Vector v = (Vector)rr.getVHello().elementAt(ii);
     for (int jj=0;jj<v.size();jj++){
       Hello h = (Hello)v.elementAt(jj);
       int x = find(h.getStartRouter().getName());
       int y = find(h.getDesRouter().getName());
       if ((x==-1) || (y==-1)){
       }
       else{
         arr[x][y]=h.getWeight();
       }
     }
   }
 }
 private void initFloid(int[][] arr,int[][] Q,int w){
   int maxW=1000;
   for (int a=0;a<w;a++){
     for (int b=0;b<w;b++)                                                                                                                                                                                                                                                                                                                                                                                                                                 {
       if (a==b){
         Q[a][b]=0;
       }
       else {
         if (arr[a][b] == 0) {
           Q[a][b]=maxW;
         }
         else {
           Q[a][b]=arr[a][b];
         }
       }
     }
   }
 }
 private void floidAlgo(int[][] Q,int[][] path,int w){
   init(path,w,-1);
   //---------------step 2-----------------//
   for (int k=0;k<w;k++){
     for (int i=0;i<w;i++){
       for (int j=0;j<w;j++){
         int tmp1 = Q[i][j];
         int tmp2 = Q[i][k]+Q[k][j];
         Q[i][j] = min(tmp1,tmp2);
         Router r1 = (Router)NewRouter.vRouter.elementAt(i);
         Router r2 = (Router)NewRouter.vRouter.elementAt(j);
         Router r3 = (Router)NewRouter.vRouter.elementAt(k);
           if (Q[i][j] == tmp1){
         }
         else if (Q[i][j] == tmp2){
           path[i][j] = k;
         }
         else{
         }
       }
     }
   }
   printArr(Q,w);
 }
 private void finalFindPath(int[][] path,int w){
//    System.out.println("************** print task ***************");
   for(int i=0;i<w;i++){
     for (int j=0;j<w;j++){
       int ii = i+1;
       int jj = j+1;
       NewRouter.pathx[i][j] = new Vector();
       NewRouter.pathx[i][j].addElement(NewRouter.vRouter.elementAt(i));
       printPathBetween(path,w,i,j,NewRouter.pathx[i][j]);
       NewRouter.pathx[i][j].addElement(NewRouter.vRouter.elementAt(j));
     }
   }
 }
 public void printPathBetween(int[][] p,int w,int src,int des,Vector pathList){
   if (p[src][des] != -1) {
     int middle = p[src][des];
     printPathBetween(p,w,src, middle,pathList);
     float m=middle+1;
     pathList.addElement(NewRouter.vRouter.elementAt(middle));
     printPathBetween(p,w,middle, des,pathList);
   }
 }
 public void adjustPathX(Vector[][] pathx,int[][] Q,int w){
   int maxW=1000;
   for(int i=0;i<w;i++){
     pathx[i][i].removeAllElements();
     pathx[i][i].addElement(NewRouter.vRouter.elementAt(i));
     for (int j=0;j<w;j++){
       if (Q[i][j] >= maxW){
         pathx[i][j].removeAllElements();
       }
     }
   }
 }
 public void init(int[][] arr,int w,int n){
   for (int i=0;i<w;i++){
     for (int j=0;j<w;j++){
       arr[i][j] = n;
     }
   }
 }
 public void printPathX(Vector[][] pathx,int w){
   for (int i=0;i<w;i++){
       for (int j=0;j<w;j++){
         int aa=i+1;
         int bb=j+1;
//          System.out.print(aa+","+bb+"=");
         for (int k=0;k<pathx[i][j].size();k++){
           Router r = (Router)pathx[i][j].elementAt(k);
//	    System.out.print(r.getName());
         }
//	  System.out.print("\t");

       }
//	System.out.println();
   }
 }
 public void printArr(int[][] a,int w){
   for (int i=0;i<w;i++)
   {
       for (int j=0;j<w;j++)
       {
         int aa=i+1;
         int bb=j+1;
//          System.out.print(aa+","+bb+"=");
//          System.out.print(a[i][j]);
//          System.out.print("\t");
     }
//      System.out.println();
   }
 }
 /*---------------------------------------------------------------------------------*/
  private int min(int a,int b)
  {
     if (a<=b){return a;}
     else {return b;}
  }
  private int find(String rName)
  {
   int x=-1;
   for (int i=0;i < NewRouter.vRouter.size(); i++){
     if (((Router)NewRouter.vRouter.elementAt(i)).getName().equalsIgnoreCase(rName)){
       x = i;
     }
   }
   return x;
   }

   private Router findR(String name)
   {
      boolean found=false;
      int i=0;
      Router r= null;
      while ((i<NewRouter.vRouter.size())&&(!found))
      {
	r = (Router)NewRouter.vRouter.elementAt(i);
	if (name.equalsIgnoreCase(r.getName())){
	  found=true;
	}
	i++;
      }
      return r;
   }
   private int findindexofR(String name)
   {

      int index = -1;
      boolean found=false;
      int i=0;
      Router r= null;
      while ((i<NewRouter.vRouter.size())&&(!found))
      {
        r = (Router)NewRouter.vRouter.elementAt(i);
        if (name.equalsIgnoreCase(r.getName())){
          found=true;
          index=i;
        }
        i++;
      }
      return index;
   }
    public void setWeight(String r_name,String neighbor_name,int w){
    Router r = findR(r_name);
    int s_index = findindexofR(r_name);
    Router neighbor = findR(neighbor_name);
    int d_index = findindexofR(neighbor_name);
    for (int i=0;i<r.getHello().size();i++)
    {
      Hello h =(Hello)r.getHello().elementAt(i);
      if (h.getStartRouter().getName().equalsIgnoreCase(r.getName()) &(h.getDesRouter().getName().equalsIgnoreCase(neighbor.getName())))
      {
        h.setWeight(w);
        StatusPanel.setCost(s_index,d_index,w);
      }
    }
    for (int i=0;i<neighbor.getHello().size();i++)
    {
      Hello h =(Hello)neighbor.getHello().elementAt(i);
      if (h.getStartRouter().getName().equalsIgnoreCase(neighbor.getName()) &(h.getDesRouter().getName().equalsIgnoreCase(r.getName())))
      {
        h.setWeight(w);
        StatusPanel.setCost(s_index,d_index,w);
      }
    }
  }
}