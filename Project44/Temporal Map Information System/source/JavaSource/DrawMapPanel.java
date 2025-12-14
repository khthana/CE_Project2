/*
 * MapPanel.java
 *
 * Created on March 2, 2002, 9:06 PM
 */

//package GIS_v1;
import javax.swing.*;
import java.awt.*;
import java.awt.Dimension;
import java.awt.geom.*;
import java.util.Vector;

//Cache Class
import COM.intersys.objects.*;
import COM.intersys.objects.attribute.*;
import COM.intersys.util.SysList;
import COM.intersys.util.CacheException;

/**
 *
 * @author  n'ai'
 */
public class DrawMapPanel extends javax.swing.JPanel {

    /** Creates new form MapPanel */
    public DrawMapPanel() {
        initComponents();
        VillageAll=new Vector();
        VillageCond=new Vector();
        RoadAll=new Vector();
        RoadCond=new Vector();
	VillageAttribute=new Vector();
	RoadAttribute=new Vector();
	VAPaint=new Vector();
	RAPaint=new Vector();
	VAShow=new Vector();
	RAShow=new Vector();
    }

    public void paintComponent(Graphics g)
    {
        Graphics2D g2d=(Graphics2D) g;
        super.paintComponent  (g2d);
        maxx=0;
        maxy=0;
		//TestPoly(g2d);
		//TestLine(g2d);
        if (VillageAll.size()>0)
        {   
            PaintPoly(g2d,VillageAll,0); 
        } 
        if (VillageCond.size()>0)
        {   PaintPoly(g2d,VillageCond,1); }
        if (RoadAll.size()>0) 
        {   
            PaintLine(g2d,RoadAll,3); 
        }
        if (RoadCond.size()>0)
        {   PaintLine(g2d,RoadCond,4);
        }
//********************************************************
        System.out.println("PaintAttribute");
        PaintVillageAttribute(g2d);
        PaintRoadAttribute(g2d);
//********************************************************
        
        if (maxx>panelsize.width)
            panelsize.width=maxx;
        if (maxy>panelsize.height)
            panelsize.height=maxy;
        setPreferredSize(panelsize);
        revalidate();        
       
   }
   private void PaintLine(Graphics2D g2d,Vector RLine,int colorno)
   {
        RoadContainer rcontain;
        PointSet pset;
        ListOfDataTypes xp1,yp1,xp2,yp2;
        int xpoint1,ypoint1,xpoint2,ypoint2;
        g2d.setColor(colors[colorno]);
    try{
    for (int i=0;i<RLine.size();i++)
    {
        rcontain=(RoadContainer)RLine.elementAt(i);
        pset=rcontain.pointset;
        xp1=pset.getX1();
        yp1=pset.getY1();
        xp2=pset.getX2();
        yp2=pset.getY2();
        
        xpoint1=Integer.parseInt(xp1._getAt(1));
		ypoint1=Integer.parseInt(yp1._getAt(1));
        xpoint2=Integer.parseInt(xp2._getAt(1));
		ypoint2=Integer.parseInt(yp2._getAt(1));

        
        Line2D line=new Line2D.Double(xpoint1,ypoint1,xpoint2,ypoint2);
        g2d.draw(line);
            if ((xpoint1+10)>maxx)
                maxx=xpoint1+10;
            if ((ypoint1+10)>maxy)
                maxy=ypoint1+10;
        
        for (int r=2; r<=xp1._count(); r++)
        {
            xpoint1=Integer.parseInt(xp1._getAt(r));
            ypoint1=Integer.parseInt(yp1._getAt(r));
            xpoint2=Integer.parseInt(xp2._getAt(r));
            ypoint2=Integer.parseInt(yp2._getAt(r));
            line.setLine(xpoint1,ypoint1,xpoint2,ypoint2);
            g2d.draw(line);
 
            if ((xpoint1+10)>maxx)
                maxx=xpoint1+10;
            if ((ypoint1+10)>maxy)
                maxy=ypoint1+10;
        }
       }
    } catch (Exception ex) 
    {
	System.out.println( "PaintLine::Caught exception: " + ex.getClass().getName()
        + ": " + ex.getMessage() );
    }

   }

   private void TestLine(Graphics2D g2d)
   {
    g2d.setColor(colors[2]);
    Line2D line=new Line2D.Double(0,0,0,1);
    g2d.draw(line);
	for(int i=0;i<RX1.length;i++)
	{
  		for (int r =0; r<RX1[i].length; r++) 
        {
            line.setLine(RX1[i][r],RY1[i][r],RX2[i][r],RY2[i][r]);
            g2d.draw(line);
            if ((RX1[i][r]+10)>maxx)
                maxx=RX1[i][r]+10;
            if ((RX2[i][r]+10)>maxx)
                maxx=RX2[i][r]+10;
            if ((RY1[i][r]+10)>maxy)
                maxy=RY1[i][r]+10;
            if ((RY2[i][r]+10)>maxy)
                maxy=RY2[i][r]+10;
        }
	}
    }

   private void TestPoly(Graphics2D g2d)
   {
    GeneralPath poly=new GeneralPath();
    g2d.setColor(colors[0]);
	for(int i=0;i<VPointX.length;i++)
	{
        poly.moveTo(VPointX[i][0],VPointY[i][0]);
		for (int r =1; r<=VPointX[i].length-1; r++) 
        {
            poly.lineTo(VPointX[i][r],VPointY[i][r]);
            if ((VPointX[i][r]+10)>maxx)
                maxx=VPointX[i][r]+10;
            if ((VPointY[i][r]+10)>maxy)
                maxy=VPointY[i][r]+10;
        }
        poly.closePath();
        g2d.fill(poly);
        poly.reset();
	}
    }
   
