
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import java.awt.image.*;
import javax.swing.*;
import javax.swing.filechooser.*;
import javax.imageio.ImageIO;
public class Imagemaker {
    static String returnpath;
    String p,pathImage;
    /** Creates a new instance of Imagemaker */
    public Imagemaker() {
    }

 
       /**
         * Save the buffered image to a file.  Image format should be png, gif, jpg
         */
        protected void saveToFile(BufferedImage bi,String[] filename,final String imageFormat,String rootpath) {
            //
            // Guess at file name
            //
            //String frameTitle = title.replaceAll("[^a-zA-Z0-9]", "_");
            /*
            //
            // Set up a file chooser for png files
            //
            JFileChooser fc = new JFileChooser();
            fc.setSelectedFile(new File(System.getProperty("user.dir"),frameTitle + "." + imageFormat));
            
            fc.addChoosableFileFilter(new javax.swing.filechooser.FileFilter() {
                public boolean accept(File f) {
                    return(f.toString().endsWith("." + imageFormat));
                }
                public String getDescription() {
                    return  imageFormat.toUpperCase() + " Images";
                }
            });
             
            int rc = fc.showSaveDialog(null);
            
            if(rc != JFileChooser.APPROVE_OPTION) {
                return;
            }
            */
             //
            // If save selected, write out the buffered image.
            //
            //File outfile = fc.getSelectedFile();
            	
            
        File path;
	System.out.println (">>>>> rootpath in Imagemaker  " + rootpath);
    	//path = new File("d:\\BackupVDO\\"+ filename[0] + "\\snap shot");
    	path = new File(rootpath + filename[0] + "\\snap shot");
	   
    	if(path.exists()){
	   		if(path.isDirectory())
	   		    //System.out.println ("d:\\BackupVDO\\"+ filename[0] + "\\snap shot is exists.");
			    
	   		     path = new File(rootpath + filename[0] + "\\snap shot");
	   		else
	   			path.mkdir();	   	
	    } 
	    else
	    { 
	     	path.mkdir();
                System.out.println("make" + path);
            }
       	
       	//pathImage = "d:\\BackupVDO\\"+ filename[0] + "\\snap shot\\";
       	pathImage = rootpath + "\\" + filename[0] + "\\\\snap shot\\";
        p = rootpath + filename[0] + "\\snap shot\\" + filename[1] + "."+imageFormat;
            File outfile;
            outfile = new File(p);
            returnpath = pathImage;
            try {
                ImageIO.write(bi,imageFormat,outfile);
                System.out.println("Save Image complete");
            } catch(Exception ex) {
                //JOptionPane.showMessageDialog(null,"Error " + ex.getMessage());
            }
            
        }
        public static String getImagepath(){
            return returnpath;
        }
    
}
