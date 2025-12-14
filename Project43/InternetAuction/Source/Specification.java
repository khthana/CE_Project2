
import  java.io.*;
import  java.util.*;
public  final class Specification extends Object implements Serializable
{
 //  public static Vector Array_part = new Vector();
   public  String name ;
   public  String company_name ;
   public  String projectname  ;
   public  String projectdescription;
  
   public  String Enddate ;
   public  int Maxprice ;
   public  Vector Listpart = new Vector();
   public  int count_part ;
   Specification()
   {

   }
   void Set_Partdetail(String Partname,String Partdescription,int part_no)
   {
     this.GetPart(part_no).Partname         = Partname ;
     this.GetPart(part_no).Partdescription  = Partdescription ;
   }
    public Part GetPart(int part_no)
   {
       return (Part)Listpart.elementAt(part_no);
   }
}

