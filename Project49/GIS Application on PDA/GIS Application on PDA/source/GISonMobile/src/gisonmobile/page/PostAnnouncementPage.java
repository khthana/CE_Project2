package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;

import java.util.*;

public class PostAnnouncementPage extends Form implements CommandListener
{
    private Command backCommand = new Command("Back",Command.BACK,1);
    private Command postCommand = new Command("OK",Command.OK,1);
    private TextField topic = new TextField("","",100,TextField.ANY);
    private TextField content = new TextField("","",500,TextField.ANY);
    private TextField location = new TextField("","",100,TextField.ANY);
    private DateField startTime = new DateField(" เวลาเริ่ม  ",DateField.DATE_TIME,TimeZone.getDefault());
    private DateField endTime = new DateField(" เวลาจบ  ",DateField.DATE_TIME,TimeZone.getDefault());
    private int type ;
    private String groupName;
    
    public PostAnnouncementPage(int type)
    {
    	super("New Announcement");
        this.type = type;
        
    	try {
            jbinit();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
    
    public PostAnnouncementPage(String groupName,int type)
    {
    	super("New Announcement");
        this.type = type;
        this.groupName = groupName;
    	try {
            jbinit();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
    	this.addCommand(backCommand);
    	this.addCommand(postCommand);
        this.setCommandListener(this);
        
        if(type == Announcement.CALENDAR_ANNOUNCE || type == Announcement.NORMAL_ANNOUNCE)
        {
        	this.append(new StringItem(" กลุ่ม : "+groupName+"\n\n",null));
        }
        
        topic.setLabel("หัวข้อ");
        content.setLabel("รายละเอียด");
        this.append(topic);
        this.append(content);
        
        if(type == Announcement.CALENDAR_ANNOUNCE || type == Announcement.CONTACT_CALENDAR_ANNOUNCE)
        {
        	location.setLabel("สถานที่");
        	this.append(location);
        	this.append(startTime);
        	this.append(endTime);
        }
    }

    public void commandAction(Command c, Displayable d) {
        if (c == backCommand) 
        {    
        	if(type == Announcement.CALENDAR_ANNOUNCE || type == Announcement.NORMAL_ANNOUNCE)
        		CampusGISMain.instance.ShowModeratorPage();
        	else
        		CampusGISMain.instance.ShowAnnouncementsPage();
        }
        else if(c == postCommand)
        {
        	ConnectService con = new ConnectService();
        	
        	if(type == Announcement.NORMAL_ANNOUNCE)
        		con.groupPost(groupName,topic.getString(), content.getString());
        	else if(type == Announcement.CALENDAR_ANNOUNCE)
        		con.groupPostAsCalendar(groupName,topic.getString(), content.getString(),location.getString(),
        				""+startTime.getDate().getTime(),""+endTime.getDate().getTime());
        	else if(type == Announcement.CONTACT_NORMAL_ANNOUNCE)
        		con.post(topic.getString(), content.getString());
        	else if(type == Announcement.CONTACT_CALENDAR_ANNOUNCE)
        		con.postAsCalendar(topic.getString(), content.getString(),location.getString(),
        				""+startTime.getDate().getTime(),""+endTime.getDate().getTime());
        }
        
    }
}
