/*
    WmfView.java
    Copyright (C) 1997,2001 Albrecht Kleine <kleine@ak.sax.de>
 
    version 0.6
    (bugfix in META_POLYGON token, August 2001,
     tnx to Ivan Markovic for demo files)
 
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
import Acme.JPM.Encoders.*;

public class WmfImage extends Frame{
    
    // constructor
    WmfImage(String filename)
	{
		try{
			file = new FileInputStream(filename);
		} catch ( FileNotFoundException fnfex ){
			file = null;
		}

	}
    
	public FileInputStream file;

    public Image CreateWmfDecoder() {
        return CreateWmfDecoder( 0, 0, 400, 400, 400, 400); 
    }
    
    public Image CreateWmfDecoder(int x, int y, int dw, int dh, int ws, int hs) {
	    //Image image;
	    try {
            WmfDecoder WDec = new WmfDecoder( file , new Dimension(dw,dh), new Dimension(ws,hs));
            //image = 
            return createImage(WDec);
        } catch (Exception ex) {
            return null;
        }
        //return CropImage(image , x, y, ws, hs);
    }
    
    public Image CropImage(Image image, int x, int y, int w, int h){
        //if(image==null)
        //    return null;
        try{
            CropImageFilter cropfilter = new CropImageFilter(x, y, w, h);
			FilteredImageSource filterImage = new FilteredImageSource(image.getSource(), cropfilter);
            return createImage(filterImage);
        }catch (Exception ex) {
            return image;
        }
    }
    
    public void sendAsGIF(Image image, OutputStream out) {
        try {
            new GifEncoder(image, out).encode();
        } catch (IOException ioe) {}
    }
    
    // constructor
    WmfImage(File fin) throws IOException
	{
		file = new FileInputStream(fin);
		
	}

    // constructor
    WmfImage(FileInputStream fin)
	{
		file = fin;
		
	}
}


