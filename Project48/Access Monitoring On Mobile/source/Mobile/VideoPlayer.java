import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import java.io.*;
import java.util.*;		


/** A simple video player MIDlet using JSR 135 - Mobile Media API */
public class VideoPlayer extends MIDlet implements CommandListener
{
        
	private Display display;
	private TextField textField; 
        
 //      public initForm;        
	public Form form;
        private Form initForm;
        private TextField urlBox;
        private TextField userid;
        private TextField password;
        private Command sendCmd;
        private Command exitCmd;
        
	private Gauge gauge;
        private Gauge Imggauge;
        private StringItem strLabel;
        
        //msg form
        private StringItem strTest;
        private Form msgForm;
        private Command logCheckCmd;
   
        	//option form		
		public List optList;
		private Command optCmd;
		private String[] options={"Recently", "Select by Date"};	
        
        
        
        // declare cookies variable
        private Vector cookies;

        
        //event form
	public Form eventForm;
	private Command eventCmd;
        private Command backeventCmd;
        private Command backsearchCmd;
        private TextField dayBox;
        private TextField monthBox;
        private TextField yearBox;
        public List eventList;
        private List recentlyList;
        	
        //preview image form
        public Form imageForm;
        private Command previewCmd;
        private Command backpreviewCmd;
        private Command backrecentlyCmd;       
        private Image img;
              
        //report form
        public  Form reportForm;     
       	private Command playCommand;
        private Command reportbackCmd;
        		
        //declare Variable
	private static final int GAUGE_LEVELS = 4;
	private static final int GAUGE_MAX = 12;
	private static final String DEFAULT_URL ="http://161.246.5.125:8084/VideoServlet/";
        //check login valid
        private String logState;
        private String resultString ;
        //search event
        private String playurl;
        
        private String [] urlset= new String[100];
        private String [] timeset= new String[100];
        private String [] imgset=new String[100];
        int index;
        
        
        Vector seturl = new Vector();
        Vector settime=new Vector();
        Vector setimag=new Vector();
        
        //recently
        String recentlytmp[];
        String urlrecently;
        String imgrecently;
        String daterecently;
        public String checkOpt;
        

        
        public VideoPlayer(){
            display = Display.getDisplay(this);
            form =new Form("Access Monitoring");
            urlBox= new TextField("Server URL", DEFAULT_URL, 100, TextField.URL);
            initForm=new Form("Access Monitoring");
	    userid=new TextField("Username","komate",25,TextField.ANY);
	    password=new TextField("Password","1593",15,TextField.PASSWORD);            
            gauge = new Gauge("Acquiring video", false, GAUGE_MAX, 0);
            Imggauge = new Gauge("Acquiring image", false, GAUGE_MAX, 0);
            exitCmd=new Command("Exit",Command.EXIT,1);
            sendCmd=new Command("OK",Command.OK,1);            
            
        // msgForm 
        msgForm = new Form("GET Result:");
        logCheckCmd= new Command("Continue",Command.OK, 1); 
           
        //option form
	optList=new List("Select Option",List.IMPLICIT,options,null);     
        //Add option list 
	optList.setCommandListener(this);			
                                  
        //event form
	eventForm =new Form("SearchEvent");
	eventCmd = new Command("OK event",Command.OK, 1);
        backeventCmd = new Command("Back",Command.BACK, 2);
        dayBox= new TextField("Day", "", 2, TextField.DECIMAL);
        monthBox=new TextField("Month", "", 2, TextField.DECIMAL);
        yearBox=new TextField("Year","", 4, TextField.DECIMAL);
        
        eventForm.append(dayBox);
        eventForm.append(monthBox);
        eventForm.append(yearBox);  
        eventForm.addCommand(eventCmd);
        eventForm.addCommand(backeventCmd);
        
       
        
       //preview image form
        imageForm=new Form("Preview Event");
        playCommand=new Command("Play",Command.OK, 1);
        backpreviewCmd=new Command("Back",Command.BACK, 2);
        backrecentlyCmd=new Command("Back",Command.BACK, 2);
        
        imageForm.addCommand(playCommand);

               
       
        //report form
        reportbackCmd=new Command("back",Command.BACK,2);
                        
        //init form 
            initForm.addCommand(sendCmd);
            initForm.addCommand(exitCmd);
            initForm.append(urlBox);
            initForm.append(userid);
            initForm.append(password);   
            initForm.setCommandListener(this);
           
        }
        
	public void startApp(){				
		display.setCurrent(initForm);				
	}
	

