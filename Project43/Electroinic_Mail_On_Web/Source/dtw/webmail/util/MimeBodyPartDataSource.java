package dtw.webmail.util;

import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class MimeBodyPartDataSource 
	implements DataSource {

	//instance attributes
	private String myType;
	private String myName;
	private byte[] myData;

	 public MimeBodyPartDataSource(
		String type, String name,byte[] data) {
		
		myType=type;
		myName=name;
		myData=data;
	 }//constructore

	 public String getContentType(){
		return myType;
	 }//getContentType

	 public String getName(){
		return myName;
	 }//getName

	 public InputStream getInputStream() 
			throws IOException {
			
		return new ByteArrayInputStream(myData);
	 }//getInputStream

	 public OutputStream getOutputStream() 
			throws IOException {
	
		throw new IOException(
			"Not supported."
		);
	 }//getOutputStream

}//class MimeBodyPartDataSource