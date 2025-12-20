package gisonmobile.page;

import java.util.TimeZone;
import java.util.Calendar;
import gisonmobile.*;

import javax.microedition.lcdui.*;

public class CalendarsPage extends Form implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 0);
    private Command backCommand = new Command("Back",Command.BACK,0);
    private Command showCommand = new Command("Show",Command.OK,0);
    private Command nextCommand = new Command("Next",Command.OK,2);
    private Command prevCommand = new Command("Prev",Command.OK,1);
    private ChoiceGroup choice;
    private int calendarList[];
    private int count,start = 0,num = 5;
    private List list;
    private int type;
   
    public CalendarsPage()
    {
        super("Calendars");
        
        try {
        	jbinit();
        	type = CampusGISMain.SHOW_ALL_CALENDAR;
        	initMode(type);
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
    
    public CalendarsPage(int type)
    {
        super("Calendars");
        
        try {
        	jbinit();
        	this.type = type;
        	initMode(type);
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
        
        
    }
    
    public CalendarsPage(int type,int start)
    {
        super("Calendars");
      
        try {
        	jbinit();
        	this.start = start;
        	this.type = type;
        	initMode(type);
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
        
       
    }
    
    public void initMode(int type)
    {
    	if(CampusGISMain.instance.announce!=null)
    	try
    	{
    	calendarList = new int[CampusGISMain.instance.announce.length];
    	if(type == CampusGISMain.SHOW_ALL_CALENDAR)
    	{
        	for(int i =0;i!=calendarList.length;++i)
        	{
        		if(Announcement.CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type || 
        				Announcement.CONTACT_CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type)
        		{
    				calendarList[count++] = i;
        		}	
        	}
    	}
    	else if(type == CampusGISMain.SHOW_GROUP_CALENDAR)
    	{                   
    		count = 0;
    		
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(Announcement.CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type)
            		{
        				calendarList[count++] = i;
            		}	
        		}
    	}
    	else if(type == CampusGISMain.SHOW_CONTACT_CALENDAR)
    	{                   
    		count = 0;
    		
    			for(int i =0;i!=CampusGISMain.instance.announce.length;++i)
        		{
        			if(Announcement.CONTACT_CALENDAR_ANNOUNCE == CampusGISMain.instance.announce[i].type)
            		{
        				calendarList[count++] = i;
            		}	
        		}
    	}

    	
    	choice = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE);
    	if(CampusGISMain.instance.announce != null && count > 0)
        {
     	   
     		   for (int i = start ;i<start+num && i<count ;++i )
    	   		{
 	       	   		if(CampusGISMain.instance.announce[calendarList[i]].type == Announcement.CALENDAR_ANNOUNCE)
 	       	   		{
 	       	   			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
	       	   			calendar.setTime(CampusGISMain.instance.announce[calendarList[i]].postTime);
	       	   			choice.append(CampusGISMain.instance.announce[calendarList[i]].calendar.summary+"\n"+
	       	   				"โดยกลุ่ม => "+CampusGISMain.instance.announce[calendarList[i]].groupName+"\n"+
	       	   				"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
	           	   				calendar.get(Calendar.MONTH)+1+"/"+
	           	   				calendar.get(Calendar.YEAR)+","+
	           	   				calendar.get(Calendar.HOUR)+":"+
	           	   				calendar.get(Calendar.MINUTE)+":"+
	           	   				calendar.get(Calendar.SECOND)+"\n"+
	           	   				"ประเภท : Group Calendar"
	           	   				, null);
 	       	   		}
 	       	   		else if(CampusGISMain.instance.announce[calendarList[i]].type == Announcement.CONTACT_CALENDAR_ANNOUNCE)
 	       	   		{
 	       	   			Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT+7"));
 	       	   			calendar.setTime(CampusGISMain.instance.announce[calendarList[i]].postTime);
 	       	   			choice.append(CampusGISMain.instance.announce[calendarList[i]].calendar.summary+"\n"+
 	       	   					"ผู้ลงประกาศ => "+CampusGISMain.instance.announce[calendarList[i]].owner+"\n"+
 	       	   					"ประกาศเมื่อ => "+calendar.get(Calendar.DAY_OF_MONTH)+"/"+
	           	   				calendar.get(Calendar.MONTH)+1+"/"+
	           	   				calendar.get(Calendar.YEAR)+","+
	           	   				calendar.get(Calendar.HOUR)+":"+
	           	   				calendar.get(Calendar.MINUTE)+":"+
	           	   				calendar.get(Calendar.SECOND)+"\n"+
	           	   				"ประเภท : Contact Calendar"
	           	   				, null);
 	       	   		}
    	   		}
     		  this.append(choice);
        }
    	}catch(Exception ex){}
    }
    
    public void jbinit() {
        this.addCommand(backCommand);
        this.addCommand(selectCommand);
        this.addCommand(showCommand);
        this.addCommand(nextCommand);
        this.addCommand(prevCommand);
        this.setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
        if (c == backCommand) {    
			CampusGISMain.instance.ShowMainPage();
        }
        else if(c == selectCommand)
        {
        	CampusGISMain.instance.ShowCalendarPage(CampusGISMain.instance.announce[calendarList[choice.getSelectedIndex()]].calendar);
        }
       
        else if(c == showCommand)
        {
        	list = new List("Show Announcement",List.IMPLICIT,
        			new String[]{"All Calendar","Group Calendar","Contact Calendar"},null);
        	list.setCommandListener(this);
        	CampusGISMain.instance.display.setCurrent(list);
        }
        else if(c == nextCommand)
        {
        	if(start+num < count)
        	{
        		start += num;
        		CampusGISMain.instance.ShowCalendarsPage(type,start);
        	}	
        }
        else if(c == prevCommand)
        {
        	if(start-num >= 0)
        	{
        		start -= num;
        		CampusGISMain.instance.ShowCalendarsPage(type,start);
        	}	
        }
        else if (c == List.SELECT_COMMAND)
        {
        	if(list != null)
        	{
    			if(list.getSelectedIndex() == 0)
    				CampusGISMain.instance.ShowCalendarsPage(CampusGISMain.SHOW_ALL_CALENDAR);
    			else if(list.getSelectedIndex() == 1)
    				CampusGISMain.instance.ShowCalendarsPage(CampusGISMain.SHOW_GROUP_CALENDAR);
    			else if(list.getSelectedIndex() == 2)
    				CampusGISMain.instance.ShowCalendarsPage(CampusGISMain.SHOW_CONTACT_CALENDAR);
        	}
        }
        
    }
}
