/**
 * Insert the type's description here.
 * Creation date: (24/12/2002 2:10:40)
 * @author: Administrator
 */
class Wmf {


	public final static int META_SETBKCOLOR 		= 0x0201;	//SetBkColor 		0x0201 
    public final static int META_SETBKMODE 			= 0x0102;	//SetBkMode 		0x0102 
    public final static int META_SETMAPMODE 		= 0x0103;	//SetMapMode 		0x0103 
    public final static int META_SETROP2 			= 0x0104;	//SetROP2 			0x0104 
    public final static int META_SETRELABS 			= 0x0105;	//SetRelabs 		0x0105 
    public final static int META_SETPOLYFILLMODE 	= 0x0106;	//SetPolyFillMode 	0x0106 
    public final static int META_SETSTRETCHBLTMODE 	= 0x0107;	//SetStretchBltMode 0x0107
    public final static int META_SETTEXTCHAREXTRA 	= 0x0108;	//SetTextCharExtra 	0x0108 
    public final static int META_SETTEXTCOLOR 		= 0x0209;	//SetTextColor 		0x0209 
    public final static int META_SETTEXTJUSTIFICATION = 0x020A;	//SetTextJustification 0x020A 
    public final static int META_SETWINDOWORG 		= 0x020B;	//SetWindowOrg 		0x020B 
    public final static int META_SETWINDOWEXT 		= 0x020C;	//SetWindowExt 		0x020C 
    public final static int META_SETVIEWPORTORG 	= 0x020D;	//SetViewportOrg 	0x020D
    public final static int META_SETVIEWPORTEXT 	= 0x020E;	//SetViewportExt 	0x020E
    public final static int META_OFFSETWINDOWORG 	= 0x020F;	//OffsetWindowOrg 	0x020F 
    public final static int META_SCALEWINDOWEXT 	= 0x0410;	//ScaleWindowExt 	0x0410
    public final static int META_OFFSETVIEWPORTORG 	= 0x0211;	//OffsetViewportOrg 0x0211 
    public final static int META_SCALEVIEWPORTEXT 	= 0x0412;	//ScaleViewportExt 	0x0412 
    public final static int META_LINETO 			= 0x0213;	//LineTo 			0x0213
    public final static int META_MOVETO 			= 0x0214;	//MoveTo 			0x0214 
    public final static int META_EXCLUDECLIPRECT 	= 0x0415;	//ExcludeClipRect 	0x0415 
    public final static int META_INTERSECTCLIPRECT 	= 0x0416;	//IntersectClipRect 0x0416
    public final static int META_ARC 				= 0x0817;	//Arc		 		0x0817
    public final static int META_ELLIPSE 			= 0x0418;	//Ellipse 			0x0418 
    public final static int META_FLOODFILL 			= 0x0419;	//FloodFill 		0x0419 
    public final static int META_PIE 				= 0x081A;	//Pie 				0x081A
    public final static int META_RECTANGLE 			= 0x041B;	//Rectangle 		0x041B
    public final static int META_ROUNDRECT 			= 0x061C;	//RoundRect 		0x061C
    public final static int META_PATBLT 			= 0x061D;	//PatBlt 			0x061D 
    public final static int META_SAVEDC 			= 0x001E;	//SaveDC 			0x001E
    public final static int META_SETPIXEL 			= 0x041F;	//SetPixel 			0x041F
    public final static int META_OFFSETCLIPRGN 		= 0x0220;	//OffsetClipRgn 	0x0220
    public final static int META_RESTOREDC 			= 0x0127;	//RestoreDC 		0x0127 
    public final static int META_FILLREGION 		= 0x0228;	//FillRegion 		0x0228 
    public final static int META_FRAMEREGION 		= 0x0429;	//FrameRegion 		0x0429 
    public final static int META_INVERTREGION 		= 0x012A;	//InvertRegion 		0x012A 
    public final static int META_PAINTREGION 		= 0x012B;	//PaintRegion 		0x012B
    public final static int META_SELECTCLIPREGION 	= 0x012C;	//SelectClipRegion 	0x012C
    public final static int META_SELECTOBJECT 		= 0x012D;	//SelectObject 		0x012D
    public final static int META_SETTEXTALIGN 		= 0x012E;	//SetTextAlign 		0x012E 
    public final static int META_CHORD 				= 0x0830;	//Chord	 			0x0830
    public final static int META_SETMAPPERFLAGS 	= 0x0231;	//SetMapperFlags 	0x0231 
    public final static int META_SETDIBTODEV 		= 0x0D33;	//SetDibToDev 		0x0d33 
    public final static int META_SELECTPALETTE 		= 0x0234;	//SelectPalette 	0x0234
    public final static int META_REALIZEPALETTE 	= 0x0035;	//RealizePalette 	0x0035
    public final static int META_SETPALENTRIES 		= 0x0037;	//SetPalEntries 	0x0037 
    public final static int META_RESIZEPALETTE 		= 0x0139;	//ResizePalette 	0x0139
    public final static int META_EXTFLOODFILL 		= 0x0548;	//ExtFloodFill 		0x0548
    public final static int META_RESETDC 			= 0x014C;	//ResetDc 			0x014C 
    public final static int META_STARTDOC 			= 0x014D;	//StartDoc 			0x014D 
    public final static int META_STARTPAGE 			= 0x004F;	//StartPage 		0x004F
    public final static int META_ENDPAGE 			= 0x0050;	//EndPage 			0x0050
    public final static int META_ABORTDOC 			= 0x0052;	//AbortDoc 			0x0052
    public final static int META_ENDDOC 			= 0x005E;	//EndDoc 			0x005E 
    public final static int META_DELETEOBJECT 		= 0x01F0;	//DeleteObject 		0x01f0