	public void pauseApp(){	
	}
	
	
	public void destroyApp(boolean unconditional){	
	}
	
	
	public void commandAction(Command c, Displayable s){		
		
		if(c == exitCmd){
			destroyApp(false);
			notifyDestroyed();	
		}
                else if(c==sendCmd){
            
                 logState="";

                 String urlLogin=urlBox.getString()+"?userid="+userid.getString()+"&password="+password.getString();
                                          
        // send userid,password to login & recieve login status     
   
           try {
                logState = LoginRequest(urlLogin);
            } 
	   catch (IOException e) {
                logState = "ERROR";
            }
            
                  
           logState=logState.trim();  
           
           String str="loginvalid";
           String loginMsg=null;
           
                    //compare loginvalid
                   if(logState.equals(str)){
                    loginMsg="Login Success";
                   }
                   else{
                    loginMsg="Login Failed!!!";
                   }
                       
          System.out.println(loginMsg);
        
            //login status
            strLabel = new StringItem(null,loginMsg);  
            msgForm.append(strLabel);
            msgForm.addCommand(logCheckCmd);        			
            msgForm.setCommandListener(this);
            display.setCurrent(msgForm);         
  
                }
                                
                else if(c == logCheckCmd){
                    String str="loginvalid";
                    //compare loginvalid
                   if(logState.equals(str)){
                        eventForm.setCommandListener(this);
                        display.setCurrent(optList);                      
                   }
                   else{
                        //clear msgForm
                       msgForm.deleteAll();
                       initForm.setCommandListener(this);
                       display.setCurrent(initForm);
                   }
                }      
                           
 		else if(s==optList && c==List.SELECT_COMMAND) {				
			switch(optList.getSelectedIndex()) 
			{
				case 0:		
				//	System.out.println(options[((List)s).getSelectedIndex()] + " is selected");
                                        String url=urlBox.getString()+"?id=recently";
                                        
                                       // send userid,password to login & recieve login status     
                                        try {
                                            resultString = sendGetQuery(url);
                                        } 
                                        catch (IOException e) {
                                            resultString = "ERROR";
                                        }
                                        //recently  state
                                        checkOpt="recently";
                                        resultString=resultString.trim();
                                       System.out.println(resultString);
                                        recentlytmp=new String[1];
                                        recentlytmp[0]=resultString.substring(0, resultString.indexOf(';'));
                                        urlrecently=resultString.substring(resultString.indexOf(';')+1, resultString.indexOf('#'));
                                        imgrecently=resultString.substring(resultString.indexOf('#')+1, resultString.indexOf('@')); 
                                        daterecently=resultString.substring(resultString.indexOf('@')+1,resultString.length());
                                        System.out.println(urlrecently);
                                        System.out.println(imgrecently);
                                        System.out.println(daterecently);
                                        recentlyList=new List("Recently Event", List.IMPLICIT, recentlytmp, null);
                                       
                                        recentlyList.setCommandListener(this);
                                        display.setCurrent(recentlyList);    
                                        
					break;		
				case 1:		
                                        checkOpt="event";
					display.setCurrent(eventForm);
					eventForm.setCommandListener(this);
					break;		
			}
		}
                       
                
                //list recently event to select
                else if(s==recentlyList && c==List.SELECT_COMMAND){
                 try{
                      img=getImage(imgrecently); 
                   }
                   catch(IOException e){
                       System.out.print("image error");
                   }
                  playurl=urlrecently;
                  ImageItem imgPreview = new ImageItem("Date: "+daterecently+" \n Time "+recentlytmp[0], img, ImageItem.LAYOUT_CENTER, " ");
                  
                  imageForm.append(imgPreview);

                  imageForm.removeCommand(backpreviewCmd);
                  imageForm.addCommand(backrecentlyCmd);
                  imageForm.setCommandListener(this);
                  display.setCurrent(imageForm);    
                                                                                          
                }
                
                //search event
                else if(c == eventCmd){
                    String url=urlBox.getString()+"?id="+yearBox.getString()+"-"+monthBox.getString()+"-"+dayBox.getString();
                    
                // send userid,password to login & recieve login status     
                    try {
                        resultString = sendGetQuery(url);
                         } 
                    catch (IOException e) {
                        resultString = "ERROR";
                        }
                    resultString=resultString.trim();
         //         System.out.println(resultString);
                    
                           String timestr=resultString.substring(0, resultString.indexOf('@'));
                           String urlstr=resultString.substring(resultString.indexOf('@')+1,resultString.indexOf('$') );
                           String imgstr=resultString.substring(resultString.indexOf('$')+1, resultString.length());
                       System.out.println(timestr);
                        System.out.println(urlstr);
                       System.out.println(imgstr);
                       
                       //clear array 
                       for(int Index=0;Index<urlset.length;Index++){
                           urlset[Index]=null;
                           imgset[Index]=null;
                           timeset[Index]=null;
                       }
                       
                                                // cut time set
                                                String sub="";
                                                int j=0;
                                                for(int i=0;i<timestr.length();i++){        
                                                if(timestr.charAt(i)!=';'){             
                                                sub=sub+timestr.charAt(i);               
                                                }
                                                else{                                              
                                                timeset[j]=sub;
                                                // settime.addElement(sub);
                                                 
                                                j++;
                                                sub="";
                                                    }          
                                                }                                         
                                               int count=0;
                                               for(int i=0;i<timeset.length;i++){
                                               if(timeset[i]!=null){
                                                    count++;
                                   //                System.out.println(timeset[i]);
                                    //               System.out.println(count);
                                                    }                                                       
                                                }
                                               
                                               // cut url set
                                                sub="";
                                                j=0;
                                                for(int i=0;i<urlstr.length();i++){        
                                                if(urlstr.charAt(i)!=';'){             
                                                sub=sub+urlstr.charAt(i);               
                                                }
                                                else{
                                                urlset[j]=sub;
                                                j++;
                                                sub="";
                                                   }          
                                                }   
                                                
                                                // cut img set
                                                sub="";
                                                j=0;
                                                for(int i=0;i<imgstr.length();i++){        
                                                if(imgstr.charAt(i)!=';'){
                
                                                sub=sub+imgstr.charAt(i);
                
                                                }
                                                else{
                                                imgset[j]=sub;
                                                j++;
                                                sub="";
                                                   }          
                                                } 

                                               
                                         
                    //list event by time  show in eventlist                                                                     
                    String listtime[]=new String[count];
                    
                    for(int i=0;i<count;i++){
                        listtime[i]=timeset[i];
                        System.out.println(listtime[i]);
                    }
                    
                     //if no event  
                    if(timeset[0]==null)
                    {
                    reportForm =new Form("List event");                   
                    strLabel = new StringItem(null,"No event");                                                        
                    reportForm.append(strLabel);
 
                    reportForm.addCommand(reportbackCmd);
                    reportForm.setCommandListener(this);
                    display.setCurrent(reportForm); 
                    }
                    //list event by time
                    else{
                    eventList=new List("Select Event", List.IMPLICIT, listtime, null);    
                    backsearchCmd = new Command("Back",Command.BACK, 2);
                    eventList.addCommand(backsearchCmd);
                    eventList.setCommandListener(this);
                    display.setCurrent(eventList);    
                    }
                    
               
                }
                
                //go to option list
                else if(c == backeventCmd){
                    eventForm.setCommandListener(this);
                    display.setCurrent(optList); 
                }
                                                                           
                // list event select to preview image
                else if(s==eventList && c==List.SELECT_COMMAND){
                   index=eventList.getSelectedIndex();
                   try{
                      System.out.println(imgset[index]);
                      img=getImage(imgset[index]); 
                      
                   }
                   catch(IOException e){
                       System.out.print("image error");
                   }
                  playurl=urlset[index];
                  System.out.println(urlset[index]);
                  ImageItem imgPreview = new ImageItem("Time "+timeset[index], img, ImageItem.LAYOUT_CENTER, " ");                  
                  imageForm.append(imgPreview);
     //           imageForm.append(Imggauge);
                  imageForm.addCommand(backpreviewCmd);
                  imageForm.setCommandListener(this);
                  display.setCurrent(imageForm);    
                                                        
                }
                
                //back to eventList
                else if (c==backpreviewCmd){
                   imageForm.deleteAll();
                   display.setCurrent(eventList);
                }
                //back to OptionList
                else if(c==backrecentlyCmd){
                    imageForm.deleteAll();
                    display.setCurrent(optList);
                }
                //back to searchevent from no event
                else if (c ==reportbackCmd){
                    display.setCurrent(eventForm);
                }
				
                 //back to searchevent from eventlist
                else if (c ==backsearchCmd){
                    display.setCurrent(eventForm);
                }
                
		else if(c == playCommand){						
			gauge.setValue(0);
			form.append(gauge);						
			VideoCanvas videoCanvas = new VideoCanvas(this);
                        System.out.println(playurl);                       
			videoCanvas.initializeVideo(playurl);
                        display.setCurrent(form);
		}	
		

	}
	
