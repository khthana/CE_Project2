import java.awt.*;
import java.io.*;
import java.util.*;
import java.util.Date;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ServletReadz extends HttpServlet{

	public void doGet (HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{

    ServletOutputStream out = res.getOutputStream();
    Image img;
    Graphics g = null;
    Frame frame = null;



    img  = Toolkit.getDefaultToolkit().getImage("/1.jpg");
    frame = new Frame();
    frame.addNotify();
    MediaTracker mt = new MediaTracker(frame);
    mt.addImage(img,0);
    try {
      mt.waitForAll();
    }
    catch (InterruptedException e){

    }
    if (mt.isErrorAny()){
      out.println("<br>Problem loading");
    }
    out.println("<br>Hello");
    Image imgg = frame.createImage(100,200);
    g = imgg.getGraphics();
    g.drawImage(img,10,10,frame);

	}
};
