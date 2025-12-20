package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;

public class GroupsPage extends Form implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 0);
    
    private Command backCommand = new Command("Back",Command.BACK,0);
    private Command showCommand = new Command("Filter",Command.OK,0);
    private Command nextCommand = new Command("Next",Command.OK,2);
    private Command prevCommand = new Command("Prev",Command.OK,1);
    private ChoiceGroup choice = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE);
    private int groupList[];
    private int count,start=0,num=10;
    private List list;
    private int type;
    public GroupsPage()
    {
        super("Groups");
        try {
        	this.type = CampusGISMain.SHOW_ALL_GROUP;
        	jbinit();
        	initMode(type);
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
    
    public GroupsPage(int type)
    {
    	super("Groups");	
    	
    	try {
    		this.type = type;
        	jbinit();
        	initMode(type);
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
    
    public GroupsPage(int type,int start)
    {
    	super("Groups");	
    	try {
    		this.start = start;
    		this.type = type;
        	jbinit();
        	initMode(type);
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }
    
    private void initMode(int type)
    {
    	if(CampusGISMain.instance.announce!=null)
    	try {
        	
        	groupList = new int[CampusGISMain.instance.groups.length];
        	if(type == CampusGISMain.SHOW_ALL_GROUP)
        	{
            	for(int i =0;i!=groupList.length;++i)
            		groupList[i] = i;
            	count = groupList.length;
        	}
        	else if(type == CampusGISMain.SHOW_STUDY_GROUP)
        	{
        		count = 0;
        		for(int i =0;i!=CampusGISMain.instance.groups.length;++i)
            	{
            		if(CampusGISMain.instance.groups[i].type == Group.STUDY_GROUP)
            			groupList[count++] = i; 
            	}		
        	}
        	else if(type == CampusGISMain.SHOW_INTERESTING_GROUP)
        	{
        		count = 0;
        		for(int i =0;i!=CampusGISMain.instance.groups.length;++i)
            	{
            		if(CampusGISMain.instance.groups[i].type == Group.INTERESTING_GROUP)
            			groupList[count++] = i; 
            	}
        	}
        	else if(type == CampusGISMain.SHOW_MY_GROUP)
        	{
        		count = 0;
            	for(int i =0;i!=CampusGISMain.instance.groups.length;++i)
            	{
            		if(CampusGISMain.instance.groups[i].mygroup == true)
            			groupList[count++] = i; 
            	}		
        	}
        	
        	if(CampusGISMain.instance.groups != null && count > 0)
            {
         	   try
         	   {
         		   for (int i = start ;i<start+num && i<count ;++i )
        	   			{
     	       	   		if(CampusGISMain.instance.groups[groupList[i]].type == Group.STUDY_GROUP)
     	       	   		{
     	       	   			choice.append(CampusGISMain.instance.groups[groupList[i]].name+" : วิชาเรียน"	
     	           	   				, null);
     	       	   		}
     	       	   		else if(CampusGISMain.instance.groups[groupList[i]].type == Group.INTERESTING_GROUP)
     	       	   		{
     	       	   			choice.append(CampusGISMain.instance.groups[groupList[i]].name	
     	       	   					, null);
     	       	   		}
        	   			}
         	   }catch(Exception ex){CampusGISMain.instance.ShowAlertPage("Error", ex.getMessage());}
         	   	 
            }
            
            this.append(choice);
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
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
        	CampusGISMain.instance.ShowGroupPage(CampusGISMain.instance.groups[groupList[choice.getSelectedIndex()]]);
        }
        else if(c == showCommand)
        {
            	list = new List("Show Groups",List.IMPLICIT,
            			new String[]{"All Group","Study Group","Interesting Group","My Group"},null);
            	list.setCommandListener(this);
            	CampusGISMain.instance.display.setCurrent(list);
        }
        else if(c == nextCommand)
        {
        	if(start+num < count)
        	{
        		start += num;
        		CampusGISMain.instance.ShowGroupsPage(type,start);
        	}	
        }
        else if(c == prevCommand)
        {
        	if(start-num >= 0)
        	{
        		start -= num;
        		CampusGISMain.instance.ShowGroupsPage(type,start);
        	}	
        }
        else if(c == List.SELECT_COMMAND)
        {
        	if(list != null)
        	{
    			if(list.getSelectedIndex() == 0)
    			{
    				if(CampusGISMain.instance.mode.equals("Online"))
    		    	{
    		    		ConnectService con = new ConnectService();
    					con.getGroupList("0", "100");
    		    	}
    				else
    				CampusGISMain.instance.ShowGroupsPage();
    			}
    				
    			else if(list.getSelectedIndex() == 1)
    			{
    				CampusGISMain.instance.ShowGroupsPage(CampusGISMain.SHOW_STUDY_GROUP);
    			}	
    			else if(list.getSelectedIndex() == 2)
    				CampusGISMain.instance.ShowGroupsPage(CampusGISMain.SHOW_INTERESTING_GROUP);
    			else if(list.getSelectedIndex() == 3)
    				CampusGISMain.instance.ShowGroupsPage(CampusGISMain.SHOW_MY_GROUP);	
    					
        	}
        }
        
    }
}
