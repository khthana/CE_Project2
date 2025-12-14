package dtw.webmail.model;

import java.util.*;
import java.text.*;
import dtw.webmail.*;

public class JwmaHtmlHelperImpl implements JwmaHtmlHelper {
	
	public JwmaHtmlHelperImpl() {
	}//constructor
	
	public String getControllerUrl() {
		return JwmaKernel.getReference().getControllerUrl();
	}//getControllerUrl

	public String getPathHierarchyNavigator(String path) {
		String clickurl=
			"<a href=\""+
			getControllerUrl()+
			"?acton=folder&todo=display&path={0}\">{1}</a>";
			
		String fname="";
		//JwmaKernel.getReference().debugLog().write("Path="+path+";ClickUrl="+clickurl);
 		StringBuffer fpath=new StringBuffer();
 		StringBuffer hierarchy=new StringBuffer();
 		StringTokenizer strtok= new StringTokenizer(path,"/",false);
    	int i=0;
    
    	while (strtok.hasMoreElements()) {
    		fname=strtok.nextToken();
    		if (i>0) {
    			fpath.append("/");
				hierarchy.append("/");
    		}
    		fpath.append(fname);
			if (strtok.countTokens()==0) {
				hierarchy.append(fname);
			} else {
				Object[]args= {fpath,fname};
				hierarchy.append(MessageFormat.format(clickurl,args));
			}
			i++;
    	}
 		return hierarchy.toString();
	}//getPathNavigator

	public String getFolderDisplayAction(String path) {
		return getControllerUrl()+"?acton=folder&todo=display&path="+path;
	}//getFolderDisplayAction
	
	public String getMailboxDisplayAction(String path) {
		return getControllerUrl()+"?acton=mailbox&todo=display&path="+path;
	}//getMailboxDisplayAction

	public String getDestinationsSelect(String[] paths) {
		StringBuffer buf=new StringBuffer("<select name=\"destination\">");
		for(int i=0;i<paths.length;i++) {
			buf.append("  <option value="+ paths[i] + ">" + paths[i] + "</option>");
		}
		buf.append("</select>");
		return buf.toString();
	}//getDestinationsSelection

	public String getFrequentSelect(JwmaAddressBook book,String eventhandler) {
		String[] fnicks=book.listNicknames(true);
		StringBuffer buf=new StringBuffer("<select name=\"frequent\"");
		
		if(eventhandler!=null) { 
			buf.append(eventhandler);
		}
		buf.append(">\n");
		buf.append("<option value=\"\" selected>Select frequent</option>\n");
		for(int i=0;i<fnicks.length;i++) {
			JwmaAddress add=book.getAddress(fnicks[i]);
			buf.append("  <option value=\"")
			   .append(add.getFirstname())
			   .append(" ")
			   .append(add.getLastname())
			   .append("<")	
			   .append(add.getEmail())
			   .append(">")
			   .append("\">")
			   .append(fnicks[i])
			   .append("</option>\n");
		}
		buf.append("</select>\n");
		return buf.toString();
	}//getFrequentSelect

	public String displayPartsInlined(JwmaMessagePart[] parts) {
		StringBuffer sbuf=new StringBuffer();
	
		String type="";
		
		for(int n=0;n<parts.length;n++) {			
			//get type
			type=parts[n].getContentType();
			//handle different types
			if(type.indexOf("text")!=-1) {
				//text types
				if(type.indexOf("plain")!=-1) {
					sbuf.append("<pre>");
				} 
				sbuf.append("<jsp:include page=\"")
					.append(getControllerUrl())
					.append("?acton=message&todo=displaypart&number=")
					.append(parts[n].getPartNumber())
					.append("\" />"); 
				if(type.indexOf("plain")!=-1) {
					sbuf.append("</pre>");
				}	
			} else if(type.indexOf("image")!=-1) {
				
			
			} 
		}
		
		return sbuf.toString();
	}//displayParts
        
