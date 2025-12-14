import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class GenerateSellerSpec
{
    void query_seller_spec(java.io.PrintWriter out,String Str_device,int Device_col,
                                   Specification spectest,int i_count_part,int row)
    {
       Connection con = null;
       Statement stmt = null;
       ResultSet rs= null;
       String name_of_select ;
       name_of_select  = "part" + new Integer(i_count_part).toString() + "_" ;
       name_of_select += "row" +  new Integer(row).toString() ;
       try
       {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
       }
	     catch (java.sql.SQLException ko){ out.println("Register error");}
     try
     {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      //////----Make SQL state to Find seller Spec-----///
      /////---------------IF DEVICE = CPU----------------------//////
      if (Str_device.compareTo("CPU") == 0)
      {
        String Findseller_spec = new String("select brand_cpu,type_cpu,speed_cpu,slot_type from " + Str_device);
        String Brand    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Type     = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Speed    = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Slot_type= spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;

        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Speed.compareTo("Not specific")     == 0 ) &&
           (Slot_type.compareTo("Not specific") == 0 ))
           Findseller_spec += " where brand_cpu = '"+ Brand + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Speed.compareTo("Not specific")== 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_cpu = '"+ Type + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Speed.compareTo("Not specific")== 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where brand_cpu = '"+ Brand + "' and Type_cpu = '" + Type + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Speed.compareTo("Not specific")!= 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Speed_cpu = '" + Speed + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Speed.compareTo("Not specific")!= 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where brand_cpu = '"+ Brand + "' and Speed_cpu = '" + Speed + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_cpu = '"+ Type + "' and Speed_cpu = '" + Speed + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where brand_cpu = '"+ Brand + "' and Type_cpu = '" + Type + "'";
           Findseller_spec += " and Speed_cpu = '" + Speed + "'" ;
           }
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    == 0 ) &&
           (Speed.compareTo("Not specific") == 0 ) &&
           (Slot_type.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where slot_type = '"+ Slot_type + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")    == 0 ) &&
           (Speed.compareTo("Not specific") == 0 ) &&
           (Slot_type.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where brand_cpu = '"+ Brand + "' and slot_type = '" + Slot_type + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Speed.compareTo("Not specific") == 0 ) &&
           (Slot_type.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Type_cpu = '"+ Type + "' and slot_type = '" + Slot_type + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Speed.compareTo("Not specific") == 0 ) &&
           (Slot_type.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where brand_cpu = '"+ Brand + "' and Type_cpu = '" + Type + "'";
            Findseller_spec += " and slot_type = '" + Slot_type + "'" ;
           }
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Speed_cpu = '"+ Speed + "' and slot_type = '" + Slot_type + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where brand_cpu = '"+ Brand + "' and Speed_cpu = '" + Speed + "'";
            Findseller_spec += " and slot_type  = '" + Slot_type + "'" ;
           }
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_cpu = '"+ Type + "' and Speed_cpu = '" + Speed + "'";
            Findseller_spec += " and slot_type  = '" + Slot_type + "'" ;
           }
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Speed.compareTo("Not specific") != 0 ) &&
           (Slot_type.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_cpu= '"+ Type + "' and Speed_cpu = '" + Speed + "'";
            Findseller_spec += " and slot_type = '" + Slot_type + "' and brand_cpu ='" + Brand + "'";
           }

        Findseller_spec +=  " order by 1,2,3,4 " ;
