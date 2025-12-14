import javax.media.*;
import javax.media.protocol.*;
import javax.media.control.*;
import javax.media.format.*;
import javax.media.format.AudioFormat;
import java.awt.*;
import com.sun.media.controls.VFlowLayout; // Lays components one below the other
import java.awt.event.*;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.text.SimpleDateFormat;

import javax.media.control.TrackControl;
import javax.media.protocol.DataSource;

import javax.swing.*;
import javax.swing.Timer;

public class JVidCap implements ControllerListener{

    //GUIServer objects
    AcessMonitor GUI;
    InsertDB InsertVideofile;
    Processor p = null;
    DataSink datasink = null;
    Component monitor = null;
    DataSource datasource = null;
    DataSource originalDS;
    String outputType = "video.mpeg";
    String vdoSize = "";
    String strSize,encoding;
    String path;
    String stopTime;
    String[] manual = new String[3]; // keep manual save time file    
    Object waitSync = new Object();   
    boolean stateTransitionOK = true;
    static MotionDetectionEffect mde;
    
    public JVidCap(AcessMonitor GUI) {
	//createGUI();
	//fillGUI();
	this.GUI = GUI;
	this.mde = GUI.mde;
    
    }	
	public JVidCap(){
	}

    public void startMonitoring(FileTypeDescriptor ftd) {
	// Close the previous processor, which in turn closes the capture device
		
	if (p != null) {
		p.stop();
	    p.close();
	}
	// Remove the previous monitor
	if (monitor != null) {
	    GUI.jPanel1.remove(monitor);
	    monitor = null;
	}

	AudioFormat af = null;
	VideoFormat vf = null;

	if (GUI.checkVideo.getState()) {
	    //encoding = "RGB";
            encoding = GUI.jcomboEncoding.getSelectedItem().toString();
	    strSize = GUI.jcomboSize.getSelectedItem().toString();
	    StringTokenizer st = new StringTokenizer(strSize, "x");
	    //int sizeX = 640;
            //int sizeY = 480;
            int sizeX = Integer.parseInt(st.nextToken());
	    int sizeY = Integer.parseInt(st.nextToken());
	
	    Dimension size = new Dimension(sizeX, sizeY);

	    vf = new VideoFormat(encoding, size, Format.NOT_SPECIFIED,
				 null, 15f);
	}
/*
	if(vdoSize.equals(null)){
		vdoSize = new String(strSize);
		variableCode.flagSizeVDO = 0;
	}
	else if(!vdoSize.equals(strSize)){
		variableCode.flagSizeVDO = 1;
		vdoSize = new String(strSize);
	}
*/	
	// Use CaptureUtil to create a monitored capture datasource
	datasource = CaptureUtil.getCaptureDS(vf, af);
	
	if (datasource != null) {
	    // Set the preferred content type for the Processor's output
	    //outputType = "video.quicktime";
	    originalDS = datasource;
	    datasource = Manager.createCloneableDataSource(datasource);
	    outputType = "video.mpeg";
	    if (GUI.jcomboFileType.getSelectedItem().toString().equals("AVI"))
			outputType = "video.x_msvideo";	
	    //FileTypeDescriptor ftd = new FileTypeDescriptor(outputType);
	    Format [] formats = null;
	    
	    

	    if (af != null && vf != null) {
		formats = new Format[] { new AudioFormat(null),
					 new VideoFormat(null) };
	    }

	    if (af == null)
		formats = new Format[] {new VideoFormat(null)};
   
	    try{
	    	p = Manager.createProcessor(datasource);
	    }
	    catch(Exception me){
	    	System.err.println("error = "+me);
	    	datasource.disconnect();	
	    }
	    
	    //p.addControllerListener(this);
	    System.out.println ("Before config: " + p.getState());
	    p.configure();
	    System.out.println ("After config "+ p.getState());

   		if (!waitForState(p.Configured)) {
			System.err.println("Failed to configure the processor.");
			System.exit(0);
		}
		

		p.setContentDescriptor(ftd);
		p.addControllerListener(this);
		TrackControl tc[] = p.getTrackControls();

		if (tc == null) {
			System.err.println("Failed to obtain track controls from the processor.");
			System.exit(0);
		}

		// Search for the track control for the video track.
		TrackControl videoTrack = null;

		for (int i = 0; i < tc.length; i++) {
			if (tc[i].getFormat() instanceof VideoFormat) {
			videoTrack = tc[i];
			break;
			}
		}

		if (videoTrack == null) {
			System.err.println("The input media does not contain a video track.");
			System.exit(0);
		}


	// Instantiate and set the frame access codec to the data flow path.

		try {
		    Codec codec[] = {mde};
		    videoTrack.setCodecChain(codec);
		} catch (UnsupportedPlugInException e) {
		    System.err.println("The processor does not support effects.");
		}

	    p.realize();
        if (!waitForState(p.Realized)) {
            System.err.println("Failed to configure the player.");
            System.exit(0);
        }
        
        p.prefetch();
        if(!waitForState(p.Prefetched)){
            System.err.println("Failed to prefetch the player");
        }
	    
	    MonitorControl mc = (MonitorControl)datasource.getControl("jmfsample.MonitorStream");
	   
            if (mc != null) {
			monitor = mc.getControlComponent();
			GUI.jPanel1.add(monitor);
	    /*  
	        monitor.addMouseListener(new MouseAdapter(){
		  		public void mousePressed( MouseEvent e)
	      		{
	      			if(e.getButton() == MouseEvent.BUTTON1){
	      				System.out.println( "Mouse pressed at (" + e.getX() + "," + e.getY() + ")" ); 
	      				//if(GUI.jDefinemode.isSelected())	
	      					mde.setPointPress(e.getPoint());
	      			}
	      			else if(e.getButton() == MouseEvent.BUTTON3)
                                    System.out.println("MouseEvent.Button3 press");
                                    //GUI.createPopupMenu(e.getComponent(),e.getX(),e.getY());
	      		}
			  	public void mouseReleased( MouseEvent e)
		      	{ 
		      		System.out.println( "Mouse released at (" + e.getX() + "," +e.getY() + ")" ); 
		      		//if(GUI.jDefinemode.isSelected())
		      			mde.setPointRelease(e.getPoint());
		      	}
	      	});*/
			
			// Make sure the monitor is enabled
			mc.setEnabled(true);
			GUI.pack();
			
			if(variableCode.flagStartProcessor==1)
			{	p.start();
				System.out.println ("\nProcessor state start = "+p.getState()+"\n");
			}
		}
	}
		System.out.println("Capture Player");	
    }
	

