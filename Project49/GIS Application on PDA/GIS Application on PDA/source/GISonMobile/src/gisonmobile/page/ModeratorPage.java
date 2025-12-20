package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;

public class ModeratorPage extends Form implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 0);
    private Command backCommand = new Command("Back",Command.BACK,0);
    
    private Command showCommand = new Command("Manage",Command.OK,0);
    private Command postCommand = new Command("Post Group Announcement",Command.ITEM,2);
    private Command postAsCalendarCommand = new Command("Post Group Calendar",Command.ITEM,3);
    private Command activateGroup = new Command("Accept to group",Command.ITEM,4);
    private Command editGroup = new Command("Edit Group",Command.OK,4);
    
    private Command createGroup = new Command("Create Group",Command.OK,5);
    private Command activateMember = new Command("Accept to member",Command.ITEM,6);
    
    
    private TextField name = new TextField("","",100,TextField.ANY);
    private TextField details = new TextField("","",1000,TextField.ANY);
    private ChoiceGroup type_ = new ChoiceGroup("ชนิด",ChoiceGroup.POPUP);
    private ChoiceGroup moderator = new ChoiceGroup("ผู้ดูแล",ChoiceGroup.POPUP);
    
    private ChoiceGroup choice;
    private int moderatorList[];
    private int count;
    private List list;
    private Group group;
    private int type; 
   
   
    public ModeratorPage()
    {
        super("Moderator Page");
        try {
        	type = CampusGISMain.SHOW_EDIT_GROUP;
        	jbinit();
        	initMode(type); 
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
        
    }
    
    public ModeratorPage(int type)
    {
        super("Moderator Page");
        try {
        	this.type = type;
        	jbinit();
        	initMode(type); 
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
        
        
    }
    
    public void initMode(int type)
    {
    	if(CampusGISMain.instance.groups!=null && CampusGISMain.instance.users!=null)
    	try{
    			
    		
    	for(int i=CampusGISMain.instance.groups.length-1;i!=-1;--i)
    	{
    		if(CampusGISMain.instance.groups[i].moderator.equals(CampusGISMain.instance.profile.username))
    		{
    			group = CampusGISMain.instance.groups[i];
    			break;
    		}
    	}
    	
    	if(type == CampusGISMain.SHOW_EDIT_GROUP)
    	{
    		this.append(new StringItem("ชื่อ : "+group.name,null));
    		details.setLabel("รายละเอียด");
    		details.setString(group.details);
    		this.append(details);
    		if(group.type == Group.STUDY_GROUP)
    			this.append(new StringItem("ประเภท : วิชาเรียน" ,null));
    		else
    			this.append(new StringItem("ประเภท : ชุมนุมชมรม" ,null));
    	}
    	else if(type == CampusGISMain.SHOW_CREATE_GROUP)
    	{
    		name.setLabel("ชื่อกลุ่ม");
    		this.append(name);
    		details.setLabel("รายละเอียด");
    		this.append(details);
    		type_.append("วิชาเรียน", null);
    		type_.append("ชุมนุมและชมรม", null);
    		this.append(type_);
    		for(int i=0;i!=CampusGISMain.instance.users.length;++i)
        	{
    			if(CampusGISMain.instance.users[i].active == true)
    				moderator.append(CampusGISMain.instance.users[i].username, null);
        	}
    		this.append(moderator);
    	}
    	else 
    	{
    		choice = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE);
        	if(type == CampusGISMain.SHOW_NO_ACTIVATE_MEMBERGROUP)
        	{
        		moderatorList = new int[CampusGISMain.instance.users.length];
            	for(int i =0;i!=moderatorList.length;++i)
            	{
            		if(CampusGISMain.instance.users[i].groupregister.equals(group.name))
            		{
        				moderatorList[count++] = i;
            		}	
            	}
        	}
        	else if(type == CampusGISMain.SHOW_NO_ACTIVATE_MEMBER)
        	{
        		moderatorList = new int[CampusGISMain.instance.users.length];
            	for(int i =0;i!=moderatorList.length;++i)
            	{
            		if(CampusGISMain.instance.users[i].active == false)
            		{
        				moderatorList[count++] = i;
            		}	
            	}
        	}
        	
        	if(CampusGISMain.instance.users != null && count > 0)
            {
         	   try
         	   {
         		   for (int i = 0 ;i!=count ;++i )
        	   		{
    	       	   		choice.append(CampusGISMain.instance.users[moderatorList[i]].username
    	           	   			, null);
        	   		}
         	   }catch(Exception ex){}
         	   	 
            }
        	this.append(choice);
    	}
    	}
    	catch(Exception ex){}

    	
    }
    
    public void jbinit() {
    	
        this.addCommand(backCommand);
        this.addCommand(showCommand);
        this.addCommand(postCommand);
        this.addCommand(postAsCalendarCommand);
        
        if(CampusGISMain.instance.profile != null)
        if(CampusGISMain.instance.profile.type == User.ADMIN )
        {
        	if(type == CampusGISMain.SHOW_NO_ACTIVATE_MEMBER)
        	{
        		this.addCommand(activateMember);
        		this.addCommand(selectCommand);
        	}   
        	
        	if(type == CampusGISMain.SHOW_CREATE_GROUP)
        		this.addCommand(createGroup);
        }
        
        if(type == CampusGISMain.SHOW_NO_ACTIVATE_MEMBERGROUP)
        {
        	this.addCommand(activateGroup);
        	this.addCommand(selectCommand);
        }
        
        if(type == CampusGISMain.SHOW_EDIT_GROUP)
        {
        	this.addCommand(editGroup);
        }
        

        this.setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
        if (c == backCommand) {    
			CampusGISMain.instance.ShowMainPage();
        }
        else if(c == selectCommand)
        {
        	CampusGISMain.instance.ShowUserPage(CampusGISMain.instance.users[moderatorList[choice.getSelectedIndex()]]);
        }
        else if(c == showCommand)
        {
        	if(CampusGISMain.instance.profile.type != User.ADMIN)
        	{
        		list = new List("Show member",List.IMPLICIT,
            			new String[]{"No Activate Group Member","Edit Group"},null);
        	}
        	else
        	{
        		list = new List("Show member",List.IMPLICIT,
            			new String[]{"No Activate Group Member","Edit Group","No Activate Member","Create Group"},null);
        	}
        	
        	list.setCommandListener(this);
        	CampusGISMain.instance.display.setCurrent(list);
        }
        else if(c == postCommand)
        {
        	if(!group.name.equals(""))
        		CampusGISMain.instance.ShowPostAnnouncementPage(group.name,Announcement.NORMAL_ANNOUNCE);
        }
        else if( c == postAsCalendarCommand)
        {
        	if(!group.name.equals("null"))
        		CampusGISMain.instance.ShowPostAnnouncementPage(group.name,Announcement.CALENDAR_ANNOUNCE);
        }
        else if(c == activateGroup)
        {
        	ConnectService con = new ConnectService();
        	con.activateMemberGroup(""+CampusGISMain.instance.users[moderatorList[choice.getSelectedIndex()]].membergroupid);
        }
        else if(c == activateMember)
        {
        	ConnectService con = new ConnectService();
        	con.activateMember(""+CampusGISMain.instance.users[moderatorList[choice.getSelectedIndex()]].id);
        }
        else if(c == editGroup)
        {
        	group.details = details.getString();
        	ConnectService con = new ConnectService();
        	con.updateDetails(group.name, group.details);
        }
        else if(c == createGroup)
        {
        	String id="";
        	for(int i=0;i!=CampusGISMain.instance.users.length;++i)
        	{
        		
        		if(moderator.getString(moderator.getSelectedIndex()).equals(CampusGISMain.instance.users[i].username))
        		{	
        			id = ""+CampusGISMain.instance.users[i].id;
        			break;
        		}	
        	}
        	ConnectService con = new ConnectService();
        	con.createGroup(name.getString(), ""+type_.getSelectedIndex(), details.getString(),id );
        }
        else if (c == List.SELECT_COMMAND)
        {
        	if(list != null)
        	{
    			if(list.getSelectedIndex() == 0)
    			{
    				if(CampusGISMain.instance.mode.equals("Online"))
    				{
    					ConnectService con = new ConnectService();
    					con.getNoActiveMemberGroupList();
    					CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBERGROUP);
    				}else
    					CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBERGROUP);
    			}
    				
    			else if(list.getSelectedIndex() == 1)
    				CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_EDIT_GROUP);
    			else if(list.getSelectedIndex() == 2)
    			{
    				if(CampusGISMain.instance.mode.equals("Online"))
    				{
    					ConnectService con = new ConnectService();
    					con.getNoActiveProfileList();
    					CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBER);
    				}else
    					CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBER);
    			}
    				
    			else if(list.getSelectedIndex() == 3)
    				CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_CREATE_GROUP);
        	}
        }
        
    }
}
