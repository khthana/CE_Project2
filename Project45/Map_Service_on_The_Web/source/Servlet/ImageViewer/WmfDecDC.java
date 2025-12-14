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

// Consider: this is NOT really what Windows-GDI does!
class WmfDecDC implements Cloneable {
    // this is our "device context" (DC), init'd with GDI defaults
    // it has 6 selectable objects
    private WmfDecObj aktpen;
    private WmfDecObj aktbrush;
    private WmfDecObj aktpal;
   private WmfDecObj aktbmp;
    private WmfDecObj aktclip;
    private WmfDecObj aktfont;
    
    private Color akttextc;//=Color.black;
    private Color aktbackgnd;//=Color.white;	// for usage in NULL-pens and -brushs
    
    private int aktYpos=0;			// current graphic cursor (MoveTo,LineTo)
    private int aktXpos=0;
    
    private short winextX;		// for SetWindowExt()
    private short winextY;
    
    private short winorgX;		// for SetWindowOrg()
    private short winorgY;
    
    
    private int akttextalign;//=WmfDecoder.TA_TOP;
    private int aktbkmode;//=WmfDecoder.OPAQUE;
    
    private Graphics gr;
    

	private int truewidth;
	private int trueheight;
	//private final static int PS_SOLID = 0;
	
    WmfDecDC(int orgX,int orgY, int extX,int extY) {
        // init (some metafiles don't call META_SETWINDOWEXT/META_SETWINDOWORG !)
        truewidth = extX;
        trueheight = extY;
        winextX = (short)extX;
        winextY = (short)extY;
        winorgX = (short)orgX;
        winorgY = (short)orgY;
        //xratio = sX/extX;
        //yratio = sY/extY;
        
        aktclip= new WmfDecObj( 0, 0,winextX, winextY );
        aktpen = new WmfDecObj( Wmf.PS_SOLID, Color.black );
        aktbrush= new WmfDecObj( Color.white, Wmf.M_BRUSH );
        aktpal  = new WmfDecObj( Color.white, Wmf.M_PALETTE );
        aktbmp  = new WmfDecObj( Color.white, Wmf.M_BITMAP );
        aktfont = new WmfDecObj( new Font("Courier", Font.PLAIN,12 ), 0, 0 );
        akttextc = Color.black;
    	aktbackgnd = Color.yellow;
    	akttextalign = Wmf.TA_TOP;
    	aktbkmode = Wmf.OPAQUE;
    	
    
    }
	//private final static int PS_SOLID = 0;
	
