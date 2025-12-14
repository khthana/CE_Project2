//package search;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.net.*;
import java.io.*;
import javax.media.*;
import javax.media.protocol.*;
import javax.media.control.*;
import javax.media.bean.playerbean.*;

/**
 * MovieScreen.java - A movie player control class for the the movie player
 * assignment in smd074 (lab1).
 * @author Fredrik Nilsson, Mikael Larsson, Erik Holmgren
 * @version 1.0
 * @see Modig
 */
public class MovieScreen extends JFrame implements WindowListener{

    public boolean debug = true;
    public MediaPlayer mediaPlayer;
    public Player player;
    
    
    private String location;
    private Component visualComponent;
    private Component controlPanelComponent;
    private URL url;
    private boolean fullScreen;
    private JWindow jWindow;
    private Dimension dimBeforeFullScreen;
    private MouseAdapter listenerMouseFullScreen;
    
    /**
     * Creates a new MovieScreen.
     * @param location A string with the full path/url to a movie.
     */
    public MovieScreen(String location){
	super(location);
	this.location = location;
	
	// Make ourselves able to receive window events.
  	addWindowListener(this);
    }

    /**
     * Tries to load the movie specified in location.
     * @return int, return values are:
     *         0 success.
     *         1 Problems contacting url.
     *         2 Couldn't create a realized player.
     */
    public int loadMovie(){
	try{
	    url = new URL(location);
	}catch(Exception e){
	    printDebug(e.getMessage());
	    return 1;
	}
	try{
	    player = Manager.createRealizedPlayer(url);
	}catch(Exception e){
	    printDebug(e.getMessage());
	    return 2;
	}
	

	mediaPlayer = new MediaPlayer();

	// Register the MediaEventControl in the MediaPlayer. This way
	// we now when the movie has ended. MediaEventControl is
	// an inner class.
	mediaPlayer.addControllerListener(new MediaEventControl(this));
	mediaPlayer.setPlayer(player);

	// Make the mediaplayer "real"
	mediaPlayer.realize();
	mediaPlayer.setStopTime(new Time(0));

	// Get the display and control components and add these to our window
	visualComponent = mediaPlayer.getVisualComponent();
	controlPanelComponent = mediaPlayer.getControlPanelComponent();
        getContentPane().add(visualComponent);
	getContentPane().add(controlPanelComponent,BorderLayout.SOUTH);
	mediaPlayer.setControlPanelVisible(true);

	return 0;
    }

    /**
     * Starts playing the movie.
     */
    public void start(){
	// If we are not already visible, put us in the center of the screen and
	// show ourselves.
	if(!isVisible()){
	    Dimension dimFrame, dimScreen;
	    Point p;

	    dimFrame = getContentPane().getSize();
	    dimScreen = Toolkit.getDefaultToolkit().getScreenSize();	    
	    p = new Point((dimScreen.width / 2) - (dimFrame.width / 2), (dimScreen.height / 2) - (dimFrame.height / 2));
	    setLocation(p);
	    pack();
	    setVisible(true);
	}
	// Start playinh the movie
	mediaPlayer.start();
    }

    /**
     * Stops playback.
     */
    public void stop(){
	mediaPlayer.stop();
    }

    /**
     * Set the speed at the movie is played.
     *   1.0 - normal rate
     * < 1.0 - slower rate
     * > 1.0 - faster rate
     */
    public float setSpeed(double speed){
	float rateSet;
	Time time;

	// We have to stop the clock before being able to set the rate 
	time = mediaPlayer.getMediaTime();
	mediaPlayer.stop();
	
	rateSet = mediaPlayer.setRate((float)speed);
	printDebug("Rate set to: " + rateSet);

	// Start the movie where we stopped it.
	mediaPlayer.setMediaTime(time);
	mediaPlayer.start();

	printDebug("Leaving setSpeed");
	return rateSet;
    }

    /**
     * Increases the speed with 0.1 units.
     */
    public float incRate(){
	return setSpeed(mediaPlayer.getRate() + 0.1);
    }

    /**
     * Decreases the speed with 0.1 units.
     */
    public float decRate(){
	return setSpeed(mediaPlayer.getRate() - 0.1);
    }

