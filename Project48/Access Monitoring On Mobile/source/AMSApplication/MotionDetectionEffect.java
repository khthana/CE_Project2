import javax.media.*;
import javax.media.format.*;
import java.awt.*;
import java.awt.event.*;
import java.io.IOException;
import javax.media.util.*;
import java.lang.*;
import java.util.*;
import javax.swing.Timer;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.sound.sampled.*;
import java.awt.image.*;

public class MotionDetectionEffect implements Effect{
	/**
	* The initial square side.
	*/
	private final static int INITIAL_SQUARE_SIZE = 5;
    private Format inputFormat;
    private Format outputFormat;
    private Format[] inputFormats;
	//private MulticastServer multicast;
    private Format[] outputFormats;
    private int[] bwPixels;
    private byte[] bwData;
    /**
	* Visual mode is set.
	*/
	private boolean visualize = true;
	/**
	* Server mode is set.
	*/
	private boolean serverActive = true;
	/**
	* Update requested is set.
	*/	
	private boolean updateRequested;
    private int avg_ref_intensity;
    private int avg_img_intensity;
	
	/**
	* The RGBFormat of the inbuffer.
	*/	
	private RGBFormat vfIn = null;
	/**
	* Four different thresholds. Set initial values here.
	*/		
	private int[] threshs = {20,30,40,50};
    
	private int det_thresh = threshs[1];
	/**
	*  The corresponding colours to the four different thresholds.
	*/		
	private int[] colors = {0x00FF0000,0x00FF9900,0x00FFFF00,0x00FFFFFF};
	/**
	*  The mean values of all squares in an image.
	*/		
	private int[] newImageSquares = null;
	/**
	*  The mean values of all squares in an image.
	*/			
	private int[] oldImageSquares = null;
	/**
	*  The difference of all the mean values of all squares in an image.
	*/			
	private int[] changedSquares = null;
	/**
	* The number of squares fitted in the image.
	*/
    private int numberOfSquaresWide;
    /**
	* The number of squares fitted in the image.
	*/
	private int numberOfSquaresHigh;
	/**
	* The number of squares fitted in the image.
	*/
	private int numberOfSquares;
	/**
	* The square side, in pixels.
	*/
    private int sqSide = INITIAL_SQUARE_SIZE;
	/**
	* The level used for motion detection.
	*/
    private int level = 0;
        /**
	* The square area, in pixels.
	*/
    private int sqArea = 0;
        /**
	* The amount of pixels left when all normal sized squares have been removed.
	*/    
	private int sqWidthLeftover = 0;
	/**
	* The amount of pixels left when all normal sized squares have been removed.
	*/    
	private int sqHeightLeftover = 0;
	/**
	* Optional, less processing is needed if some pixels are left out during some of the calculations.
	*/ 	
	private int pixelSpace = 0;
	/**
	* Image property.
	*/
	private int imageWidth = 0;
	/**
	* Image property.
	*/
	private int imageHeight = 0;
	/**
	* Image property.
	*/
	private int imageArea = 0;
	
