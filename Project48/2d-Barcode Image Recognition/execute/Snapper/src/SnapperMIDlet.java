/* License
 * 
 * Copyright 1994-2004 Sun Microsystems, Inc. All Rights Reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *  
 *  * Redistribution of source code must retain the above copyright notice,
 *      this list of conditions and the following disclaimer.
 * 
 *  * Redistribution in binary form must reproduce the above copyright notice,
 *      this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of Sun Microsystems, Inc. or the names of contributors
 * may be used to endorse or promote products derived from this software
 * without specific prior written permission.
 *  
 * This software is provided "AS IS," without a warranty of any kind. ALL
 * EXPRESS OR IMPLIED CONDITIONS, REPRESENTATIONS AND WARRANTIES, INCLUDING
 * ANY IMPLIED WARRANTY OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
 * OR NON-INFRINGEMENT, ARE HEREBY EXCLUDED. SUN MICROSYSTEMS, INC. ("SUN")
 * AND ITS LICENSORS SHALL NOT BE LIABLE FOR ANY DAMAGES SUFFERED BY LICENSEE
 * AS A RESULT OF USING, MODIFYING OR DISTRIBUTING THIS SOFTWARE OR ITS
 * DERIVATIVES. IN NO EVENT WILL SUN OR ITS LICENSORS BE LIABLE FOR ANY LOST
 * REVENUE, PROFIT OR DATA, OR FOR DIRECT, INDIRECT, SPECIAL, CONSEQUENTIAL,
 * INCIDENTAL OR PUNITIVE DAMAGES, HOWEVER CAUSED AND REGARDLESS OF THE THEORY
 * OF LIABILITY, ARISING OUT OF THE USE OF OR INABILITY TO USE THIS SOFTWARE,
 * EVEN IF SUN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
 *  
 * You acknowledge that this software is not designed, licensed or intended
 * for use in the design, construction, operation or maintenance of any
 * nuclear facility. 
 */

import java.io.IOException;

import javax.microedition.lcdui.*;
import javax.microedition.media.*;
import javax.microedition.media.control.*;
import javax.microedition.midlet.MIDlet;
//import java.util.zip.*;
import com.tinyline.util.GZIPInputStream;
import java.io.*;

