/*
 * ResponseServlet.java
 *
 * Created on 9 กุมภาพันธ์ 2546, 15:22 น.
 */

package PalmData;

import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import PalmData.Database;
/**
 *
 * @author  Aey
 */
public class ResponseServlet extends HttpServlet {
    Database data = new Database();
    
    public void init(ServletConfig config) throws ServletException
    {
        super.init(config);
    }
    
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
                       throws ServletException, IOException
    {
        try
        {    
            HttpSession session = req.getSession(true);
      
            // If a new session, we need to rewrite the URL for client
            if (session.isNew())
            {
                // Get the URL that got us here
                String incomingURL = HttpUtils.getRequestURL(req).toString();
        
                // Encode by adding session ID onto URL
                String URLwithID = res.encodeURL(incomingURL);
        
                // Send back a header to client with new re-written URL
                res.setHeader("Custom-newURL", URLwithID);
            }
            
            // getData Parameter
            String table = req.getParameter("table")==null?"":req.getParameter("table");
            String area = req.getParameter("area")==null?"":req.getParameter("area");
            String kind = req.getParameter("kind")==null?"":req.getParameter("kind");
            String con4 = req.getParameter("con4")==null?"":req.getParameter("con4");
            String con5 = req.getParameter("con5")==null?"":req.getParameter("con5");
            String con6 = req.getParameter("con6")==null?"":req.getParameter("con6");
            String con7 = req.getParameter("con7")==null?"":req.getParameter("con7");
            String con8 = req.getParameter("con8")==null?"":req.getParameter("con8");
            String con9 = req.getParameter("con9")==null?"":req.getParameter("con9");
            String con10 = req.getParameter("con10")==null?"":req.getParameter("con10");
            String con11 = req.getParameter("con11")==null?"":req.getParameter("con11");
            String con12 = req.getParameter("con12")==null?"":req.getParameter("con12");
            String con13 = req.getParameter("con13")==null?"":req.getParameter("con13");
            String con14 = req.getParameter("con14")==null?"":req.getParameter("con14");
            String con15 = req.getParameter("con15")==null?"":req.getParameter("con15");
            String con16 = req.getParameter("con16")==null?"":req.getParameter("con16");
            String con17 = req.getParameter("con17")==null?"":req.getParameter("con17");    
            String con18 = req.getParameter("con18")==null?"":req.getParameter("con18");    

            // getList Parameter
            String tablename = req.getParameter("tablename")==null?"-":req.getParameter("tablename");;            
            
            System.out.print(con4+":con5 "+con5+":con6 "+con6+":con7 "+con7+":con8 "+con8+":con9 "+con9+
            ":con10 "+con10+":con11 "+con11+":con12 "+con12+":con13 "+con13+":con14 "+con14+":con15 "+
            con15+":con16 "+con16+":con17 "+con17+":con18 "+con18);
            // Send back to client the new running total
            String text = "";
            if (!table.equals("")) 
                text = data.getData(table,area,kind,con4,con5,con6,con7,con8,con9,con10,con11,con12,con13,con14,con15,con16,con17,con18);
            else if (!tablename.equals("")) text = data.getDataList(tablename);
            res.setContentType("text/plain");
            PrintWriter out = res.getWriter();
            
            if (text.length()<5)
                text="Not Found Please Try Again! \n \n \n \n \n \n \n \n \n";
            else
                text+="\n \n \n "; 
                
            out.println(text);              
            out.close();
        }
        catch (Exception e)
        {
            //System.err.println("Msg: " + e.toString());
            e.printStackTrace();
        }
  }

  /*--------------------------------------------------
  * Information about servlet
  *-------------------------------------------------*/
    public String getServletInfo()
    {
        return "ResponseServlet";
    }
}
