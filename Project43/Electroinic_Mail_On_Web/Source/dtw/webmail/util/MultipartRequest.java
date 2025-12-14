package dtw.webmail.util;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.mail.*;
import javax.mail.internet.*;

import dtw.webmail.model.JwmaMessagePartImpl;
import dtw.webmail.JwmaKernel;

public class MultipartRequest {

	//instance attributes
	private int myLimit=JwmaKernel.getReference().getFileLimit()*FORMDATA_LIMIT;
	
	private ServletRequest myRequest;
	private Hashtable myParameters;
	private FormdataMultipart myFormdataMultipart;
        
	 private static final int FORMDATA_LIMIT=1024 * 1024;  // 1 Meg        
 
 	/**
 	 * Constructs a <code>MultipartRequest</code> instance.
 	 * 
 	 * @return the newly constructed <code>MultipartRequest</code> instance.
 	 */
	 public MultipartRequest(ServletRequest request) 
	 		throws IOException {
	 			
    	myRequest=request;
     	processRequest();
     }//constructor
  
 
	 public Enumeration getParameterNames(){
		return myParameters.keys();
	 }//getParameterNames

	 public String getParameter(String name){
	 	if(myParameters.containsKey(name)) {
			return ((String[])myParameters.get(name))[0];		
	 	} else {
	 		return null;
	 	}
	 }//getParameter

	 public String[] getParameterValues(String name){
	 	if(myParameters.containsKey(name)) {
	 		return (String[])myParameters.get(name);
	 	} else {
	 		return null;
	 	}
	 }//getParameterValues
	
	 public boolean hasAttachments() 
	 		throws MessagingException {
	 
	 	return (myFormdataMultipart.getCount()>0);
	 }//hasAttachments
	 	
	 public MimeMultipart getAttachments() {
	 	return (MimeMultipart) myFormdataMultipart;
	 }//getAttachments
	 	
	 public void processRequest() 
	 		throws IOException {
    	
    	//first check on content length
		int length=myRequest.getContentLength();
		if (length>myLimit) {
			throw new IOException("Posted data exceeds limit of " +
			myLimit + " bytes.");
		}
		//then check for the content type and contained boundary
		String ctype=myRequest.getContentType();
		if(ctype.indexOf("--")==-1) {
			throw new IOException("Data malformed, missing multipart boundary:"+ctype);
		}
		if(ctype.indexOf("multipart/form-data")==-1) {
			throw new IOException("Can only handle an incoming multipart/form-data stream:"+ctype);
		}
		
    	MultipartInputStream myInputStream= new MultipartInputStream(
    		myRequest.getInputStream(),ctype,myLimit
    	);
    	try {
    		myFormdataMultipart=new FormdataMultipart(myInputStream);	
     		myParameters=myFormdataMultipart.getParameters();
     		
     	} catch (MessagingException mex) {
     		
     		JwmaKernel.getReference().debugLog().writeStackTrace(mex);
     		throw new IOException(mex.getMessage());
     	}
     }//processRequest
 
	

	  
}//class MultipartRequest




