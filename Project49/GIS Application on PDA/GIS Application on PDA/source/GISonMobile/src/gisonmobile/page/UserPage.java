package gisonmobile.page;

import gisonmobile.*;

import javax.microedition.lcdui.*;


public class UserPage extends Form implements CommandListener
{
	private Command backCommand = new Command("Back",Command.BACK,0);
	private Command groupCommand = new Command("My group", Command.BACK, 1);
    private Command editCommand = new Command("Edit my profile",Command.OK,4);
    private Command addCommand = new Command("Add to contact",Command.OK,5);
    private Command activateCommand = new Command("Accept this contact",Command.OK,6);
    private Command removeCommand = new Command("Remove this contact",Command.OK,7);
    
    private User user;
    TextField year = new TextField("", "", 1, TextField.DECIMAL);
    TextField phone = new TextField("", "", 15, TextField.PHONENUMBER);
    TextField email  = new TextField("", "", 30, TextField.EMAILADDR);
    TextField password = new TextField("", "", 15, TextField.ANY);
    
    public UserPage(User user)
    {
    	super("Profile : "+user.username);
    	this.user = user;
        try {
            jbinit();
            
        } catch (Exception ioe) {
            ioe.printStackTrace();
        }
    }

    public void jbinit() {
    	
    	this.addCommand(backCommand);
        
        if(user.id == CampusGISMain.instance.profile.id)
        {
        	this.addCommand(editCommand);
        	this.addCommand(groupCommand);
        }
        else
        {
        	if(user.contactid > 0)
        	{
        		if(	user.contactactive == false)
            	{
        			this.addCommand(activateCommand);
            	}
        		else
            		this.addCommand(removeCommand);
        	}
        	else
        		this.addCommand(addCommand);
        	
        }
        
        this.setCommandListener(this);
        
        StringItem str = 	new StringItem("	ชื่อ 		: ",user.name+" "+user.surname,Item.BUTTON);
    	this.append(str);
    	str = 				new StringItem("	คณะ 		: ",user.faculty,Item.BUTTON);
    	this.append(str);
    	str = 				new StringItem("	ภาควิชา 	: ",user.major,Item.BUTTON);
    	this.append(str);
    	if(user.type == User.STUDENT)
    	{
    		if(user.id == CampusGISMain.instance.profile.id)
    		{
    			year.setLabel("นักศึกษาชั้นปี");
    			year.setString(user.year);
    			this.append(year);
    		}
    		else
    		{
    			str = 			new StringItem("นักศึกษาชั้นปี 	: ",user.year,Item.BUTTON);
        		this.append(str);
    		}
    		
    		str = 			new StringItem("รหัสนักศึกษา 	: ",user.studentid,Item.BUTTON);
    		this.append(str);
    	}
    	else if(user.type == User.TEACHER)
    	{
    		str = 			new StringItem("ตำแหน่ง 	 	: ","อาจารย์และบุคลากร",Item.BUTTON);
    		this.append(str);
    	}
    	else if(user.type == User.ADMIN)
    	{
    		str = 			new StringItem("ตำแหน่ง 	 	: ","ผู้ดูแลระบบ",Item.BUTTON);
    		this.append(str);
    	}
    	
    	str = 				new StringItem("	ชื่อผู้ใช้ 	: ",user.username,Item.BUTTON);
    	this.append(str);
    	
    	if(user.id == CampusGISMain.instance.profile.id)
    	{
    		phone.setLabel("เบอร์โทรศัพท์");
    		phone.setString(user.phone);
    		email.setLabel("อีเมลล์");
    		email.setString(user.email);
    		password.setLabel("รหัสผ่าน");
    		password.setString(user.password);
    		this.append(password);
    		this.append(phone);
    		this.append(email);
    	}
    	else
    	{
    		str = 				new StringItem("	เบอร์โทรศัพท์ 	: ",user.phone,Item.BUTTON);
        	this.append(str);
        	str = 				new StringItem("	อีเมลล์ 	: ",user.email,Item.BUTTON);
        	this.append(str);
    	}

    }

    public void commandAction(Command c, Displayable d) {
       if(c == backCommand)
       {
    	   CampusGISMain.instance.ShowUsersPage();
       }
       else if(c == groupCommand)
       {
    	   CampusGISMain.instance.ShowGroupsPage(CampusGISMain.SHOW_MY_GROUP);
       }
       else if(c == editCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.editProfile(year.getString(),phone.getString(),email.getString(),password.getString());
       }
       else if(c == addCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.addContact(""+user.id);
       }
       else if(c == activateCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.activateContact(""+user.id);
       }
       else if(c == removeCommand)
       {
    	   ConnectService con = new ConnectService();
		   con.removeContact(""+user.id);
       }
    }
}