    public final static int META_ANIMATEPALETTE 	= 0x0436;
    public final static int META_CREATEPALETTE 		= 0x00F7;
    public final static int META_CREATEBRUSH 		= 0x00F8;
    public final static int META_CREATEPATTERNBRUSH = 0x01F9;
    public final static int META_CREATEPENINDIRECT 	= 0x02FA;
    public final static int META_CREATEFONTINDIRECT = 0x02FB;
    public final static int META_CREATEBRUSHINDIRECT = 0x02FC;
    public final static int META_CREATEBITMAPINDIRECT = 0x02FD;
    public final static int META_CREATEBITMAP 		= 0x06FE;
    public final static int META_CREATEREGION 		= 0x06FF;
    public final static int META_TEXTOUT 			= 0x0521;
    public final static int META_BITBLT 			= 0x0922;
    public final static int META_STRETCHBLT 		= 0x0B23;
    public final static int META_POLYGON 			= 0x0324;
    public final static int META_POLYLINE 			= 0x0325;
    public final static int META_ESCAPE 			= 0x0626;
    public final static int META_DIBBITBLT 			= 0x0940;
    public final static int META_DIBSTRETCHBLT 		= 0x0B41;
    public final static int META_DIBCREATEPATTERNBRUSH = 0x0142;
    public final static int META_STRETCHDIB 		= 0x0F43;
    public final static int META_DRAWTEXT 			= 0x062F;
    public final static int META_EXTTEXTOUT 		= 0x0A32;
    public final static int META_POLYPOLYGON 		= 0x0538;
 
    public final static int MFCOMMENT = 15;
    public final static int SRCCOPY = 0xCC0020;
    public final static int PATCOPY = 0xF00021;
    public final static int PATINVERT = 0x5A0049;
    public final static int DSTINVERT = 0x550009;
    public final static int BLACKNESS = 0x000042;
    public final static int WHITENESS = 0xFF0062;
    public final static int BI_RLE8 = 1;
    public final static int BI_RLE4 = 2;
    
    public final static int TA_BASELINE = 24; // TextAlign options
    public final static int TA_BOTTOM = 8;
    public final static int TA_CENTER = 6;
    public final static int TA_UPDATECP = 1; // FIXME: update current postion
    
    public final static int TA_TOP = 0;
    public final static int OPAQUE = 2;
    public final static int ETO_GRAYED = 1;
    public final static int ETO_OPAQUE = 2;
    public final static int ETO_CLIPPED = 4;
    public final static int PS_SOLID = 0;
    public final static int PS_DASH = 1;
    public final static int PS_DOT = 2;
    public final static int PS_DASHDOT = 3;
    public final static int PS_DASHDOTDOT = 4;
    public final static int PS_NULL = 5;
    public final static int PS_INSIDEFRAME = 6;

    public final static int M_PEN = 1; // the Windows GDI uses some other magic words...
    public final static int M_BRUSH = 2;
    public final static int M_FONT = 3;
    public final static int M_BITMAP = 4;
    public final static int M_CLIP = 5;
    public final static int M_PALETTE = 6;


    public final static int BS_SOLID = 0;
	public final static int BS_HOLLOW = 1;
    public final static int BS_HATCHED = 2;
    public final static int BS_PATTERN = 3;
    public final static int BS_INDEXED = 4;
    public final static int BS_DIBPATTERN = 5;
/**
 * Wmf constructor comment.
 */
public Wmf() {
	super();
}
}
