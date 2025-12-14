package stocktrade;

import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import java.applet.AppletContext;

public class Chart extends Applet {
//  private boolean isStandalone = false;
  // refer set parameter
    float x;float x2;float height;float width;float vals;float labs;
    int laboffset;int border;int xmax;float price_max;int xmin;float price_min;
    int i;int xcounter;float ycounter;
    float xfactor;float yfactor;float xincrement;float xincrement2;
    float v1y;float v1x;float v2y;float v2x;
    String v1;String v2;String title; boolean grid=true;
    int xfq;float yfq;float tp;float rp;
  /*//Get a parameter value
  public String getParameter(String key, String def) {
    return isStandalone ? System.getProperty(key, def) :
      (getParameter(key) != null ? getParameter(key) : def);
  }*/

  //Construct the applet
  public Chart() {
  }

  // refer Ggraphic for daraw graph
  public void paint(Graphics g){
       border = 40;
       draw();
       g.setFont(new Font("Arial", 0, 10));
       g.setColor(new Color(200, 200, 200));
       if(title != null)
           g.drawString(title, getSize().width / 2 - (title.length() * 3) / 2, 30);
       g.drawRect(0, 0, getSize().width - 1, getSize().height - 1);
       g.setColor(Color.black);
       g.drawLine((int)x, border, (int)x, (int)height + border);
       g.drawLine((int)(x - 3F), (int)height + border, (int)(width + x), (int)height + border);
       g.setColor(new Color(188, 179, 158));
       for(; ycounter <= price_max; ycounter = ycounter + yfq){
           String s = new String(String.valueOf(ycounter));
           g.drawString(s, (border + 10) - String.valueOf(price_max).length() * 5, Math.round(height * (1.0F - (float)(ycounter - price_min) / (float)(price_max - price_min))) + (border + 5));
           if(grid){
               g.setColor(new Color(188, 179, 158));
               g.drawLine((int)(x - 3F), Math.round(height * (1.0F - (float)(ycounter - price_min) / (float)(price_max - price_min))) + border, (int)(width + x), Math.round(height * (1.0F - (float)(ycounter - price_min) / (float)(price_max - price_min))) + border);
           }
           else
               g.drawLine((int)(x - 3F), Math.round(height * (1.0F - (float)(ycounter - price_min) / (float)(price_max - price_min))) + border, (int)x, Math.round(height * (1.0F - (float)(ycounter - price_min) / (float)(price_max - price_min))) + border);
       }
       for(; xcounter <= xmax; xcounter = xcounter + xfq){
               String s1 = new String(String.valueOf(xcounter));
               i = s1.length() * 3;
               g.drawString(s1, (int)((width - (float)Math.round(width * (1.0F - (float)(xcounter - xmin) / (float)(xmax - xmin)))) + (float)(int)x) - i, (int)height + (border + 18));
               g.drawLine((int)(width - (float)Math.round(width * (1.0F - (float)(xcounter - xmin) / (float)(xmax - xmin)))) + (int)x, (int)height + (border + 1), (int)(width - (float)Math.round(width * (1.0F - (float)(xcounter - xmin) / (float)(xmax - xmin)))) + (int)x, (int)height + (border + 3));
       }

       g.setColor(new Color( 77,77,177 ));
       if( vals != 1 )
       for(i = 1; i < (int)vals; i = i + 1){
         v1 = getParameter("VAL" + String.valueOf(i));
               v2 = getParameter("VAL" + String.valueOf(i + 1));
               v1x = Float.valueOf(v1.substring(0, v1.indexOf(":"))).floatValue();
               tp = v1x;
               tp = tp%100;
               System.out.println( v1x-tp );
               v1y = Float.valueOf(v1.substring(v1.indexOf(":") + 1, v1.length())).floatValue();
               v2x = Float.valueOf(v2.substring(0, v2.indexOf(":"))).floatValue();
               rp = v2x;
               rp = rp%100;
               v2y = Float.valueOf(v2.substring(v2.indexOf(":") + 1, v2.length())).floatValue();
                 g.drawLine((int)((float)Math.round( (v1x-tp-xmin+(tp*100/60)) * xfactor)+ x), (int)(height + (float)border) - Math.round((v1y - (float)price_min) * yfactor), (int)((float)Math.round( (v2x-rp-(float)xmin+(rp*100/60)) * xfactor)+x), (int)(height + (float)border) - Math.round((v2y - (float)price_min) * yfactor));

       }
 }
 // refer method get frequency
 public float getFrequency(float j){
   float a;

   if( j>=0 && j<=0.50 )
     a=0.10f;
   else a=j/5;
   return a;
  }

  // refer method draw
  public void draw(){
    setBackground(Color.white);

     x = 60;
     x2 = 60;
     title = getParameter("stock");
     System.out.println(title);

    try{
       price_min = Float.parseFloat( this.getParameter( "pricemin" ) );
     }
     catch(NumberFormatException _ex){
           price_min = 0.0f;
     }
     // refer get price max
     try{
       String m =  getParameter("pricemax");
          price_max = Float.valueOf( m ).floatValue();
     }
     catch(NumberFormatException _ex){
          price_max = 0.5f;
     }
     height = getSize().height - border * 2;
     width = (float)(getSize().width - (border + 5)) - x;
     yfq = getFrequency( price_max - price_min );
     ycounter = price_min;
     yfactor = height / (price_max - price_min);
     vals = Integer.parseInt(getParameter("NumberOfVals"));

     // refer set time in x axis
     xmax = 1700;
     xmin = 1000;
     xfactor = width / (float)(xmax - xmin);
     xfq = 100;//x frequency
     xcounter = xmin;
  }
}