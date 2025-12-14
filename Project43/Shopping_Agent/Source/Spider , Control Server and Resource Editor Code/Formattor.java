package Spider2;
import java.util.*;
import java.sql.*;
public class Formattor implements Runnable {
  Thread runner;
  Spider control;
  Vector Data;
  ResultSet rst;
  public Formattor(Spider control) {
    this.control = control;
    runner = new Thread(this);
  }
  public void run(){
    RareProduct temp;
    while(true/*(temp = control.getProduct())!=null*/)
    {
      try{
        runner.sleep(2000);
        if((temp = control.getProduct())!=null)format(temp);
      }catch(Exception e){
        e.printStackTrace(System.out);
      }
    }
  }
  public void start(){
    runner.start();
  }
  public void format(RareProduct product){
    boolean pass =  true;
    Data = new Vector();
    for(int i=1;i<control.tagCount;i++)
    {
      //---------------Cut prefix and suffix---------------------------//
      if((product.attribute[i].compareTo("Not Available")!=0)&&((product.attribute[i].length()-product.resource.suffix[i])>=0)&&(product.attribute[i].length()>product.resource.prefix[i]))product.attribute[i] = product.attribute[i].substring(product.resource.prefix[i],product.attribute[i].length()-product.resource.suffix[i]);
      else
      if(((product.attribute[i].length()-product.resource.suffix[i])<0)||(product.attribute[i].length()<=product.resource.prefix[i]))product.attribute[i] = "Not Available";
      //---------------Search End String-------------------------------//
      if(product.resource.end_charactor[i].length()!=0) product.attribute[i] = CutString("end",product.resource.end_charactor[i],product.attribute[i]);
      //---------------Case Accepted String----------------------------//
      if(product.resource.accept_charactor[i].length()!=0)
      {
        product.attribute[i] = CutString("accept",product.resource.accept_charactor[i],product.attribute[i]);
      }else
      if(product.resource.cut_off_charactor[i].length()!=0)
      {
        product.attribute[i] = CutString("cut_off",product.resource.cut_off_charactor[i],product.attribute[i]);
      }
          ///---------------------------Check Province Value-----------------///
      if((control.tagString[i].compareTo("property_province")==0)&&(product.attribute[i].compareTo("Not Available")!=0))
      {
        try{
          rst = control.SQLservice2.query("select VALUE from PROVINCE_IDX where KEYWORD = '"+product.attribute[i]+"'");
          if(rst.next())
          {
            product.attribute[i] = rst.getString(1);
            Data.addElement(product.attribute[i]);
          }else
          {
            pass = false;
            Data.addElement(product.attribute[i]);
            control.Table.addElement("PROVINCE_IDX");
            control.Keyword.addElement(product.attribute[i]);
            control.Value.addElement("None");
            control.Province.addElement("None");
            control.InsertWind.InsertList.add("PROVINCE_IDX");
          }
        }catch(Exception e){
          e.printStackTrace(System.out);
        }
      }else
      if((control.tagString[i].compareTo("property_area")==0)&&(product.attribute[i].compareTo("Not Available")!=0))
      {
        try{
          rst = control.SQLservice2.query("select VALUE from AREA_IDX where keyword = '"+product.attribute[i]+"'");
          if(rst.next())
          {
            product.attribute[i] = rst.getString(1);
            Data.addElement(product.attribute[i]);
          }else
          {
            pass = false;
            Data.addElement(product.attribute[i]);
            control.Table.addElement("AREA_IDX");
            control.Keyword.addElement(product.attribute[i]);
            control.Value.addElement("None");
            control.Province.addElement("None");
            control.InsertWind.InsertList.add("AREA_IDX");
          }
        }catch(Exception e){
        }
      }else
      if((control.tagString[i].compareTo("property_bed")==0)&&(product.attribute[i].compareTo("Not Available")==0))
      {
        product.attribute[i] = "0";
        Data.addElement(product.attribute[i]);
      }else
      if((control.tagString[i].compareTo("more_info_url")==0)&&(product.attribute[i].compareTo("Not Available")!=0))
      {
        if(!product.attribute[i].startsWith("http://"))
        {
          product.attribute[i] = product.resource.local_site + product.attribute[i];
        }
        Data.addElement(product.attribute[i]);
      }
      else
      {
        Data.addElement(product.attribute[i]);
      }
    }
    Integer tempint = new Integer(control.getProductID());
    Data.addElement(tempint.toString());
    if(pass){
      try{
        control.SQLservice2.insert(control.spiderTable,Data);
      }catch(Exception e){
      }
    }
    control.spiderWindow.ProductList.replaceItem("Formatted :"+control.spiderWindow.ProductList.getItem(product.ProductNo),product.ProductNo);
  }
  public String CutString(String command,String indicator,String stringToChange){
    String temp="";
    boolean checked;
    if(command.compareTo("accept")==0)
    {
      int j;
      for(int i=0;i<stringToChange.length();i++)
      {
        checked = false;
        j=0;
        while((j<indicator.length())&&(!checked))
        {
          if(indicator.charAt(j)==stringToChange.charAt(i))
          {
            temp = temp + indicator.charAt(j);
            checked = true;
          }
          j++;
        }
      }
    }else
    if(command.compareTo("cut_off")==0)
    {
      int j=0;
      for(int i=0;i<stringToChange.length();i++)
      {
        checked = false;
        while((!checked)&&(j<indicator.length()))
        {
          if(indicator.charAt(j)==stringToChange.charAt(i)) checked = true;
          j++;
        }
        if(!checked) temp = temp + indicator.charAt(j);
      }
    }else
    if(command.compareTo("end")==0)
    {
      checked = false;
      int i=0;
      int j;
      while((!checked)&&(i<stringToChange.length()))
      {
        j=0;
        while((j<indicator.length())&&(!checked))
        {
          if(indicator.charAt(j)==stringToChange.charAt(i)) checked = true;
          j++;
        }
        if(!checked)temp = temp + stringToChange.charAt(i);
        i++;
      }
    }
    return temp;
  }
}