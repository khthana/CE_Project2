/******************************************************************
 * Copyright (C) 2002-2006 Andrew Girow. All rights reserved.     *
 * ---------------------------------------------------------------*
 * This software is published under the terms of the TinyLine     *
 * License, a copy of which has been included with this           *
 * distribution in the TINYLINE_LICENSE.TXT file.                 *
 *                                                                *
 * For more information on the TinyLine,                          *
 * please see <http://www.tinyline.com/>.                         *
 *****************************************************************/
package gisonmobile.page;

import gisonmobile.*;
import gps.datatypes.Record;
import gps.exceptions.EmptyBufferException;

import java.io.*;

import javax.microedition.io.*;
import javax.microedition.lcdui.*;

import com.tinyline.tiny2d.*;
import com.tinyline.svg.*;
import com.tinyline.util.GZIPInputStream;

import com.tinyline.app.ImageConsumer;
import com.tinyline.app.MIDPSVGImageProducer;

import javax.microedition.io.file.FileConnection;

import com.tinyline.app.MIDPSVGCanvas;
import com.tinyline.app.SVGEvent;
import com.tinyline.app.PlayerListener;
import java.util.Date;
/**
 * This class represents an SVG canvas used for
 * the aimple SVG Viewer demo application.
 * <p>
 * @author (C) Andrew Girow
 * @version 1.10
 * <p>
 */

public class ViewerCanvas extends MIDPSVGCanvas implements ImageConsumer, ImageLoader,Runnable
{

    /**
     * Type of the UI
     */
    final static int  TYPE_LINK      = 0;  // Link mode
    final static int  TYPE_PAN       = 1;  // Pan mode
    final static int  TYPE_ZOOM      = 3;  // Zoom mode
    final static int  TYPE_MAXCOUNT  = 4;  // MAX
    final static int  TYPE_FIND  = 5;  // FIND

	final static int LOAD_URL = 0;
	final static int LOAD_FILE = 1;
	
    /* The current mode */
    int type = TYPE_ZOOM;

    /**
     * The original values to calculate pan.
     */
    int pressedX;
    int pressedY;
    int draggedX;
    int draggedY;


    // The pan step
    static final int PAN_STEP    = 10;
    static final int MENU_HEIGHT = 18;

    // Zooms levels
    private  static int MAX_ZOOMLEVEL = 10;
    private  static int MIN_ZOOMLEVEL = -10;
    private  int zoomLevel = 0;
    private static double zoomScale = 0.2;
    
    /* The clock image */
    Image wait;

    /** The SVG renderer */
    SVGRaster raster;
    MIDPSVGImageProducer imageProducer;
    
    
    /* The current loading status */
    boolean load = true;
    
    /* The current dislpay */
    Display display;

    /* The MIDPSVGCanvas bounds */
    int x,y,width,height;
	
    TinyColor redColor    =  new TinyColor(0xFFFF0000);
    TinyColor yellowColor =  new TinyColor(0xFFFFFF00);
    TinyColor navyColor   =  new TinyColor(0xFF000080);
    TinyColor greenColor   =  new TinyColor(0xFF00FF00);
    TinyColor purpleColor   =  new TinyColor(0xFF00FFFF);
    TinyColor pinkColor   =  new TinyColor(0xFFFF00FF);
	TinyColor nColor   =  new TinyColor(0xFFFFFFFF);
	TinyColor positionColor   =  new TinyColor(0xFF0F0FFF);

	public String svgStr;
	String urlStr;
	int option;
	private Thread runner;
	public int displayMode;
	 public final static int  DISPLAY_MODE  = 0;
	 public final static int  POSITION_MODE  = 1;
	 public final static int  SEARCH_MODE  = 2;
	
	
    /* Contructor a new MIDPSVGCanvas */
    public ViewerCanvas(Display display)
    {
    	super(display);
    	displayMode = DISPLAY_MODE;
        width = getWidth();
        height = getHeight();

        // Creates the SVG raster
        TinyPixbuf      buffer = new TinyPixbuf(width, height);
        raster = new SVGRaster(buffer);
        imageProducer = new MIDPSVGImageProducer(raster);
        imageProducer.setConsumer(this);
        raster.setSVGImageProducer(imageProducer);

        SVGImageElem.setImageLoader(this);
        raster.setAntialiased(true);
        
        wait    = CampusGISMain.instance.wait;
        load = false;
    }

