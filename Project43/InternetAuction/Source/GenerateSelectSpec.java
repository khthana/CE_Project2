import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class GenerateSelectSpec
{
    void query_select_spec(java.io.PrintWriter out,String Str_device)
    {
       Connection con = null;
       Statement stmt = null;
       ResultSet rs= null;
       String name_of_select ;
       try
       {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
       }
	     catch (java.sql.SQLException ko){ out.println("Register error");}
       try
       {
       con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
       stmt = con.createStatement();
       if (Str_device.compareTo("CPU") == 0)
       {
         String Findselect_spec = new String("select brand_cpu,type_cpu,speed_cpu,Slot_type from CPU");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
        if (Str_device.compareTo("RAM") == 0)
       {
         String Findselect_spec = new String("select brand_ram,model_ram,size_ram from ram");
         Findselect_spec +=  " order by 1,2,3 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 3  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");

   	 	   }
       }
        if (Str_device.compareTo("MAINBOARD") == 0)
       {
         String Findselect_spec = new String("select brand_mb,model_mb,chip_set,type_cpu from mainboard");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
        if (Str_device.compareTo("HARDDISK") == 0)
       {
         String Findselect_spec = new String("select brand_harddisk,model_harddisk,capacity,speed from harddisk");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
      if (Str_device.compareTo("CDROM") == 0)
       {
         String Findselect_spec = new String("select brand_cdrom,x,interface from cd_rom");
         Findselect_spec +=  " order by 1,2,3 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 3  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
       if (Str_device.compareTo("DISPLAY CARD") == 0)
       {
         String Findselect_spec = new String("select brand_display,type_display,chip,memory from display_card");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
       if (Str_device.compareTo("SOUND CARD") == 0)
       {
         String Findselect_spec = new String("select brand_sound,model_sound,chip_set,interface from soundcard");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
      if (Str_device.compareTo("MONITOR") == 0)
       {
         String Findselect_spec = new String("select brand_monitor,size_monitor,type_monitor,dot_pitch from monitor");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
      if (Str_device.compareTo("MODEM") == 0)
       {
         String Findselect_spec = new String("select brand_modem,type_modem,interface,speed_modem from modem");
         Findselect_spec +=  " order by 1,2,3,4 " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
      if (Str_device.compareTo("FLOPPY DISK") == 0)
       {
         String Findselect_spec = new String("select brand_floppy,capacity cpu from floppy_disk");
         Findselect_spec +=  " order by 1,2  " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 2  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
      if (Str_device.compareTo("MOUSE") == 0)
       {
         String Findselect_spec = new String("select brand_mouse,interface from mouse");
         Findselect_spec +=  " order by 1,2  " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 2  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
       if (Str_device.compareTo("KEYBOARD") == 0)
       {
         String Findselect_spec = new String("select brand_keyboard,interface from keyboard");
         Findselect_spec +=  " order by 1,2  " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 2  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }
       if (Str_device.compareTo("SPEAKER") == 0)
       {
         String Findselect_spec = new String("select brand_speaker,type_speaker,number_speaker,watt from speaker");
         Findselect_spec +=  " order by 1,2,3,4  " ;
         rs = stmt.executeQuery(Findselect_spec);
         while (rs.next())
		     {
          String Seller_spec = new String("");
          for (int count_col  = 1 ; count_col <= 4  ; count_col++)
          {
            Seller_spec =  Seller_spec + " " +   rs.getString(count_col) ;
          }
          out.println("<option>" + Seller_spec + "</option>");
   	 	   }
       }

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
