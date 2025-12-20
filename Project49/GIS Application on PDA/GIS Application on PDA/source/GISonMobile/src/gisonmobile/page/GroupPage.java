package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;


public class GroupPage extends Form implements CommandListener
{
    private Command addCommand = new Command("Add this group", Command.OK, 0);
    private Command removeCommand = new Command("leave from group", Command.OK, 1);
    private Command moderatorCommand = new Command("Moderator", Command.ITEM, 1);
    private Command backCommand = new Command("Back",Command.BACK,0);
    private Command announceCommand = new Command("Announcemets",Command.BACK,1);
    private Group group;
    
    public GroupPage(Group group)
    {
    	super(group.name);
    	this.group = group;
        try {
            jbinit();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
    	this.addCommand(announceCommand);
    	this.addCommand(backCommand);
    	if(!group.mygroup)
    		this.addCommand(addCommand);
    	else
    		this.addCommand(removeCommand);
    	this.addCommand(moderatorCommand);
        this.setCommandListener(this);
        
        String content="",content1="",content2="",content3="";
        content = group.name;
        content1 = group.moderator;
		content2 = group.details;
		if(group.type == Group.INTERESTING_GROUP)
			content3 = "ชุมนุมและชมรม";
		else if(group.type == Group.STUDY_GROUP)
			content3 = "วิชาเรียน";
			
        
		this.append(new StringItem("ชื่อกลุ่ม : ",content,Item.PLAIN));
    	this.append(new StringItem("\nรายละเอียด","\n   "+content2.toString(),Item.PLAIN));
    	this.append(new StringItem("\nผู้ดูแล : ",content1,Item.BUTTON));
    	this.append(new StringItem("\nประเภท : ",content3,Item.BUTTON));
    	
    }

    public void commandAction(Command c, Displayable d) {
       if(c == backCommand)
       {
    	   CampusGISMain.instance.ShowGroupsPage();
       }
       else if(c == announceCommand)
       {
    	   CampusGISMain.instance.ShowAnnouncementsPage();
       }
       else if(c == moderatorCommand)
       {
    	   for(int i=0;i!=CampusGISMain.instance.users.length;++i)
    	   {
    		   if(group.moderator.equals(CampusGISMain.instance.users[i].username))
    		   {
    			   CampusGISMain.instance.ShowUserPage(CampusGISMain.instance.users[i]);
    			   break;
    		   }
    	   }
       }
       else if(c == addCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.registerToGroup(group.name);
       }
       else if(c == removeCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.departGroup(group.name);
       }
    }
}