//      out.println(Findseller_spec);
        rs = stmt.executeQuery(Findseller_spec);
    //    out.println("<select name=\"select\">");
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = CPU----------------------//////
      /////---------------IF DEVICE = RAM----------------------//////

      if (Str_device.compareTo("RAM") == 0)
      {
        String Findseller_spec = new String("select brand_ram,model_ram,size_ram from " + Str_device);
        String Brand    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Model    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Size     = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        if((Brand.compareTo("Not specific")  != 0 ) &&
           (Model.compareTo("Not specific")  == 0 ) &&
           (Size.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where brand_ram = '"+ Brand + "'";
        if((Brand.compareTo("Not specific")  == 0 ) &&
           (Model.compareTo("Not specific")  != 0 ) &&
           (Size.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where Model_ram = '" + Model + "'";
        if((Brand.compareTo("Not specific")  != 0 ) &&
           (Model.compareTo("Not specific")  != 0 ) &&
           (Size.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where brand_ram = '"+ Brand + "' and Model_ram = '" + Model + "'";
        if((Brand.compareTo("Not specific")  == 0 ) &&
           (Model.compareTo("Not specific")  == 0 ) &&
           (Size.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where Size_ram = '"+ Size + "'";
        if((Brand.compareTo("Not specific")  != 0 ) &&
           (Model.compareTo("Not specific")  == 0 ) &&
           (Size.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where brand_ram = '"+ Brand + "' and Size_ram = '" + Size + "'";
        if((Brand.compareTo("Not specific")  == 0 ) &&
           (Model.compareTo("Not specific")  != 0 ) &&
           (Size.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where Model_ram = '" +  Model + "' and Size_ram = '" + Size + "'";
        if((Brand.compareTo("Not specific")  != 0 ) &&
           (Model.compareTo("Not specific")  != 0 ) &&
           (Size.compareTo("Not specific")   != 0 ))
           {Findseller_spec += " where brand_ram = '"+ Brand + "' and Size_ram = '" + Size + "'";
            Findseller_spec += " and Model_ram = '" + Model + "'" ;
           }
        Findseller_spec +=  " order by 1,2,3 " ;
//        out.println(Findseller_spec);
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 3  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = RAM----------------------//////
      if (Str_device.compareTo("MAINBOARD") == 0)
      {
        String Findseller_spec = new String("select Brand_mb,Model_mb,chip_set,type_cpu from " + Str_device);
        String Brand_mb    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Model_mb    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Chip_set    = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Type_cpu    = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;

        if((Brand_mb.compareTo("Not specific")     != 0 ) &&
           (Model_mb.compareTo("Not specific")      == 0 ) &&
           (Chip_set.compareTo("Not specific")     == 0 ) &&
           (Type_cpu.compareTo("Not specific") == 0 ))
           Findseller_spec += " where Brand_mb = '"+ Brand_mb + "'";
        if((Brand_mb.compareTo("Not specific")    == 0 ) &&
           (Model_mb.compareTo("Not specific")     != 0 ) &&
           (Chip_set.compareTo("Not specific")== 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_mb = '"+ Model_mb + "'";
        if((Brand_mb.compareTo("Not specific")    != 0 ) &&
           (Model_mb.compareTo("Not specific")     != 0 ) &&
           (Chip_set.compareTo("Not specific")== 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Model_mb = '" + Model_mb + "'";
        if((Brand_mb.compareTo("Not specific")    == 0 ) &&
           (Model_mb.compareTo("Not specific")     == 0 ) &&
           (Chip_set.compareTo("Not specific")!= 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Chip_set = '" + Chip_set + "'";
        if((Brand_mb.compareTo("Not specific")    != 0 ) &&
           (Model_mb.compareTo("Not specific")     == 0 ) &&
           (Chip_set.compareTo("Not specific")!= 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Chip_set = '" + Chip_set + "'";
        if((Brand_mb.compareTo("Not specific")    == 0 ) &&
           (Model_mb.compareTo("Not specific")    != 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_mb = '"+ Model_mb + "' and Chip_set = '" + Chip_set + "'";
        if((Brand_mb.compareTo("Not specific")    != 0 ) &&
           (Model_mb.compareTo("Not specific")    != 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Model_mb = '" + Model_mb + "'";
           Findseller_spec += " and Chip_set = '" + Chip_set + "'" ;
           }
        if((Brand_mb.compareTo("Not specific")    == 0 ) &&
           (Model_mb.compareTo("Not specific")    == 0 ) &&
           (Chip_set.compareTo("Not specific") == 0 ) &&
           (Type_cpu.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Type_cpu = '"+ Type_cpu + "'";
        if((Brand_mb.compareTo("Not specific")    != 0 ) &&
           (Model_mb.compareTo("Not specific")    == 0 ) &&
           (Chip_set.compareTo("Not specific") == 0 ) &&
           (Type_cpu.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Type_cpu = '" + Type_cpu + "'";
        if((Brand_mb.compareTo("Not specific")    == 0 ) &&
           (Model_mb.compareTo("Not specific")    != 0 ) &&
           (Chip_set.compareTo("Not specific") == 0 ) &&
           (Type_cpu.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Model_mb_cpu = '"+ Model_mb + "' and Type_cpu = '" + Type_cpu + "'";
        if((Brand_mb.compareTo("Not specific")     != 0 ) &&
           (Model_mb.compareTo("Not specific")      != 0 ) &&
           (Chip_set.compareTo("Not specific") == 0 ) &&
           (Type_cpu.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Model_mb = '" + Model_mb + "'";
            Findseller_spec += " and Type_cpu = '" + Type_cpu + "'" ;
           }
        if((Brand_mb.compareTo("Not specific")     == 0 ) &&
           (Model_mb.compareTo("Not specific")      == 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Chip_set = '"+ Chip_set + "' and Type_cpu = '" + Type_cpu + "'";
        if((Brand_mb.compareTo("Not specific")     != 0 ) &&
           (Model_mb.compareTo("Not specific")      == 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_mb = '"+ Brand_mb + "' and Chip_set = '" + Chip_set + "'";
            Findseller_spec += " and Type_cpu  = '" + Type_cpu + "'" ;
           }
        if((Brand_mb.compareTo("Not specific")     == 0 ) &&
           (Model_mb.compareTo("Not specific")      != 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_mb = '"+ Model_mb + "' and Chip_set = '" + Chip_set + "'";
            Findseller_spec += " and Type_cpu  = '" + Type_cpu + "'" ;
           }
        if((Brand_mb.compareTo("Not specific")     != 0 ) &&
           (Model_mb.compareTo("Not specific")      != 0 ) &&
           (Chip_set.compareTo("Not specific") != 0 ) &&
           (Type_cpu.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_mb = '"+ Model_mb + "' and Chip_set = '" + Chip_set + "'";
            Findseller_spec += " and Type_cpu = '" + Type_cpu + "' and Brand_mb ='" + Brand_mb + "'";
           }

        Findseller_spec +=  " order by 1,2,3,4 " ;

        rs = stmt.executeQuery(Findseller_spec);
    //    out.println("<select name=\"select\">");
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = MAINBOARD----------------------//////
      /////---------------END IF DEVICE = HARDDISK----------------------//////
      if (Str_device.compareTo("HARDDISK") == 0)
      {
        String Findseller_spec = new String("select Brand_harddisk,Model_harddisk,Capacity,speed from " + Str_device);
        String Brand_harddisk    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Model_harddisk    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Capacity          = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Speed             = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;

        if((Brand_harddisk.compareTo("Not specific")     != 0 ) &&
           (Model_harddisk.compareTo("Not specific")      == 0 ) &&
           (Capacity.compareTo("Not specific")     == 0 ) &&
           (Speed.compareTo("Not specific") == 0 ))
           Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "'";
        if((Brand_harddisk.compareTo("Not specific")    == 0 ) &&
           (Model_harddisk.compareTo("Not specific")     != 0 ) &&
           (Capacity.compareTo("Not specific")== 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_harddisk = '"+ Model_harddisk + "'";
        if((Brand_harddisk.compareTo("Not specific")    != 0 ) &&
           (Model_harddisk.compareTo("Not specific")     != 0 ) &&
           (Capacity.compareTo("Not specific")== 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Model_harddisk = '" + Model_harddisk + "'";
        if((Brand_harddisk.compareTo("Not specific")    == 0 ) &&
           (Model_harddisk.compareTo("Not specific")     == 0 ) &&
           (Capacity.compareTo("Not specific")!= 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Capacity = '" + Capacity + "'";
        if((Brand_harddisk.compareTo("Not specific")    != 0 ) &&
           (Model_harddisk.compareTo("Not specific")     == 0 ) &&
           (Capacity.compareTo("Not specific")!= 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Capacity = '" + Capacity + "'";
        if((Brand_harddisk.compareTo("Not specific")    == 0 ) &&
           (Model_harddisk.compareTo("Not specific")    != 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_harddisk = '"+ Model_harddisk + "' and Capacity = '" + Capacity + "'";
        if((Brand_harddisk.compareTo("Not specific")    != 0 ) &&
           (Model_harddisk.compareTo("Not specific")    != 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Model_harddisk = '" + Model_harddisk + "'";
           Findseller_spec += " and Capacity = '" + Capacity + "'" ;
           }
        if((Brand_harddisk.compareTo("Not specific")    == 0 ) &&
           (Model_harddisk.compareTo("Not specific")    == 0 ) &&
           (Capacity.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Speed = '"+ Speed + "'";
        if((Brand_harddisk.compareTo("Not specific")    != 0 ) &&
           (Model_harddisk.compareTo("Not specific")    == 0 ) &&
           (Capacity.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Speed = '" + Speed + "'";
        if((Brand_harddisk.compareTo("Not specific")    == 0 ) &&
           (Model_harddisk.compareTo("Not specific")    != 0 ) &&
           (Capacity.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Model_harddisk_cpu = '"+ Model_harddisk + "' and Speed = '" + Speed + "'";
        if((Brand_harddisk.compareTo("Not specific")     != 0 ) &&
           (Model_harddisk.compareTo("Not specific")      != 0 ) &&
           (Capacity.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Model_harddisk = '" + Model_harddisk + "'";
            Findseller_spec += " and Speed = '" + Speed + "'" ;
           }
        if((Brand_harddisk.compareTo("Not specific")     == 0 ) &&
           (Model_harddisk.compareTo("Not specific")      == 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Capacity = '"+ Capacity + "' and Speed = '" + Speed + "'";
        if((Brand_harddisk.compareTo("Not specific")     != 0 ) &&
           (Model_harddisk.compareTo("Not specific")      == 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_harddisk = '"+ Brand_harddisk + "' and Capacity = '" + Capacity + "'";
            Findseller_spec += " and Speed  = '" + Speed + "'" ;
           }
        if((Brand_harddisk.compareTo("Not specific")     == 0 ) &&
           (Model_harddisk.compareTo("Not specific")      != 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_harddisk = '"+ Model_harddisk + "' and Capacity = '" + Capacity + "'";
            Findseller_spec += " and Speed  = '" + Speed + "'" ;
           }
        if((Brand_harddisk.compareTo("Not specific")     != 0 ) &&
           (Model_harddisk.compareTo("Not specific")      != 0 ) &&
           (Capacity.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_harddisk = '"+ Model_harddisk + "' and Capacity = '" + Capacity + "'";
            Findseller_spec += " and Speed = '" + Speed + "' and Brand_harddisk ='" + Brand_harddisk + "'";
           }
        Findseller_spec +=  " order by 1,2,3,4 " ;
        
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = HARDDISK----------------------//////
       /////---------------IF DEVICE = CDROM----------------------//////

      if (Str_device.compareTo("CDROM") == 0)
      {
        Str_device ="CD_ROM" ;
        String Findseller_spec = new String("select Brand_cdrom,X,interface from " + Str_device);
        String Brand_cdrom    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String X    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Interface     = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        if((Brand_cdrom.compareTo("Not specific")  != 0 ) &&
           (X.compareTo("Not specific")  == 0 ) &&
           (Interface.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where Brand_cdrom = '"+ Brand_cdrom + "'";
        if((Brand_cdrom.compareTo("Not specific")  == 0 ) &&
           (X.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where X = '" + X + "'";
        if((Brand_cdrom.compareTo("Not specific")  != 0 ) &&
           (X.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")   == 0 ))
           Findseller_spec += " where Brand_cdrom = '"+ Brand_cdrom + "' and X = '" + X + "'";
        if((Brand_cdrom.compareTo("Not specific")  == 0 ) &&
           (X.compareTo("Not specific")  == 0 ) &&
           (Interface.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where Interface = '"+ Interface + "'";
        if((Brand_cdrom.compareTo("Not specific")  != 0 ) &&
           (X.compareTo("Not specific")  == 0 ) &&
           (Interface.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where Brand_cdrom = '"+ Brand_cdrom + "' and Interface = '" + Interface + "'";
        if((Brand_cdrom.compareTo("Not specific")  == 0 ) &&
           (X.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")   != 0 ))
           Findseller_spec += " where X = '" +  X + "' and Interface = '" + Interface + "'";
        if((Brand_cdrom.compareTo("Not specific")  != 0 ) &&
           (X.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")   != 0 ))
           {Findseller_spec += " where Brand_cdrom = '"+ Brand_cdrom + "' and Interface = '" + Interface + "'";
            Findseller_spec += " and X = '" + X + "'" ;
           }
        Findseller_spec +=  " order by 1,2,3 " ;
        
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 3  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = CDROM----------------------//////

      /////-----------------IF DEVICE = DISPLAY----------------------//////

      if (Str_device.compareTo("DISPLAY CARD") == 0)
      {
        Str_device ="DISPLAY_CARD" ;
        String Findseller_spec = new String("select Brand_display,type_display,Chip,Memory from " + Str_device);
        String Brand_display     = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Type_display      = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Chip      = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Memory     = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;
        if((Brand_display.compareTo("Not specific")     != 0 ) &&
           (Type_display.compareTo("Not specific")      == 0 ) &&
           (Chip.compareTo("Not specific") == 0 ) &&
           (Memory.compareTo("Not specific")     == 0 ))
           Findseller_spec += " where Brand_display = '"+ Brand_display + "'";
        if((Brand_display.compareTo("Not specific")    == 0 ) &&
           (Type_display.compareTo("Not specific")     != 0 ) &&
           (Chip.compareTo("Not specific")== 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where type_display = '"+ Type_display + "'";
        if((Brand_display.compareTo("Not specific")    != 0 ) &&
           (Type_display.compareTo("Not specific")     != 0 ) &&
           (Chip.compareTo("Not specific")== 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_display = '"+ Brand_display + "' and type_display = '" + Type_display + "'";
        if((Brand_display.compareTo("Not specific")    == 0 ) &&
           (Type_display.compareTo("Not specific")     == 0 ) &&
           (Chip.compareTo("Not specific")!= 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Chip = '" + Chip + "'";
        if((Brand_display.compareTo("Not specific")    != 0 ) &&
           (Type_display.compareTo("Not specific")     == 0 ) &&
           (Chip.compareTo("Not specific")!= 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_display = '"+ Brand_display + "' and Chip = '" + Chip + "'";
        if((Brand_display.compareTo("Not specific")    == 0 ) &&
           (Type_display.compareTo("Not specific")    != 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where type_display = '"+ Type_display + "' and Chip = '" + Chip + "'";
        if((Brand_display.compareTo("Not specific")    != 0 ) &&
           (Type_display.compareTo("Not specific")    != 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where Brand_display = '"+ Brand_display + "' and type_display = '" + Type_display + "'";
           Findseller_spec += " and Chip = '" + Chip + "'" ;
           }
        if((Brand_display.compareTo("Not specific")    == 0 ) &&
           (Type_display.compareTo("Not specific")    == 0 ) &&
           (Chip.compareTo("Not specific") == 0 ) &&
           (Memory.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Memory = '"+ Memory + "'";
        if((Brand_display.compareTo("Not specific")    != 0 ) &&
           (Type_display.compareTo("Not specific")    == 0 ) &&
           (Chip.compareTo("Not specific") == 0 ) &&
           (Memory.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Brand_display = '"+ Brand_display + "' and Memory = '" + Memory + "'";
        if((Brand_display.compareTo("Not specific")    == 0 ) &&
           (Type_display.compareTo("Not specific")    != 0 ) &&
           (Chip.compareTo("Not specific") == 0 ) &&
           (Memory.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where type_display = '"+ Type_display + "' and Memory = '" + Memory + "'";
        if((Brand_display.compareTo("Not specific")     != 0 ) &&
           (Type_display.compareTo("Not specific")      != 0 ) &&
           (Chip.compareTo("Not specific") == 0 ) &&
           (Memory.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_display = '"+ Brand_display + "' and type_display = '" + Type_display + "'";
            Findseller_spec += " and Memory = '" + Memory + "'" ;
           }
        if((Brand_display.compareTo("Not specific")     == 0 ) &&
           (Type_display.compareTo("Not specific")      == 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Chip = '"+ Chip + "' and Memory = '" + Memory + "'";
        if((Brand_display.compareTo("Not specific")     != 0 ) &&
           (Type_display.compareTo("Not specific")      == 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_display = '"+ Brand_display + "' and Chip = '" + Chip + "'";
            Findseller_spec += " and Memory  = '" + Memory + "'" ;
           }
        if((Brand_display.compareTo("Not specific")     == 0 ) &&
           (Type_display.compareTo("Not specific")      != 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where type_display = '"+ Type_display + "' and Chip = '" + Chip + "'";
            Findseller_spec += " and Memory  = '" + Memory + "'" ;
           }
        if((Brand_display.compareTo("Not specific")     != 0 ) &&
           (Type_display.compareTo("Not specific")      != 0 ) &&
           (Chip.compareTo("Not specific") != 0 ) &&
           (Memory.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where type_display= '"+ Type_display + "' and Chip = '" + Chip + "'";
            Findseller_spec += " and Memory = '" + Memory + "' and Brand_display ='" + Brand_display + "'";
           }
        Findseller_spec +=  " order by 1,2,3,4 " ;

      
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = DISPLAY----------------------//////
    /////-----------------IF DEVICE = SOUND CARD----------------------//////

      if (Str_device.compareTo("SOUND CARD") == 0)
      {
        Str_device ="SOUNDCARD" ;
        String Findseller_spec = new String("select Brand_sound,Model_sound,Sound_system,Interface from " + Str_device);
        String Brand_sound     = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Model_sound     = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Sound_system    = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Interface       = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;
        if((Brand_sound.compareTo("Not specific")     != 0 ) &&
           (Model_sound.compareTo("Not specific")      == 0 ) &&
           (Sound_system.compareTo("Not specific") == 0 ) &&
           (Interface.compareTo("Not specific")     == 0 ))
           Findseller_spec += " where Brand_sound = '"+ Brand_sound + "'";
        if((Brand_sound.compareTo("Not specific")    == 0 ) &&
           (Model_sound.compareTo("Not specific")     != 0 ) &&
           (Sound_system.compareTo("Not specific")== 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_sound = '"+ Model_sound + "'";
        if((Brand_sound.compareTo("Not specific")    != 0 ) &&
           (Model_sound.compareTo("Not specific")     != 0 ) &&
           (Sound_system.compareTo("Not specific")== 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Model_sound = '" + Model_sound + "'";
        if((Brand_sound.compareTo("Not specific")    == 0 ) &&
           (Model_sound.compareTo("Not specific")     == 0 ) &&
           (Sound_system.compareTo("Not specific")!= 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Sound_system = '" + Sound_system + "'";
        if((Brand_sound.compareTo("Not specific")    != 0 ) &&
           (Model_sound.compareTo("Not specific")     == 0 ) &&
           (Sound_system.compareTo("Not specific")!= 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Sound_system = '" + Sound_system + "'";
        if((Brand_sound.compareTo("Not specific")    == 0 ) &&
           (Model_sound.compareTo("Not specific")    != 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Model_sound = '"+ Model_sound + "' and Sound_system = '" + Sound_system + "'";
        if((Brand_sound.compareTo("Not specific")    != 0 ) &&
           (Model_sound.compareTo("Not specific")    != 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Model_sound = '" + Model_sound + "'";
           Findseller_spec += " and Sound_system = '" + Sound_system + "'" ;
           }
        if((Brand_sound.compareTo("Not specific")    == 0 ) &&
           (Model_sound.compareTo("Not specific")    == 0 ) &&
           (Sound_system.compareTo("Not specific") == 0 ) &&
           (Interface.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Interface = '"+ Interface + "'";
        if((Brand_sound.compareTo("Not specific")    != 0 ) &&
           (Model_sound.compareTo("Not specific")    == 0 ) &&
           (Sound_system.compareTo("Not specific") == 0 ) &&
           (Interface.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Interface = '" + Interface + "'";
        if((Brand_sound.compareTo("Not specific")    == 0 ) &&
           (Model_sound.compareTo("Not specific")    != 0 ) &&
           (Sound_system.compareTo("Not specific") == 0 ) &&
           (Interface.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Model_sound = '"+ Model_sound + "' and Interface = '" + Interface + "'";
        if((Brand_sound.compareTo("Not specific")     != 0 ) &&
           (Model_sound.compareTo("Not specific")      != 0 ) &&
           (Sound_system.compareTo("Not specific") == 0 ) &&
           (Interface.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Model_sound = '" + Model_sound + "'";
            Findseller_spec += " and Interface = '" + Interface + "'" ;
           }
        if((Brand_sound.compareTo("Not specific")     == 0 ) &&
           (Model_sound.compareTo("Not specific")      == 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Sound_system = '"+ Sound_system + "' and Interface = '" + Interface + "'";
        if((Brand_sound.compareTo("Not specific")     != 0 ) &&
           (Model_sound.compareTo("Not specific")      == 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_sound = '"+ Brand_sound + "' and Sound_system = '" + Sound_system + "'";
            Findseller_spec += " and Interface  = '" + Interface + "'" ;
           }
        if((Brand_sound.compareTo("Not specific")     == 0 ) &&
           (Model_sound.compareTo("Not specific")      != 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_sound = '"+ Model_sound + "' and Sound_system = '" + Sound_system + "'";
            Findseller_spec += " and Interface  = '" + Interface + "'" ;
           }
        if((Brand_sound.compareTo("Not specific")     != 0 ) &&
           (Model_sound.compareTo("Not specific")      != 0 ) &&
           (Sound_system.compareTo("Not specific") != 0 ) &&
           (Interface.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Model_sound= '"+ Model_sound + "' and Sound_system = '" + Sound_system + "'";
            Findseller_spec += " and Interface = '" + Interface + "' and Brand_sound ='" + Brand_sound + "'";
           }
        Findseller_spec +=  " order by 1,2,3,4 " ;

        
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = SOUND CARD----------------------//////

        /////-----------------IF DEVICE = MONITOR----------------------//////
      if (Str_device.compareTo("MONITOR") == 0)
      {
        String Findseller_spec = new String("select brand_monitor,type_monitor,size_monitor,dot_pitch from " + Str_device);
        String Brand     = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Type      = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Size      = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Dot_pitch = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Size.compareTo("Not specific")      == 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where brand_monitor= '"+ Brand + "'";
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Size.compareTo("Not specific")      == 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where Type_monitor= '"+ Type + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Size.compareTo("Not specific")      == 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where brand_monitor= '"+ Brand + "' and Type_monitor= '" + Type + "'";
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Size.compareTo("Not specific")      != 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where Size_monitor = '" + Size + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Size.compareTo("Not specific")      != 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where brand_monitor= '"+ Brand + "' and Size_monitor = '" + Size + "'";
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Size.compareTo("Not specific")      != 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           Findseller_spec += " where Type_monitor= '"+ Type + "' and Size_monitor = '" + Size + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Size.compareTo("Not specific")      != 0 ) &&
           (Dot_pitch.compareTo("Not specific") == 0 ))
           {
           Findseller_spec += " where brand_monitor= '"+ Brand + "' and Type_monitor= '" + Type + "'";
           Findseller_spec += " and Size_monitor = '" + Size + "'" ;
           }
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Size.compareTo("Not specific")      == 0 ) &&
           (Dot_pitch.compareTo("Not specific") != 0 ))
           Findseller_spec += " where Dot_pitch = '"+ Dot_pitch + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Size.compareTo("Not specific")      == 0 ) &&
           (Dot_pitch.compareTo("Not specific") != 0 ))
           Findseller_spec += " where brand_monitor= '"+ Brand + "' and Dot_pitch = '" + Dot_pitch + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Size.compareTo("Not specific")     == 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           Findseller_spec += " where Type_monitor= '"+ Type + "' and Dot_pitch = '" + Dot_pitch + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Size.compareTo("Not specific")     == 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           {
            Findseller_spec += " where brand_monitor= '"+ Brand + "' and Type_monitor= '" + Type + "'";
            Findseller_spec += " and Dot_pitch = '" + Dot_pitch + "'" ;
           }
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Size.compareTo("Not specific")     != 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           Findseller_spec += " where Size_monitor = '"+ Size + "' and Dot_pitch = '" + Dot_pitch + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Size.compareTo("Not specific")     != 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           {
            Findseller_spec += " where brand_monitor= '"+ Brand + "' and Size_monitor = '" + Size + "'";
            Findseller_spec += " and Dot_pitch = '" + Dot_pitch + "'" ;
           }
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Size.compareTo("Not specific")     != 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           {
            Findseller_spec += " where Type_monitor= '"+ Type + "' and Size_monitor = '" + Size + "'";
            Findseller_spec += " and Dot_pitch = '" + Dot_pitch + "'" ;
           }
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Size.compareTo("Not specific")     != 0 ) &&
           (Dot_pitch.compareTo("Not specific")!= 0 ))
           {
            Findseller_spec += " where Type_monitor= '"+ Type + "' and Size_monitor = '" + Size + "'";
            Findseller_spec += " and Dot_pitch = '" + Dot_pitch + "' and brand_monitor='" + Brand + "'";
           }
          Findseller_spec +=  " order by 1,2,3,4 " ;

        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = MONITOR----------------------//////
      /////-----------------IF DEVICE = MODEM----------------------//////
      if (Str_device.compareTo("MODEM") == 0)
      {
        String Findseller_spec = new String("select brand_modem,type_modem,interface,speed_modem from " + Str_device);
        String Brand     = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Type      = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Interface = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Speed     = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Interface.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")     == 0 ))
           Findseller_spec += " where brand_modem = '"+ Brand + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Interface.compareTo("Not specific")== 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_modem = '"+ Type + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     != 0 ) &&
           (Interface.compareTo("Not specific")== 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where brand_modem = '"+ Brand + "' and Type_modem = '" + Type + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Interface.compareTo("Not specific")!= 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Interface = '" + Interface + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")     == 0 ) &&
           (Interface.compareTo("Not specific")!= 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where brand_modem = '"+ Brand + "' and Interface = '" + Interface + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_modem = '"+ Type + "' and Interface = '" + Interface + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where brand_modem = '"+ Brand + "' and Type_modem = '" + Type + "'";
           Findseller_spec += " and Interface = '" + Interface + "'" ;
           }
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    == 0 ) &&
           (Interface.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where speed_modem = '"+ Speed + "'";
        if((Brand.compareTo("Not specific")    != 0 ) &&
           (Type.compareTo("Not specific")    == 0 ) &&
           (Interface.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where brand_modem = '"+ Brand + "' and speed_modem = '" + Speed + "'";
        if((Brand.compareTo("Not specific")    == 0 ) &&
           (Type.compareTo("Not specific")    != 0 ) &&
           (Interface.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Type_modem = '"+ Type + "' and speed_modem = '" + Speed + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Interface.compareTo("Not specific") == 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where brand_modem = '"+ Brand + "' and Type_modem = '" + Type + "'";
            Findseller_spec += " and speed_modem = '" + Speed + "'" ;
           }
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Interface = '"+ Interface + "' and speed_modem = '" + Speed + "'";
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      == 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where brand_modem = '"+ Brand + "' and Interface = '" + Interface + "'";
            Findseller_spec += " and speed_modem  = '" + Speed + "'" ;
           }
        if((Brand.compareTo("Not specific")     == 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_modem = '"+ Type + "' and Interface = '" + Interface + "'";
            Findseller_spec += " and speed_modem  = '" + Speed + "'" ;
           }
        if((Brand.compareTo("Not specific")     != 0 ) &&
           (Type.compareTo("Not specific")      != 0 ) &&
           (Interface.compareTo("Not specific") != 0 ) &&
           (Speed.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_modem= '"+ Type + "' and Interface = '" + Interface + "'";
            Findseller_spec += " and speed_modem = '" + Speed + "' and brand_modem ='" + Brand + "'";
           }
        Findseller_spec +=  " order by 1,2,3,4 " ;

//   
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = MODEM----------------------//////
        /////-----------------IF DEVICE = SPEAKER----------------------//////

      if (Str_device.compareTo("SPEAKER") == 0)
      {
        String Findseller_spec = new String("select Brand_speaker,Type_speaker,Number_speaker,Watt from " + Str_device);
        String Brand_speaker     = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Type_speaker     = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        String Number_speaker    = spectest.GetPart(i_count_part).GetDevice(row).Data[2] ;
        String Watt       = spectest.GetPart(i_count_part).GetDevice(row).Data[3] ;
        if((Brand_speaker.compareTo("Not specific")     != 0 ) &&
           (Type_speaker.compareTo("Not specific")      == 0 ) &&
           (Number_speaker.compareTo("Not specific") == 0 ) &&
           (Watt.compareTo("Not specific")     == 0 ))
           Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    == 0 ) &&
           (Type_speaker.compareTo("Not specific")     != 0 ) &&
           (Number_speaker.compareTo("Not specific")== 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_speaker = '"+ Type_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    != 0 ) &&
           (Type_speaker.compareTo("Not specific")     != 0 ) &&
           (Number_speaker.compareTo("Not specific")== 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Type_speaker = '" + Type_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    == 0 ) &&
           (Type_speaker.compareTo("Not specific")     == 0 ) &&
           (Number_speaker.compareTo("Not specific")!= 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Number_speaker = '" + Number_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    != 0 ) &&
           (Type_speaker.compareTo("Not specific")     == 0 ) &&
           (Number_speaker.compareTo("Not specific")!= 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Number_speaker = '" + Number_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    == 0 ) &&
           (Type_speaker.compareTo("Not specific")    != 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           Findseller_spec += " where Type_speaker = '"+ Type_speaker + "' and Number_speaker = '" + Number_speaker + "'";
        if((Brand_speaker.compareTo("Not specific")    != 0 ) &&
           (Type_speaker.compareTo("Not specific")    != 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")    == 0 ))
           {
           Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Type_speaker = '" + Type_speaker + "'";
           Findseller_spec += " and Number_speaker = '" + Number_speaker + "'" ;
           }
        if((Brand_speaker.compareTo("Not specific")    == 0 ) &&
           (Type_speaker.compareTo("Not specific")    == 0 ) &&
           (Number_speaker.compareTo("Not specific") == 0 ) &&
           (Watt.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Watt = '"+ Watt + "'";
        if((Brand_speaker.compareTo("Not specific")    != 0 ) &&
           (Type_speaker.compareTo("Not specific")    == 0 ) &&
           (Number_speaker.compareTo("Not specific") == 0 ) &&
           (Watt.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Watt = '" + Watt + "'";
        if((Brand_speaker.compareTo("Not specific")    == 0 ) &&
           (Type_speaker.compareTo("Not specific")    != 0 ) &&
           (Number_speaker.compareTo("Not specific") == 0 ) &&
           (Watt.compareTo("Not specific")    != 0 ))
           Findseller_spec += " where Type_speaker = '"+ Type_speaker + "' and Watt = '" + Watt + "'";
        if((Brand_speaker.compareTo("Not specific")     != 0 ) &&
           (Type_speaker.compareTo("Not specific")      != 0 ) &&
           (Number_speaker.compareTo("Not specific") == 0 ) &&
           (Watt.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Type_speaker = '" + Type_speaker + "'";
            Findseller_spec += " and Watt = '" + Watt + "'" ;
           }
        if((Brand_speaker.compareTo("Not specific")     == 0 ) &&
           (Type_speaker.compareTo("Not specific")      == 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")     != 0 ))
           Findseller_spec += " where Number_speaker = '"+ Number_speaker + "' and Watt = '" + Watt + "'";
        if((Brand_speaker.compareTo("Not specific")     != 0 ) &&
           (Type_speaker.compareTo("Not specific")      == 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Brand_speaker = '"+ Brand_speaker + "' and Number_speaker = '" + Number_speaker + "'";
            Findseller_spec += " and Watt  = '" + Watt + "'" ;
           }
        if((Brand_speaker.compareTo("Not specific")     == 0 ) &&
           (Type_speaker.compareTo("Not specific")      != 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_speaker = '"+ Type_speaker + "' and Number_speaker = '" + Number_speaker + "'";
            Findseller_spec += " and Watt  = '" + Watt + "'" ;
           }
        if((Brand_speaker.compareTo("Not specific")     != 0 ) &&
           (Type_speaker.compareTo("Not specific")      != 0 ) &&
           (Number_speaker.compareTo("Not specific") != 0 ) &&
           (Watt.compareTo("Not specific")     != 0 ))
           {
            Findseller_spec += " where Type_speaker= '"+ Type_speaker + "' and Number_speaker = '" + Number_speaker + "'";
            Findseller_spec += " and Watt = '" + Watt + "' and Brand_speaker ='" + Brand_speaker + "'";
           }
        Findseller_spec +=  " order by 1,2,3,4 " ;


        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 4  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
       /////---------------IF DEVICE = FLOPPY DISK----------------------//////
      if (Str_device.compareTo("FLOPPY DISK") == 0)
      {
        Str_device ="FLOPPY_DISK" ;
        String Findseller_spec = new String("select Brand_floppy,Capacity from " + Str_device);
        String Brand_floppy    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Capacity    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        if((Brand_floppy.compareTo("Not specific")  != 0 ) &&
           (Capacity.compareTo("Not specific")  == 0 ) )
           Findseller_spec += " where Brand_floppy = '"+ Brand_floppy + "'";
        if((Brand_floppy.compareTo("Not specific")  == 0 ) &&
           (Capacity.compareTo("Not specific")  != 0 ))
           Findseller_spec += " where Capacity = '" + Capacity + "'";
        if((Brand_floppy.compareTo("Not specific")  != 0 ) &&
           (Capacity.compareTo("Not specific")  != 0 ) )
           Findseller_spec += " where Brand_floppy = '"+ Brand_floppy + "' and Capacity = '" + Capacity + "'";
        Findseller_spec +=  " order by 1,2 " ;
      
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 2  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
       /////---------------IF DEVICE = MOUSE----------------------//////
      if (Str_device.compareTo("MOUSE") == 0)
      {
        Str_device ="MOUSE" ;
        String Findseller_spec = new String("select Brand_mouse,Interface from " + Str_device);
        String Brand_mouse    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Interface    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        if((Brand_mouse.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")  == 0 ) )
           Findseller_spec += " where Brand_mouse = '"+ Brand_mouse + "'";
        if((Brand_mouse.compareTo("Not specific")  == 0 ) &&
           (Interface.compareTo("Not specific")  != 0 ))
           Findseller_spec += " where Interface = '" + Interface + "'";
        if((Brand_mouse.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")  != 0 ) )
           Findseller_spec += " where Brand_mouse = '"+ Brand_mouse + "' and Interface = '" + Interface + "'";
        Findseller_spec +=  " order by 1,2" ;
      
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 2  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = CDROM----------------------//////
       /////---------------IF DEVICE = KEYBOARD----------------------//////
      if (Str_device.compareTo("KEYBOARD") == 0)
      {
        Str_device ="KEYBOARD" ;
        String Findseller_spec = new String("select Brand_KEYBOARD,Interface from " + Str_device);
        String Brand_keyboard    = spectest.GetPart(i_count_part).GetDevice(row).Data[0] ;
        String Interface    = spectest.GetPart(i_count_part).GetDevice(row).Data[1] ;
        if((Brand_keyboard.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")  == 0 ) )
           Findseller_spec += " where Brand_keyboard = '"+ Brand_keyboard + "'";
        if((Brand_keyboard.compareTo("Not specific")  == 0 ) &&
           (Interface.compareTo("Not specific")  != 0 ))
           Findseller_spec += " where Interface = '" + Interface + "'";
        if((Brand_keyboard.compareTo("Not specific")  != 0 ) &&
           (Interface.compareTo("Not specific")  != 0 ) )
           Findseller_spec += " where Brand_keyboard = '"+ Brand_keyboard + "' and Interface = '" + Interface + "'";
        Findseller_spec +=  " order by 1,2" ;
      
        rs = stmt.executeQuery(Findseller_spec);
        out.println("<select name=\"" + name_of_select + "\">");
        while (rs.next())
		    {
         String Seller_spec = new String("");
         for (int count_col  = 1 ; count_col <= 2  ; count_col++)
         {
          Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
         }
          out.println("<option>" + Seller_spec + "</option>");
   		  }
        out.println("</select>");
      }
      /////---------------END IF DEVICE = KEYBOARD----------------------//////

      //////----End Make SQL state to Find seller Spec-----///
      }
      catch (Exception ex)
      {
      	 out.println("Exception");
	       ex.printStackTrace(out);
	    }
      finally
      {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	   }
    }

}
