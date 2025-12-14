


import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public  class Sendadddevice extends HttpServlet
{
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      resp.setContentType("text/html");
      PrintWriter out = resp.getWriter();
      HttpSession session = req.getSession(true);
      String Device ;
      out.println("<html>");
      out.println("<head>");
      out.println("<title> Employee List </title>");
	    out.println("</head>");
      out.println("<body>");
      Device = req.getParameter("Device") ;
      if (Device.compareTo("CPU")== 0)
      {
        resp.sendRedirect("AddCpu");
      }
      if (Device.compareTo("RAM")== 0)
      {
        resp.sendRedirect("AddRam");
      }
      if (Device.compareTo("MAINBOARD")== 0)
      {
        resp.sendRedirect("AddMainboard");
      }
      if (Device.compareTo("HARDDISK")== 0)
      {
        resp.sendRedirect("AddHarddisk");
      }
      if (Device.compareTo("CDROM")== 0)
      {
        resp.sendRedirect("AddCdrom");
      }
      if (Device.compareTo("DISPLAY CARD")== 0)
      {
        resp.sendRedirect("AddDisplaycard");
      }
      if (Device.compareTo("SOUND CARD")== 0)
      {
        resp.sendRedirect("AddSoundcard");
      }
      if (Device.compareTo("MONITOR")== 0)
      {
        resp.sendRedirect("AddMonitor");
      }
       if (Device.compareTo("MODEM")== 0)
      {
        resp.sendRedirect("AddModem");
      }
      if (Device.compareTo("FLOPPY DISK")== 0)
      {
        resp.sendRedirect("AddFloppy");
      }
      if (Device.compareTo("MOUSE")== 0)
      {
        resp.sendRedirect("AddMouse");
      }
      if (Device.compareTo("KEYBOARD")== 0)
      {
        resp.sendRedirect("AddKeyboard");
      }
      if (Device.compareTo("SPEAKER")== 0)
      {
        resp.sendRedirect("AddSpeaker");
      }
      out.println("</body>");
      out.println("</html>");
    }
}