        // for login
	 public String LoginRequest(String urlstring) throws IOException 
	{
		// กำหนดตัวแปรออปเจ็กต์ hc สำหรับการเชื่อมโยงของ HTTP
        HttpConnection hc = null;

		// กำหนดตัวแปรออปเจ็กต์ dis ใช้เป็นสตรีมสำหรับอินพุตข้อมูล
        DataInputStream dis = null;
        
		// ใช้บรรจุข่าวสารที่ส่งมาจากเว็บเซิร์ฟเวอร์
        String message = "";
        try {
			// เปิดการเชื่อมโยงของ HTTP กับเว็บเซิร์ฟเวอร์ จะใช้
			// เมธอด GET ของการร้องขอโดยอัตโนมัติ
            hc = (HttpConnection) Connector.open(urlstring);

			// สร้างออปเจ็กต์ dis เป็นสตรีมของการอินพุตข้อมูล
			// ที่ได้รับจากการเชื่อมโยงของ HTTP
            dis = new DataInputStream(hc.openInputStream());
            int ch;
			// ตรวจสอบการอ่านข่าวสารจากสตรีมของการอินพุตข้อมูล
            while ((ch = dis.read()) != -1) 
			{
				// บรรจุข่าวสารที่ส่งมาจากเว็บเซิร์ฟเวอร์
                message = message + (char) ch;
            }
            
   
        //recieve cookie         
            
        cookies = new Vector();    
           		// กำหนดดัชนีของฟิลด์ส่วนหัวเริ่มจาก 0
        int headerFieldIndex = 0;

		// สร้างออปเจ็กต์ cookies บรรจุข้อมูลแบบอะเรย์ สามารถ
		// ขยายหน่วยความจำโดยอัตโนมัติ
        

        while (true) 
		{
		  // ได้รับส่วนหัวของข่าวสารของ HTTP ตามที่ดัชนี headerFieldIndex ระบุ
          String httpMessageHeader = hc.getHeaderField(headerFieldIndex);

		  // ตรวจสอบว่ามีส่วนหัวของข่าวสารของ HTTP หรือไม่
          if (httpMessageHeader == null) 
		  {
            break;
          }
		  // ได้รับคีย์ของฟิลด์ส่วนหัวของ HTTP ตามที่ดัชนี headFieldIndex ระบุ
		  // เช่น เมื่อดัชนี headerFieldIndex เป็น 0 จะได้คีย์ของฟิลด์ส่วนหัวเป็น
		  // content-type และส่วนหัวข่าวสารของ HTTP เป็น text-plain
          String headerFieldKey = hc.getHeaderFieldKey(headerFieldIndex);

		  // เพิ่มดัชนีของฟิลด์ส่วนหัวของ HTTP อีก 1 
          ++headerFieldIndex;

		  // บรรจุคีย์ของฟิลด์ส่วนหัวของ HTTP เป็นตัวพิมพ์เล็ก เช่น set-cookie
          String hfk = headerFieldKey.toLowerCase();

		  // ตรวจสอบการมีคุกกี้ที่คีย์ของฟิลด์ส่วนหัวของ HTTP
          if (hfk.indexOf("cookie") < 0) 
		  {
			// ออกไปทำงานที่คำสั่งถัดจากบล็อกของคำสั่ง while
            continue;
          }
		  // หาตำแหน่งที่พบเครื่องหมาย ; ในส่วนหัวข่าวสารของ HTTP
		  // เช่น JSESSIONID=m22hdqj9cl;Path=j3pJ2ME จะพบเครื่อง
		  // หมาย ; อยู่ตำแหน่งที่ 21 (J เริ่มที่ตำแหน่ง 0 )		
          int pos = httpMessageHeader.indexOf(';');

		  // ใช้เก็บค่าของคุกกี้ (cookie)
          String cookieValue;

		  // ตรวจสอบตำแหน่งที่พบเครื่องหมาย ;
          if (pos >= 0) 
		  {
			// ค่าของคุกกี้จะได้  เช่น JSESSIONID=m22hdqj9cl
            cookieValue = httpMessageHeader.substring(0, pos);
         
          }
          else 
		  {
            // กำหนดค่าของคุกกี้
			cookieValue = httpMessageHeader;
          }
		  // เพิ่มค่าของคุกกี้ให้ออปเจ็กต์ cookies
          cookies.addElement(cookieValue);
   //       System.out.println(cookieValue);
        }  
                     
        } 
       
		finally {
			// ถ้ายังมีการเชื่อมโยงของ HTTP ให้ปิดการเชื่อมโยงนั้น
            if (hc != null) 
				hc.close();
			// ถ้ายังมีสตรีมสำหรับอินพุตข้อมูล ให้ปิดการเชื่อมโยงนั้น
            if (dis != null) 
				dis.close();
        }
		// ส่งกลับข่าวสารจากเว็บเซิร์ฟเวอร์ไปที่จุดเรียกใช้งาน
        return message;
    }

