package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;

import java.util.*;

public class AnnouncementPage extends Form implements CommandListener
{
    private Command calendarCommand = new Command("Go to calendar", Command.BACK, 1);
    private Command groupCommand = new Command("Select to Group", Command.ITEM, 2);
    private Command ownerCommand = new Command("Select to Owner", Command.ITEM, 3);
    private Command backCommand = new Command("Back",Command.BACK,1);
    private Announcement announce;
    
    public AnnouncementPage(Announcement announce)
    {
    	super(announce.topic);
    	this.announce = announce;
        try {
            jbinit();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
    	this.addCommand(backCommand);
    	if(announce.type == Announcement.CONTACT_CALENDAR_ANNOUNCE || announce.type == Announcement.CONTACT_NORMAL_ANNOUNCE)
    		this.addCommand(ownerCommand);
    	else
    		this.addCommand(groupCommand);
    	
    	if(announce.type == Announcement.CALENDAR_ANNOUNCE || announce.type == Announcement.CONTACT_CALENDAR_ANNOUNCE)
    		this.addCommand(calendarCommand);
    	
        this.setCommandListener(this);
        
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
  		calendar.setTime(announce.postTime);
  		String post = calendar.get(Calendar.DAY_OF_MONTH)+"/"+
					calendar.get(Calendar.MONTH)+1+"/"+
	   				calendar.get(Calendar.YEAR)+" "+
	   				calendar.get(Calendar.HOUR)+":"+
	   				calendar.get(Calendar.MINUTE)+":"+
	   				calendar.get(Calendar.SECOND);
  		
  		if(announce.type == Announcement.CALENDAR_ANNOUNCE || announce.type == Announcement.NORMAL_ANNOUNCE)
  			this.append(new StringItem("หัวข้อ : "+announce.topic,"\nรายละเอียด \n"+announce.content+"\n\n ผู้ประกาศ : "+announce.owner+"\n"+
    			" กลุ่ม : "+announce.groupName+"\n"+
    			" ประกาศเมื่อ : "+post+"\n\n",Item.PLAIN));
  		else
  			this.append(new StringItem("หัวข้อ : "+announce.topic,"\nรายละเอียด \n"+announce.content+"\n\n ผู้ประกาศ : "+announce.owner+"\n"+
  	    			" ประกาศเมื่อ : "+post+"\n\n",Item.PLAIN));
    }

    public void commandAction(Command c, Displayable d) {
        if (c == backCommand) {    
			CampusGISMain.instance.ShowAnnouncementsPage();
        }else if(c == calendarCommand)
        {
        	CampusGISMain.instance.ShowCalendarPage(announce.calendar);
        }
        else if(c == groupCommand)
        {
        	for(int i=0;i!=CampusGISMain.instance.groups.length;++i)
        	{
        		String groupName = announce.groupName;
        		if(groupName.equals(CampusGISMain.instance.groups[i].name))
        		{
        			CampusGISMain.instance.ShowGroupPage(CampusGISMain.instance.groups[i]);
        			break;
        		}
        	}
        }
        else if(c == ownerCommand)
        {
        	for(int i = 0;i!=CampusGISMain.instance.users.length;++i)
        	{
        		if(CampusGISMain.instance.users[i].username.equals(announce.owner))
        		{
        			CampusGISMain.instance.ShowUserPage(CampusGISMain.instance.users[i]);
        			break;
        		}
        		
        	}
        }
    }
}