    public void startCapture(String[] filename) {
                System.out.println ("In startCapture()");
		if(variableCode.ismanual==1){
                  manual = filename;
                }
                
                FileTypeDescriptor ftd = new FileTypeDescriptor("video.x_msvideo");
		System.out.println ("Processor state at startCapture = "+ p);
		if(p != null){
			System.out.println ("\n\nProcessor state before stop= " + p.getState()+"\n\n");
			p.stop();
			System.out.println ("\nProcessor state after stop = " + p.getState());
			p.close();
			System.out.println ("\nProcessor state after close = " + p.getState());
		}


		startMonitoring(ftd);
             
		variableCode.flagStartProcessor = 0;
		//filename = new String[2];
		//filename = getDateTime();
		//String path = managePath(filename[0]);
		path = managePath(filename[0]);

		enableComponents(false);
		GUI.jButton1.setLabel("Pause");
		GUI.jButton3.setEnabled(true);
		// Get the processor's output, create a DataSink and connect the two.
		try{
			datasource.connect();
		}catch(Exception d){System.err.println("d ="+d);}
		DataSource outputDS = p.getDataOutput();
		System.out.println ("Datasource ="+outputDS);
		try {
		    MediaLocator ml = new MediaLocator("file:"+ path + filename[1] +
					  (outputType.equals("video.x_msvideo")? ".avi" : ".mpeg"));
					  //outputType.equals("video.x_msvideo")? "avi" : "mov")
		    datasink = Manager.createDataSink(outputDS, ml);
		    System.out.println("\n\nDataSink\n"+datasink + "\n\n");
		    datasink.open();
		    datasink.start();
		} catch (Exception e) {
			e.printStackTrace();
		}
		p.start();
	
		System.out.println ("descriptor: " + p.getContentDescriptor());	
		
		System.out.println("Started saving...");
                GUI.jTextArea1.append("Started saving...\n");
	}
	
	public void pauseCapture() {
		p.stop();
		GUI.jButton1.setLabel("Resume");
                System.out.println("Pause Capture....");
                GUI.jTextArea1.append("Pause Capture....\n");
	}
	
	public void resumeCapture() {
		p.start();
		GUI.jButton1.setLabel("Pause");
                System.out.println("Resume Capture....");
                GUI.jTextArea1.append("Resume Capture....\n");
        }
	
	public void stopCapture(Timer timer,Timer countTimeMde) {
	// Stop the capture and the file writer (DataSink)
                p.stop();
                p.close();
		datasink.close();
		
		setTimeStop();
	
		p = null;
		
		if(timer != null)
			timer.stop();
		if(countTimeMde != null)
			countTimeMde.stop();
	
		GUI.jButton3.setEnabled(false);
		// Restart monitoring
		System.out.println("Done saving.");
                GUI.jTextArea1.append("Done saving\n");
		variableCode.flagSave = 0;
		variableCode.flagStartProcessor = 1;
		variableCode.flagTimer = 0;
		startMonitoring(null);
		GUI.jButton1.setLabel("Start Capture");
		enableComponents(true);
                if(variableCode.ismanual==1){
                    Convertfile cf = new Convertfile();
                    cf.setrootpath(GUI.rootpath);
                    cf.convert(manual,getPathSaveFile());
                    Convertimage ci = new Convertimage();
                    ci.setrootpath(GUI.rootpath);
                    ci.convert(manual, getPathSaveFile());
                }
                variableCode.ismanual = 0;
        }
    	
