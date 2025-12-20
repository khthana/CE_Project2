package gisonmobile.page;


import gisonmobile.*;

import javax.microedition.lcdui.*;

public class UsersPage extends Form implements CommandListener
{
    private Command selectCommand = new Command("Select", Command.ITEM, 0);
    private Command backCommand = new Command("Back",Command.BACK,0);
    private Command profileCommand = new Command("My Profile",Command.BACK,1);
    private Command showCommand = new Command("Show",Command.OK,0);
    private Command nextCommand = new Command("Next",Command.OK,2);
    private Command prevCommand = new Command("Prev",Command.OK,1);
    private ChoiceGroup choice;
    private int userList[];
    private int count;
    private List list;
    private int start;
    private int num = 10;
    private int type;
   
    public UsersPage()
    {
        super("Users");
        
        try {
        	jbinit();
        	type = CampusGISMain.SHOW_ALL_USER;
        	initMode(type);
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
        
    }
    
    public UsersPage(int type)
    {
        super("Users");
       
        try {
        	jbinit();
        	this.type = type;
        	initMode(type);
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }  
        
    }
    
    public UsersPage(int type,int start)
    {
        super("Users");
        
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
    	if(CampusGISMain.instance.users!=null)
    	try
  	   {
    	userList = new int[CampusGISMain.instance.users.length];
    	if(type == CampusGISMain.SHOW_ALL_USER)
    	{
    		count = 0;
    		for(int i =0;i!=userList.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].active == true)
    			{
    				userList[count++] = i;
    			}
    		}
    			
        	
    	}
    	else if(type == CampusGISMain.SHOW_MY_CONTACT)
    	{                   
    		count = 0;
			for(int i =0;i!=CampusGISMain.instance.users.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].contactid > 0 &&
    					CampusGISMain.instance.users[i].contactactive == true)
        		{
    				userList[count++] = i;
        		}	
    		}
    	}
    	else if(type == CampusGISMain.SHOW_ONLINE_USER)
    	{                   
    		count = 0;
			for(int i =0;i!=CampusGISMain.instance.users.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].contactid > 0  &&
    					CampusGISMain.instance.users[i].contactactive == true &&
    					CampusGISMain.instance.users[i].online == true)
        		{
    				userList[count++] = i;
        		}	
    		}
    	}
    	else if(type == CampusGISMain.SHOW_NO_ACTIVATE_CONTACT)
    	{                   
    		count = 0;
			for(int i =0;i!=CampusGISMain.instance.users.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].contactid > 0 &&
    					CampusGISMain.instance.users[i].contactactive == false)
        		{
    				userList[count++] = i;
        		}	
    		}
    	}
    	else if(type == CampusGISMain.SHOW_TEACHER)
    	{                   
    		count = 0;
			for(int i =0;i!=CampusGISMain.instance.users.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].type  == User.TEACHER)
        		{
    				userList[count++] = i;
        		}	
    		}
    	}
    	else if(type == CampusGISMain.SHOW_STUDENT)
    	{                   
    		count = 0;
			for(int i =0;i!=CampusGISMain.instance.users.length;++i)
    		{
    			if(CampusGISMain.instance.users[i].type  == User.STUDENT)
        		{
    				userList[count++] = i;
        		}	
    		}
    	}

    	
    	choice = new ChoiceGroup("", ChoiceGroup.EXCLUSIVE);
    	if(CampusGISMain.instance.users != null && count > 0)
        {
     	   
     		   for (int i = start ;i<start+num && i<count ;++i )
    	   		{
     			   String active="";
     			  if(CampusGISMain.instance.users[userList[i]].contactactive == false &&
   	       	   			CampusGISMain.instance.users[userList[i]].contactid == CampusGISMain.instance.profile.id)
     			  {	
     				  active = " => Not Add"; 
     			  }
     			  
 	       	   		if(CampusGISMain.instance.users[userList[i]].type == User.ADMIN)
 	       	   		{
	       	   			choice.append(CampusGISMain.instance.users[userList[i]].username+" : ผู้ดูแลระบบ"+active
	       	   					, null);
 	       	   		}
 	       	   		else if(CampusGISMain.instance.users[userList[i]].type == User.STUDENT)
 	       	   		{
 	       	   			choice.append(CampusGISMain.instance.users[userList[i]].username+" : นักศึกษา"+active
 	       	   					, null);
 	       	   		}
 	       	   		else if(CampusGISMain.instance.users[userList[i]].type == User.TEACHER)
	       	   		{
	       	   			choice.append(CampusGISMain.instance.users[userList[i]].username+" : อาจารย์และบุคลากร"+active
	       	   					, null);
	       	   		}
 	       	   		
 	       	   		
    	   		}
     	  
     		  this.append(choice); 
        }
  	 }catch(Exception ex){}
    }
    
    public void jbinit() {
        this.addCommand(backCommand);
        this.addCommand(profileCommand);
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
        else if(c == profileCommand)
        {
        	CampusGISMain.instance.ShowUserPage(CampusGISMain.instance.profile);
        }
        else if(c == selectCommand)
        {
        	CampusGISMain.instance.ShowUserPage(CampusGISMain.instance.users[userList[choice.getSelectedIndex()]]);
        }
        else if(c == showCommand)
        {
        	list = new List("Show Users",List.IMPLICIT,
        			new String[]{"All","My Contact","Online Contact","No Activate Contact","Teacher","Student"},null);
        	list.setCommandListener(this);
        	CampusGISMain.instance.display.setCurrent(list);
        }
        else if(c == nextCommand)
        {
        	if(start+num < count)
        	{
        		start += num;
        		CampusGISMain.instance.ShowUsersPage(type,start);
        	}	
        }
        else if(c == prevCommand)
        {
        	if(start-num >= 0)
        	{
        		start -= num;
        		CampusGISMain.instance.ShowUsersPage(type,start);
        	}	
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
    					con.getProfileList();
    					CampusGISMain.instance.ShowUsersPage();
    				}
    				else
    					CampusGISMain.instance.ShowUsersPage();
    			}
    				
    			else if(list.getSelectedIndex() == 1)
    				CampusGISMain.instance.ShowUsersPage(CampusGISMain.SHOW_MY_CONTACT);
    			else if(list.getSelectedIndex() == 2)
    				CampusGISMain.instance.ShowUsersPage(CampusGISMain.SHOW_ONLINE_USER);
    			else if(list.getSelectedIndex() == 3)
    			{
					CampusGISMain.instance.ShowUsersPage(CampusGISMain.SHOW_NO_ACTIVATE_CONTACT);
    			}
    				
    			else if(list.getSelectedIndex() == 4)
    				CampusGISMain.instance.ShowUsersPage(CampusGISMain.SHOW_TEACHER);
    			else if(list.getSelectedIndex() == 5)
    				CampusGISMain.instance.ShowUsersPage(CampusGISMain.SHOW_STUDENT);
        	}
        }
        
    }
}
