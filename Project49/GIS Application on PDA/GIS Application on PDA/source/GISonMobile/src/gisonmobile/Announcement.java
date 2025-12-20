package gisonmobile;

//import javax.microedition.lcdui.AlertType;
import java.util.*;

import org.kxml.kdom.*;

public class Announcement
{
	public final static int NORMAL_ANNOUNCE = 0;
	public final static int CALENDAR_ANNOUNCE = 1;
	public final static int CONTACT_NORMAL_ANNOUNCE = 2;
	public final static int CONTACT_CALENDAR_ANNOUNCE = 3;
	
	public int id,type;
	public String owner,groupName,content,topic;
	public Date postTime=null;
	public EventCalendar calendar=null;
	
	public Announcement(Element announce)
	{
		int count = announce.getChildCount();
		for(int i =1 ;i!=count;i+=2)
		{
			this.id = Integer.parseInt(announce.getAttribute("id").getValue());
			Node announceNode = (Node)announce.getChild(i);
			
			if(announceNode.getName().equals("type"))
				this.type = Integer.parseInt(announceNode.getText());
			else if(announceNode.getName().equals("owner"))
				this.owner = announceNode.getText();
			else if(announceNode.getName().equals("groupname"))
				this.groupName = ParseXML.convertToThai(announceNode.getText());
			else if(announceNode.getName().equals("content"))
				this.content = ParseXML.convertToThai(announceNode.getText());
			else if(announceNode.getName().equals("topic"))
				this.topic = ParseXML.convertToThai(announceNode.getText());
			else if(announceNode.getName().equals("posttime"))
			{
				if(!announceNode.getText().equals("null"))
					this.postTime = new Date((Long.parseLong(announceNode.getText())));
			}
			else if(announceNode.getName().equals("calendar"))
			{
				this.calendar = new EventCalendar(announceNode);
			}	
		}
	}
		
};