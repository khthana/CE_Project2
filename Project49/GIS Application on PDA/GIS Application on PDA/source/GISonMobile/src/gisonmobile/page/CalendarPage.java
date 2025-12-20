package gisonmobile.page;

import java.util.Date;
import java.util.TimeZone;

import gisonmobile.*;

import javax.microedition.lcdui.*;

public class CalendarPage extends Form implements CommandListener
{
	private Command addCommand = new Command("Add to appointment", Command.OK, 1);
    private Command backCommand = new Command("Back",Command.BACK,1);
    private EventCalendar calendar;
	private DateField startTime,endTime;
    private ChoiceGroup alarmChoice,alarmUnit,isAlarm;
    private TextField summary = new TextField("","",100,TextField.ANY);
    private TextField note = new TextField("","",500,TextField.ANY);
    private TextField location = new TextField("","",100,TextField.ANY);

    public CalendarPage(EventCalendar calendar)
    {
        super("Calendar");
        this.calendar = calendar;
        try {
            jbInit();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        try {
            init();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    private void jbInit() throws Exception {
        // add the Exit command
        this.addCommand(addCommand);
        this.addCommand(backCommand);
        this.setCommandListener(this);
    }
    
    private void init() throws Exception{
    	this.summary.setLabel(" เรื่อง");
    	this.summary.setString(calendar.summary);
		this.note.setLabel(" รายละเอียด");
		this.note.setString(calendar.note);
    	this.location.setLabel(" สถานที่");
    	if(!calendar.location.equals("null"))
    		this.location.setString(calendar.location);
    	this.append(this.summary);
		this.append(this.note);
		this.append(this.location);
		
		this.startTime = new DateField(" เวลาเริ่ม",DateField.DATE_TIME,TimeZone.getDefault());
		this.endTime = new DateField(" เวลาจบ  ",DateField.DATE_TIME,TimeZone.getDefault());
		
		
		if(calendar.startTime != null)	
    		this.startTime.setDate(calendar.startTime);
		else
			this.startTime.setDate(new Date());
		if(calendar.endTime != null)	
    		this.endTime.setDate(calendar.endTime);
		else
			this.endTime.setDate(calendar.startTime);
		
		this.isAlarm = new ChoiceGroup("แจ้งเตือน",ChoiceGroup.POPUP);
		this.isAlarm.append("เตือน", null);
		this.isAlarm.append("ไม่เตือน", null);
		
		this.alarmChoice = new ChoiceGroup("เวลาเตือน", ChoiceGroup.POPUP);
		this.alarmChoice.append("0", null);
		this.alarmChoice.append("1", null);
		this.alarmChoice.append("2", null);
		this.alarmChoice.append("3", null);
		this.alarmChoice.append("5", null);
		this.alarmChoice.append("10", null);
		this.alarmChoice.append("15", null);
		this.alarmChoice.append("30", null);
		this.alarmChoice.append("45", null);
		this.alarmChoice.append("60", null);
		
		this.alarmUnit = new ChoiceGroup("หน่วยเวลา", ChoiceGroup.POPUP);
		this.alarmUnit.append("second", null);
		this.alarmUnit.append("minute", null);
		this.alarmUnit.append("hour", null);
		
		this.append(startTime);
		this.append(endTime);
		this.append(isAlarm);
		this.append(alarmChoice);
		this.append(alarmUnit);
    }

    public void commandAction(Command c, Displayable displayable) {
    	if (c == backCommand) {    
			CampusGISMain.instance.ShowCalendarsPage();
        }else if(c == addCommand)
        {
        	calendar.summary = summary.getString();
        	calendar.note = note.getString();
        	calendar.location = location.getString();
        	calendar.startTime.setTime(startTime.getDate().getTime());
     //   	announce.calendar.endTime.setTime(endTime.getDate().getTime());
        	if(isAlarm.getSelectedIndex() == 0)
        		calendar.isAlarm = true;
			int flag = 0;
        	if(alarmUnit.getSelectedIndex() == 0)
        		flag = 1000;
        	else if(alarmUnit.getSelectedIndex() == 1)
        		flag = 60*1000;
        	else if(alarmUnit.getSelectedIndex() == 2)
        		flag = 60*60*1000;
        	calendar.alarm = flag*Integer.parseInt(alarmChoice.getString(alarmChoice.getSelectedIndex()));
        	
        	calendar.commit();
        }
        
    }

}