public class SnapperMIDlet
    extends MIDlet
    implements CommandListener {
  private Display mDisplay;
  
  private Form mMainForm;
  
  private Command mExitCommand, mCameraCommand,mQueryCommand;
  private Command mBackCommand, mCaptureCommand;
  
  private Player mPlayer;
  private VideoControl mVideoControl;

  private String query = "";

  
  public SnapperMIDlet() {
    mExitCommand = new Command("Exit", Command.EXIT, 0);
    mCameraCommand = new Command("Camera", Command.SCREEN, 0);
    mBackCommand = new Command("Back", Command.BACK, 0);
    mCaptureCommand = new Command("Capture", Command.SCREEN, 0);
		    mQueryCommand = new Command("Query", Command.SCREEN, 0);
    
    mMainForm = new Form("Snapper");
    mMainForm.addCommand(mExitCommand);
    String supports = System.getProperty("video.snapshot.encodings");
    if (supports != null && supports.length() > 0) {
		
		//-------------------------------------------------------------------------------------------------------------------------------------------------------- test decompression
		/*com.java4ever.apime.io.GZIP gzip = new com.java4ever.apime.io.GZIP();
		byte[] a = new byte[] {10,20,30,40,50,60,70,80,90,100};		
		byte[] b;
		try
		{
			b = gzip.inflate(a);
			mMainForm.append("Compress OK.");
		}
		catch(Exception e)
		{
		    mMainForm.append("Compress Error.");
		}*/

		//--------------------------------------------------------------------------------------------------------------------------------------------------------test send
		/*RSAlgorithm rs = new RSAlgorithm(255,8,16,0);
		for(int i=0;i<223;i++) rs.messageSend.coefficient[i]=i;
		rs.messageSend.degree = rs.degree(rs.messageSend);
		rs.calculateGenerator();
		rs.calculateCodeSend();
		int data[] = rs.codeSend.coefficient;*/

		//-------------------------------------------------------------------------------------------------------------------------------------------------------- test receive
		/*RSAlgorithm rr = new RSAlgorithm(255,8,16,0);
		rr.codeReceive.coefficient = data;
		rr.codeReceive.degree = rr.degree(rr.codeReceive);
		rr.calculateSyndrome();
		rr.errorProcessing();
		rr.calculateMessageReceive();
		int errcount=0;*/

		//-------------------------------------------------------------------------------------------------------------------------------------------------------- compare send - receive
		/*for(int i=0;i<223;i++)
		{
			if (rs.messageSend.coefficient[i] != rr.messageReceive.coefficient[i] ) errcount++;
		}
		if(errcount==0)
		{
			mMainForm.append("Reed Solomon OK."+ errcount);
		}
		else
		{
		    mMainForm.append("Reed Solomon Error." + errcount);
		}*/


      mMainForm.append("Ready to take pictures.");
      mMainForm.addCommand(mCameraCommand);
    }
    else
      mMainForm.append("Snapper cannot use this " +
          "device to take pictures.");
    mMainForm.setCommandListener(this);
  }
  
  public void startApp() {
    mDisplay = Display.getDisplay(this);
    
    mDisplay.setCurrent(mMainForm);
  }
    
  public void pauseApp() {}
  
  public void destroyApp(boolean unconditional) {
  }
  
  public void commandAction(Command c, Displayable s) {
    if (c.getCommandType() == Command.EXIT) {
      destroyApp(true);
      notifyDestroyed();
    }
    else if (c == mCameraCommand)
      showCamera();
    else if (c == mQueryCommand)
      queryCommand();
    else if (c == mBackCommand)
      mDisplay.setCurrent(mMainForm);
    else if (c == mCaptureCommand) {
      capture();
    }
  }

  private void showCamera() {
    try {
      mPlayer = Manager.createPlayer("capture://video");
      mPlayer.realize();
      
      mVideoControl = (VideoControl)mPlayer.getControl("VideoControl");
      
      Canvas canvas = new CameraCanvas(this, mVideoControl);
      canvas.addCommand(mBackCommand);
      canvas.addCommand(mCaptureCommand);
      canvas.setCommandListener(this);
      mDisplay.setCurrent(canvas);

      /*
      Form form = new Form("Camera form");
      Item item = (Item)mVideoControl.initDisplayMode(
          GUIControl.USE_GUI_PRIMITIVE, null);
      form.append(item);
      form.addCommand(mBackCommand);
      form.addCommand(mCaptureCommand);
      form.setCommandListener(this);
      mDisplay.setCurrent(form);
      */

      mPlayer.start();
    }
    catch (IOException ioe) { handleException(ioe); }
    catch (MediaException me) { handleException(me); }
  }
  
  public void capture() {
    try {
      // Get the image.
      byte[] raw = mVideoControl.getSnapshot(null);
      Image image = Image.createImage(raw, 0, raw.length);
      
     Image thumb = createThumbnail(image);
	  String thumbstring = createString(image);
      
      // Place it in the main form.
//      if (mMainForm.size() > 0 && mMainForm.get(0) instanceof StringItem)
//        mMainForm.delete(0);
      mMainForm.append(thumb);
       mMainForm.append(thumbstring);
      
      // Flip back to the main form.
      mDisplay.setCurrent(mMainForm);
      
      // Shut down the player.
      mPlayer.close();
      mPlayer = null;
      mVideoControl = null;
    }
    catch (MediaException me) { handleException(me); }
  }

  public void queryCommand() {
    try {
      // Get the image.
	   mMainForm.delete(0);
  	  String q0 = "--------------------------\n";
	  String q1 = "Querying ... data\n";
	  String q2 = "found ... data.\n";
	  String q3 = "Key: "+query+ ".\n";
  	  String q4 = "Product : Pencil\n";
   	  String q5 = "Total : 10 pcs\n";
  	  String q6 = "Product : Rubber\n";
   	  String q7 = "Total : 30 pcs\n";

       mMainForm.append(q0);
       mMainForm.append(q1);
       mMainForm.append(q2);
       mMainForm.append(q3);
       mMainForm.append(q4);
       mMainForm.append(q5);
       mMainForm.append(q6);
       mMainForm.append(q7);
      
      // Flip back to the main form.
      mDisplay.setCurrent(mMainForm);
      
      // Shut down the player.
    }
    catch (Exception e) { handleException(e); }
  }
  
  private void handleException(Exception e) {
    Alert a = new Alert("Exception", e.toString(), null, null);
    a.setTimeout(Alert.FOREVER);
    mDisplay.setCurrent(a, mMainForm);
  }
  
  private Image createThumbnail(Image image) {
	try
	{
	 barcode b1 = new barcode(image);
	 return b1.getpic();
	}
	catch(Exception e)
	{
	 return image;
     }
  }
  private String createString(Image image) {

		barcode b1 = new barcode(image);
		if (b1.geterror() > 0)
		{
			//return "Error Reed Solomon Count : "+b1.geterror();
		}

  		try
		{
			/*ByteArrayInputStream bytearray = new ByteArrayInputStream(b1.getdata());
    		GZIPInputStream gis = new GZIPInputStream(bytearray);
			byte[] out=null;
			gis.read(out);
			return "\n"+(new String(out)) + " , error count = "+b1.geterror() ;*/

			    mMainForm.addCommand(mQueryCommand);
			query = new String(b1.getdata());
			return "\n"+(new String(b1.getdata())) + " , error count = "+b1.geterror() ;
		}
		catch(Exception e)
		{
			return e.getMessage() + "\nError Decompression , error count = "+b1.geterror() ;
		}
  }

}
