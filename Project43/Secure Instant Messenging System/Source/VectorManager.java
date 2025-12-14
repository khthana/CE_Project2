import java.util.*;

public class VectorManager
{

   public ContactUserInfo findContactUser(Vector vUser,ContactUserInfo cUserInfo,int fUIN)
   {
     boolean found=false;
     boolean findSucc=false;
     int     aSize=0;

     while(!findSucc)
     {
       aSize=vUser.size();
       for(int i=0;i<vUser.size();i++)
       {
         ContactUserInfo cTemp=(ContactUserInfo)vUser.elementAt(i);

         if(cTemp.getUIN()==fUIN)
         {
            cUserInfo=cTemp;
            found=true;
            return cUserInfo;
         }
       }
       if((found)||(aSize==vUser.size()))
       {
         findSucc=true;
       }
     }
     return cUserInfo;
   }
}