        public String getPartDescription(JwmaMessagePart part,int no)
        {
          String tmp = "";
          JwmaKernel.getReference().debugLog().write("message no = " + Integer.toString(no));
          JwmaKernel.getReference().debugLog().write(part.getContentType());
          JwmaKernel.getReference().debugLog().write(part.getContent());
          if (no != 0)
          {
		StringBuffer sbuf=new StringBuffer("<p>");
		sbuf.append("<b>Part #").append(part.getPartNumber())
			.append("</b> (<i>")
			.append(part.getContentType())
			.append("</i>)")
			.append("<br>\n")
			.append("<b>Filename:</b>")
			.append("<a href=\"")
			.append(getControllerUrl())
			.append("?acton=message&todo=displaypart&number=")
			.append(part.getPartNumber())
			.append("&name=/")
			.append(part.getName())
			.append("\">")
			.append(part.getName())
			.append("</a>");
                //==================================================================================
                //    Modify 15/3/2001 5:08PM
                if (JwmaKernel.getReference().getMailClientProtocol().equals("imap")) 
                {
                  sbuf.append("(<i>").append(getSizeString(part.getSize())).append("</i>)");
                }
                //==================================================================================
                
			sbuf.append(" ========> <a href=javascript:openWindow(\"")
			.append(getControllerUrl())
			.append("?acton=message&todo=scanpart&number=")
			.append(part.getPartNumber()+"\");")
			.append(">")
			.append("<b>Scanvirus</b>")
			.append("</a>");
                
                        sbuf.append("<br>\n").append("</p>\n");
		tmp = sbuf.toString();
          }
          else  if ((no == 0) && (part.getContentType().toLowerCase().indexOf("text/plain") != -1))
          {
            StringBuffer sbuf=new StringBuffer("<p>");
            		sbuf.append("<b>Part #").append(part.getPartNumber())
			.append("</b> (<i>")
			.append(part.getContentType())
			.append("</i>)")
			.append("<br><br>\n")
			.append(replacenewline(part.getContent()))
                        .append("<br></p>\n\n");
            tmp = sbuf.toString();

          }
          return tmp;
        
        }//getPartDescription
	
	/*public String getPartDescription(JwmaMessagePart part) {
		
		StringBuffer sbuf=new StringBuffer("<p>");
		sbuf.append("<b>Part #").append(part.getPartNumber())
			.append("</b> (<i>")
			.append(part.getContentType())
			.append("</i>)")
			.append("<br>\n")
			.append("<b>Filename:</b>")
			.append("<a href=\"")
			.append(getControllerUrl())
			.append("?acton=message&todo=displaypart&number=")
			.append(part.getPartNumber())
			.append("&name=/")
			.append(part.getName())
			.append("\">")
			.append(part.getName())
			.append("</a>");
                //==================================================================================
                //    Modify 15/3/2001 5:08PM
                if (JwmaKernel.getReference().getMailClientProtocol().equals("imap")) 
                {
                  sbuf.append("(<i>").append(getSizeString(part.getSize())).append("</i>)");
                }
                //==================================================================================
                
			sbuf.append(" ========> <a href=\"")
			.append(getControllerUrl())
			.append("?acton=message&todo=scanpart&number=")
			.append(part.getPartNumber())
			.append("\">")
			.append("<b>Scanvirus</b>")
			.append("</a>");
                
                        sbuf.append("<br>\n").append("</p>\n");
		return sbuf.toString();
	}//getPartDescription*/
	
	public String getSizeString(int size) {
        int steps=0;
        while(size>1024) {
          size=size/1024;
          steps++;
        }
        if(steps==0) {
                return size+" bytes";
        } else if(steps==1) {
                return size+" kB";
        } else if(steps==2){
                return size+" MB";
        } else {
                return "Huge ;)";
        }
   }//getSizeString

  public String replacenewline(String text)
  {
    String temp = "";
    while (text.indexOf("\n") != -1)
    {
      temp = text;
      String temp1 = text.substring(0,text.indexOf("\n"));
      String temp2 = text.substring(text.indexOf("\n"));
      
      //temp1.replace('\n','<');
      temp1 = temp1 + "<br>";  // abc\n --> abc<br>
      
      if (temp2.indexOf("\n") != temp2.length()-1) 
      {
        temp2 = temp2.substring(temp2.indexOf("\n") + 1,temp2.length());  // \nabc --> abc
      }
      else
      {
        temp2 = temp2.trim(); //  abc\n --> abc
      }
      text = temp1 + temp2;
    }
    temp = text;
    return temp;
  }
   
	
}//class JwmaHtmlHelperImpl