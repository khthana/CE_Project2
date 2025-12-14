/*
 * Page2.java
 *
 * Created on 18 กุมภาพันธ์ 2546, 14:00 น.
 */

import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;
import javax.microedition.io.*;
import java.io.*;
import java.util.*;
/**
 *
 * @author  Man
 * @version 1.0
 */
public class Page2 extends MIDlet
    implements CommandListener,ItemStateListener {
        
    private Display display;
    private Form form;    
    private Form form2;  
    private Form form3;
//----------------------------    
//    private Form S1,S2;
 
//---------------------------    
    private Command cmSearch;
    private Command cmSearch2;
    private Command cmBack;    
    private Command cmUpdate;
    private ChoiceGroup group1;
    private ChoiceGroup group2;
    private ChoiceGroup group3;
    private ChoiceGroup group4;
    private ChoiceGroup group5;
    private ChoiceGroup group6;
    private ChoiceGroup group7;
    private ChoiceGroup group8;
    private ChoiceGroup group9;
    private ChoiceGroup group10;
    private ChoiceGroup group11;
    private ChoiceGroup group12;
    private ChoiceGroup group13;
    private ChoiceGroup group14;
    private ChoiceGroup group15;
    private ChoiceGroup group16;
    private ChoiceGroup group17;
    private ChoiceGroup group18;    

    private TextField field1;
    private String[] options = {"Choose Services","Restaurant","Pub&Resturant"};
    private String[] area = {"All","Bangbon","Bangkapi","Bangkae","Bangkhen","Bangkholame","Bangkhunthian",
                             "Bangkoknoi","Bangyai","Bangna","Bangphlat","Bangrak","Bangsu","Buengkum",
                             "Chatuchak","Chomthong","Dindaeng","Donmuang","Dusit","Huaikhwang","Khannayao",
                             "Khlongsamwa","Khlongsan","Klonguey","Laksi","Lakrabang","Latphrao","Minburi",
                             "Nongchok","Nongkhaem","Pathumwan","Phasicharoan","Phayathai","Phrakhanong",
                             "Pharanakorn","Pomprapsattruphai","Pravet","Rachtheve","Ratburana","Saimai",
                             "Samphathawong","Saphansung","Sathon","Suanluang","Talingchan","Thawiwattana",
                             "Thonburi","Thungkhru","Wangthonglang","Wattana","Yanawa"};
    private String[] rKind = {"All","American","American Cajun","Chinese","Continental","Delicatessen","French",
                             "French/Mediterranean","Fusion","German","German/Inter","Greek","Indian/Pakistani",
                             "Intalian Pizza","Inter/American","International","Irish","Italian","Italian/Thai",
                             "Japanese","Korea","Lebanese","Seafood BBQ","Steak House","Steak/Grills&Roasts",
                             "Swiss","Swiss/Inter","Thai","Thai/Inter","Thai/Seafood","ThaiDeli&Bakery","Vietnamese"};
                                                          
    private String[] tKind = {"All","Shopping","Sport","Night Life"};
    private String[] style = {"All","Antique","Art","Fast Food","Future","Garden","Luxury","Modern","Pool side","River side","Romantic","Side walk"};
    private String[] karaoke = {"None","Public","Private","Both"};
    private String[] credit_D = {"All","None","American Express","Diner Club","Discovery","Master Card","VISA Electron","VISA Bankok","VISA Asia",
                                 "VISA Ayudhaya","VISA BankThai","VISA City Bank","VISA DBS","VISA HSBC","VISA Krung Thai",
                                 "VISA Siam City Bank","VISA Siam Commercial","VISA Standard Charter","VISA Thai Farmers",
                                 "VISA Thai Military","VISA ThanaChart","VISA UOB Radanasin"};
    private String[] credit_A = {"All","None","American Express","Diner Club","Discovery","Master Card","VISA Electron","VISA"};
    private String[] Res_cap = {" 1-25 Persons","26-50 Persons","51-75 Persons","76 Up Persons"};
    private String[] Private_room = {"All","None","1-2 rooms","3-4 rooms","5-10 rooms","11 rooms Up"};
    private String[] Private_cap = {"All","None"," 1-10 Persons","11-20 Persons","21-30 Persons","31-40 Persons","40 Up Persons","Variety"};
    private String[] Price = {"Low(50-100B)","Average(101-200B)","High(201-400B)","Very high(401B Up)"}; 
    private String[] Openning = {"All","5AM","6AM","7AM","8AM","9AM","10AM","11AM","12AM","1PM","2PM","3PM","4PM","5PM","6PM","7AM","8PM","9PM","10PM","11PM","12PM","1AM","2AM","3AM","4AM"};
    private String[] Nation_music = {"All","Aboriginal","Instrumental","Thai","Inter","Thai/Inter"};
    private String[] Kind_music = {"All","Alternative","Alter/Dance","Alter/Pop","Alter/Rock","Alter/Techno","Alter/Underground","Classic","Classic/Jazz","Classic/Pop","Dance","Dance/Jazz","Dance/Pop",
    "Dance/Rock","Dance/Techno","Dance/Underground","Jazz","Jazz/Pop","Jazz/Rock","Pop","Pop/Rock","Rock","Rock/Techno","Rock/Underground","Techno","Techno/Underground","Underground","Variety","Variety Hard","Variety Soft"};
    private String[] Live_music = {"No","Yes"};
    private String[] Cocktail = {"All","None","Full Bar","Full Bar & Wine List","Full Bar plus Martini","Beer,Wine","Soft drinks, Beer, Wine","Wines"};
    private String[] Buffet = {"All","None","50-100 Baht","101-200 Baht","201-300 Baht","301 Baht Up"};
    private String[] Internet = {"All","No","Yes"};
   
    
    private String[] field = {"Name","Recommend","Style","Karaoke","Credit",
                              "Car Park","Price"};

//    private String url ="http://localhost:8080/servlet/PalmData.ResponseServlet";
//    private String url ="http://161.246.6.130:8080/servlet/PalmData.ResponseServlet";
    private String url ="http://203.149.47.84:8080/servlet/PalmData.ResponseServlet";

    private String label = "";
    
    private static final String TICKER_TEXT = "Please Choose Service " +
                    "And Choose Another Detail" +
                   " And You Will Get It! ";

    /**
     * Creates new TickerDemo
     */        
    public Page2() {
        display = Display.getDisplay(this);
        form = new Form("MKServices");
        //cmExit = new Command("Exit", Command.EXIT, 1);
        cmBack = new Command("Back", Command.BACK, 1);
        cmUpdate = new Command("Submit", Command.SCREEN,2);
        cmSearch = new Command("Search", Command.SCREEN,1);
        cmSearch2 = new Command("Search", Command.SCREEN,1);
        group1 = new ChoiceGroup("Services",
                                ChoiceGroup.EXCLUSIVE,
                                options,
                                null);
        form.append("Welcome to Services");          
        form.append(group1);
        form.setItemStateListener(this);
        form.addCommand(cmSearch);
        form.addCommand(cmUpdate);      
        form.setCommandListener(this);  
        
  //      S1 = new Form("MKServices");
  //      S1.append("Welcome to MK Service");
        
        setForm3();
   
       //super("Ticker");
       Ticker t = new Ticker("Please Choose Service " +
                    "And Choose Another Detail" +
                    " And You Will Get It! ");
      form.setTicker(t);
       //setTicker(t);
    }
    private void setForm3() {
        // form3
        form3 = new Form("Search");
      /*  group4 = new ChoiceGroup("Select Field", 
                                ChoiceGroup.EXCLUSIVE,
                                field,null); */
        field1 = new TextField("Wording","",20,TextField.ANY);                        
        form3.append("Enter your search");         
      //  form3.append(group4);
        form3.append(field1);
        form3.addCommand(cmSearch2);
        form3.addCommand(cmBack);    
        form3.setCommandListener(this);
        Ticker t3 = new Ticker("Please Input Hint! To Find! ");
        form3.setTicker(t3);
    }
    
    public void startApp() {
   //     display.setCurrent(S1);
        
    //    Alert info = new Alert("Sucess","Wait",null,AlertType.INFO);
    //   info.setTimeout(100);
       // textBox =new TextBox("","",20,TextField.ANY);
      //display.setCurrent(info,textBox);
  //      display.setCurrent(info);
        display.setCurrent(form);
        
    }
    
    public void pauseApp() {
    }
    
    public void destroyApp(boolean unconditional) {
    }
    
    public void itemStateChanged( Item item ){
        int i;
        if (item == group1){
            if (group1.getSelectedIndex()==1 || group1.getSelectedIndex()==2) {
                for (i=form.size()-1;i>=2;i--)                
                    form.delete(i);
                
                group2 = new ChoiceGroup("Area",
                                ChoiceGroup.EXCLUSIVE,area,null);                
                form.insert(2,group2);                
                group3 = new ChoiceGroup("Food Type", 
                                ChoiceGroup.EXCLUSIVE,rKind,null);   
                form.insert(3,group3);
                group4 = new ChoiceGroup("Style",
                                ChoiceGroup.EXCLUSIVE,style,null);
                form.insert(4,group4);
                group5 = new ChoiceGroup("Karaoke",
                                ChoiceGroup.EXCLUSIVE,karaoke,null);
                form.insert(5,group5);
                group6 = new ChoiceGroup("Discount Card",
                                ChoiceGroup.EXCLUSIVE,credit_D,null);
                form.insert(6,group6);
                group7 = new ChoiceGroup("Card Accepted",
                                ChoiceGroup.EXCLUSIVE,credit_A,null);
                form.insert(7,group7);
        
                group8 = new ChoiceGroup("Resturant Size",
                                ChoiceGroup.EXCLUSIVE,Res_cap,null);
                form.insert(8,group8);

                group9 = new ChoiceGroup("Private Room",
                                ChoiceGroup.EXCLUSIVE,Private_room,null);
                form.insert(9,group9);
                
                group10 = new ChoiceGroup("Room Size",
                                ChoiceGroup.EXCLUSIVE,Private_cap,null);
                form.insert(10,group10);                
                
                group11 = new ChoiceGroup("Price",
                                ChoiceGroup.EXCLUSIVE,Price,null);
                form.insert(11,group11);
                
                group12 = new ChoiceGroup("Time To Go",
                                ChoiceGroup.EXCLUSIVE,Openning,null);
                form.insert(12,group12);
                
                group13 = new ChoiceGroup("Music Language",
                                ChoiceGroup.EXCLUSIVE,Nation_music,null);
                form.insert(13,group13);

                group14 = new ChoiceGroup("Music Kind",
                                ChoiceGroup.EXCLUSIVE,Kind_music,null);
                form.insert(14,group14);

                group15 = new ChoiceGroup("Live Music",
                                ChoiceGroup.EXCLUSIVE,Live_music,null);
                form.insert(15,group15);

                group16 = new ChoiceGroup("Cocktail",
                                ChoiceGroup.EXCLUSIVE,Cocktail,null);
                form.insert(16,group16);
                
                group17 = new ChoiceGroup("Buffet",
                                ChoiceGroup.EXCLUSIVE,Buffet,null);
                form.insert(17,group17);                

                group18 = new ChoiceGroup("Internet",
                                ChoiceGroup.EXCLUSIVE,Internet,null);
                form.insert(18,group18);                
                 
                
            }            
            else if (group1.getSelectedIndex()==0){                
                for (i=form.size()-1;i>=2;i--)
                    form.delete(i);
            }
        }
    }
        
    public void commandAction(Command c, Displayable s)
    {   String con = "",con1="",con2="";
        if (c == cmBack)
	{   	    
            if(s==form3)
                setForm3();
            else
                startApp();            
	}	
	else if (c == cmUpdate)  // Send to search
	{   
       
            if (group2!=null){                
                con = ""+group1.getSelectedIndex();                
                con1 = group2.getSelectedIndex()+"";                
                if (group3!=null) {
                    if (group3.getSelectedIndex()==0)
                        con2 = "0";
                    else {
                        if (group3.getLabel().startsWith("Food"))
                            con2 = "F"+group3.getSelectedIndex();
                        else
                            con2 = "T"+group3.getSelectedIndex();                    
                    }
                }
     
                showData(con,con1,con2,group4.getSelectedIndex()+"",
                    group5.getSelectedIndex()+"",group6.getSelectedIndex()+"",
                    group7.getSelectedIndex()+"",group8.getSelectedIndex()+"",
                    group9.getSelectedIndex()+"",group10.getSelectedIndex()+"",
                    group11.getSelectedIndex()+"",group12.getSelectedIndex()+"",
                    group13.getSelectedIndex()+"",group14.getSelectedIndex()+"",
                    group15.getSelectedIndex()+"",group16.getSelectedIndex()+"",
                    group17.getSelectedIndex()+"",group18.getSelectedIndex()+""
                    );
            } 
            else {
                form.append("Error! Choose your services.");
                display.setCurrent(form);
            }
        }
        else if (c == cmSearch) {
            field1.setString("");
            display.setCurrent(form3);
        }
        else if (c == cmSearch2) {
            con = "*";
          //  con1 = field[group4.getSelectedIndex()];
            con2 = field1.getString();
            showData(con,"",con2,"","","","","","","","","","","","","","","");
        }
    }
    
    private void showData(String con1,String con2,String con3,String con4,
        String con5,String con6,String con7,String con8,String con9,String con10,
        String con11,String con12,String con13,String con14,String con15,String con16,String con17,String con18) 
    {
        HttpConnection http = null;
        InputStream iStrm = null;    
             
        try
        {
            // When using GET, append data onto the url
            String completeURL = url+"?"+"table="+con1+"&area="+con2+"&kind="+con3+
                "&con4="+con4+"&con5="+con5+"&con6="+con6+"&con7="+con7+"&con8="+con8+      
                "&con9="+con9+"&con10="+con10+"&con11="+con11+"&con12="+con12+"&con13="+con13+
                "&con14="+con14+"&con15="+con15+"&con16="+con16+"&con17="+con17+"&con18="+con18;   
            // Request
            http = (HttpConnection) Connector.open(completeURL);      
            http.setRequestMethod(HttpConnection.GET);
      
            // Server Response      
            iStrm = http.openInputStream();      
            String URLwithID = http.getHeaderField("Custom-newURL");      
            if (URLwithID != null)
                url = URLwithID;
     
            // Get body/data 
            String str;
            int length = (int) http.getLength();
            if (length != -1)
            {
                byte servletData[] = new byte[length];
                iStrm.read(servletData);
                str = new String(servletData);
            }
            else  // Length not available...
            {
                ByteArrayOutputStream bStrm = new ByteArrayOutputStream();             
                int ch;
                while ((ch = iStrm.read()) != -1)
                    bStrm.write(ch);
                str = new String(bStrm.toByteArray());
                bStrm.close();                        
            }
       
            int i;
        
            if (!str.equals("")) {    
                String type = "";
                if (group3.getLabel().startsWith("Food"))
                    type = rKind[group3.getSelectedIndex()];
                else
                    type = tKind[group3.getSelectedIndex()];
                // form2
                form2 = new Form("Search Result");
                form2.addCommand(cmBack);
                form2.setCommandListener(this); 
                
                Ticker t2 = new Ticker("Enjoy! To Your Choice! ");
                form2.setTicker(t2);
       
                if (!con1.equals("*")) {
                    form2.append(new StringItem("Result ",
                        options[group1.getSelectedIndex()]));                   
                    form2.append(new StringItem("Area ",area[group2.getSelectedIndex()]));
                 //   form2.append(new StringItem("Karaoke ",area[group2.getSelectedIndex()]));
            //       form2.append(new StringItem("Price ",type));  
            //        form2.append(new StringItem("Karaoke ",type));                      
            //        form2.append(new StringItem("man ",type));  
            //        form2.append(new StringItem("Type ",type));
            //        form2.append(new StringItem("Price ",type));  
            //       form2.append(new StringItem("Karaoke ",type));                      
            //        form2.append(new StringItem("man ",type));  
                   
                }
                form2.append("\n"+str);                
                display.setCurrent(form2);
            } 
    }catch (Exception e) {
          System.err.println("showData : " + e.toString());        
    }
    finally
    {   try {
        // Clean up
            if (iStrm != null)
                iStrm.close();
            if (http != null)
                http.close();
        }catch(IOException io){
            System.err.print("finally : "+io);
        }
    }
  }
    
  private String[] getList(String table) 
  {
    HttpConnection http = null;
    InputStream iStrm = null;    
    String options[] = {""};
     
    try
    {      
      String completeURL = url + "?" + "tablename=" + table;      
      http = (HttpConnection) Connector.open(completeURL);           
      http.setRequestMethod(HttpConnection.GET);     
      
      iStrm = http.openInputStream();      
      String URLwithID = http.getHeaderField("Custom-newURL");      
      if (URLwithID != null)
        url = URLwithID;
           
      String str;
      int length = (int) http.getLength();
      if (length != -1)
      {
        byte servletData[] = new byte[length];
        iStrm.read(servletData);
        str = new String(servletData);
      }
      else  // Length not available...
      {
        ByteArrayOutputStream bStrm = new ByteArrayOutputStream();       
      
        int ch;
        while ((ch = iStrm.read()) != -1)
          bStrm.write(ch);

        str = new String(bStrm.toByteArray());
        bStrm.close();                        
      }
      if (str.length()<3)
          str+="Not Found Please Try Again!!!";
    //  if (man<1)
    //      str+="Not Found";
       
        int i,j=0,size=1;
         
        if ((i = str.indexOf('$'))!= -1) {            
            label = str.substring(0,i);
            str = str.substring(i + 1);
            if ((i = str.indexOf('#')) != -1){
                size = Integer.parseInt(str.substring(0,i));
                str = str.substring(i+1);
                options = new String[size];
                
            while ((i = str.indexOf('\n'))!= -1) {                 
                //options = new String[size];                       
                if (i != str.length()-1)
                    options[j] = str.substring(0, i);                    
                j++;
                str = str.substring(i + 1);
            }
            }
        } 
    }catch (Exception e) {
          System.err.println("updateTotal : " + e.toString());        
    }
    finally
    {   try {
        // Clean up
            if (iStrm != null)
                iStrm.close();
            if (http != null)
                http.close();
        }catch(IOException io){
            System.err.print("finally : "+io);
        }
    }
    return options;
  }
}
  