    /**
     * Creates a JWindow that spawns over the whole screen and then plays the
     * movie in that window.
     * @param boolean, true fullscreen shall be enabled, false restores to original size 
     */
    public void setFullScreen(boolean fullScreen){
	printDebug("Entering setFullScreen");

	// Check if full screen mode is requested and if so make sure we are not
	// alredy in full screen mode.

	if(fullScreen && !this.fullScreen){
	    printDebug("Setting fullscreen");
	    Dimension dimScreen;

	    // Save the current size.
	    dimBeforeFullScreen = getContentPane().getSize();

	    jWindow = new JWindow(this);
	    
	    // Find out how big our screen is and give the JWindow the same size
	    dimScreen = Toolkit.getDefaultToolkit().getScreenSize();
	    jWindow.setBounds(0, 0, dimScreen.width, dimScreen.height);

	    // Remove the movie display from our frame.
	    getContentPane().remove(visualComponent);

	    // Add the movie display in the JWindow instead.
	    jWindow.getContentPane().add(visualComponent);


	    // Add a mouse adapter so we can listen for mouseclicks on the movie display.
	    // If we recive a click then we should restore the movie to original size. 
	    /*--------------------------------------------------------------*/
	    /* In pure frustration this code was ripped from JMApps         */
	    listenerMouseFullScreen = new MouseAdapter () {
                public void mouseClicked(MouseEvent event) {
                    setFullScreen(false);
                }
            };
	    
            visualComponent.addMouseListener(listenerMouseFullScreen);
	    /* End of ripped code                                           */
	    /*--------------------------------------------------------------*/

	    Toolkit.getDefaultToolkit().sync();

	    // Show the movie in the whole screen.
	    jWindow.setVisible(true);
	    this.fullScreen = true;
	}

	// Check if normal mode is requested and that we are in fullscreen mode.
	else if(!fullScreen && this.fullScreen){
	    // Hide us for a moment while we do some magic.
	    setVisible(false);
	    
	    printDebug("Restoring frame");
	    
	    // Remove the mouse adapter from the movie display.
	    visualComponent.removeMouseListener(listenerMouseFullScreen);

	    Toolkit.getDefaultToolkit().sync();

	    // Get rid of the JWindow used for fullscreen mode.
	    jWindow.getContentPane().remove(visualComponent);
	    jWindow.dispose();
	    jWindow=null;

	    // Add the movie display to our frame again.
      	    getContentPane().add(visualComponent);

	    // Restore the old size.
	    getContentPane().setSize(dimBeforeFullScreen);

	    // It's show time!
	    setVisible(true);
	    this.fullScreen = false;
	}
      printDebug("Leaving setFullScreen");
    }

    /**
     * Sets the volume level to the desired value.
     * @param int, where  0 <= int <= 5
     */
    public void setVolume(int level){
	if(level < 0)
	    level = 0;
	else if(level > 5)
	    level = 5;

	mediaPlayer.setVolumeLevel(""+level);
    }

    /**
     * Increases the volume one unit.
     */
    public void incVolume(){
	String strLevel;
	int level;

	strLevel = mediaPlayer.getVolumeLevel();
	printDebug("incVolume: " + strLevel);
	try{
	    level = (new Integer(strLevel)).intValue();
	}catch (Exception e){
	    printDebug(e.getMessage());
	    mediaPlayer.setVolumeLevel("4");
	    return;
	}

	setVolume(level + 1);
	
    }

    /**
     * Decreases the volume one unit.
     */
    public void decVolume(){
	String strLevel;
	int level;
	
	strLevel = mediaPlayer.getVolumeLevel();
	printDebug("decVolume: " + strLevel);
	
	try{
	    level = (new Integer(strLevel)).intValue();
	}catch (Exception e){
	    printDebug(e.getMessage());
	    mediaPlayer.setVolumeLevel("2");
	    return;
	}

	setVolume(level - 1);
	
    }
    
    /**
     * Sets the playback loop option
     * @param boolean loop
     */
    public void setLoop(boolean loop){
	mediaPlayer.setPlaybackLoop(loop);
    }

    /**
     * Gets the current volume level
     * @return int
     */
    public int getVolume(){
	try{
	    return (new Integer(mediaPlayer.getVolumeLevel())).intValue();
	} catch (Exception e){
	    return 3;
	}
    }
    
    /**
     * Destroys this window where the movie is playing.
     */
    public void destroy(){
       	if(mediaPlayer != null){
      	    mediaPlayer.stopAndDeallocate();
	    mediaPlayer.close();
	    mediaPlayer = null;
	}
	if(player != null){
	    player.close();
	    player = null;
	}
	dispose();

	// Die bloody frame, die!
	try{
	    finalize();
	}catch (Throwable e){
	    printDebug(e.getMessage());
	}
    }
    
    /**
     * window* methods needs to be here because we implement WindowListener.
     */    
    public void windowOpened(WindowEvent event) {
    }

    public void windowClosing(WindowEvent event) {
    }

    public void windowClosed(WindowEvent event) {
	destroy();
    }
    
    public void windowIconified(WindowEvent event){
	
    }

    public void windowDeiconified(WindowEvent event){
    }

    public void windowActivated(WindowEvent event){
    }

    public void windowDeactivated(WindowEvent event){
    }

    /**
     * Prints debug messages. Disabled when variable debug=false
     */
    public void printDebug(String str){
	if(debug){
	    System.out.println(str);
	}
    }
}

/**
 * Inner class used for detecting when the media has ended.
 * This is so we can restore the movie to original size if
 * we are in full screen mode.
 */
class MediaEventControl extends ControllerAdapter{
    private MovieScreen movieScreen;
    
    public MediaEventControl(MovieScreen movieScreen){
	this.movieScreen = movieScreen;
    }

    public void controllerUpdate(ControllerEvent event){
	if(event instanceof EndOfMediaEvent){
	    movieScreen.setFullScreen(false);
	}
    }
}