	private Point firstPoint = new Point(0,48);
	private Point endPoint = new Point(64,0);
	//array for level detection
        //for 640*480
        //private int[] levels = {0,614,1228,1842,2456};
        //for 320*240
        private int[] levels = {0,153,307,460,614};
        //for 160*120
        //private int[] levels = {0,35,77,130,157};
	private javax.sound.sampled.AudioFormat audioFormat;
  	private AudioInputStream audioInputStream;
  	private SourceDataLine sourceDataLine;
	AcessMonitor GUI;
	String[] filename,lossTime;
	String rootpath;
	private int counter=0;
	Timer timer,countTimeMde,emailcounttime;
	ActionListener stopSave,forceStopSave,smail;
	int delay = 4000,limitTimeMde = 30000,emailtime;
	Buffer exBuffer;
        boolean emailsend = false;
        /**
     * Initialize the effect plugin.
     */
    public MotionDetectionEffect(final AcessMonitor GUI) {
	System.out.println ("Start MotionDetectionEffect()");
	this.GUI = GUI;
	this.rootpath = GUI.rootpath;
        //this.smotion = smotion;
        inputFormats = new Format[] {
            new RGBFormat(null,  
                          Format.NOT_SPECIFIED,
                          Format.byteArray,
                          Format.NOT_SPECIFIED,
						  24,
                          3, 2, 1,
                          3, Format.NOT_SPECIFIED,
                          Format.TRUE,
                          Format.NOT_SPECIFIED)
        };
        System.out.println ("inputFormats = "+inputFormats.toString());
        /*new RGBFormat(java.awt.Dimension size,
         				int maxDataLength, 
         				java.lang.Class dataType, 
         				float frameRate, 
         				int bitsPerPixel, 
         				int red, int green, int blue, 
         				int pixelStride, int lineStride,
         				int flipped,
         				int endian)*/

        outputFormats = new Format[] {
            new RGBFormat(null,
                          Format.NOT_SPECIFIED,
                          Format.byteArray,
                          Format.NOT_SPECIFIED,
						  24,
                          3, 2, 1,
                          3, Format.NOT_SPECIFIED,
                          Format.TRUE,
                          Format.NOT_SPECIFIED)
        };
        //multicast = new MulticastServer("224.4.5.6",5002);
  	stopSave = new ActionListener() {
      	public void actionPerformed(ActionEvent evt) {
          		stopCap();
      	}
      	};
        //Listener for email send
        smail = new ActionListener() {
                    public void actionPerformed(ActionEvent evt) {
                    if(GUI.emailalert.isSelected() && variableCode.flagemail == 0){
                        //for sending e-mail**************************
                        emailsend = true;
                        variableCode.flagemail = 1;
                    }
      	}
      	};
	timer = new Timer(delay,stopSave);
		
		/*forceStopSave = new ActionListener(){
			public void actionPerformed(ActionEvent evt){
				if(variableCode.flagTimer==1){
					variableCode.flagTimer=0;
					timer.stop();
				}
				forceStop();
			}
		};
		countTimeMde = new Timer(limitTimeMde,forceStopSave);*/
        
        emailtime = Integer.parseInt(GUI.timemail.getSelectedItem().toString())*1000;
	countTimeMde = new Timer(limitTimeMde,stopSave);
        
    }
    
    private void stopCap()
    {
    	System.out.println ("***** stopCap *****");
    	//System.out.println(filename[1]+rootpath);
        GUI.captureapi.stopCapture(timer,countTimeMde);
        emailcounttime.stop();
        if(emailsend){
            AlertMail am = new AlertMail(filename[1]);
            //sm.setRootPath(GUI.rootpath);
            am.start();
            emailsend = false;
            GUI.jTextArea1.append("Email has been Send \n");
        }
        GUI.timemail.setEnabled(true);    
        variableCode.flagemail = 0;
        GUI.ckbxServerActiveBasic.setEnabled(true);
        Convertfile cf = new Convertfile();
        cf.setrootpath(GUI.rootpath);
        cf.convert(filename,GUI.captureapi.getPathSaveFile());
        
        Convertimage ci = new Convertimage();
        ci.setrootpath(GUI.rootpath);
        ci.convert(filename,GUI.captureapi.getPathSaveFile());
    }
    
/*    private void forceStop()
    {
    	System.out.println ("***** motion detect had found more than 15 sec *****");
    	System.out.println ("----- stop saving now -----");
    	GUI.captureapi.stopCapture(countTimeMde);
    }
*/
    /**
     * Get the inputformats that we support.
     * @return  All supported Formats.
     */
    public Format[] getSupportedInputFormats() {
        return inputFormats;
    }

    /**
     * Get the outputformats that we support.
     * @param input the current inputformat.
     * @return  All supported Formats.
     */
    public Format [] getSupportedOutputFormats(Format input) {
        if (input == null) {
            return outputFormats;
        }
        if (matches(input, inputFormats) != null) {
            return new Format[] { outputFormats[0].intersects(input) };
        } else {
            return new Format[0];
        }
    }