    private void setTimeStop(){
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat sdfTime = new SimpleDateFormat("H:mm:ss");
		stopTime = sdfTime.format(date);
		updateDB();
    }
   	
    private void updateDB()
    {
    	String[] data = new String[3];
    	data = mde.getFileName();
    	if(variableCode.ismanual==1){
           InsertVideofile = new InsertDB(GUI,manual[1],getPathSaveFile(),manual[0],manual[2],stopTime);         
           System.out.println ("Update VideoFile Complete");
           InsertDB InsertImagefile = new InsertDB(GUI,manual,getPathSaveFile());
           System.out.println ("Update ImageFile Complete");
        }else{
            InsertVideofile = new InsertDB(GUI,data[1],getPathSaveFile(),data[0],data[2],stopTime);
            System.out.println ("Update VideoFile Complete");
            //InsertImage
            InsertDB InsertImagefile = new InsertDB(GUI,data,getPathSaveFile());
            System.out.println ("Update ImageFile Complete");
        }
    }
   
    /*private String managePath(String date)
    {
		File rootBackup,rootDate;
		String path;		
		
    	rootBackup = new File("//BackupVDO");
	    if(rootBackup.exists()){
	   		if(rootBackup.isDirectory())
	   		    System.out.println ("//BackupVDO// is exists.");
	   		else
	   			rootBackup.mkdir();	   	
	    } 
	    else
	    { 
	   	 	System.out.println ("make //BackupVDO//");
	     	rootBackup.mkdir();   
       	}

    	rootDate = new File("//BackupVDO//"+date);
	    if(rootDate.exists()){
	   		if(rootDate.isDirectory())
	   		    System.out.println ("//BackupVDO//"+date+" is exists.");
	   		else
	   			rootDate.mkdir();	   	
	    } 
	    else
	    { 
	   	 	System.out.println ("make //BackupVDO//"+date);
	     	rootDate.mkdir();   
       	}
		
		path = "//BackupVDO//" + date +"//";
		return path;
	
    }*/
    
    private String managePath(String date)
    {
        File rootBackup,rootDate;
        String path;		
        rootBackup = new File(GUI.rootpath);
        if(rootBackup.exists()){
                    if(rootBackup.isDirectory())
                        System.out.println (GUI.rootpath+"\\ is exists.");
                    else
                            rootBackup.mkdir();	   	
        } 
        else
        { 
                    System.out.println ("make "+ GUI.rootpath +"\\");
            rootBackup.mkdir();   
        }

    	rootDate = new File(GUI.rootpath+"\\"+ date);
	    if(rootDate.exists()){
	   		if(rootDate.isDirectory())
	   		    System.out.println (GUI.rootpath+date+ " is exists.");
	   		else
	   			rootDate.mkdir();	   	
	    } 
	    else
	    { 
	   	 	System.out.println ("make "+GUI.rootpath+date);
	     	rootDate.mkdir();   
       	}
		
		path = GUI.rootpath + "\\" + date + "\\";
		return path;
	
    }


    private void enableComponents(boolean state) {
	GUI.jcomboFileType.setEnabled(state);
	GUI.jcomboEncoding.setEnabled(state);
	GUI.jcomboSize.setEnabled(state);
	//checkAudio.setEnabled(state);
	//GUI.comboSampling.setEnabled(state);
	GUI.jButton8.setEnabled(state);
    }	
	  
    void exit() {
	if (p != null)
	    p.close();
        System.exit(0);
    }
    
    public DataSource getDataSource()
    {
    	if( datasource != null )
    		return ((SourceCloneable)datasource).createClone();
    	return null;
    }
    
    public String getPathSaveFile()
    {
    	return path;
    }
    
    boolean waitForState(int state) {
		System.out.println ("In wait state");
        synchronized (waitSync) {
            try {
                while (p.getState() != state && stateTransitionOK)
                {
                    //waitSync.wait();
                    Thread.sleep(100);
                    //System.out.println(p.getState() + "Configuring: " + Processor.Configuring);
            	}

            } catch (Exception e) {}
        }
        return stateTransitionOK;
    }
    
    public void controllerUpdate(ControllerEvent evt) {
        System.out.println("Event: " + evt);
    }
   public String[] getmanual(){
       return manual;
   } 
}
