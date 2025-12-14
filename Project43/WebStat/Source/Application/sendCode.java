import java.util.*;
import java.io.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class sendCode {
	public static void main(String[] args) {
	if (args.length != 6) {
	    usage();
	    System.exit(1);
	}

	System.out.println();

	String to = args[0];
	String from = args[1];
	String host = args[2];
	boolean debug = Boolean.valueOf(args[3]).booleanValue();
   String id = args[4];
   String Url = args[5];
   String fileName = "C:/javawebserver2.0/server.conf";
   String WebstatServer = ReadFile(fileName);

  String msgText = 
"Register complete\n"+
"ขอขอบคุณที่ใช้บริการกับทาง webstat  \n"+
"\n"+
"กรุณานำ source code ที่อยู่ข้างล่างนี้ไปใส่ไว้ในส่วน body หรือ head ที่หน้า webpage ที่ท่านได้ทำการลงทะเบียนกับทาง webstat ไว้ \n"+
"แล้วคุณจะได้รู้ว่า \"ความลับไม่มีในโลก\"\n"+
"\n"+
  "<script language=\"javascript\"><!--\n"+

"var idUser="+id+";\n"+
"var name = navigator.appName;\n"+
"var appPlatform = navigator.platform;\n"+
"var screenWidth = window.screen.width;\n"+
"var screenHeight = window.screen.height;\n"+
"var referrer = window.document.referrer;\n"+
"var time=new Date();\n"+
"var hours = time.getHours();\n"+
"var days=new Array(8);\n"+
"days[1]=\"Sunday\";\n"+
"days[2]=\"Monday\";\n"+
"days[3]=\"Tuesday\";\n"+
"days[4]=\"Wednesday\";\n"+
"days[5]=\"Thursday\";\n"+
"days[6]=\"Friday\";\n"+
"days[7]=\"Saturday\";\n"+
"var day=days[time.getDay() + 1];\n"+
"var date=time.getDate();\n"+
"var months=new Array(13);\n"+
"months[1]=\"January\";\n"+
"months[2]=\"February\";\n"+
"months[3]=\"March\";\n"+
"months[4]=\"April\";\n"+
"months[5]=\"May\";\n"+
"months[6]=\"June\";\n"+
"months[7]=\"July\";\n"+
"months[8]=\"August\";\n"+
"months[9]=\"September\";\n"+
"months[10]=\"October\";\n"+
"months[11]=\"November\";\n"+
"months[12]=\"December\";\n"+
"var month=months[time.getMonth() + 1];\n"+
"var year=time.getYear();\n"+
"if ((navigator.appName == \"Microsoft Internet Explorer\") && (year < 2000))	year=\"19\" + year;\n"+
"if (navigator.appName == \"Netscape\")  year=1900 + year;\n"+

"var userAgent = navigator.userAgent;\n"+
"var version;\n"+
"var os;\n"+

"if (userAgent.indexOf(\'MSIE 5.5\') != -1) version =\"InternetExplorer5.5\";\n"+
"else if (userAgent.indexOf(\'MSIE 5\') != -1) version =\"InternetExplorer5.0\";\n"+    
"else if (userAgent.indexOf(\'MSIE 4\') != -1)  version =\"InternetExplorer4.0\";\n"+
"else if (userAgent.indexOf(\'MSIE 3\') != -1)  version =\"InternetExplorer3.0\";\n"+
"else if (userAgent.indexOf(\"Mozilla/4.73\") != -1)  version =\"Netscape4.73\";\n"+
"else if (userAgent.indexOf(\"Mozilla/4.7\") != -1)  version =\"Netscape4.7\";\n"+
"else if (userAgent.indexOf(\"Mozilla/4.61\") != -1)  version =\"Netscape4.61\";\n"+
"else if (userAgent.indexOf(\"Mozilla/4.5\") != -1)  version =\"Netscape4.5\";\n"+
"else if (userAgent.indexOf(\"Mozilla/4\") != -1)  version =\"Netscape4.0\";\n"+
"else if (userAgent.indexOf(\"Mozilla/3\") != -1)  version =\"Netscape3.0\";\n"+
"else if (userAgent.indexOf(\"Mozilla/2\") != -1)  version =\"Netscape2\";\n"+
"else if (userAgent.indexOf(\"MSIE 4.5\") != -1)  version =\"InternetExplorer4.5\"; \n"+
"else version = \"Other\";\n"+

"if(userAgent.indexOf(\"IRIX\") != -1) os = \"Irix\";\n"+
"else if((userAgent.indexOf(\"Win\") != -1)&&(userAgent.indexOf(\"98\") != -1)) os = \"Windows98\";\n"+
"else if((userAgent.indexOf(\"Win\") != -1)&&(userAgent.indexOf(\"95\") != -1)) os = \"Windows95\";\n"+
"else if(userAgent.indexOf(\"16\") != -1) os = \"Windows3.1\";\n"+
"else if(userAgent.indexOf(\"NT 5.0\") != -1) os = \"Windows2000\";\n"+
"else if(userAgent.indexOf(\"NT\") != -1) os = \"WindowsNT\";\n"+
"else if(userAgent.indexOf(\"Sunos\") != -1) os = \"Sunos\";\n"+
"else if(userAgent.indexOf(\"Linux\") != -1) os = \"Linux\";\n"+
"else if(userAgent.indexOf(\"Mac\") != -1) os = \"Macintosh\";\n"+
"else if(userAgent==\"WebTV Internet Terminal\") os=\"WebTV\";\n"+
"else if(userAgent.indexOf(\"HP\") != -1) os=\"HP-UX\";\n"+
"else os = \"other\";\n"+

"if (referrer == \"\")\n"+
"referrer = \""+Url+"\";\n"+

"document.write(\n"+
"\'<A TARGET=\"_blank\" HREF=\'\n"+
"+\'\"http://"+WebstatServer+"/servlet/ReceiveData.class\">\');\n"+
"document.write(\'<IMG BORDER=\"0\" WIDTH=\"0\"\'+\n"+
"\'HEIGHT=\"0\" SRC=\"http://"+WebstatServer+"/servlet/ReceiveData.class?&idUser=\'\n"+
"+idUser+\'&hour=\'+hours+\'&day=\'+day+\'&date=\'\n"+
"+date+\'&month=\'+month+\'&year=\'+year+\'&name=\'\n"+
"+name+\'&appPlatform=\'+appPlatform+\'&screenWidth=\'\n"+
"+screenWidth+\'&screenHeight=\'+screenHeight+\'&referrer=\'\n"+
"+referrer+\'&version=\'+version+\'&os=\'+os+\'\">\');\n"+

"//-->\n"+
"</script>";
	
/////////////////////////////////////////	
//"\'<A TARGET=\"_blank\" HREF=\"http://161.246.5.118/servlet/ReceiveData.class\">\');\n"+

	// create some properties and get the default Session
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	if (debug) props.put("mail.debug", args[3]);

	Session session = Session.getDefaultInstance(props, null);
	session.setDebug(debug);

	try {
	    // create a message
	    Message msg = new MimeMessage(session);
	    msg.setFrom(new InternetAddress(from));
	    InternetAddress[] address = {new InternetAddress(args[0])};
	    msg.setRecipients(Message.RecipientType.TO, address);
	    msg.setSubject("WebStat Register");
	    msg.setSentDate(new Date());
	    // If the desired charset is known, you can use
	    // setText(text, charset)
	    msg.setText(msgText);
	    
	    Transport.send(msg);
	} catch (MessagingException mex) {
	    System.out.println("\n--Exception handling in msgsendsample.java");

	    mex.printStackTrace();
	    System.out.println();
	    Exception ex = mex;
	    do {
		if (ex instanceof SendFailedException) {
		    SendFailedException sfex = (SendFailedException)ex;
		    Address[] invalid = sfex.getInvalidAddresses();
		    if (invalid != null) {
			System.out.println("    ** Invalid Addresses");
			if (invalid != null) {
			    for (int i = 0; i < invalid.length; i++) 
				System.out.println("         " + invalid[i]);
			}
		    }
		    Address[] validUnsent = sfex.getValidUnsentAddresses();
		    if (validUnsent != null) {
			System.out.println("    ** ValidUnsent Addresses");
			if (validUnsent != null) {
			    for (int i = 0; i < validUnsent.length; i++) 
				System.out.println("         "+validUnsent[i]);
			}
		    }
		    Address[] validSent = sfex.getValidSentAddresses();
		    if (validSent != null) {
			System.out.println("    ** ValidSent Addresses");
			if (validSent != null) {
			    for (int i = 0; i < validSent.length; i++) 
				System.out.println("         "+validSent[i]);
			}
		    }
		}
		System.out.println();
		if (ex instanceof MessagingException)
		    ex = ((MessagingException)ex).getNextException();
		else
		    ex = null;
	    } while (ex != null);
	}
    }

    private static void usage() {
	System.out.println("usage: java msgsendsample <to> <from> <smtp> true|false <id> <url>");
    }
  
  static String ReadFile(String File) {
    String inPut=new String("");
    FileInputStream s;
    int readVar;

    try {
      s = new FileInputStream(File);
      readVar = 0;
      //--------------------Read File to String-----------
      while (readVar != ';') {
        try {
          readVar = s.read();
          inPut+=(char)readVar;
//          System.out.print("" + ((char)readVar));
        } catch (IOException e){
          System.out.println("Unknown IO error reading file " + File);
          System.exit(2);
        }
      } 
//      inPut = inPut.substring(inPut.indexOf("?"),1);
    } catch (FileNotFoundException e) {
      System.out.println("File " + File + " not found");
      System.exit(1);
    }
    System.out.println();
	inPut = inPut.substring(0,inPut.indexOf(';'));
    return inPut;
  }

}
