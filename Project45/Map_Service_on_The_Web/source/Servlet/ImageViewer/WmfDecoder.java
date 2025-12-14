import sun.io.*;
/*
    Copyright (C) 1997,2001 Albrecht Kleine <kleine@ak.sax.de>
 
    version 0.6
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.
 
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */
import java.io.*;
import java.util.*;
import java.awt.*;
import java.awt.image.*;

// ----------- the WMF file interpreter ----------------------------------
//
class WmfDecoder implements ImageProducer {
	
    private boolean drawCross_if_error = true;
    private int minsize = 8;
    private int top = 0;
    private int left = 0;
    
    private int siz;
    private int obj;
    private int max;
    private int res = Toolkit.getDefaultToolkit().getScreenResolution();
    private int inch;
    private WmfDecObj gdiObj[];
    private Stack DCstack;
    private int rgbPixels[] = null;
    private short params[];
    private Frame fr;
    private InputStream in;
    private ColorModel cmodel = ColorModel.getRGBdefault();
    private boolean err = false;
    private boolean producing = false;
    private Vector consumers = new Vector();
    private Dimension di;
    private Dimension org_di;
    
       
	private boolean head = true;


	
    // constructor
    public WmfDecoder(InputStream is) {
        in=is;
        di = new Dimension(320, 240);
    }
    // constructor
    public WmfDecoder(InputStream is, Dimension d) {
        in=is;
        di = d;
        org_di = d;

    
    }
    // constructor
    // di_old for file which haven't header
    public WmfDecoder(InputStream is, Dimension org, Dimension d) {
        in=is;
        di = d;
        org_di = org;
    }
    private int add_handle(WmfDecObj x) {
        int i;
        for (i = 0; i < obj; i++)
            if (gdiObj[i] == null) {
                gdiObj[i] = x;
                return i;
            }
        return -1;
    }
    // -------- methods that implement ImageProducer -----------------------
    public void addConsumer(ImageConsumer ic) {
        if (ic != null && !isConsumer(ic))
            consumers.addElement(ic);
    }
    private int arcus(int ank,int geg) {
        int val=-(int) (Math.atan((float)(geg)/
        (float)(ank)) * 180/Math.PI); // div 0.0 is "inf"
        if (ank<0)
            val+=180;
        else
            if (geg>=0)
                val+=360;
        return val;
    }
    private boolean chkHeader() throws IOException {
        int i; 
        int j;
        int width=0;
        int height=0;
        int sum = 0;
        int hdr[] = { -12841, -25914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 9, 0x300 };
        
        for (i = 0; i < 14; i++) {
            j = readInt16(in);
            sum ^= j;
            if ((i < 3 || i > 7)) {
                if (j != hdr[i])
                    if ((i += 11) == 11 && j == hdr[11]) // no first header present
                    {
	                 	left = 0;
	                 	top = 0;
                        continue;
                    }
                    else
                        return true; // error
            } else
                switch (i) {
                    case 3 :
                        left = j;
                        break;
                    case 4 :
                        top = j;
                        break;
                    case 5 :
                        width = j;
                        break;
                    case 6 :
                        height = j;
                        break;
                    case 7 :
                        hdr[10] = sum; // store checksum
                        inch = j;
                        org_di.width = ((width - left) * res) / inch;
						org_di.height = ((height - top) * res) / inch;
                        break;
                }
        }

        siz = readInt32(in);
        obj = readInt16(in);
        max = readInt32(in);
        readInt16(in); // unused
        
        return false;
    }
    // ----------- called by META_STRETCHDIB ----------- (1, 4, 8 bpp only, no RLE) --------
    private Image DIBBitmapImage(int off,short params[],Component comp) {
        int width=params[off+2];
        int height=params[off+4];
        int size=width*height;
        int bpp=params[off+7];
        int colors,i,j,k,l,m,x=0,startbitmap;
        if (params[off+0]!=40 || params[off+1]!=0) {
            //System.out.println("unsupported data format");
            return null;
        }
        if (params[off+6]!=1) {
            //System.out.println("not supported: planes="+params[off+17]);
            return null;
        }
        if (bpp != 4 && bpp != 8 && bpp != 1) {
            //System.out.println("not supported: "+ bpp +" bits per pixel");
            return null;
        }
        if (params[off+8]!=0 || params[off+9]!=0) {
            //System.out.println("not supported: RLE-compression");
            return null;
        }
        
        colors = params[off+16]!=0 ? params[off+16] : (1 << bpp);
        int palette[]=new int[colors];
        for (i=0;i<colors;i++)			// palette data starts at params[off+20]
        {
            x=params[off+21+2*i];			// range = 0...255
            palette[i]=x<<16;
            x=getHiByteVal(params[off+20+2*i]);
            palette[i]+=x<<8;
            x=getLoByteVal(params[off+20+2*i]);
            palette[i]+=x;
            palette[i]-=0x1000000;   		// add bit_pattern (unsigned)0xFF000000 (for alpha)
        }
        
        startbitmap=20+off+2*colors;		// beginning after header+palette data
        int pixels[] = new int[size];
        switch (bpp) {
            case 1:
                for (k=height-1,i=0;k>=0;k--)
                    for (l=0;l<width;l+=16) {
                        i++;
                        m=params[i-1+startbitmap];
                        if (m<0) m+=65536;
                        for (j=0,m =(m>>8)|(m<<8); j+l< width && j<16;j++) {
                            pixels[k*width+l+j]= (m&0x8000)==0 ? -0x1000000:-0x1;
                            m<<=1;
                        }
                        if (i%2!=0)
                            i++;
                    }
                break;
                
            case 4:
                for (k=height-1,i=0;k>=0;k--)
                    for (l=0;l<width;l++) {
                        switch (l%4) {
                            case 0:i++;
                            x=getLoByteVal(params[i-1+startbitmap]) >>>4;break;
                            case 1:x=getLoByteVal(params[i-1+startbitmap]) &0xf;break;
                            case 2:x=getHiByteVal(params[i-1+startbitmap]) >>>4;break;
                            case 3:x=getHiByteVal(params[i-1+startbitmap]) &0xf;break;
                        }
                        pixels[k*width+l]=palette[x];
                    }
                break;
                
            case 8:
                for (k=height-1,i=0;k>=0;k--) {
                    for (l=0;l<width;l++) {
                        switch (l%2) {
                            case 0:i++;
                            x=getLoByteVal(params[i-1+startbitmap]);break;
                            case 1:x=getHiByteVal(params[i-1+startbitmap]);break;
                        }
                        pixels[k*width+l]=palette[x];
                    }
                    if (i%2!=0)
                        i++;
                }
                break;
        }
        Image im = comp.createImage(new MemoryImageSource(width, height, pixels, 0, width));
        pixels=null;
        return im;
    }
    private void drawOpaqePattern(Graphics g,Image im,int x1,int y1,int x2,int y2,ImageObserver fr) {
        // it's just a little bit tricky ;-)
        // subsequent calls to clipRect allow only to make the clip-region smaller
        // ... but not to set it to a different location that was not covered by the
        // ... current clipping region. So we have to create a new graphics, g2
        int width=x2-x1;
        int height=y2-y1;
        int i,j;
        Graphics g2=g.create(x1-x1%8,y1-y1%8,width+8,height+8);
        g2.clipRect(x1%8,y1%8,width,height);
        for (i=0;i<width+1;i+=8)
            for (j=0 ;j<height+1;j+=8)
                g2.drawImage(im,i,j,fr);
        g2.dispose();
    }
    private int getHiByteVal(int hhh) {
        byte b;
        if (hhh>0)
            b=(byte)(hhh/256);
        else {
            int iii=~hhh;
            b=(byte)(iii>>>8);
            b=(byte)((byte)255-b);
        }
        return b<0 ? (int)b+256 :b;
    }
    private int getLoByteVal(int hhh) {
        byte b;
        if (hhh>0)
            b=(byte)(hhh%256);
        else {
            int iii=~hhh;
            b=(byte)(iii&0xff);
            b=(byte)((byte)255-b);
        }
        return b<0 ? (int)b+256 :b;
    }
    public boolean isConsumer(ImageConsumer ic) {
        return consumers.contains(ic);
    }
    // ----------- called by META_STRETCHBLT ----------- (here monochrome only) --------
    private Image OldBitmapImage(int off,short params[],Component comp) {
        int width=params[off];
        int height=params[off+1];
        int i,j,k,l,m;
        if ((params[off+3]!=1) || (params[off+4] != 1)) {
            //System.out.println("sorry, the only supported format is: planes=1,bpp=1");
            return null;
        }
        int pixels[] = new int[width*height];
        for (k=0,i=0;k<height;k++)
            for (l=0;l<width;l+=16) {
                m=params[off+5+i++];
                if (m<0) m+=65536;
                for (j=0,m =(m>>8)|(m<<8); j+l< width && j<16;j++) {
                    pixels[k*width+l+j]= (m&0x8000)==0 ? -0x1000000:-0x1;
                    m<<=1;
                }
            }
        Image im = comp.createImage(new MemoryImageSource(width, height, pixels, 0, width));
        pixels=null;
        return im;
    }
    /*private static void PrintObserverStatus(String text,int status) {
        System.out.print(text);
        if ((status & 0x80)>0 )  System.out.print("ABORT ");
        if ((status & 0x40)>0 )  System.out.print("ERROR ");
        if ((status & 0x20)>0 )  System.out.print("ALLBITS ");
        if ((status & 0x10)>0 )  System.out.print("FRAMEBITS ");
        if ((status & 0x08)>0 )  System.out.print("SOMEBITS ");
        if ((status & 0x04)>0 )  System.out.print("PROPERTIES ");
        if ((status & 0x02)>0 )  System.out.print("HEIGHT ");
        if ((status & 0x01)>0 )  System.out.print("WIDTH ");
        System.out.println("");
    }*/
    private short readInt16(InputStream in) throws IOException {
        int ch1 = in.read();
        int ch2 = in.read();
        if ((ch1 | ch2 ) < 0)
            throw new EOFException();
        return (short)((ch2 << 8) + (ch1 << 0));
    }
    private int readInt32(InputStream in) throws IOException {
        int ch1 = in.read();
        int ch2 = in.read();
        int ch3 = in.read();
        int ch4 = in.read();
        if ((ch1 | ch2 | ch3 | ch4) < 0)
            throw new EOFException();
        return (ch4 << 24) + (ch3 << 16) + (ch2 << 8) + (ch1 << 0);
    }
private boolean readRecord(InputStream in) {
    int i, j, rdSize, rdFunc;
    int a, b, c, d, e, f, k, l, m, n;
    Color crco;
    Font fo;
    Image im;
    WmfDecDC DC = (WmfDecDC) DCstack.peek();
    Graphics g = DC.getGr();

    boolean error;
    int xpoints[], ypoints[];
    byte text[];
    String s;
    Object ob;
    Graphics g2;

    try {
        rdSize = readInt32(in);
        rdFunc = readInt16(in);
        for (i = 0; i < rdSize - 3; i++)
            params[i] = readInt16(in);
    } catch (IOException ex) {
        return false;
    }
    switch (rdFunc) {
        case Wmf.META_LINETO :
            //System.out.println("META_LINETO");

            g.setColor(DC.getAktpen().getColor());
            a = DC.ytransfer(params[0]);
            b = DC.xtransfer(params[1]);
            g.drawLine(DC.getAktXpos(), DC.getAktYpos(), b, a);
            DC.setAktXpos(b);
            DC.setAktYpos(a);
            //System.out.println(a);
            //System.out.println(b);

            break;

        case Wmf.META_MOVETO :
            //System.out.println("META_MOVETO");
            DC.setAktYpos(DC.ytransfer(params[0]));
            DC.setAktXpos(DC.xtransfer(params[1]));

            //System.out.println(DC.aktYpos);
            //System.out.println(DC.aktXpos);

            break;

        case Wmf.META_ROUNDRECT :
            //System.out.println("META_ROUNDRECT");
            e = transform(params[0], minsize);
            f = transform(params[1], minsize);
            a = DC.ytransfer(params[2]);
            b = DC.xtransfer(params[3]);
            c = DC.ytransfer(params[4]);
            d = DC.xtransfer(params[5]);
            if (a < c && b < d) {
                i = a;
                a = c;
                c = i;
                i = b;
                b = d;
                d = i;
            }

            // FIXME: draw_round_rect_Pattern if needed
            g.setColor(DC.getAktbrushColor());
            g.fillRoundRect(d, c, b - d - 1, a - c - 1, f, e);
            g.setColor(DC.getAktpenColor());
            g.drawRoundRect(d, c, b - d - 1, a - c - 1, f, e);

            //System.out.println(a);
            //System.out.println(b);
            //System.out.println(c);
            //System.out.println(d);
            break;

        case Wmf.META_RECTANGLE :
            //System.out.println("META_RECTANGLE");

            a = DC.ytransfer(params[0]);
            b = DC.xtransfer(params[1]);
            c = DC.ytransfer(params[2]);
            d = DC.xtransfer(params[3]);
            if (a < c && b < d) {
                i = a;
                a = c;
                c = i;
                i = b;
                b = d;
                d = i;
            }
            if (DC.getAktbrushImage() != null)
                drawOpaqePattern(g, DC.getAktbrushImage(), d, c, b, a, fr);
            else {
                g.setColor(DC.getAktbrushColor());
                g.fillRect(d, c, b - d - 1, a - c - 1);
            }
            g.setColor(DC.getAktpenColor());
            g.drawRect(d, c, b - d - 1, a - c - 1);

            //System.out.println(a);
            //System.out.println(b);
            //System.out.println(c);
            //System.out.println(d);

            break;

        case Wmf.META_SETPIXEL :
            //System.out.println("META_SETPIXEL");

            crco =
                new Color(
                    getLoByteVal(params[0]),
                    getHiByteVal(params[0]),
                    getLoByteVal(params[1]));

            g.setColor(crco);
            crco = null;
            a = DC.xtransfer(params[3]);
            b = DC.ytransfer(params[2]);
            g.drawLine(a, b, a, b);

            //System.out.println( getLoByteVal(params[0]) + ":" + getHiByteVal(params[0]) + ":" + getLoByteVal(params[1]) );
            //System.out.println(a);
            //System.out.println(b);
            break;

        case Wmf.META_POLYLINE :

        case Wmf.META_POLYGON :
            xpoints = new int[params[0]];
            ypoints = new int[params[0]];
            for (i = 0; i < params[0]; i++) {
                xpoints[i] = DC.xtransfer(params[i * 2 + 1]);
                ypoints[i] = DC.ytransfer(params[i * 2 + 2]);
                //System.out.println(xpoints[i]);
                //System.out.println(ypoints[i]);
            }

            if (rdFunc == Wmf.META_POLYGON) {
                //System.out.println("META_POLYGON");
                g.setColor(DC.getAktbrushColor());
                g.fillPolygon((int[]) xpoints, (int[]) ypoints, params[0]);
            }// else
                //System.out.println("META_POLYLINE");

            g.setColor(DC.getAktpenColor());
            g.drawPolygon((int[]) xpoints, (int[]) ypoints, params[0]);
            xpoints = null;
            ypoints = null;
            break;

        case Wmf.META_POLYPOLYGON :
            //System.out.println("META_POLYPOLYGON");
            for (i = 0; i < params[0]; i++) {
                xpoints = new int[params[i + 1]];
                ypoints = new int[params[i + 1]];
                b = params[0] + 1; // first point of first polygon
                for (c = 0; c < i; c++)
                    b += params[c + 1] * 2; // add size of polygons before

                for (a = 0; a < params[i + 1]; a++) {
                    xpoints[a] = DC.xtransfer(params[b + a * 2]);
                    ypoints[a] = DC.ytransfer(params[b + a * 2 + 1]);
                }
                g.setColor(DC.getAktbrushColor());
                g.drawPolygon((int[]) xpoints, (int[]) ypoints, params[i + 1]);
            }
            break;

        case Wmf.META_ELLIPSE :
            //System.out.println("META_ELLIPSE");
            a = DC.ytransfer(params[0]);
            b = DC.xtransfer(params[1]);
            c = DC.ytransfer(params[2]);
            d = DC.xtransfer(params[3]);
            g.setColor(DC.getAktpenColor());
            g.drawOval(d, c, b - d, a - c);
            g.setColor(DC.getAktbrushColor());
            g.fillOval(d, c, b - d, a - c);
            break;

        case Wmf.META_ARC :
        case Wmf.META_PIE :
        case Wmf.META_CHORD :
            a = DC.ytransfer(params[0]);
            b = DC.xtransfer(params[1]); // Yend;Xend;
            c = DC.ytransfer(params[2]);
            d = DC.xtransfer(params[3]); // Ystart;Xstart;
            e = DC.ytransfer(params[4]);
            f = DC.xtransfer(params[5]); // Ybuttom;Xright;
            k = DC.ytransfer(params[6]);
            l = DC.xtransfer(params[7]); // Ytop;Xleft

            g.setColor(DC.getAktpenColor());
            int xm = l + (f - l) / 2;
            int ym = k + (e - k) / 2;
            if (rdFunc == Wmf.META_PIE) {
                //System.out.println("META_ELLIPSE");
                g.drawLine(d, c, xm, ym);
                g.drawLine(b, a, xm, ym);
            } else
                if (rdFunc == Wmf.META_CHORD) {
                    //System.out.println("META_CHORD");
                    g.drawLine(d, c, b, a);
                } //else
                    //System.out.println("META_ARC");

            int beg = arcus(d - xm, c - ym);
            int arc = arcus(b - xm, a - ym) - beg;
            if (arc < 0)
                arc += 360;
            g.drawArc(l, k, f - l, e - k, beg, arc);
            // FIXME: fill arc etc with selected brush  Sat May 17 19:02:27 1997
            break;

        case Wmf.META_DELETEOBJECT :
            //System.out.println("META_DELETEOBJECT\t" + params[0]);
            gdiObj[params[0]] = null;
            break;

        case Wmf.META_SELECTPALETTE :
            //System.out.println("META_SELECTPALETTE");
            if (gdiObj[params[0]].getMagic() == Wmf.M_PALETTE)
                DC.setAktpal(gdiObj[params[0]]);
            //else
            //    System.out.println(" ---- internal ERROR in MetaSelectPalette -----");
            break;

        case Wmf.META_SELECTCLIPREGION :
            //System.out.println("META_SELECTCLIPREGION");

            if (gdiObj[params[0]].getMagic() == Wmf.M_CLIP) {
                DC.setAktclip(gdiObj[params[0]]);
                g.clipRect(
                    DC.getAktclipRectX(),
                    DC.getAktclipRectY(),
                    DC.getAktclipRectWidth(),
                    DC.getAktclipRectHeight());

            } //else
            //    System.out.println(" ---- internal ERROR in MetaSelectClipregion -----");
            break;

        case Wmf.META_SELECTOBJECT :
            //System.out.println("META_SELECTOBJECT\t" + params[0]);
            switch (gdiObj[params[0]].getMagic()) {
                case Wmf.M_PEN :
                    DC.setAktpen(gdiObj[params[0]]);
                    break;
                case Wmf.M_FONT :
                    DC.setAktfont(gdiObj[params[0]]);
                    break;
                case Wmf.M_BRUSH :
                    DC.setAktbrush(gdiObj[params[0]]);
                    break;
                case Wmf.M_PALETTE : // a kind of dummy
                    DC.setAktpal(gdiObj[params[0]]);
                    break;
                case Wmf.M_BITMAP : // another one...
                    DC.setAktbmp(gdiObj[params[0]]);
                    break;
                case Wmf.M_CLIP :
                    DC.setAktclip(gdiObj[params[0]]);
                   	g.clipRect(
                    	DC.getAktclipRectX(),
                    	DC.getAktclipRectY(),
                    	DC.getAktclipRectWidth(),
                    	DC.getAktclipRectHeight());
                    break;
            }
            break;

        case Wmf.META_CREATEPENINDIRECT :
            //System.out.println("META_CREATEPENINDIRECT");
            error = false;
            switch (params[0]) {
                case Wmf.PS_NULL :
                    crco = null;
                    //ex DC.aktbackgnd;
                    // FIXME: have to test all  DC.akt{pen|brush}.getColor()
                    // if  color equals null, do NOT paint,draw,fill etc!! Sat May 17 19:23:45 1997
                    break;
                case Wmf.PS_DASH :
                case Wmf.PS_DOT :
                case Wmf.PS_DASHDOT :
                case Wmf.PS_DASHDOTDOT :
                case Wmf.PS_INSIDEFRAME :
                case Wmf.PS_SOLID :
                    crco =
                        new Color(
                            getLoByteVal(params[3]),
                            getHiByteVal(params[3]),
                            getLoByteVal(params[4]));
                    break;
                default :
                    crco = Color.black;
                    error = true;
                    break;
            }
            if (!error) {
                add_handle(new WmfDecObj(params[0], crco));
                crco = null;
                a = params[1];
                b = params[2];
            }
            break;

        case Wmf.META_CREATEBRUSHINDIRECT :
            //System.out.println("META_CREATEBRUSHINDIRECT");
            switch (params[0]) {
                case Wmf.BS_SOLID :
                    crco =
                        new Color(
                            getLoByteVal(params[1]),
                            getHiByteVal(params[1]),
                            getLoByteVal(params[2]));
                    add_handle(new WmfDecObj(crco, Wmf.M_BRUSH));
                    crco = null;
                    break;
                case Wmf.BS_HOLLOW :
                    crco = DC.getAktbackgnd();
                    add_handle(new WmfDecObj(crco, Wmf.M_BRUSH));
                    break;

                case Wmf.BS_HATCHED :
                    crco =
                        new Color(
                            getLoByteVal(params[1]),
                            getHiByteVal(params[1]),
                            getLoByteVal(params[2]));

                    add_handle(new WmfDecObj((int) params[3], crco, DC.getAktbackgnd(), fr));
                    crco = null;
                    break;

                case Wmf.BS_PATTERN :
                case Wmf.BS_INDEXED :
                case Wmf.BS_DIBPATTERN :
                    // FIXME: replace workaround
                    crco = Color.gray;
                    add_handle(new WmfDecObj(crco, Wmf.M_BRUSH));
                    break;

                default :

                    }
            break;

        case Wmf.META_CREATEREGION :
            //System.out.println("META_CREATEREGION");
            add_handle(
                new WmfDecObj(
                    DC.xtransfer(params[7]),
                    DC.ytransfer(params[8]),
                    DC.xtransfer(params[9]),
                    DC.xtransfer(params[10])));
            // awt supports only rectangle clipping, currently other data ignored
            // FIXME: fake oval or other regions
            break;

        case Wmf.META_INTERSECTCLIPRECT :
            //System.out.println("META_INTERSECTCLIPRECT");
            n = DC.ytransfer(params[0]);
            m = DC.xtransfer(params[1]);
            l = DC.ytransfer(params[2]);
            k = DC.xtransfer(params[3]);
            g.clipRect(k, l, m - k, n - l);
            break;

        case Wmf.META_CREATEFONTINDIRECT :

            //System.out.println("META_CREATEFONTINDIRECT");
            text = new byte[80];
            for (j = i = 0; i < rdSize - 3 - 9; i++) // 9 starts FontName, 3 for overhead
                {
                if ((text[2 * i] = (byte) getLoByteVal(params[i + 9])) == 0)
                    break;
                else
                    j++;
                if ((text[2 * i + 1] = (byte) getHiByteVal(params[i + 9])) == 0)
                    break;
                else
                    j++;
            }
            s = new String(text, 0, j);
            if (s.startsWith("Times")) // may be: "Times New Roman";
                s = "TimesRoman";
            else
                if (s.startsWith("Arial"))
                    s = "Helvetica";
                else
                    if (s.startsWith("Courier"))
                        s = "Courier";
                    else
                        if (s.startsWith("MS")) // may be: "MS Sans Serif"
                            s = "Dialog";
                        else
                            if (s.startsWith("WingDings"))
                                s = "ZapfDingbats";

            b = params[1]; // width
            c = params[2];
            d = params[3]; // esc, ori
            e = params[4];
            f = params[5]; // height, ita+underl
            k = params[6];
            l = params[7]; // str+cha, out+clip
            i = params[8]; // pitch
            //a = transform(params[0], minsize);
            a = params[0];
            fo = new Font( s, (e > 500 ? Font.BOLD : Font.PLAIN) + (getLoByteVal(f) > 0 ? Font.ITALIC : 0),  a);
            

            add_handle(new WmfDecObj(fo, getHiByteVal(f), d));
            fo = null;
            text = null;
            /*
            System.out.println("Font = " + s);
            System.out.println("a size= " + a);
            System.out.println("a size= " + params[0]);
            System.out.println("b width = " + b);
            System.out.println("c = " + c);
            System.out.println("d esc = " + getHiByteVal(d));
            System.out.println("e  = " + e);
            System.out.println("f height = " + getHiByteVal(f));
            System.out.println("k = " + k);
            System.out.println("l str = " + getHiByteVal(l));
            System.out.println("i pitch = " + i);
*/
            break;

        case Wmf.META_CREATEPALETTE :
            //System.out.println("META_CREATEPALETTE");
            crco = Color.black;
            add_handle(new WmfDecObj(crco, Wmf.M_PALETTE));
            break;

        case Wmf.META_REALIZEPALETTE :
            //System.out.println("META_REALIZEPALETTE");
            break;

        case Wmf.META_SETROP2 :
            //System.out.println("META_SETROP2");
            break;

        case Wmf.META_SETPOLYFILLMODE :
            //System.out.println("META_SETPOLYFILLMODE");
            break;

        case Wmf.META_SETSTRETCHBLTMODE :
            //System.out.println("META_SETSTRETCHBLTMODE");
            break;

        case Wmf.META_INVERTREGION :
            //System.out.println("META_INVERTREGION");
            break;

        case Wmf.META_SETWINDOWEXT :
            //System.out.print("META_SETWINDOWEXT");
            //System.out.println("\tY=" + params[0] + "\tX=" + params[1]);
            DC.setWinextY(params[0]);
            DC.setWinextX(params[1]);
            break;

        case Wmf.META_SETWINDOWORG :
            //System.out.print("META_SETWINDOWORG");
            //System.out.println("\tY=" + params[0] + "\tX=" + params[1]);
            DC.setWinorgY(params[0]);
            DC.setWinorgX(params[1]);
            break;

        case Wmf.META_SETTEXTCOLOR :
            //System.out.println("META_SETTEXTCOLOR");
            DC.setAkttextc(
                new Color(
                    getLoByteVal(params[0]),
                    getHiByteVal(params[0]),
                    getLoByteVal(params[1])));
            break;

        case Wmf.META_EXTTEXTOUT :
        case Wmf.META_TEXTOUT :
        
            if (rdFunc == Wmf.META_EXTTEXTOUT) {
                //System.out.println("META_EXTTEXTOUT");
                a = params[2]; // text length
                b = DC.ytransfer(params[0]);
                c = DC.xtransfer(params[1]);
                d = params[3]; // option
                k = DC.xtransfer(params[4]);
                l = DC.ytransfer(params[5]);
                m = DC.xtransfer(params[6]);
                n = DC.ytransfer(params[7]);
                e = d == 0 ? 3 : 7; // start of text
            } else {
                //System.out.println("META_TEXTOUT");
                a = params[0]; //text length
                b = DC.ytransfer(params[(a + 1) / 2 + 1]);
                c = DC.xtransfer(params[(a + 1) / 2 + 2]);
                d = e = 0;
                k = l = m = n = 0;
            }
            // ------- handle ETO_... flags
            if ((d & Wmf.ETO_OPAQUE) != 0) {
                g.setColor(DC.getAktbackgnd()); // for testing purpose: .... ,Color.green);
                g.fillRect(k, l, m - k - 1, n - l - 1);
            }
            //
            if ((d & Wmf.ETO_GRAYED) != 0)
                g.setColor(Color.lightGray);
            else
                g.setColor(DC.getAkttextc());
            //
            if ((d & Wmf.ETO_CLIPPED) != 0) {
                g2 = g.create();
                g2.clipRect(k, l, m - k - 1, n - l - 1);
                // FIXME: intersect with original clip rect
                g = g2;
            } else
                g2 = null;
            // ------------------
            g.setFont(DC.getAktFont());
            FontMetrics fm = g.getFontMetrics();
			//ByteToCharUnicode convert = new ByteToCharUnicode();
			
            text = new byte[a];
            for (i = 0; i < a; i++)
            {
                if (i % 2 == 0)
                    text[i] = (byte) getLoByteVal(params[e + i / 2 + 1]);
                else
                    text[i] = (byte) getHiByteVal(params[e + i / 2 + 1]);
            }

            try
            {
            	//char chs[] = convert.convertAll(text);
            	s = new String(text,"CP874");
			}
            /*catch(MalformedInputException mlinex)
            {
	            s = "";
	        }*/
            catch(UnsupportedEncodingException unenex)
            {
	            s = "";
	        }
            
/*
            System.out.println("String = " + s );
            System.out.println("x = " + params[(a + 1) / 2 + 1] );
            System.out.println("y = " + params[(a + 1) / 2 + 2] );

            System.out.println("a = " + a );
            System.out.println("b = " + b );
            System.out.println("c = " + c );
  */          
            // ---- draw text ---
            if (DC.getAktFontOri() == 0) {
                if (DC.getAkttextalign() == Wmf.TA_TOP)
                    b += DC.getAktFont().getSize();
                g.drawString(s, c, b);
                if (DC.getAktfont().isUnderlined())
                    g.drawLine(c, b + 2, c + fm.stringWidth(s), b + 2);
            }
            // ------------------
            
            text = null;
            if (g2 != null)
                g2.dispose();
            break;

        case Wmf.META_SETMAPMODE :
            //System.out.print("META_SETMAPMODE " + rdSize);
            //System.out.println(
            //    "\t0="
            //        + params[0]
            //        + "\t1="
            //        + params[1]
            //        + "\t2="
            //        + params[2]
            //        + "\t3="
            //        + params[3]);
            break;

        case Wmf.META_SETBKCOLOR :
            //System.out.print("META_SETBKCOLOR ");
            //System.out.println(
            //    "\tR="
            //        + getLoByteVal(params[0])
            //        + "\tG="
            //        + getHiByteVal(params[0])
            //        + "\tB="
            //        + getLoByteVal(params[1]));
            DC.setAktbackgnd(
                new Color(
                    getLoByteVal(params[0]),
                    getHiByteVal(params[0]),
                    getLoByteVal(params[1])));
            break;

        case Wmf.META_SETTEXTJUSTIFICATION :
            //System.out.println("META_SETTEXTJUSTIFICATION");
            break;

        case Wmf.META_SETBKMODE :
            //System.out.println("META_SETBKMODE");
            break;

        case Wmf.META_SETTEXTALIGN :
            //System.out.println("META_SETTEXTALIGN");
            DC.setAkttextalign(params[0]);
            break;

        case Wmf.META_SAVEDC :
            //System.out.print("META_SAVEDC\t");
            //System.out.print(DCstack.capacity() / 10);
            try {
                DC = (WmfDecDC) DCstack.push(DC.clone());

                //DC.slevel++;
                //System.out.println(DC.slevel);

                DC.setGr(g.create());
            } catch (Exception ex) {}
            /*System.out.println(
                "\tOrgX="
                    + DC.getWinorgX()
                    + "\tOrgY="
                    + DC.getWinorgY()
                    + "\tExtX="
                    + DC.getWinextX()
                    + "\tExtY="
                    + DC.getWinextY());
                    */
            break;

        case Wmf.META_RESTOREDC :
            //System.out.print("META_RESTOREDC\t");
            //System.out.println(params[0]);
            //System.out.println(DC.slevel);
            //System.out.println(DCstack.capacity());
            switch (params[0]) {
                case -1 :
                    g.dispose();
                    DCstack.pop();
                    DC = (WmfDecDC) DCstack.peek();

                    break;

                default :
                    if ((DCstack.capacity() / 10) > params[0])
                    {
                        while(!DCstack.empty()) 
                        {
                        	g.dispose();
	                        DC = (WmfDecDC) DCstack.pop();
 	                    	g = DC.getGr();
						}
                    }
                    break;
            }
            /*System.out.println(
                "\tOrgX="
                    + DC.getWinorgX()
                    + "\tOrgY="
                    + DC.getWinorgY()
                    + "\tExtX="
                    + DC.getWinextX()
                    + "\tExtY="
                    + DC.getWinextY());*/
            break;

        case Wmf.META_PATBLT :
            //System.out.println("META_PATBLT");
            e = (params[1] << 16) + params[0];
            a = DC.ytransfer(params[2]);
            b = DC.xtransfer(params[3]);
            c = DC.ytransfer(params[4]);
            d = DC.xtransfer(params[5]);
            switch (e) {
                case Wmf.WHITENESS :
                    g.setColor(Color.white); // <------ not yet debugged
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.BLACKNESS :
                    g.setColor(Color.black);
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.PATCOPY :
                    if ((im = DC.getAktbrushImage()) != null)
                        drawOpaqePattern(g, im, d, c, d + b, c + a, fr);
                    else {
                        g.setColor(DC.getAktbrushColor());
                        g.fillRect(d, c, b, a);
                    }
                    break;
                case Wmf.PATINVERT :
                case Wmf.DSTINVERT : // FIXME
                default :

                    }

            break;

        case Wmf.META_STRETCHBLT :
            //System.out.println("META_STRETCHBLT");
            e = (params[1] << 16) + params[0];
            a = DC.ytransfer(params[6]);
            b = DC.xtransfer(params[7]);
            c = DC.ytransfer(params[8]);
            d = DC.xtransfer(params[9]);
            switch (e) {
                case Wmf.WHITENESS :
                    g.setColor(Color.white); // <------ not yet debugged
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.BLACKNESS :
                    g.setColor(Color.black);
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.SRCCOPY :
                    im = OldBitmapImage(10, params, fr);
                    if (im != null) {
                        g.drawImage(im, d, c, b, a, fr);
                        im = null;
                    } else
                        if (drawCross_if_error) {
                            g.setColor(Color.black);
                            g.drawLine(0, 0, DC.xtransfer(params[7]), DC.ytransfer(params[6]));
                            g.drawLine(DC.xtransfer(params[7]), 0, 0, DC.ytransfer(params[6]));
                        }
                    break;
                default :

                    }
            break;

        case Wmf.META_DIBCREATEPATTERNBRUSH :
            //System.out.println("META_DIBCREATEPATTERNBRUSH");
            im = DIBBitmapImage(2, params, fr);
            if (im != null)
                add_handle(new WmfDecObj(im));
            break;

        case Wmf.META_DIBBITBLT :
        case Wmf.META_STRETCHDIB :
        case Wmf.META_DIBSTRETCHBLT :
            k = 0;
            switch (rdFunc) {
                case Wmf.META_DIBBITBLT :
                    //System.out.println("META_DIBBITBLT");
                    k = -2; // 2 params less
                    break;
                case Wmf.META_STRETCHDIB :
                    //System.out.println("META_STRETCHDIB");
                    k = 1; // 1 param  more
                    break;
                case Wmf.META_DIBSTRETCHBLT :
                    //System.out.println("META_DIBSTRETCHBLT");
                    k = 0;
                    break;
            }
            a = DC.ytransfer(params[6 + k]);
            b = DC.xtransfer(params[7 + k]);
            c = DC.ytransfer(params[8 + k]);
            d = DC.xtransfer(params[9 + k]);
            e = (params[1] << 16) + params[0];
            switch (e) {
                case Wmf.WHITENESS :
                    g.setColor(Color.white); // <------ not yet debugged
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.BLACKNESS :
                    g.setColor(Color.black);
                    g.fillRect(d, c, b, a);
                    break;
                case Wmf.SRCCOPY :
                    im = DIBBitmapImage(10 + k, params, fr); // here starts bmp
                    if (im != null) {
                        g.drawImage(im, d, c, b, a, fr);
                        im = null;
                    } else
                        if (drawCross_if_error) { // draw a cross X
                            g.setColor(Color.black);
                            g.drawLine(d, c, d + b, c + a);
                            g.drawLine(d + b, c, d, c + a);
                        }
                    break;
                default :
                    //System.out.println("unsupported ROP code:" + Integer.toString(e, 16));
            }
            break;

        case Wmf.META_ESCAPE :
            //System.out.println("META_ESCAPE");
            break;

        case 0 :
            return false; // EOF

        default :

            break;
    }
    return true;
}
    //---- main method for reading Wmf into a pixel array -------------------
    private void readWmf() throws IOException, InterruptedException {
        //Dimension d = new Dimension(320, 240);
        // std window size, only if no first header present
        Image offscreen;
        Graphics g;
        
        if (chkHeader())
            throw new IOException("WMF file format not supported");
        
        DCstack = new Stack();
        gdiObj = new WmfDecObj[obj];
        
                     
        fr = new Frame();
        fr.addNotify();
        offscreen = fr.createImage( di.width, di.height);
        g = offscreen.getGraphics();
        
        params = new short[max]; // max space for a metafile record
        
        //WmfDecDC DC = new WmfDecDC(width, height, left, top);
        WmfDecDC DC = new WmfDecDC( left, top, org_di.width, org_di.height, di.width, di.height);
        DC.setGr(g);
        DCstack.push(DC);
        while (readRecord(in));
        //rgbPixels = new int[d.width * d.height];
        rgbPixels = new int[di.width * di.height];
        PixelGrabber pg = new PixelGrabber(	offscreen.getSource(),
	        								0,
	        								0,
	        								di.width,
	        								di.height,
	        								rgbPixels,
	        								0,
	        								di.width );
        pg.grabPixels();
        fr.dispose();
    }
    public void removeConsumer(ImageConsumer ic) {
        consumers.removeElement(ic);
    }
    public void requestTopDownLeftRightResend(ImageConsumer ic) {
    }
    // ---- method connects the Wmf interpreter with ImageProducer methods
    private void sendImage() {
        Vector xconsumers =(Vector)consumers.clone();
        // consumers will decrease while calling ic.imageComplete()
        // so in xconsumers we can each all elements
        for(Enumeration e = xconsumers.elements() ; e.hasMoreElements(); ) {
            ImageConsumer ic = (ImageConsumer)e.nextElement();
            if (isConsumer(ic)) {
                if (!err) {
                    ic.setDimensions(di.width, di.height);
                    ic.setColorModel(cmodel);
                    ic.setHints(	ImageConsumer.TOPDOWNLEFTRIGHT | 
	                    			ImageConsumer.COMPLETESCANLINES | 
	                    			ImageConsumer.SINGLEPASS | 
	                    			ImageConsumer.SINGLEFRAME );
                    
                    for ( int row = 0; row < di.height; row++ )
                        ic.setPixels(0, row, di.width, 1, cmodel, rgbPixels, row*di.width, di.width);
                    ic.imageComplete( ImageConsumer.STATICIMAGEDONE);
                }
                else {
                    // ic.imageComplete(ImageConsumer.IMAGEERROR);
                    ic.imageComplete(ImageConsumer.IMAGEABORTED);
                }
            }
        }
        producing = false;
    }
    public void startProduction(ImageConsumer ic) {
        addConsumer(ic);
        if (rgbPixels==null) {
            try {
                readWmf();
            }
            catch (Exception ex) {
                err = true;
                //width = height = -1;
            }
        }
        
        if (!producing) {
            producing = true;
            sendImage();
        }
    }
    private int transform(int param, int minsize) {
        int i = param;
        if (i < 0)
            i = -i;
        try {
            i = (i * res) / inch;
            if (i < minsize)
                i = minsize;
        } catch (ArithmeticException ex) {
            return minsize;
        }
        return i;
    }
}
