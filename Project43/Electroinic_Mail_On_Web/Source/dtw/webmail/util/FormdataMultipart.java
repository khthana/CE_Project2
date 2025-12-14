package dtw.webmail.util;

import java.io.*;
import java.util.Hashtable;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import dtw.webmail.JwmaKernel;

public class FormdataMultipart extends MimeMultipart {

	//instance attributes
	private Hashtable myParams=new Hashtable();
	private boolean removed=false;

	 public FormdataMultipart() {
		super();
	 }//constructor

	 public FormdataMultipart(DataSource ds) 
			throws MessagingException,IOException {
		
		super(ds);
		processBodyParts();
		updateHeaders();
	 }//constructor
	
	 public Hashtable getParameters() {
		return myParams;
	 }//getParameters
	
	 private void processBodyParts()
		throws IOException,MessagingException {
     	
     	//if write out to log for debug reasons!
     	//ByteArrayOutputStream bout=new ByteArrayOutputStream();
     	//writeTo(bout);
     	//JwmaKernel.getReference().debugLog().write(bout.toString());		
     	
     			
		for(int i=0; i<getCount(); i++){
	    	MimeBodyPart mbp=(MimeBodyPart)getBodyPart(i);
	    	processBodyPart(mbp);
	    	if(removed) {
	    		removed=false;
	    		//decrease index i approbiately
	    		i--;
	    	}
		}
		setSubType("mixed");
		JwmaKernel.getReference().debugLog().write("Processed multipart/form-data. Attachment parts:"+getCount());
     }//processParts

	 private void processBodyPart(MimeBodyPart mbp) 
		throws MessagingException,IOException {
		
		
		String contenttype=new String(mbp.getContentType());
		JwmaKernel.getReference().debugLog().write("Processing "+contenttype);
		
		//check if a content-type is given
		String[] cts=mbp.getHeader("Content-Type");
		if(cts==null || cts.length==0){
			//this is a parameter, get it out and
			//remove the part.
			String controlname=extractName(
				(mbp.getHeader("Content-Disposition"))[0]);
			
			JwmaKernel.getReference().debugLog().write("Processing control:"+controlname);
			//retrieve value observing encoding
			InputStream in=mbp.getInputStream();
			String[] encoding=mbp.getHeader("Content-Transfer-Encoding");
			if(encoding!=null && encoding.length>0){
	   	 		in=MimeUtility.decode(in,encoding[0]);
			}
			
			String value=extractValue(in);	
			if(value!=null || !value.trim().equals("")) {
				addParameter(controlname,value);
			}
			//flag removal
			removed=true;
			removeBodyPart(mbp);	
		} else {
			String filename=extractFileName(
				(mbp.getHeader("Content-Disposition"))[0]);
				
			//normally without file the control should be not successful.
			//but neither netscape nor mircosoft iexploder care much.
			//the only feature is an empty filename.
			if(filename.equals("")) {
				//kick it out too
				removed=true;
				removeBodyPart(mbp);
			} else {
				//IExploder sends files with complete path. 
				//jwma doesnt want this.
				int lastindex=filename.lastIndexOf("\\");
				if(lastindex!=-1) {
					filename=filename.substring(lastindex+1,filename.length());
				}
			
				//the problem is that we have to encode it
				//obviously thats the only way to get this 
				//really working *sigh*
				InputStream in=mbp.getInputStream();
				//observe possible encoding
				String[] encoding=mbp.getHeader("Content-Transfer-Encoding");
				if(encoding!=null && encoding.length>0){
	   	 			in=MimeUtility.decode(in,encoding[0]);
				}
				ByteArrayOutputStream bout=new ByteArrayOutputStream();
				//We could enforce encoding
				//OutputStream out=MimeUtility.encode(bout,"base64");
				OutputStream out=(OutputStream) bout;
					
				int i=0;
				while((i=in.read())!=-1) {
					//maybe more efficient in buffers, but well
					out.write(i);
				}
				out.flush();
				out.close();
				
				MimeBodyPartDataSource mbpds=
					new MimeBodyPartDataSource(
						contenttype,filename,bout.toByteArray()
					);
				
				//restructure the Content-Disposition header
				mbp.removeHeader("Content-Disposition");
				mbp.addHeader(
					"Content-Disposition","attachment; filename=\""+
					filename+
					"\""
				);
				
				//set encoding und data handler with encoding
				mbp.addHeader("Content-Transfer-Encoding","base64");
				mbp.setDataHandler(new DataHandler(mbpds));				
			}	
		}
	 }//processBodyPart
	
	 private String extractName(String disposition)
		throws IOException {
	
		int end=0;
		int start=-1;
		
		start=disposition.indexOf("name=\""); 
		end=disposition.indexOf("\"",start+7);   //offset is to skip name=\"
		if (start==-1 || end==-1) {
			throw new IOException("Mime header malformed.");
		}
		return disposition.substring(start+6,end);
    }//extractName
 
     private String extractFileName(String disposition)
		throws IOException {
	
		int end=0;
		int start=-1;
		
		start=disposition.indexOf("filename=\""); 
		end=disposition.indexOf("\"",start+10);   //offset is to skip filename=\"
		if (start==-1 || end==-1) {
			throw new IOException("Mime header malformed.");
		}
		return disposition.substring(start+10,end);
     }//extractFileName

     private String extractValue(InputStream in) 
    		throws IOException {
    	
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		int i=0;
	    while ((i=in.read())!=-1) {
	    	out.write(i);
	    }
	    out.flush();
	    out.close();
	    in.close();
	    
	    JwmaKernel.getReference().debugLog().write("Retrieved value="+out.toString());
	    //apply a little bit of magic when returning
	    return out.toString("iso-8859-1");
     }//extractValue

	 private void addParameter(String name, String value) {
		String values[];
	
		JwmaKernel.getReference().debugLog().write("Adding "+name+"="+value);
	
		if (myParams.containsKey(name)) {
	    	String oldValues[]=(String[])myParams.get(name);
	    	values=new String[oldValues.length + 1];
	    	for (int i = 0; i < oldValues.length; i++) {
				values[i] = oldValues[i];
	    	}
	    	values[oldValues.length]=value;
		} else {
	    	values=new String[1];
	    	values[0]=value;
		}
		myParams.put(name, values);
     }//addParameter

}//FormdataMultipart