    WmfDecDC(int orgX,int orgY, int extX,int extY, int trueWidht, int trueHeigth) {
        // init (some metafiles don't call META_SETWINDOWEXT/META_SETWINDOWORG !)
        truewidth = trueWidht;
        trueheight = trueHeigth;
        winextX = (short)extX;
        winextY = (short)extY;
        winorgX = (short)orgX;
        winorgY = (short)orgY;
                
        aktclip= new WmfDecObj( 0, 0,winextX, winextY );
        aktpen = new WmfDecObj( Wmf.PS_SOLID, Color.black );
        aktbrush= new WmfDecObj( Color.white, Wmf.M_BRUSH );
        aktpal  = new WmfDecObj( Color.white, Wmf.M_PALETTE );
        aktbmp  = new WmfDecObj( Color.white, Wmf.M_BITMAP );
        aktfont = new WmfDecObj( new Font("Courier", Font.PLAIN,12 ), 0, 0 );
        akttextc = Color.black;
    	aktbackgnd = Color.white;
    	akttextalign = Wmf.TA_TOP;
    	aktbkmode = Wmf.OPAQUE;
    	
    
    }
    public Object clone()	// not yet ready
    {
        try
        { return super.clone(); }
        catch (CloneNotSupportedException e)
        { return null; }  // this never happens?
    }
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return java.awt.Color
 */
public java.awt.Color getAktbackgnd() {
	return aktbackgnd;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return int
 */
public int getAktbkmode() {
	return aktbkmode;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktbmp() {
	return aktbmp;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktbrush() {
	return aktbrush;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public Color getAktbrushColor() {
	return aktbrush.getColor();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public Image getAktbrushImage() {
	return aktbrush.getImage();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktclip() {
	return aktclip;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public int getAktclipRectHeight() {
	return aktclip.getRect().height;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public int getAktclipRectWidth() {
	return aktclip.getRect().width;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public int getAktclipRectX() {
	return aktclip.getRect().x;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public int getAktclipRectY() {
	return aktclip.getRect().y;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public Font getAktFont() {
	return aktfont.getFont();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktfont() {
	return aktfont;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public int getAktFontOri() {
	return aktfont.getFontOrientation();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktpal() {
	return aktpal;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public WmfDecObj getAktpen() {
	return aktpen;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public Color getAktpenColor() {
	return aktpen.getColor();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return WmfDecObj
 */
public Image getAktpenImage() {
	return aktpen.getImage();
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return int
 */
public int getAkttextalign() {
	return akttextalign;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return java.awt.Color
 */
public java.awt.Color getAkttextc() {
	return akttextc;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return int
 */
public int getAktXpos() {
	return aktXpos;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return int
 */
public int getAktYpos() {
	return aktYpos;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return java.awt.Graphics
 */
public java.awt.Graphics getGr() {
	return gr;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @return int
 */
public int getTrueheight() {
	return trueheight;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @return int
 */
public int getTruewidth() {
	return truewidth;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @return short
 */
public short getWinextX() {
	return winextX;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @return short
 */
public short getWinextY() {
	return winextY;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @return short
 */
public short getWinorgX() {
	return winorgX;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @return short
 */
public short getWinorgY() {
	return winorgY;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktbackgnd java.awt.Color
 */
public void setAktbackgnd(Color newAktbackgnd) {
	//aktbackgnd = newAktbackgnd;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktbkmode int
 */
public void setAktbkmode(int newAktbkmode) {
	aktbkmode = newAktbkmode;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktbmp WmfDecObj
 */
public void setAktbmp(WmfDecObj newAktbmp) {
	aktbmp = newAktbmp;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktbrush WmfDecObj
 */
public void setAktbrush(WmfDecObj newAktbrush) {
	aktbrush = newAktbrush;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktclip WmfDecObj
 */
public void setAktclip(WmfDecObj newAktclip) {
	aktclip = newAktclip;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktfont WmfDecObj
 */
public void setAktfont(WmfDecObj newAktfont) {
	aktfont = newAktfont;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktpal WmfDecObj
 */
public void setAktpal(WmfDecObj newAktpal) {
	aktpal = newAktpal;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktpen WmfDecObj
 */
public void setAktpen(WmfDecObj newAktpen) {
	aktpen = newAktpen;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAkttextalign int
 */
public void setAkttextalign(int newAkttextalign) {
	akttextalign = newAkttextalign;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAkttextc java.awt.Color
 */
public void setAkttextc(Color newAkttextc) {
	akttextc = newAkttextc;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktXpos int
 */
public void setAktXpos(int newAktXpos) {
	aktXpos = newAktXpos;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newAktYpos int
 */
public void setAktYpos(int newAktYpos) {
	aktYpos = newAktYpos;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newGr java.awt.Graphics
 */
public void setGr(Graphics newGr) {
	gr = newGr;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:21)
 * @param newTrueheight int
 */
public void setTrueheight(int newTrueheight) {
	trueheight = newTrueheight;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @param newTruewidth int
 */
public void setTruewidth(int newTruewidth) {
	truewidth = newTruewidth;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @param newWinextX short
 */
public void setWinextX(short newWinextX) {
	if(newWinextX!=0)
		winextX = newWinextX;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @param newWinextY short
 */
public void setWinextY(short newWinextY) {
	if(newWinextY!=0)
		winextY = newWinextY;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @param newWinorgX short
 */
public void setWinorgX(short newWinorgX) {
	winorgX = newWinorgX;
}
/**
 * Insert the method's description here.
 * Creation date: (7/1/2003 22:30:22)
 * @param newWinorgY short
 */
public void setWinorgY(short newWinorgY) {
	winorgY = newWinorgY;
}
    public int xtransfer(short x) {
	 	if(winextX==0)
	 		return x-winorgX;
	    return ((x - winorgX) * truewidth)/winextX;
		
    }
    public int ytransfer(short y) {
	 	if(winextY==0)
	 		return y-winorgY;
	    return ((y - winorgY) * trueheight)/winextY;

    }
}