    /**
     * Set the input format.
     * 
     */
    public Format setInputFormat(Format input) {
        inputFormat = input;
	    return input;
    }
    /**
     * Set our output format.
     *
     */
    public Format setOutputFormat(Format output) {

        if (output == null || matches(output, outputFormats) == null)
            return null;

        RGBFormat incoming = (RGBFormat) output;

        Dimension size = incoming.getSize();
        int maxDataLength = incoming.getMaxDataLength();
        int lineStride = incoming.getLineStride();
        float frameRate = incoming.getFrameRate();
        int flipped = incoming.getFlipped();
        int endian = incoming.getEndian();

        if (size == null)
            return null;
        if (maxDataLength < size.width * size.height * 3)
            maxDataLength = size.width * size.height * 3;
        if (lineStride < size.width * 3)
            lineStride = size.width * 3;
        if (flipped != Format.FALSE)
            flipped = Format.FALSE;

        outputFormat = outputFormats[0].intersects(new RGBFormat(size,
                                                        maxDataLength,
                                                        null,
                                                        frameRate,
                                                        Format.NOT_SPECIFIED,
                                                        Format.NOT_SPECIFIED,
                                                        Format.NOT_SPECIFIED,
                                                        Format.NOT_SPECIFIED,
                                                        Format.NOT_SPECIFIED,
                                                        lineStride,
                                                        Format.NOT_SPECIFIED,
                                                        Format.NOT_SPECIFIED));

        return outputFormat;
    }


    

   /**
     * Process the buffer. This is where motion is analysed and optionally visualized.
     *
     */

    public synchronized int process(Buffer inBuffer, Buffer outBuffer) {
        //System.out.println ("In process()");
        int outputDataLength = ((VideoFormat)outputFormat).getMaxDataLength();
        validateByteArraySize(outBuffer, outputDataLength);
        outBuffer.setLength(outputDataLength);
        outBuffer.setFormat(outputFormat);
        outBuffer.setFlags(inBuffer.getFlags());

        byte [] inData = (byte[]) inBuffer.getData();
        byte [] outData =(byte[]) outBuffer.getData();
	int[] sqAvg = null;
	int[] refsqAvg = null;

        vfIn = (RGBFormat) inBuffer.getFormat();
        Dimension sizeIn = vfIn.getSize();

        int pixStrideIn = vfIn.getPixelStride();
        int lineStrideIn = vfIn.getLineStride();

	imageWidth = (vfIn.getLineStride())/3; //Divide by 3 since each pixel has 3 colours.
        imageHeight = ((vfIn.getMaxDataLength())/3)/imageWidth;
	imageArea = imageWidth*imageHeight;

        int r,g,b = 0; //Red, green and blue values.		
		  
    	if(oldImageSquares == null){ //For the first frame.
		changeSqSize(INITIAL_SQUARE_SIZE);
		updateRequested = true;
	}

	//for the 1st frame when the size of video stream is changed
 	if(variableCode.flagSizeVDO == 1){  
		variableCode.flagSizeVDO = 0;				
		changeSqSize(INITIAL_SQUARE_SIZE);
			updateRequested = true;
	}

        //Copy all data from the inbuffer to the outbuffer. The purpose is to display the video input on the screen.
	System.arraycopy(inData,0,outData,0,outData.length); 
 
	 // Simplify the image to black and white, image information shrinks to one third of the original amount. Less processing needed.
	bwPixels = new int[outputDataLength/3] ;
        for (int ip  = 0; ip < outputDataLength; ip+=3) {
            int bw = 0;
            r = (int) inData[ip] & 0xFF;
            g = (int) inData[ip+1] & 0xFF;
            b = (int) inData[ip+2] & 0xFF;
            bw = (int) ((r + b + g)/ (double) 3);
            bwPixels[ip/3] = bw; //Now containing a black and white image. 
	}
        if (updateRequested){
            updateRequested = false;
            updateSquares();
	    return BUFFER_PROCESSED_OK;
	}
	else {
	    updateSquares();
            oldNewChange();
	    int c=0;
            
//for Area detection puy friend
            //for(int i=endPoint.y; i<firstPoint.y; i++){
              //  for(int j=firstPoint.x; j<endPoint.x; j++){
		//    if(changedSquares[(i*numberOfSquaresWide)+j] > det_thresh)
		  //  	c++;
		//}
            //}
		    
//original code here            
            for(int i=0; i<changedSquares.length; i++){
			    if(changedSquares[i] > det_thresh){
					c++;
			    }
		    }
          String day[] = getDateTime();
            //check condition here for motion detection               
          if(c>5 && serverActive && c >= levels[level] && variableCode.ismanual==0 && GUI.ckbxServerActiveBasic.isSelected()){
                GUI.ckbxServerActiveBasic.setEnabled(false);
                System.out.println("Motion detected (motion at " + c + "areas");		    
                GUI.smotion.motionarea.append("Motion detected " + c + " areas at "+ day[2] + "  " + day[0] + "\n");
                if(variableCode.flagSave==0)
                {						
                    variableCode.flagSave = 1;
                    variableCode.flagTimer = 0;
                    filename = new String[3];
                    filename = getDateTime();
                    GUI.jTextArea1.append("Motion Detected at "+ filename[2] +"\n");
                    captureimage(inBuffer);
                    GUI.captureapi.startCapture(filename);
                    countTimeMde.start();
                    //start email count time
                    GUI.timemail.setEnabled(false);
                    emailcounttime = new Timer(emailtime,smail);
                    emailcounttime.start();
                    //captureimage(inBuffer); //captureimage
                    
                }
		if(variableCode.flagTimer==1)
                {
                    variableCode.flagTimer = 0;
                    timer.stop();				    		    
                }
            }
            else 
            {	
                if(variableCode.flagSave == 1 && variableCode.flagTimer == 0){
                    variableCode.flagTimer = 1;
                    System.out.println ("###########");
                    timer.start();
                }
                // to manual save file image
                if( variableCode.flagimage==0 && variableCode.ismanual == 1){
                    filename = GUI.captureapi.getmanual();
                    captureimage(inBuffer);
                    variableCode.flagimage = 1;
                }

            }    
	}
	return BUFFER_PROCESSED_OK;
    }

	
	public String[] getDateTime()
	{
		Date date = Calendar.getInstance().getTime();
        String[] day = new String[3]; 
		SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfTime = new SimpleDateFormat("H_mm_ss");
		day[0] = sdfDay.format(date);
		day[1] = sdfTime.format(date);
		SimpleDateFormat realtime = new SimpleDateFormat("H:mm:ss");
                day[2] = realtime.format(date);
                return day;			
	}
	
