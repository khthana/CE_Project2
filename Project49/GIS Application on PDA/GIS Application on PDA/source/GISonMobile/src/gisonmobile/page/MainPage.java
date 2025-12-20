package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;

import com.tinyline.svg.*;


public class MainPage extends ViewerCanvas implements CommandListener
{
    // Commands
    Command linkCommand,updateCommand,
    panCommand, zoomCommand, drawRecordCommand, exitCommand,
    backCommand,goAnnounce,goContact ,goCalendar,goGroup,searchCommand,
    goPreference,goModerator,updateMap;
    public Command displayCommand,positionCommand;
	public String posX = "691233.448514923";
	public String posY = "1518982.90543618";
	public String width = "1814.34961213078";
	public String height = "1217.95208938536";
	
	
    public MainPage()
    { 
    	super(CampusGISMain.instance.display);
    	jbInit();
    	svgInit();
    }

    public void svgInit()
    {
    	 try
         {
//         	 Load incons
            this.init();
  			this.repaint();
  			this.urlStr = "/tinyline/helvetica.svg";
  			this.option = ViewerCanvas.LOAD_URL;
  			this.connectSVG();
  			SVGDocument doc =  loadSVG(svgStr);
  			SVGFontElem font = SVGDocument.getFont(doc,SVG.VAL_DEFAULT_FONTFAMILY);
  			SVGDocument.defaultFont = font;
  		
  			if(FileConnect.isExists("file:///"+FileConnect.getRoots()+"GISonCampus/map.svg"))
  			{
  				this.option = ViewerCanvas.LOAD_FILE;
  				urlStr = "file:///"+FileConnect.getRoots()+"GISonCampus/map.svg";
  				System.out.println("Load From File");
  			}
  			else
  			{
  				this.option = ViewerCanvas.LOAD_URL;
  				urlStr = "/map/map.svg";
  				System.out.println("Load From URL");
  			}
  			
  		   new Thread()
		   {
				public void run()
			   {
					goURL();
				}
			}.start();
          }
         catch( Exception e){System.out.println(e.getMessage());}
    }
	
    public void jbInit()
    {
        linkCommand      = new Command("Link", Command.OK, 1);
        panCommand       = new Command("Pan", Command.OK, 2);
        zoomCommand      = new Command("Zoom", Command.OK, 3);
        displayCommand      = new Command("Diplay Mode", Command.OK, 4);
        positionCommand      = new Command("Display Position", Command.OK, 4);

        exitCommand      = new Command("Exit", Command.EXIT, 14);
        
		searchCommand  = new Command("Search", Command.ITEM, 1);
		drawRecordCommand  = new Command("Show Record", Command.ITEM, 2);
		updateMap = new Command("Update Map", Command.ITEM, 3);
		updateCommand = new Command("Update Information", Command.ITEM, 4);
        
        goGroup =  new Command("Groups", Command.BACK, 1);
        goContact =  new Command("Contacts", Command.BACK, 2);
        goCalendar =  new Command("My calendar", Command.BACK, 3);
        goAnnounce =  new Command("Announcements", Command.BACK, 4);
        goModerator = new Command("Moderator", Command.BACK, 5);
        goPreference = new Command("Preference", Command.BACK, 6);
        backCommand      = new Command("Choose Mode", Command.BACK, 7);
        
		this.addCommand(linkCommand);
        this.addCommand(panCommand);
        this.addCommand(zoomCommand);
        this.addCommand(drawRecordCommand);
   //     this.addCommand(searchCommand);
        this.addCommand(exitCommand);
        this.addCommand(backCommand);
        this.addCommand(goAnnounce);
        this.addCommand(goContact );
        this.addCommand(goCalendar);
        this.addCommand(goGroup);
        this.addCommand(updateCommand);
        this.addCommand(goPreference);
		this.addCommand(updateMap);		
		this.addCommand(goModerator);
		this.addCommand(positionCommand);
        this.setCommandListener(this);
    }
    
    public void setSVGString(String str)
    {
    	this.svgStr = str;
    }
  
    public void commandAction(Command c, Displayable s)
    {
    	
    	if(c == linkCommand)
       {
           this.type = ViewerCanvas.TYPE_LINK;
    		
       }
       else if(c == panCommand)
       {
          this.type = ViewerCanvas.TYPE_PAN;
       }
       else if(c == zoomCommand)
       {
    	   this.type = ViewerCanvas.TYPE_ZOOM;
       }
       else if(c == displayCommand)
       {
    	   displayMode = DISPLAY_MODE;
    	   this.removeCommand(displayCommand);
    	   this.addCommand(positionCommand);
       }
       else if(c == positionCommand)
       {
    	   displayMode = POSITION_MODE;
    	   this.addCommand(displayCommand);
    	   this.removeCommand(positionCommand);
       }
       else if(c == drawRecordCommand)
       {
    	   displayMode = DISPLAY_MODE;
    	   ConnectService con = new ConnectService();
    	   con.getMyRecordPosition();
       }
       else if(c == searchCommand)
       {
    	   ConnectService con = new ConnectService();
    	   con.listMapLayer();
       }
       else if(c == exitCommand)
       {
    	  CampusGISMain.quitApp();
       }
	   else if (c == backCommand)
	   {
		   CampusGISMain.instance.ShowChooseModePage();
	   }
	   else if(c == goAnnounce)
        {            
			CampusGISMain.instance.ShowAnnouncementsPage();
        }
        else if(c == goGroup)
        {
	        CampusGISMain.instance.ShowGroupsPage();
        }
        else if(c == goContact )
        {
            CampusGISMain.instance.ShowUsersPage();
        }
        else if(c == goCalendar)
        {
            CampusGISMain.instance.ShowCalendarsPage();
        }
        else if(c == goPreference)
        {
            CampusGISMain.instance.ShowPreferencePage();
        }
        else if(c == goModerator)
        {
            CampusGISMain.instance.ShowModeratorPage();
        }
        else if (c == updateCommand) {
        	
        	
           
		   if(CampusGISMain.instance.loadAnnouncement.equals("Yes"))
		   {
			   ConnectService con2 = new ConnectService();
			   con2.getAllAnnouncements();
		   }
		   
		   if(CampusGISMain.instance.loadUser.equals("Yes"))
		   {
			   ConnectService con5 = new ConnectService();
			   con5.getProfileList();
		   }
		   
		   if(CampusGISMain.instance.loadGroup.equals("Yes"))
		   {
			   ConnectService con3 = new ConnectService();
			   con3.getAllGroupList();
		   }
		   
		   
        	
        	
        }
        else if (c == updateMap) {
        	ConnectService con = new ConnectService();
        	if(CampusGISMain.instance.layers != null)
        	{
        		String layers="";
            	for(int i=0;i!=CampusGISMain.instance.layers.length;++i)
            	{
            		if(CampusGISMain.instance.layers[i].choose)
            		{
            			layers += ","+CampusGISMain.instance.layers[i].layerID;
            		}
            	}
            	con.getMap(posX,posY,width,height,layers.substring(1));
        	}
        	else
        		con.getMap(posX,posY,width,height,"10001,10002,10003,10004,10005,10006");
        	
     }
   }

}
