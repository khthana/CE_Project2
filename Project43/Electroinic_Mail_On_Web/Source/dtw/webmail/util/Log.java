package dtw.webmail.util;

import java.util.*;
import java.text.SimpleDateFormat;
import java.io.*;

 public class Log {
 
 	//instance attributes
 	private SimpleDateFormat dateformat;
 	private OutputStreamWriter writer;
 	private ByteArrayOutputStream bout;
 	private PrintWriter pw;
 	private String stacktrace;
 	private boolean active=true;

	 private Log(OutputStreamWriter wri,String stampformat){
		//set writer
		writer=wri;
		//prepare dateformat
		dateformat=new SimpleDateFormat(stampformat);
		//prepare streams for stacktracewriting
		bout=new ByteArrayOutputStream(512);
    	pw=new PrintWriter(bout);
	 }//constructor
	 
	 

	 public synchronized void write(String msg){
		if(!active) {
			return;
		} else {
			try {
				writer.write(getLogDateTime()+" "+msg+"\n");
				writer.flush();
			} catch (Exception ex){
				//log failure will dump shit to screen , well thats ok
				ex.printStackTrace();
			}
		}
	 }//write
	
	 public synchronized void writeStackTrace(Exception ex) {
    	if (!active) {
    		return;
    	} else {
    		try {
     			ex.printStackTrace(pw);
        		pw.flush();
       			stacktrace="Exception occured:\n"+bout.toString()+"\n";
       		} catch (Exception exc){
       			stacktrace="Logging exception failed.";
       		} finally {
       			//empty the bytebuffer
       			bout.reset();
       		}
       		write(stacktrace);
       	}
	 }//logStackTrace
	
	 public String getLogDateTime() {
		return dateformat.format(new Date());
	 }//getLogDateTime
	 
	 public void setActive(boolean b) {
	 	active=b;
	 }//setActive
	
	 public boolean isActive() {
	 	return active;
	 }//isActive
	 
	 private static OutputStreamWriter prepareFileLog(String fpath)
	 		throws Exception {

	 	//filewriter stream
	 	return new FileWriter(new File(fpath));
	 }//prepareLog


	 public static Log createStreamLog(OutputStream stream,String stampformat)
			throws Exception {
		return new Log(new OutputStreamWriter(stream),stampformat);
	 }//createStreamLog
	
	
	 public static Log createFileLog(String fpath,String stampformat)
			throws Exception {
		return new Log(prepareFileLog(fpath),stampformat);
	 }//createLog

	
}//class Log