    public String[] getFileName()
    {
            return filename;
    }

    // Methods for interface PlugIn
    public String getName() {
        return "Motion Detection Codec";
    }
    
    public void open() {
    }

    public void close() {
    }

    public void reset() {
    }

    // Methods for interface javax.media.Controls
    public Object getControl(String controlType) {
        System.out.println(controlType);
	    return null;
    }
    

    public Object[] getControls() {
        return null;
    }
        

    // Utility methods.
    public Format matches(Format in, Format outs[]) {
	for (int i = 0; i < outs.length; i++) {
	    if (in.matches(outs[i]))
		return outs[i];
	}

	return null;
    }

	// Credit : example at www.java.sun.com
    byte[] validateByteArraySize(Buffer buffer,int newSize) {
        Object objectArray=buffer.getData();
        byte[] typedArray;

        if (objectArray instanceof byte[]) {     // Has correct type and is not null
            typedArray=(byte[])objectArray;
            if (typedArray.length >= newSize ) { // Has sufficient capacity
                return typedArray;
            }

            byte[] tempArray=new byte[newSize];  // Reallocate array
            System.arraycopy(typedArray,0,tempArray,0,typedArray.length);
            typedArray = tempArray;
        } else {
            typedArray = new byte[newSize];
        }

        buffer.setData(typedArray);
        return typedArray;
    }

/**
* Sets the current pixelspace, default is zero.
* This is mainly for use where limited processing capacity are availible. Some pixels are left out in the calculations.
* @param newSpace the space between two successive pixels.
*/
	private void setPixelSpace(int newSpace) {
		pixelSpace = newSpace;
	}