    /**
     * Delivers the pixels of the image. The pixel (px,py) is
     * stored in the pixels array at index (px * scansize + py + off).
     * @param x,&nbsp;y the coordinates of the upper-left corner of the
     *        area of pixels to be set
     * @param w the width of the area of pixels
     * @param h the height of the area of pixels
     * @see  ImageConsumer
     */
    public void newPixels(int x, int y, int w, int h)
    {
         repaint(x,y,w,h);
         // paint it now!
         serviceRepaints();
    }


    /**
     * Loads and dispalys an SVG document from the given URL.
     * @param url The SVG document URL.
     * @ see LinkWalker Interface
     */
        

	public void goURL()
    {
		connectSVG();
		SVGDocument document = loadSVG(svgStr);
		loadOption();
		drawLayer(document);
		raster.setSVGDocument(document);
		raster.setCamera();
		raster.update();
		raster.sendPixels();
		start();
    }

	public void start() {
		if (runner == null) {
			runner = new Thread(this);
			runner.start();
		}
	}

	public void stop() {
		runner = null;
	}
	
	public void run()
	{
		while(Thread.currentThread() == runner)
		  {
			System.out.println(displayMode);
			try
			{
				if(displayMode == POSITION_MODE)
				{
					CampusGISMain.instance.location.x+=CampusGISMain.instance.location.tmpX;
					CampusGISMain.instance.location.y+=CampusGISMain.instance.location.tmpY; 
					System.out.println("Position : "+CampusGISMain.instance.location.x+","+CampusGISMain.instance.location.y);
					 String svg = svgStr;
					 if(CampusGISMain.instance.showMyPosition.equals("Yes"))
						 svg = drawMyPosition(svg);
					 if(CampusGISMain.instance.showContactPosition.equals("Yes"))
						 svg = drawContactPosition(svg);
					 if(CampusGISMain.instance.showBusPosition.equals("Yes"))
						 svg = drawBusPosition(svg);
			//		 System.out.println(svg);
					 SVGDocument document = loadSVG(svg); 
					 drawLayer(document);
					 raster.setSVGDocument(document);
					 raster.setCamera();
					 raster.update();
					 raster.sendPixels();
				}
				else if(displayMode == SEARCH_MODE)
				{
					
				}
			}
			catch(Exception ex)
			{System.out.println(ex.getMessage());}
			
			 try {
					Thread.sleep(3000);
				} catch (InterruptedException e) {
				}
		  }
	}
	
