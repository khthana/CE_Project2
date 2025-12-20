package gisonmobile.page;

import java.util.TimeZone;
import java.util.Calendar;
import gisonmobile.*;
import javax.microedition.lcdui.*;

public class AnnouncementsPage extends Form implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 0);
    private Command backCommand = new Command("Back",Command.BACK,0);
    private Command showCommand = new Command("Filter",Command.OK,0);
    private Command postCommand = new Command("Post Announcement",Command.ITEM,1);
    private Command postAsCalendarCommand = new Command("Post Calendar",Command.ITEM,2);
    private Command nextCommand = new Command("Next",Command.OK,2);
    private Command prevCommand = new Command("Prev",Command.OK,1);
    private ChoiceGroup choice;
    private int announceList[];
    private int count,start = 0,num = 5;
    private List list;
    private String strFilter[];
    private int type;
   
    public AnnouncementsPage()
    {
        super("Annoucements");
        
        try {
        	type = CampusGISMain.SHOW_ALL_ANNOUNCEMENT;
        	jbinit();
        	initMode(type);        
        } catch (Exception ioe) {
            ioe.getMessage();
        }
        
       
    }
    
    public AnnouncementsPage(String str,int type,int start)
    {
        super("Annoucements");
       
        try
        {
        	jbinit();
        	this.start = start;
        	this.type = type;
        	strFilter = new String[]{str};
            initMode(type);
        } catch(Exception ex){}
        
        
    }
    
    public AnnouncementsPage(String str,int type)
    {
        super("Annoucements");
        
        try
        {
        	jbinit();
        	this.type = type;
        	strFilter = new String[]{str};
            initMode(type);
        } catch(Exception ex){}
        
       
    }
    
    public void initMode(int type)
    {
    	if(CampusGISMain.instance.announce!=null)
    	try
  	   {
    	
    	announceList = new int[CampusGISMain.instance.announce.length];
    	if(type == CampusGISMain.SHOW_ALL_ANNOUNCEMENT)
    	{
        	for(int i =0;i!=announceList.length;++i)
        		announceList[i] = i;
        	count = announceList.length;
    	}
    	else if(type == CampusGISMain.SHOW_ANNOUNCEMENT_BY_GROUPNAME)
    	{                   
    		count = 0;
    		for(int j =0;j!=strFilter.length;++j)
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(strFilter[j].equals(CampusGISMain.instance.announce[i].groupName))
            		{
            			announceList[count++] = i;
            		}	
        		}
    	}
    	else if(type == CampusGISMain.SHOW_ANNOUNCEMENT_BY_OWNER)
    	{                   
    		count = 0;
    		for(int j =0;j!=strFilter.length;++j)
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(strFilter[j].equals(CampusGISMain.instance.announce[i].owner))
            		{
            			announceList[count++] = i;
            		}	
        		}
    	}
    	else if(type == CampusGISMain.SHOW_GROUP_ANNOUNCEMENT)
    	{                   
    		count = 0;
    		for(int j =0;j!=strFilter.length;++j)
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(Announcement.NORMAL_ANNOUNCE == CampusGISMain.instance.announce[i].type ||
        					Announcement.CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type)
            		{
            			announceList[count++] = i;
            		}	
        		}
    	}
    	else if(type == CampusGISMain.SHOW_CONTACT_ANNOUNCEMENT)
    	{                   
    		count = 0;
    		for(int j =0;j!=strFilter.length;++j)
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(Announcement.CONTACT_NORMAL_ANNOUNCE == CampusGISMain.instance.announce[i].type ||
        					Announcement.CONTACT_CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type)
            		{
            			announceList[count++] = i;
            		}	
        		}
    	}
    	
    	choice = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE);
    	if(CampusGISMain.instance.announce != null && count > 0)
        {
     	   
     		   for (int i = start ;i<start+num && i<count;++i )
    	   		{
 	       	   		if(CampusGISMain.instance.announce[announceList[i]].type == Announcement.CALENDAR_ANNOUNCE)
 	       	   		{
 	       	   			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
 	       	   			calendar.setTime(CampusGISMain.instance.announce[announceList[i]].postTime);
 	       	   			choice.append(CampusGISMain.instance.announce[announceList[i]].topic+"\n"+
 	       	   				"โดยกลุ่ม => "+CampusGISMain.instance.announce[announceList[i]].groupName+"\n"+
 	       	   				"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
 	           	   				calendar.get(Calendar.MONTH)+1+"/"+
 	           	   				calendar.get(Calendar.YEAR)+","+
 	           	   				calendar.get(Calendar.HOUR)+":"+
 	           	   				calendar.get(Calendar.MINUTE)+":"+
 	           	   				calendar.get(Calendar.SECOND)+"\n"+
 	           	   				"ประเภท : Group Announcement"
 	           	   				, null);
 	       	   		}
 	       	   		else if(CampusGISMain.instance.announce[announceList[i]].type == Announcement.NORMAL_ANNOUNCE)
 	       	   		{
 	       	   		Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
	       	   			calendar.setTime(CampusGISMain.instance.announce[announceList[i]].postTime);
	       	   			choice.append(CampusGISMain.instance.announce[announceList[i]].topic+"\n"+
	       	   				"โดยกลุ่ม => "+CampusGISMain.instance.announce[announceList[i]].groupName+"\n"+
	       	   				"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
	           	   				calendar.get(Calendar.MONTH)+1+"/"+
	           	   				calendar.get(Calendar.YEAR)+","+
	           	   				calendar.get(Calendar.HOUR)+":"+
	           	   				calendar.get(Calendar.MINUTE)+":"+
	           	   				calendar.get(Calendar.SECOND)+"\n"+
	           	   				"ประเภท : Group Announcement"
	           	   				, null);
 	       	   		}
 	       	   		else if(CampusGISMain.instance.announce[announceList[i]].type == Announcement.CONTACT_CALENDAR_ANNOUNCE)
	       	   		{
 	       	   			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
 	       	   			calendar.setTime(CampusGISMain.instance.announce[announceList[i]].postTime);
    	   				choice.append(CampusGISMain.instance.announce[announceList[i]].topic+"\n"+
        	   				"ผู้ลงประกาศ => "+CampusGISMain.instance.announce[announceList[i]].owner+"\n"+
        	   				"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
        	   				calendar.get(Calendar.MONTH)+1+"/"+
        	   				calendar.get(Calendar.YEAR)+","+
        	   				calendar.get(Calendar.HOUR)+":"+
        	   				calendar.get(Calendar.MINUTE)+":"+
        	   				calendar.get(Calendar.SECOND)+"\n"+
        	   				"ประเภท : Contact Announcement"
        	   				, null);
	       	   		}
 	       	   		else if(CampusGISMain.instance.announce[announceList[i]].type == Announcement.CONTACT_NORMAL_ANNOUNCE)
 	       	   		{
 	       	   			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
	    	   			calendar.setTime(CampusGISMain.instance.announce[announceList[i]].postTime);
	    	   			choice.append(CampusGISMain.instance.announce[announceList[i]].topic+"\n"+
			   				"ผู้ลงประกาศ => "+CampusGISMain.instance.announce[announceList[i]].owner+"\n"+
			   				"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
			   				calendar.get(Calendar.MONTH)+1+"/"+
			   				calendar.get(Calendar.YEAR)+","+
			   				calendar.get(Calendar.HOUR)+":"+
			   				calendar.get(Calendar.MINUTE)+":"+
			   				calendar.get(Calendar.SECOND)+"\n"+
			   				"ประเภท : Contact Announcement"
			   				, null);
 	       	   		}
    	   		}
     		  this.append(choice);
        }
  	 }catch(Exception ex){CampusGISMain.instance.ShowAlertPage("Error", ex.getMessage());}
    }
    
    public void jbinit() {
        this.addCommand(backCommand);
        this.addCommand(selectCommand);
        this.addCommand(showCommand);
        this.addCommand(postCommand);
        this.addCommand(postAsCalendarCommand);
        this.addCommand(nextCommand);
        this.addCommand(prevCommand);
        
        this.setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
        if (c == backCommand) {    
			CampusGISMain.instance.ShowMainPage();
        }else if(c == selectCommand)
        {
        	CampusGISMain.instance.ShowAnnouncementPage(CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]]);
        }
        else if(c == showCommand)
        {
        	if(CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].type == Announcement.CALENDAR_ANNOUNCE ||
        		CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].type == Announcement.NORMAL_ANNOUNCE)
        	{
        		list = new List("Show Announcement",List.IMPLICIT,
        			new String[]{"All Announcement","Group Announcement","Contact Announcement","By group"},null);
        	}
        	else
        	{
        		list = new List("Show Announcement",List.IMPLICIT,
            			new String[]{"All Announcement","Group Announcement","Contact Announcement","By owner"},null);
        	}
        	list.setCommandListener(this);
        	CampusGISMain.instance.display.setCurrent(list);
        }
        else if(c == postCommand)
        {
        	CampusGISMain.instance.ShowPostAnnouncementPage(Announcement.CONTACT_NORMAL_ANNOUNCE);
        }
        else if(c == postAsCalendarCommand)
        {
        	CampusGISMain.instance.ShowPostAnnouncementPage(Announcement.CONTACT_CALENDAR_ANNOUNCE);
        }
        else if(c == nextCommand)
        {
        	if(start+num < count)
        	{
        		start += num;
        		if(strFilter == null)
        			CampusGISMain.instance.ShowAnnouncementsPage("",type,start);
        		else
        			CampusGISMain.instance.ShowAnnouncementsPage(strFilter[0],type,start);
        	}	
        }
        else if(c == prevCommand)
        {
        	if(start-num >= 0)
        	{
        		start -= num;
        		if(strFilter == null)
        			CampusGISMain.instance.ShowAnnouncementsPage("",type,start);
        		else
        			CampusGISMain.instance.ShowAnnouncementsPage(strFilter[0],type,start);
        	}	
        }
        else if (c == List.SELECT_COMMAND)
        {
        	if(list != null)
        	{
    			if(list.getSelectedIndex() == 0)
    				CampusGISMain.instance.ShowAnnouncementsPage("",CampusGISMain.SHOW_ALL_ANNOUNCEMENT);
    			else if(list.getSelectedIndex() == 1)
    				CampusGISMain.instance.ShowAnnouncementsPage("",CampusGISMain.SHOW_GROUP_ANNOUNCEMENT);
    			else if(list.getSelectedIndex() == 2)
    				CampusGISMain.instance.ShowAnnouncementsPage("",CampusGISMain.SHOW_CONTACT_ANNOUNCEMENT);
    			else if(list.getSelectedIndex() == 3)
    				if(choice.getSelectedIndex() > -1)
    				{
    					if(CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].type == Announcement.CALENDAR_ANNOUNCE ||
    			        		CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].type == Announcement.NORMAL_ANNOUNCE)
			        	{
    						CampusGISMain.instance.ShowAnnouncementsPage(CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].groupName,CampusGISMain.SHOW_ANNOUNCEMENT_BY_GROUPNAME);
			        	}
			        	else
			        	{
			        		CampusGISMain.instance.ShowAnnouncementsPage(CampusGISMain.instance.announce[announceList[choice.getSelectedIndex()]].owner,CampusGISMain.SHOW_ANNOUNCEMENT_BY_OWNER);
			        	}
    				}
    					
        	}
        }
        
    }
}
