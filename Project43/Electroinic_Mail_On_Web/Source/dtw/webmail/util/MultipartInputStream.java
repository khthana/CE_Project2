package dtw.webmail.util;

import java.io.*;
import javax.activation.DataSource;

public class MultipartInputStream 
	extends FilterInputStream
	implements DataSource {

	//instance attributes
	private int myLimit;
	private String myContentType;
	private int bytesRead=0;
	
	 public MultipartInputStream(InputStream in, String ctype, int readlimit) {
        super((InputStream)in);
        myContentType=ctype;
        myLimit=readlimit;
	 }//constructor
	
	 public String getName() {
		return("form_data");
	 }//getName

	 public String getContentType() {
		return myContentType;
	 }//getContentType
	
	 public InputStream getInputStream() 
			throws IOException {
			
		return (InputStream)this;
	 }//getInputStream

	 public OutputStream getOutputStream() 
			throws IOException {
		
		throw new IOException("Cannot output to this source.");
	 }//getOutputStream
	
	 public int read() throws IOException {
		bytesRead++;
		checkLimit();
		return super.read();
	 }//read

     public int read(byte b[],int off , int len)
		throws IOException {
		bytesRead+=len;
		checkLimit();
		return super.read(b,off,len);
	 }//read
	
	 private void checkLimit() 
			throws IOException {
		
		if(bytesRead>myLimit) {
			throw new IOException("Input limit exceeded.");	
		}
	 }//checkLimit
	
}//class MultipartInputStream
