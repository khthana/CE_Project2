import java.io.*;
import java.net.*;
import java.util.*;
import Device ;
public class Part implements Serializable
{
   public  String Partname;
   public  String Partdescription;

//   public String Data[];
   public  Vector Listdevice = new Vector();
   Part()
   {
 //    Data = new String[20][20];
   }
   public Device GetDevice(int Device_no)
   {
       return (Device)Listdevice.elementAt(Device_no);
   }
}