        //for query string
	 public String sendGetQuery(String urlstring) throws IOException 
	{
		// กำหนดตัวแปรออปเจ็กต์ hc สำหรับการเชื่อมโยงของ HTTP
        HttpConnection hc = null;

		// กำหนดตัวแปรออปเจ็กต์ dis ใช้เป็นสตรีมสำหรับอินพุตข้อมูล
        DataInputStream dis = null;
        OutputStream os = null;
        
        
        String message = "";
        try {
			// เปิดการเชื่อมโยงของ HTTP กับเว็บเซิร์ฟเวอร์ จะใช้
			// เมธอด GET ของการร้องขอโดยอัตโนมัติ
            
            hc = (HttpConnection) Connector.open(urlstring);
            

	  // ตรวจสอบคุกกี้บนอุปกรณ์ไร้สาย
      if (cookies.size() > 0) 
	  {
		// สร้างออปเจ็กต์ strBuffer เป็นบัฟเฟอร์ใช้บรรจุคุกกี้ และ
		// สามารถขยายหน่วยความจำได้โดยอัตโนมัติ
        StringBuffer strBuffer = new StringBuffer();

		// วนรอบบรรจุคุกกี้แต่ละค่าลงในบัฟเฟอร์ strBuffer
        for (int i = 0; i < cookies.size(); ++i) 
		{
		  // เพิ่มคุกกี้ให้บัฟเฟอร์ strBuffer
          strBuffer.append((String)cookies.elementAt(i));    

        }
            // กำหนดค่าของคุกกี้ทั้งหมดให้พรอพเพอร์ที Cookie
            hc.setRequestProperty("Cookie", strBuffer.toString());

      }
            
           os = hc.openOutputStream();

  //      System.out.println(urlstring);
        
   //     System.out.println(cookies.toString()); 
            
        
            
            
			// สร้างออปเจ็กต์ dis เป็นสตรีมของการอินพุตข้อมูล
			// ที่ได้รับจากการเชื่อมโยงของ HTTP
            dis = new DataInputStream(hc.openInputStream());
            int ch;
			// ตรวจสอบการอ่านข่าวสารจากสตรีมของการอินพุตข้อมูล
            while ((ch = dis.read()) != -1) 
			{
				// บรรจุข่าวสารที่ส่งมาจากเว็บเซิร์ฟเวอร์
                message = message + (char) ch;
            }
        }      
        catch (Exception e) {
                 System.out.println("error");
                        }
        
        
		finally {
			// ถ้ายังมีการเชื่อมโยงของ HTTP ให้ปิดการเชื่อมโยงนั้น
            if (hc != null) 
				hc.close();
			// ถ้ายังมีสตรีมสำหรับอินพุตข้อมูล ให้ปิดการเชื่อมโยงนั้น
            if (dis != null) 
				dis.close();
        }
		// ส่งกลับข่าวสารจากเว็บเซิร์ฟเวอร์ไปที่จุดเรียกใช้งาน
        return message;
    }        
         
         
 /*--------------------------------------------------
  * Open an http connection and download a png file
  * into a byte array.
  *-------------------------------------------------*/
  private Image getImage(String url) throws IOException
  {
    ContentConnection connection = (ContentConnection) Connector.open(url);
    DataInputStream iStrm = connection.openDataInputStream();    
        
    Image im = null;

    try
    {
      // ContentConnection includes a length method
      byte imageData[];
      int length = (int) connection.getLength();
      if (length != -1)
      {
        imageData = new byte[length];

        // Read the png into an array        
        iStrm.readFully(imageData);
      }
      else  // Length not available...
      {       
        ByteArrayOutputStream bStrm = new ByteArrayOutputStream();       
        
        int ch;
        while ((ch = iStrm.read()) != -1)
          bStrm.write(ch);
        
        imageData = bStrm.toByteArray();
        bStrm.close();                
      }

      // Create the image from the byte array
      im = Image.createImage(imageData, 0, imageData.length);        
    }
    finally
    {
      // Clean up
      if (iStrm != null)
        iStrm.close();
      if (connection != null)
        connection.close();
    }
    return (im == null ? null : im);
  }         

        
	public void updateGauge(){
		int current = gauge.getValue();		
		current = (current + GAUGE_MAX/GAUGE_LEVELS);
        gauge.setValue(current);		
	}

}
