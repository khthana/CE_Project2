package dtw.webmail.model;

import java.util.*;
import javax.mail.*;
import dtw.webmail.JwmaKernel;

public class JwmaMessagePartImpl 
	implements JwmaMessagePart {

	private String myContentType;
        private String myContent;
	private String myDescription;
	private String myName;
	private int myNumber;
	private int mySize;
	
	public JwmaMessagePartImpl(int number) {
		myNumber=number;
	}//constructor

	public int getPartNumber() {
		return myNumber;
	}//getNumber
	
	public String getContentType() {
		return myContentType;
	}//getContentType
        
	public void setContentType(String type) {
		myContentType=type;
	}//setContentType
        
        public String getContent()
        {
          return myContent;
        }//getContent
        
        public void setContent(String ct)
        {
          myContent = ct;
        }//setContent
	
	public int getSize() {
		return mySize;
	}//getSize
	
	private void setSize(int size) {
		mySize=size;	
	}//setSize
		
	public String getName() {
		return myName;
	}//getName
	
	public void setName(String name) {
		myName=name;
	}//setName

	public String getDescription() {
		return myDescription;
	}//getDescription

	public void setDescription(String description) {
		myDescription=description;
	}//setDescription
	
	
	public static JwmaMessagePartImpl createJwmaMessagePartImpl(Part part, int number) {
		JwmaMessagePartImpl partinfo=
				new JwmaMessagePartImpl(number);
		
		//content type
		try {
			partinfo.setContentType(part.getContentType());
                        if (part.getContentType().toLowerCase().indexOf("text/plain") != -1) 
                        {
                          partinfo.setContent((String)part.getContent());
                        }
                        
		
			//size
			int size=part.getSize();
			JwmaKernel.getReference().debugLog().write("Part size="+size);
							
			//correct size of encoded parts
			String[] encoding=part.getHeader("Content-Transfer-Encoding");
			if(encoding!=null &&
				encoding.length>0 && 
				encoding[0].equalsIgnoreCase("base64")) {
				
				//an encoded file is about 35% smaller
				size=(int)(size*0.65);
				JwmaKernel.getReference().debugLog().write("Part size corrected="+size);
			}	
			
			partinfo.setSize(size);
			//description
			partinfo.setDescription(part.getDescription());
	
			//filename
			partinfo.setName(part.getFileName());
	
		} catch (Exception ex) {
			//handle? damn
			JwmaKernel.getReference().debugLog().writeStackTrace(ex);
		}
		
	
		return partinfo;	
	}//createJwmaMessagePartImpl

	public static JwmaMessagePartImpl createJwmaMessagePartImpl(int number) {
		return new JwmaMessagePartImpl(number);
	}//createMessagePartImpl
	
}//class JwmaMessagePartImpl