	public void setDetectNormal(int senSide){
		changeSqSize(senSide);
	}

/**
* Changes the size of the square shaped area that divides the detection area into many small parts.
* @param newSide the side of the square, in pixels.
*/
	private void changeSqSize(int newSide) {
		sqSide = newSide;
		sqArea = newSide*newSide;
		int wid = (imageWidth/sqSide); //The number of squares wide.
		int hei = (imageHeight/sqSide); //The number of squares high.
		sqWidthLeftover =  imageWidth%sqSide;
		sqHeightLeftover = imageHeight%sqSide;
		if (sqWidthLeftover>0) {
			wid++;
		}
		if (sqHeightLeftover>0) {
			hei++;
		} 

		numberOfSquaresWide = wid;
		numberOfSquaresHigh = hei;
		numberOfSquares = wid*hei;
		
		newImageSquares = new int [numberOfSquares];
		oldImageSquares = new int [numberOfSquares];
		changedSquares = new int [numberOfSquares];			

		firstPoint.x = 0;
		firstPoint.y = numberOfSquaresHigh;
		endPoint.x = numberOfSquaresWide;
		endPoint.y = 0;
		
		int step = numberOfSquares/20;
		for(int i=0; i<levels.length; i++)
		{
			levels[i] = step*i;
			System.out.println ("levels["+i+"] = " +levels[i]);
		}		

		System.out.println ("numberOfSquaresWide : "+numberOfSquaresWide);		
		System.out.println ("numberOfSquaresHigh : "+numberOfSquaresHigh);		
		System.out.println ("numberOfSquares : "+numberOfSquares);
		System.out.println ("sqSide : "+sqSide);
		System.out.println ("sqArea : "+sqArea);
		System.out.println ("imageWidth : "+imageWidth);
		//System.out.println ("first point : " + firstPoint);
		//System.out.println ("end point : " + endPoint);

	}

/**
* Calculates the average colour in each square thus indirect eliminate noise.
* @param startX the starting position of this square, in pixels, left edge.
* @param startY the starting position of this square, in pixels, bottom edge.
* @param sqWidth the width of this square, in pixels.
* @param sqHeight the height of this square, in pixels.
* @return The average greyscale value for this square.
*/
	private int averageInSquare(int startX, int startY, int sqWidth, int sqHeight) {
		int average = 0;
		for (int i=0; i<sqHeight; i=i+1+pixelSpace) {// For all pixels
			for (int j=0; j<sqWidth; j=j+1+pixelSpace) {
				average += bwPixels[(((startY+i)*imageWidth)+(startX+j))]; //Sum all the pixel values.
			}
		}
		average = average/(sqWidth*sqHeight); //Divide by the number of pixels to get the average value.
		return average;
	}



/**
* Backup the most recent frame examined. For the new frame, calculate the average greyscale value for all squares.
*/
	private void updateSquares() {    
		System.arraycopy(newImageSquares,0,oldImageSquares,0, newImageSquares.length);
		int sqCount = 0; //Keep track of the current square
		for (int j=0; j<(imageHeight);j=j+sqSide) { //For all squares
			for (int i=0; i<(imageWidth);i=i+sqSide) {
				if (i<=(imageWidth-sqSide) && j<=(imageHeight-sqSide)) {
					newImageSquares [sqCount] = averageInSquare(i, j, sqSide, sqSide); //No edge!
				} else if (i>(imageWidth-sqSide) && j<=(imageHeight-sqSide)) {
					newImageSquares [sqCount] = averageInSquare(i, j, sqWidthLeftover, sqSide); //Right edge!
				} else if (i<=(imageWidth-sqSide) && j>(imageHeight-sqSide)) {
					newImageSquares [sqCount] = averageInSquare(i, j, sqSide, sqHeightLeftover); //Bottom edge!
				} else if (i>(imageWidth-sqSide) && j>(imageHeight-sqSide)) {
					newImageSquares [sqCount] = averageInSquare(i, j, sqWidthLeftover, sqHeightLeftover); //Bottom right edge!
				}
			sqCount++;
			}
		}
	}


/**
* Calculate the difference per square between currently stored frames. 
*/
	private void oldNewChange() {
		for (int i = 0; i<=(numberOfSquares-1); i++) { //For all squares
			int difference = Math.abs((newImageSquares[i])-(oldImageSquares[i])); //Compare each square with the corresponding square in the previous frame.
				changedSquares[i] = difference; //Save the difference.
		}
	}
	
