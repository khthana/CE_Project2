/*
 * Viewer.java
 *
 * Created on 2 ¾ÄÈ¨Ô¡ÒÂ¹ 2545, 21:18 ¹.
 */
import java.io.*;
import java.awt.*;
import javax.servlet.*;
import javax.servlet.http.*;
import Acme.JPM.Encoders.*;

/**
 *
 * @author  Joe
 * @version
 */
public class ImageViewer extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("image/gif");
        OutputStream out = response.getOutputStream();
        String filename = request.getParameter("file");
        String xco = request.getParameter("x");
        String yco = request.getParameter("y");
        String width = request.getParameter("w");
        String height = request.getParameter("h");
        String defw = request.getParameter("dw");
        String defh = request.getParameter("dh");
        String wShow = request.getParameter("ws");
        String hShow = request.getParameter("hs");

         
        int x = (xco==null)?0:Integer.parseInt(xco);
        int y = (yco==null)?0:Integer.parseInt(yco);
		
        int w = (width==null)?400:Integer.parseInt(width);
        int h = (height==null)?400:Integer.parseInt(height);

        int dw = (defw==null)?400:Integer.parseInt(defw);
        int dh = (defh==null)?400:Integer.parseInt(defh);


        int ws = (wShow==null)?400:Integer.parseInt(wShow);
        int hs = (hShow==null)?400:Integer.parseInt(hShow);

        

        if(filename==null)
        	return;
			
	    File fin = new File(filename);
	    if(fin.exists()==false)
	    	return;
  		WmfImage wmfdecode = new WmfImage(fin);
 		Image img = wmfdecode.CreateWmfDecoder( x, y, dw, dh, w, h);
 		img = wmfdecode.CropImage(img, x, y, ws, hs);
		
 		if(img==null)
 			return;	
 		new GifEncoder(img, out).encode();

   
       
    }
    
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, java.io.IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    
}