	public SVGDocument drawLayer(SVGDocument document)
	{
		try
		{
			SVGSVGElem root = (SVGSVGElem)document.root;
		
			SVGNode mapNode = SVGNode.getNodeById(root, new TinyString("map".toCharArray()));

			if (mapNode == null)
			{
				System.out.println("Null Node");
				return null;
			}
			
			for (int k=0;k!=mapNode.children.count ;++k )
			{
				SVGNode node = (SVGNode)mapNode.children.data[k];
				if(displayMode == SEARCH_MODE)
				{
					String idStr = new String(node.id.data);
					if(idStr.equals(""+CampusGISMain.instance.searchLayerID))
					{
						String nearest = ""+CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearestID;
						String nearby[]=null;
						if(CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearbyID!=null)
						{
							nearby = new String[CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearbyID.length];
						}
						
						for (int i =0 ;i!=node.children.count ;++i )
						{
							if (k == 0)			
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,redColor);			
							else if(k == 1)
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,navyColor);	
							else if(k == 2)
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,yellowColor);
							else if(k == 3)
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,greenColor);
							else if(k == 4)
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,purpleColor);
							else if(k == 5)
							{
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_STROKE,pinkColor);
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,pinkColor);
							}
							else 
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,nColor);
							
							String currentid = new String(((SVGNode)node.children.data[i]).id.data);
							if(nearby!=null)
							{
								for(int j=0;j!=nearby.length;++j)
								{
									if(currentid.equals(nearby[j]))
										((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,new TinyColor(0x00000000));
								}
							}
							
							if(currentid.equals(nearest))
								((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,new TinyColor(0x00000000));
							
						}
					}
				}
				else
				{
					for (int i =0 ;i!=node.children.count ;++i )
					{
						if (k == 0)			
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,redColor);			
						else if(k == 1)
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,navyColor);	
						else if(k == 2)
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,yellowColor);
						else if(k == 3)
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,greenColor);
						else if(k == 4)
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,purpleColor);
						else if(k == 5)
						{
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_STROKE,pinkColor);
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,pinkColor);
						}
						else 
							((SVGNode)node.children.data[i]).setAttribute(SVG.ATT_FILL,nColor);
					}
				}
			}
			
			return document;
		}
		catch(Exception ex)
		{ 
			System.out.println(ex.toString());
			return null;
		}
	}
	
	String drawMyPosition(String svg)
    {
		 String position = "<circle cx='"+CampusGISMain.instance.location.x+"' cy='-"+CampusGISMain.instance.location.y+"' r='20' fill='red' stroke='yellow' stroke-width='10'  />"+
		 "\n<text  x='"+CampusGISMain.instance.location.x+"' y='-"+CampusGISMain.instance.location.y+"' style='text-anchor:middle;font-size:50;font-family:Arial' fill='rgb(0,0,255)'>"+CampusGISMain.instance.profile.username+"(My Position)</text>\n" +
		 "</svg>"; 
		 return svg.substring(0,svgStr.indexOf("</svg>"))+position;
    }
	
	String drawContactPosition(String svg)
    {
		StringBuffer position= new StringBuffer();
		if(CampusGISMain.instance.contacts != null)
		{
			
			for(int j=0;j!=CampusGISMain.instance.contacts.length;++j)
			{
					position.append("<circle cx='"+CampusGISMain.instance.contacts[j].getPosX()+"' cy='-"+CampusGISMain.instance.contacts[j].getPosY()+"' r='20' fill='yellow' stroke='red' stroke-width='10'  />"+
   				 	"\n<text  x='"+CampusGISMain.instance.contacts[j].getPosX()+"' y='-"+CampusGISMain.instance.contacts[j].getPosY()+"' style='text-anchor:middle;font-size:50;font-family:Arial' fill='rgb(0,0,255)'>"+CampusGISMain.instance.contacts[j].label+"</text>\n<"); 
			}
			position.append("/svg>");
			
			 return svg.substring(0,svg.indexOf("</svg>"))+position;
		}
		
		return svg;
    }
	
	String drawBusPosition(String svg)
    {
		StringBuffer position= new StringBuffer();
		if(CampusGISMain.instance.bus != null)
		{
			for(int j=0;j!=CampusGISMain.instance.bus.length;++j)
			{
				
				position.append("<circle cx='"+CampusGISMain.instance.bus[j].getPosX()+"' cy='-"+CampusGISMain.instance.bus[j].getPosY()+"' r='20' fill='yellow' stroke='red' stroke-width='10'  />"+
				 	"\n<text  x='"+CampusGISMain.instance.bus[j].getPosX()+"' y='-"+CampusGISMain.instance.bus[j].getPosY()+"' style='text-anchor:middle;font-size:50;font-family:Arial' fill='rgb(0,0,255)'>"+CampusGISMain.instance.bus[j].label+"</text>\n"); 
				
			}
			position.append("</svg>");
			
			 return svg.substring(0,svg.indexOf("</svg>"))+position;
		}
		return svg;

		
    }
	
	public void drawRecordPosition(String svg)
    {
		StringBuffer position= new StringBuffer();
		
		if(CampusGISMain.instance.myRecord != null && CampusGISMain.instance.myRecord.posx != null)
		{
			for(int j=0;j!=CampusGISMain.instance.myRecord.posx.length;++j)
			{
				System.out.println(CampusGISMain.instance.myRecord.posx[j]+","+CampusGISMain.instance.myRecord.posy[j]);
				position.append("<circle cx='"+CampusGISMain.instance.myRecord.posx[j]+"' cy='-"+CampusGISMain.instance.myRecord.posy[j]+"' r='20' fill='red' stroke='blue' stroke-width='10'  />\n");
			}
		}
		position.append("/svg>");
		
		 svg = svg.substring(0,svg.indexOf("</svg>"))+position;
		 SVGDocument document = loadSVG(svg); 
		 drawLayer(document);
		 raster.setSVGDocument(document);
		 raster.setCamera();
		 raster.update();
		 raster.sendPixels();
    }
	
	public void connectSVG()
	{
		load = true;
        ContentConnection c = null;
		FileConnection fc = null;
        InputStream is = null;
        Runtime.getRuntime().gc();
        try
        {
			if (option == LOAD_URL)
			{
				if (urlStr.startsWith("/"))
				{
					is = getClass().getResourceAsStream(urlStr);
				}
				else if (urlStr.startsWith("http:"))
				{
					c = (ContentConnection)Connector.open(urlStr);
					is = c.openInputStream();
					if(urlStr.endsWith("svgz"))
					{
						is = new GZIPInputStream(is);
					}
				}
			}
			else if(option == LOAD_FILE)
			{
				  fc = (FileConnection) Connector.open(urlStr);
				  if (!fc.exists()) 
				  {
					throw new IOException("File does not exists");
				  }
				  is = fc.openInputStream();
			}
			
			StringBuffer result = new StringBuffer();
	        byte[] b = new byte[4096];
	        int length ;
	        while((length = is.read(b, 0, 4096)) > 0)
	        {
			  result.append(new String(b,0,length));
	        }
	        svgStr =  result.toString();
        }
        catch( IOException ioe)
        {
            svgStr = null;
        }
        finally
        {
            try
            {
               if (is != null) is.close();
               if (c != null) c.close();
			   if (fc != null) fc.close();
            }
            catch( IOException ioe) {}
        }
        load = false;
	}
	
    public SVGDocument loadSVG(String svg)
    {
    	load = true;
    	repaint(0, height, getWidth(), MENU_HEIGHT);
    	SVGDocument doc = raster.createSVGDocument();
    	InputStream is = null;
    	try
    	{
    		byte[] xmlByteArray = svg.getBytes();
			is = new ByteArrayInputStream( xmlByteArray );
            TinyPixbuf pixbuf = raster.getPixelBuffer();
            SVGAttr attrParser = new SVGAttr(pixbuf.width, pixbuf.height);
            SVGParser parser = new SVGParser(attrParser);
            parser.load(doc,is);
    	}
    	catch(OutOfMemoryError memerror)
        {
            doc = null;
            Runtime.getRuntime().gc();
        }
        catch( Throwable thr)
        {
            doc = null;
        }
        finally
        {
        	try
            {
               if (is != null) is.close();
            }
            catch( IOException ioe) {}
        }
        load = false;
        return doc;
    }
	
    protected void paint(Graphics g)
    {
        // pixels
        if(!load)
        {
    		TinyPixbuf pixbuf = raster.getPixelBuffer();

              g.drawRGB(pixbuf.pixels32,
              0,
              pixbuf.width,
              0,
              0,
              pixbuf.width,
              pixbuf.height,
              false);

 /**/
          }
          else //if(load)
          {
             //draw the clock
             g.setColor(0xffffff);
             g.fillRect(0,0,width,height);
             g.setColor(0x000000);
             g.drawString("Wait ...", width/2, height/2,  Graphics.LEFT|Graphics.TOP);
             if(wait!=null)
             {
                g.drawImage(wait,0,height-MENU_HEIGHT,
                		 Graphics.TOP|Graphics.LEFT);
             }
          }
    }

  
  protected void keyRepeated(int keyCode)
  {
  //   keyPressed(keyCode);
  }
  protected void keyPressed(int keyCode)
  {
      if(load) return;
      int action = getGameAction(keyCode);
      switch (action)
      {
           case Canvas.LEFT:
                if(type == TYPE_PAN)
                  pan(-PAN_STEP,0);
                break;

           case Canvas.RIGHT:
                if(type == TYPE_PAN)
                  pan(PAN_STEP,0);
                break;

           case Canvas.UP:
                if(type == TYPE_PAN)
                  pan(0,-PAN_STEP);
                else if(type == TYPE_ZOOM)
                  zoom(0);
                break;
           case Canvas.DOWN:
                if(type == TYPE_PAN)
                  pan(0,PAN_STEP);
                else if(type == TYPE_ZOOM)
                  zoom(1);
                break;
           case Canvas.FIRE:
                break;
       } // end of switch
  }

  protected void pointerReleased(int x, int y)
  {
       if(load) return;
       if(type == TYPE_LINK)
       {
         //  pointerReleased(x,y);
       }
       else if(type == TYPE_PAN)
       {
           pan(pressedX - x,pressedY - y);
       }
  }

  protected void pointerPressed(int x, int y)
  {
       if(load) return;
       if(type == TYPE_PAN)
       {
          pressedX = x;
          pressedY = y;
          draggedX = pressedX;
          draggedY = pressedY;
       }
       else if(type == TYPE_LINK)
       {
           CampusGISMain.instance.ShowAlertPage("Position", "X = "+x+",Y = "+y);
        }
  }


  protected void pointerDragged(int x, int y)
  {
       if(load) return;
       if(type == TYPE_PAN)
       {
           draggedX = x;
           draggedY = y;
       }
  }

  public boolean zoom(int direction)
  {
      // zoom in '0' size / 2
      if(direction == 0)
      {
          zoomLevel--;
          if(zoomLevel < MIN_ZOOMLEVEL)
          {
             zoomLevel = MIN_ZOOMLEVEL;
             return false;
          }
      }
      else //zoom out size * 2
      {
          zoomLevel++;
          if(zoomLevel > MAX_ZOOMLEVEL)
          {
              zoomLevel = MAX_ZOOMLEVEL;
              return false;
          }
      }
      SVGRect newView = new SVGRect();
      SVGRect view = raster.view;
      int  midX = view.x + view.width/2;
      int  midY = view.y + view.height/2;
      // zoom in '0' size / 2
      if(direction == 0)
      {
          newView.width = (int)(view.width*(1-zoomScale));
          newView.height = (int)(view.height*(1-zoomScale));
      }
      else //zoom out size * 2
      {
          newView.width = (int)(view.width*(1+zoomScale) );
          newView.height = (int)(view.height*(1+zoomScale));
      }
      newView.x = midX - (newView.width) / 2;
      newView.y = midY - (newView.height) / 2;

      // Set a new current viewport
      view.x = newView.x;
      view.y = newView.y;
      view.width = newView.width;
      view.height = newView.height;

      update();
      // Change the camera transform according to the new current
      // viewport and update the raster
      raster.setCamera();
      raster.update();
      raster.sendPixels();

      return true;
  }

   /**
    *  Returns the current SVGT document to its original view.
    */
   public void origView()
   {
	   /*
       // Reset the zoom level
       zoomLevel = 0;

       // Set a new current viewport
       raster.view = new SVGRect(raster.origview);

       update();
       // Change the camera transform according to the new current
       // viewport and update the raster
       raster.setCamera();
       raster.update();
       raster.sendPixels();
   		*/
   }
   
   public void pan(int x , int y)
   {
      // Get the current viewport
      SVGRect view = raster.view;
      // Get the SVGT document
      SVGDocument doc = raster.getSVGDocument();
      // Get the root of the SVGT document
      SVGSVGElem root = (SVGSVGElem)doc.root;
      // Get the current scale value
      int scale = root.getCurrentScale();
      // Scale pan distances according to the current scale factor
      // Change the current viewport
      view.x += TinyUtil.div(x<<TinyUtil.FIX_BITS,scale);
      view.y += TinyUtil.div(y<<TinyUtil.FIX_BITS,scale);
      
      update();
      
      // Change the camera transform according to the new current
      // viewport and update the raster
      
    	  raster.setCamera();
          raster.update();
          raster.sendPixels();
      
   }
   
   public void rotate()
   {
	   TinyTransform transform = new TinyTransform();
	   transform.init(); 
   }
   
   private void update()
   {
	   CampusGISMain.instance.x = raster.view.x;
	   CampusGISMain.instance.y = raster.view.y;
	   CampusGISMain.instance.width = raster.view.width;
	   CampusGISMain.instance.height = raster.view.height;
	   CampusGISMain.instance.zoomLevel = zoomLevel;
   }
   
   private void loadOption()
   {
	   if(CampusGISMain.instance.saveState != -1)
	   {
		   raster.view.x = CampusGISMain.instance.x;
		   raster.view.y = CampusGISMain.instance.y;
		   raster.view.width = CampusGISMain.instance.width;
		   raster.view.height = CampusGISMain.instance.height; 
		   zoomLevel= CampusGISMain.instance.zoomLevel;
		   raster.setCamera();
	       raster.update();
	       raster.sendPixels();
	   }
   }
   
   public void findBuilding(String layerStr,String nameStr)
   {
	   //	 Get the SVGT document
      SVGDocument doc = raster.getSVGDocument();
      // Get the root of the SVGT document
      SVGSVGElem root = (SVGSVGElem)doc.root;
      
      SVGNode node = SVGSVGElem.getNodeById((SVGNode)root, new TinyString("map".toCharArray()));
      
      System.out.println(node.textAnchor);
   }

   
}