   private void PaintPoly(Graphics2D g2d,Vector VPoly,int colorno)
   {
    GeneralPath poly=new GeneralPath();
    VillageContainer vcontain;
    PointSet pset;
    ListOfDataTypes xp,yp;
    int xpoint,ypoint;
    g2d.setColor(colors[colorno]);
    try{
    
    for (int i=0;i<VPoly.size();i++)
    {
        
        vcontain=(VillageContainer)VPoly.elementAt(i);
        pset=vcontain.pointset;
        xp=pset.getX1();
        yp=pset.getY1();
        System.out.println(Integer.toString(i)+" "+vcontain.Name);
        System.out.println("("+xp._getAt(1)+","+xp._getAt(1)+")");
        xpoint=Integer.parseInt(xp._getAt(1));
		ypoint=Integer.parseInt(yp._getAt(1));
        poly.moveTo(xpoint,ypoint);
            if ((xpoint+10)>maxx)
                maxx=xpoint+10;
            if ((ypoint+10)>maxy)
                maxy=ypoint+10;
        for(int r=2;r<=xp._count();r++)
        {
        System.out.println("("+xp._getAt(r)+","+xp._getAt(r)+")");
        xpoint=Integer.parseInt(xp._getAt(r));
		ypoint=Integer.parseInt(yp._getAt(r));
		poly.lineTo(xpoint,ypoint);
            if ((xpoint+10)>maxx)
                maxx=xpoint+10;
            if ((ypoint+10)>maxy)
                maxy=ypoint+10;
        }
        poly.closePath();
        g2d.fill(poly);
        poly.reset();
    }
        
    } catch (Exception ex) {
		System.out.println( "Caught exception: " + ex.getClass().getName()
                                                     + ": " + ex.getMessage() );
	}
   }
 /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
   private void initComponents() {//GEN-BEGIN:initComponents
       
       setLayout(null);
       
       setBackground(java.awt.Color.white);
   }//GEN-END:initComponents


   // Variables declaration - do not modify//GEN-BEGIN:variables
   // End of variables declaration//GEN-END:variables
    private final Color colors[] = {Color.red, Color.magenta, Color.pink, Color.blue, Color.cyan, Color.green};
    private final int color_n = colors.length;  
	private	int[][] RX1={{25,7},
				 {93,80,48,42},
				 {227,200,95,94,78,151},
			     {304,331,377,320,395},
				 {461,512},
				 {33,353,638},
				 {263,390,377,443},
				 {475,429,360,429,424}   };
	private int[][]	RX2={{7,0},
			  	 {80,48,42,57},
				 {200,95,94,59,151,214},
				 {331,377,378,395,413},
				 {512,679},
				 {353,638,678},
				 {390,377,443,488},
				 {429,360,338,424,346}   };
	private	int[][] RY1={{0,36},
				 {34,64,83,125},
				 {467,448,253,212,184,115},
				 {289,285,284,248,240},
				 {269,220},
				 {0,170,431},
				 {319,383,330,325},
				 {0,19,65,19,84}	    };
	private	int[][] RY2={{36,37},
				 {64,83,125,147},
				 {448,253,212,152,115,95},
				 {285,284,238,240,226},
				 {220,150},
				 {170,431,433},
				 {383,330,325,294},
				 {19,65,161,84,128}		};
	private	int[][] VPointX={{206,158,124,167,203},
					{325,291,283,248,254,291,291,331},
					{145,167,215,219,203},
					{114,103,105,146},
					{355,383,406,366,365},
					{444,403,442,489},
					{568,516,487,509,544,566},
					{565,541,521,548}
			       };
	private	int[][] VPointY={{132,118,148,182,203},
					 {162,160,158,160,211,202,195,198},
					 {337,376,376,366,333},
					 {300,325,358,358},
					 {123,118,99,77,97},
					 {85,107,131,114},
					 {211,232,254,277,256,283},
					 {283,312,316,337,306}
			        };
    private int maxx,maxy;
    
    public  Dimension panelsize= new Dimension(0,0);
    public Vector VillageAll,VillageCond,RoadAll,RoadCond;
 
//--------------------------------Show  Attribute Table-----------------------------------------------	
	public Vector VillageAttribute,RoadAttribute;
	public Vector VAShow,RAShow;
	private Vector VAPaint,RAPaint;
//--------------------------------End  Attribute Table-----------------------------------------------	
	private void PaintVillageAttribute(Graphics2D g2d)
	{
            VAPaint=new Vector();
            String val;
            int count=0;
            if (VAShow.size()>0)
            {
                System.out.println(VAShow.size());
                System.out.println("PaintVillageAttribute");
                 for(int i=0;i<VAShow.size() ;i++)
                {
                    System.out.print(i);
                    val=VAShow.elementAt(i).toString();
                    System.out.println(" = " + val);
                    if (val=="true")
                    {
                        System.out.println(i);
                        VAPaint.addElement(VillageAttribute.elementAt(i));
                        count++;
                    }
                }
                System.out.print("show count = ");
                System.out.println(count);
                if (count>0)
                {   PaintPoly(g2d,VAPaint,2);  }
            }
	}
        
	private void PaintRoadAttribute(Graphics2D g2d)
	{
            RAPaint=new Vector();
            String val;
            int count=0;
            if (RAShow.size()>0)
            {
                System.out.println("PaintRoadAttribute");
                for(int i=0;i<RAShow.size();i++)
                {
                    val=RAShow.elementAt(i).toString();
                    if (val=="true")
                    {
                        RAPaint.addElement(RoadAttribute.elementAt(i));
                        count++;
                    }
                }
                if (count>0)
                {   PaintLine(g2d,RAPaint,5);   }
            }
	}
}
