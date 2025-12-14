import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public  class Sendspec extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      resp.setContentType("text/html");
      PrintWriter out = resp.getWriter();
      HttpSession session = req.getSession(true);
      String username      = (String)session.getValue("username");
        if (username == null)
          resp.sendRedirect("../Pleaselogin.html");

      Specification spectest = new Specification();
      String Device_name ;
      out.println("<html>");
      out.println("<head>");
      out.println("<title> Confirm Device_name </title>");
	    out.println("</head>");
      out.println("<body>");
      String Str_count_part ;
      spectest = (Specification)session.getValue(session.getId());
      int count_part =  spectest.Listpart.size()-1 ;
      Device_name = req.getParameter("Device_name") ;
      out.println(" Name  &nbsp;" + spectest.name + "<br>" );
      out.println(" Project name &nbsp;" + spectest.projectname+ "<br>");
      out.println(" Project description &nbsp;" + spectest.projectdescription+ "<br>");
      out.println(" Maxprise &nbsp;" + spectest.Maxprice+ "<br>");
      out.println(" Enddate  &nbsp;" + spectest.Enddate+ "<br>");
      out.println(" Part name &nbsp;" + spectest.GetPart(count_part).Partname+ "<br>");
      out.println(" Part description &nbsp;" + spectest.GetPart(count_part).Partdescription+ "<br>");

      if (Device_name.compareTo("CPU")== 0)
      {
        out.println("get value CPU");
        String Brand_cpu = req.getParameter("Brand_cpu") ;
        String Type_cpu  = req.getParameter("Type_cpu");
        String Speed_cpu = req.getParameter("Speed_cpu");
        String Slot_type = req.getParameter("Slot_type");
        String Quantity_cpu = req.getParameter("Quantity_cpu");
        Device device = new Device(4) ;
        device.SetType("CPU");
        device.setQuantity(Quantity_cpu);
        device.Setdata(0,Brand_cpu);
        device.Setdata(1,Type_cpu);
        device.Setdata(2,Speed_cpu);
        device.Setdata(3,Slot_type);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("RAM")== 0)
      {
        out.println("get value RAM");
        String  Brand_ram = req.getParameter("Brand_ram") ;
        String  Model_ram  = req.getParameter("Model_ram");
        String  Size_ram = req.getParameter("Size_ram");
        String  Quantity_ram = req.getParameter("Quantity_ram");
        Device device = new Device(3) ;
        device.SetType("RAM");
        device.setQuantity(Quantity_ram);
        device.Setdata(0,Brand_ram);
        device.Setdata(1,Model_ram);
        device.Setdata(2,Size_ram);

        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("MONITOR")== 0)
      {
        out.println("get value MONITOR");
        String Brand_monitor = req.getParameter("Brand_monitor") ;
        String Type_monitor  = req.getParameter("Type_monitor");
        String Size_monitor  = req.getParameter("Size_monitor");
        String Dot_pitch     = req.getParameter("Dot_pitch");
        String Quantity_monitor = req.getParameter("Quantity_monitor");
        Device device = new Device(4) ;
        device.SetType("MONITOR");
        device.setQuantity(Quantity_monitor);
        device.Setdata(0,Brand_monitor);
        device.Setdata(1,Type_monitor);
        device.Setdata(2,Size_monitor);
        device.Setdata(3,Dot_pitch);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
       if (Device_name.compareTo("MAINBOARD")== 0)
      {
        out.println("get value MAINBOARD");
        String Brand_mb = req.getParameter("Brand_mb") ;
        String Model_mb  = req.getParameter("Model_mb");
        String Chip_set  = req.getParameter("Chip_set");
        String Type_cpu  = req.getParameter("Type_cpu") ;
        String Quantity_mainboard = req.getParameter("Quantity_mb");
        Device device = new Device(4) ;
        device.SetType("MAINBOARD");
        device.setQuantity(Quantity_mainboard);
        device.Setdata(0,Brand_mb);
        device.Setdata(1,Model_mb);
        device.Setdata(2,Chip_set);
        device.Setdata(3,Type_cpu);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("HARDDISK")== 0)
      {
        out.println("get value HARDDISK");
        String Brand_harddisk = req.getParameter("Brand_harddisk") ;
        String Model_harddisk  = req.getParameter("Model_harddisk");
        String Capacity  = req.getParameter("Capacity");
        String Speed     = req.getParameter("Speed");
        String Quantity_harddisk = req.getParameter("Quantity_harddisk");
        Device device = new Device(4) ;
        device.SetType("HARDDISK");
        device.setQuantity(Quantity_harddisk);
        device.Setdata(0,Brand_harddisk);
        device.Setdata(1,Model_harddisk);
        device.Setdata(2,Capacity);
        device.Setdata(3,Speed);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("MODEM")== 0)
      {
        out.println("get value modem");
        String Brand_modem = req.getParameter("Brand_modem") ;
        String Type_modem  = req.getParameter("Type_modem");
        String Interface  = req.getParameter("Interface");
        String Speed_modem     = req.getParameter("Speed_modem");
        String Quantity_modem = req.getParameter("Quantity_modem");
        Device device = new Device(4) ;
        device.SetType("MODEM");
        device.setQuantity(Quantity_modem);
        device.Setdata(0,Brand_modem);
        device.Setdata(1,Type_modem);
        device.Setdata(2,Interface);
        device.Setdata(3,Speed_modem);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
       if (Device_name.compareTo("SPEAKER")== 0)
      {
        out.println("get value SPEAKER");
        String Brand_speaker = req.getParameter("Brand_speaker") ;
        String Type_speaker  = req.getParameter("Type_speaker");
        String Number_speaker  = req.getParameter("Number_speaker");
        String watt     = req.getParameter("watt");
        String Quantity_speaker = req.getParameter("Quantity_speaker");
        Device device = new Device(4) ;
        device.SetType("SPEAKER");
        device.setQuantity(Quantity_speaker);
        device.Setdata(0,Brand_speaker);
        device.Setdata(1,Type_speaker);
        device.Setdata(2,Number_speaker);
        device.Setdata(3,watt);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("CDROM")== 0)
      {
        out.println("get value CDROM");
        String Brand_cdrom = req.getParameter("Brand_cdrom") ;
        String x  = req.getParameter("x");
        String Interface  = req.getParameter("Interface");
        String Quantity_cdrom = req.getParameter("Quantity_cdrom");
        Device device = new Device(3) ;
        device.SetType("CDROM");
        device.setQuantity(Quantity_cdrom);
        device.Setdata(0,Brand_cdrom);
        device.Setdata(1,x);
        device.Setdata(2,Interface);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
        if (Device_name.compareTo("DISPLAY CARD")== 0)
      {
        out.println("get value DISPLAY CARD");
        String Brand_display    = req.getParameter("Brand_display") ;
        String Type_display     = req.getParameter("Type_display");
        String Chip             = req.getParameter("Chip");
        String Memory           = req.getParameter("Memory");
        String Quantity_display = req.getParameter("Quantity_display");
        Device device = new Device(4) ;
        device.SetType("DISPLAY CARD");
        device.setQuantity(Quantity_display);
        device.Setdata(0,Brand_display);
        device.Setdata(1,Type_display);
        device.Setdata(2,Chip);
        device.Setdata(3,Memory);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
        if (Device_name.compareTo("SOUND CARD")== 0)
      {
        out.println("get value SOUND CARD");
        String Brand_sound     = req.getParameter("Brand_sound") ;
        String Model_sound     = req.getParameter("Model_sound");
        String Sound_system    = req.getParameter("Sound_system");
        String Interface       = req.getParameter("Interface");
        String Quantity_sound = req.getParameter("Quantity_sound");
        Device device = new Device(4) ;
        device.SetType("SOUND CARD");
        device.setQuantity(Quantity_sound);
        device.Setdata(0,Brand_sound);
        device.Setdata(1,Model_sound);
        device.Setdata(2,Sound_system);
        device.Setdata(3,Interface);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("FLOPPY")== 0)
      {
        out.println("get value Floppy");
        String  Brand_floppy = req.getParameter("Brand_floppy") ;
        String  Capacity     = req.getParameter("Capacity");
        String  Quantity_floppy = req.getParameter("Quantity_floppy");
        Device device = new Device(2) ;
        device.SetType("FLOPPY DISK");
        device.setQuantity(Quantity_floppy);
        device.Setdata(0,Brand_floppy);
        device.Setdata(1,Capacity);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("MOUSE")== 0)
      {

        out.println("get value MOUSE");
        String  Brand_mouse = req.getParameter("Brand_mouse") ;
        String  Interface   = req.getParameter("Interface");
        String  Quantity_mouse = req.getParameter("Quantity_mouse");
        Device device = new Device(2) ;
        device.SetType("MOUSE");
        device.setQuantity(Quantity_mouse);
        device.Setdata(0,Brand_mouse);
        device.Setdata(1,Interface);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      if (Device_name.compareTo("KEYBOARD")== 0)
      {

        out.println("get value KEYBOARD");
        String  Brand_keyboard    = req.getParameter("Brand_keyboard") ;
        String  Interface         = req.getParameter("Interface");
        String  Quantity_keyboard = req.getParameter("Quantity_keyboard");
        Device device = new Device(2) ;
        device.SetType("KEYBOARD");
        device.setQuantity(Quantity_keyboard);
        device.Setdata(0,Brand_keyboard);
        device.Setdata(1,Interface);
        spectest.GetPart(count_part).Listdevice.addElement(device);
      }
      String havepart = "havepart" ;
      String haveproject = "haveproject" ;
      session.putValue(session.getId(),spectest);
      session.putValue("havepart",havepart);
      session.putValue("haveproject",haveproject);
      resp.sendRedirect("Addpart");
      out.println("</body>");
      out.println("</html>");
    }
}
