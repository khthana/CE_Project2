import java.io.*;
import java.net.*;
import java.util.*;

public class Device implements Serializable
{
  public String Data[];
  String Type_Device ;
  String Quantity ;
  Device(int Col)
  {
     Data = new String[Col];
  }
  void SetType(String Devicename)
  {
     Type_Device = Devicename ;
  }
  void setQuantity(String value)
  {
     Quantity = value  ;
  }
  String  getQuantity()
  {
     return Quantity  ;
  }
  String GetType()
  {
     return Type_Device ;
  }
  void Setdata(int col,String data)
  {
     this.Data[col] = data ;
  }
  String Getdata(int col)
  {
     return this.Data[col] ;
  }
}