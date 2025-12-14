import java.io.*;
import java.util.*;
import java.awt.*;
import java.awt.image.*;

// this an all_in_one class of GDI-objects -------------------------------------
public class WmfDecObj {

    private Color c;
    private Font f;
    private boolean f_underl;
    private int f_orient;
    private Rectangle r;
    private int magic;
    private Image ibrush;
    private int hatch;
    private int p_style;

    WmfDecObj(int left, int top, int right, int bottom) {
        r = new Rectangle(left, top, right - left, bottom - top);
        magic = Wmf.M_CLIP;
    }
    WmfDecObj(int penattr, Color cc) {
        c = cc;
        magic = Wmf.M_PEN;
        p_style = penattr;
    }
    WmfDecObj(int hatchstyle, Color cc, Color back, Component fr) {
        c = cc; // TRANSPARENT mode not suppd
        hatch = hatchstyle;
        ibrush = createOpaqueImage(hatchstyle, cc, back, fr);
        magic = Wmf.M_BRUSH;
    }
    WmfDecObj(Color cc, int mm) {
        c = cc;
        magic = mm;
    }
    WmfDecObj(Font ff, int underlined, int orientation) {
        f = ff;
        f_underl = underlined == 0 ? false : true;
        f_orient = orientation;
        magic = Wmf.M_FONT;
    }
    WmfDecObj(Image ii) {
        ibrush = ii;
        c = null;
        magic = Wmf.M_BRUSH;
    }
    Image createOpaqueImage(int hatchstyle, Color cc, Color back, Component fr) {

        Image im;
        int i, pixels[] = new int[64];
        // from HS_HORIZONTAL=0   up to   HS_DIAGCROSS=5
        int set[][] = { { 32, 33, 34, 35, 36, 37, 38, 39 }, {
                4, 12, 20, 28, 36, 44, 52, 60 }, {
                0, 9, 18, 27, 36, 45, 54, 63 }, {
                7, 14, 21, 28, 35, 42, 49, 56 }, {
                32, 33, 34, 35, 36, 37, 38, 39, 4, 12, 20, 28, 44, 52, 60 }, {
                0, 9, 18, 27, 36, 45, 54, 63, 7, 14, 21, 28, 35, 42, 49, 56 }
        };

        for (i = 0; i < 64; i++)
            pixels[i] =
            /*back.getRGB();*/
            Color.white.getRGB();
        try {
            for (i = 0; i < set[hatchstyle].length; i++)
                pixels[set[hatchstyle][i]] = cc.getRGB();
            MemoryImageSource mis =
                new MemoryImageSource(8, 8, ColorModel.getRGBdefault(), pixels, 0, 8);
            im = fr.createImage(mis);
            mis = null;
        } catch (ArrayIndexOutOfBoundsException e) {
            im = null;
            //System.out.println("unknown hatchstyle found.");
        }
        return im;
    }
    Color getColor() {
        return c;
    }
    Font getFont() {
        return f;
    }
    int getFontOrientation() {
        return f_orient;
    }
    int getHatch() {
        return hatch;
    }
    Image getImage() {
        return ibrush; //draw a hatch image if OPAQUE mode ?
    }
    int getMagic() {
        return magic;
    }
    int getPenStyle() {
        return p_style;
    }
    Rectangle getRect() {
        return r;
    }
    boolean isUnderlined() {
        return f_underl;
    }
}