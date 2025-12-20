package gisonmobile;

//import javax.microedition.lcdui.AlertType;
import javax.microedition.pim.*;
//import java.io.*;
import java.util.*;
import org.kxml.kdom.*;
import javax.microedition.lcdui.AlertType;

public class EventCalendar
{
	public String summary="", note="",location="";
	public Date startTime=null,endTime=null;
	public int alarm=0;
	public boolean isAlarm=false;

	public EventCalendar(Node calendar)
	{
		int count = calendar.getChildCount();
		for(int i =1 ;i!=count;i+=2)
		{
			Node tmpNode = (Node)calendar.getChild(i);
			if(tmpNode.getName().equals("summary"))
				this.summary = ParseXML.convertToThai(tmpNode.getText());
			else if(tmpNode.getName().equals("note"))
				this.note = ParseXML.convertToThai(tmpNode.getText());
			else if(tmpNode.getName().equals("location"))
				this.location = ParseXML.convertToThai(tmpNode.getText());
			else if(tmpNode.getName().equals("startTime"))
			{
				if(!tmpNode.getText().equals("null"))
					this.startTime = new Date((Long.parseLong(tmpNode.getText())));
			}
			else if(tmpNode.getName().equals("endTime"))
			{
				if(!tmpNode.getText().equals("null"))
					this.endTime = new Date((Long.parseLong(tmpNode.getText())));
			}
					
		}		
		
	}
	
	public static String[] getEventsSupport()
	{
		PIM pim = PIM.getInstance();
		return pim.listPIMLists(PIM.EVENT_LIST);
	}
	
	private static EventList openEvent(String event)
	{
		try
		{
			PIM pim = PIM.getInstance();
			return (EventList) pim.openPIMList(PIM.EVENT_LIST,PIM.READ_WRITE,event);
		}
		catch(Exception ex)
		{
			return null;
		}
	}

	/*
	 * Support Fields
	 * 	Alarm
	 * 	Starts
	 * 	Ends
	 * 	Notes
	 * 	Location
	 * 	Status
	 * 	UID
	*/
	
	public void commit()
	{
	//	ByteArrayOutputStream out = new ByteArrayOutputStream();
		EventList eventList = null;
		try
		{
			String listNames[] = getEventsSupport();
			if (listNames.length > 0)
			{
				eventList = openEvent(listNames[0]);
				Event newEvent = eventList.createEvent();
				if (eventList.isSupportedField(Event.SUMMARY))
				{
					if (!summary.equals(""))
						newEvent.addString(Event.SUMMARY,PIMItem.ATTR_NONE,summary);
				}
				if (eventList.isSupportedField(Event.NOTE))
				{
					if (!note.equals(""))
						newEvent.addString(Event.NOTE,PIMItem.ATTR_NONE,note);
				}
				if (eventList.isSupportedField(Event.LOCATION))
				{
					if (!location.equals(""))
						newEvent.addString(Event.LOCATION,PIMItem.ATTR_NONE,location);
				}
				if (eventList.isSupportedField(Event.START))
				{
					if(startTime != null)
						newEvent.addDate(Event.START,PIMItem.ATTR_NONE,startTime.getTime());
				}
	//			if (eventList.isSupportedField(Event.END))
	//			{
	//				if(endTime != null)
	//					newEvent.addDate(Event.END,PIMItem.ATTR_NONE,endTime.getTime());
	//			}
	//			if (eventList.isSupportedField(Event.ALARM))
	//			{
	//				if(isAlarm)
	//					newEvent.addInt(Event.ALARM,PIMItem.ATTR_NONE,(int)(startTime.getTime()-alarm));
	//			}
		//		 let's check that VCALENDAR/1.0 is supported
		//		String supportedFormats[] = PIM.getInstance().supportedSerialFormats(PIM.EVENT_LIST);
				
		//		for (int i=0;i<supportedFormats.length;i++) 
		//		{
		//			if (supportedFormats[i].equals("VCALENDAR/1.0")) 
		//			{
		//				PIM.getInstance().toSerialFormat(newEvent,out,"UTF-8","VCALENDAR/1.0");
		//				break;
		//			}
		//		}
				
	//			if (out.size() == 0)
	//			{
	//				CampusGISMain.instance.ShowAlertPage("VCALENDAR/1.0 not supported");
	//			}
		//		 let's add the event locally
		//		 an advanced version should wait for an ack
				eventList.importEvent(newEvent);
				newEvent.commit();
				CampusGISMain.instance.ShowAnnouncementsPage();
				CampusGISMain.instance.ShowAlertPage("Complete !", "Already add to calendar ");
			}
			else
			{
				CampusGISMain.instance.ShowErrorPage("Error commit","No Event list available");
			}
		}
		catch (PIMException e)
		{
			CampusGISMain.instance.ShowErrorPage("Error",e.getMessage());
		}
		catch (SecurityException e)
		{
			CampusGISMain.instance.ShowErrorPage("Error",e.getMessage());
		}
	//	catch (UnsupportedEncodingException e)
//		{
			//		 should not happen since UTF-8 is mandatory
//		}
		finally
		{
			try
			{
				if (eventList != null)
				{
					eventList.close();
				}
			}
			catch (PIMException e)
			{
				//		 ignore, we are closing anyway
			}
		}
		
	}
		
};