	public synchronized void updateSen(int sqSide){
        if(sqSide != this.sqSide)
            changeSqSize(sqSide);
        GUI.jtotalarea.setText(Integer.toString(numberOfSquares));
        GUI.jalertmoiton.setText(Integer.toString(levels[GUI.jSlider2.getValue()-1]));
        updateRequested = true;
	}
	public synchronized void updateLevel(int level){
        if(level != this.level)
        	this.level = level-1;
        GUI.jalertmoiton.setText(Integer.toString(levels[level-1]));
        updateRequested = true;
	}
	public synchronized void updateemail(int emailtime){
        if(emailtime != this.emailtime)
        	this.emailtime = emailtime;
        //updateRequested = true;
	}
	public synchronized void updateModel(boolean visualize, boolean serverActive, boolean simplified, int[] threshs,int[] colors,int sqSide, int det_thresh){
        
        this.visualize = visualize;
        this.serverActive = serverActive;
        if(sqSide != this.sqSide)
            changeSqSize(sqSide);
        if(!simplified){
            System.out.println((colors == null) + " " + (this.colors == null));
            System.arraycopy(colors,0,this.colors,0, colors.length);
            System.arraycopy(threshs,0,this.threshs,0, colors.length);
			this.det_thresh = det_thresh;
			System.out.println("New det_threhsh: " + this.det_thresh);
        }
        updateRequested = true;
    }

/**
*Check if the visualize variable is set.
*@returns the current value.
*/
	public boolean isVisual(){
        return visualize;
	}

/**
*Get the current threshold values in a vector.
*@returns the current values.
*/        	
    public int[] getThreshholds(){
        return threshs;
    }

/**
*Check if the server is active.
*@returns the current value.
*/    
    public boolean isServerActive(){
        return serverActive;
    }

    
    public int[] getColors(){
        return colors;
    }

/**
*Get the current square side.
*@returns the current value.
*/        
    public int getSqSide(){
        return sqSide;
    }
// play sound
	public void playAlert(){
	   try{
	      File soundFile = new File("somethingwrong.wav");
	      audioInputStream = AudioSystem.getAudioInputStream(soundFile);
	      audioFormat = audioInputStream.getFormat();
	      System.out.println("audioFormat : "+audioFormat);
	
	      DataLine.Info dataLineInfo = new DataLine.Info(SourceDataLine.class,audioFormat);
	
	      sourceDataLine = (SourceDataLine)AudioSystem.getLine(dataLineInfo);
	
          new PlayThread().start();
	   }
	   catch (Exception e) {
	      e.printStackTrace();
	      System.exit(0);
	   }		
	}

	class PlayThread extends Thread{
	  	byte tempBuffer[] = new byte[10000];
		
	  	public void run(){
		    try{
		      sourceDataLine.open(audioFormat);
		      sourceDataLine.start();
		
		      int cnt;
		      while((cnt = audioInputStream.read(tempBuffer,0,tempBuffer.length)) != -1)
		      {
		        if(cnt > 0){
		          sourceDataLine.write(tempBuffer, 0, cnt);
		        }//end if
		      }//end while
		      //Block and wait for internal buffer of the
		      // data line to empty.
		      sourceDataLine.drain();
		      sourceDataLine.close();
		    }catch (Exception e) {
		      e.printStackTrace();
		      System.exit(0);
		    }//end catch
		}//end run
	}
            
     public void captureimage(Buffer inBuffer){
         
       BufferToImage bti = new BufferToImage((VideoFormat)(inBuffer.getFormat()));
       Image im = bti.createImage(inBuffer);
       //Imagemakerjpg imageMaker = new Imagemakerjpg(im,filename,rootpath );
       //ImageIO.read();
       BufferedImage bufim = (BufferedImage)im;
       Imagemaker image = new Imagemaker();
       image.saveToFile(bufim,filename,"jpeg",GUI.rootpath);
       image.saveToFile(bufim,filename,"png",GUI.rootpath);
     }
}
// class for send Mail by Thread
class AlertMail extends Thread{
    String filename;
    public AlertMail(String filename){
        this.filename = filename;
    }
    public void run(){
        SendMail sm = new SendMail(filename);
    }
}


