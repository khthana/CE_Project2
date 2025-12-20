package gisonmobile;

//import javax.microedition.lcdui.AlertType;

import org.kxml.kdom.*;

public class User
{
	public String name="",surname="",faculty="",major="",phone="",email="",studentid="",
					username="",year="",password="",groupregister="";
	public int type=-1,id=-1,contactid=-1,membergroupid=-1;
	public boolean active,contactactive,online;
	
	public final static int ADMIN = 0;
	public final static int STUDENT = 1;
	public final static int TEACHER = 2;
	
	public User(Element user)
	{
		int count = user.getChildCount();
		for(int i =1 ;i!=count;i+=2)
		{
			this.id = Integer.parseInt(user.getAttribute("id").getValue());
			Node userNode = (Node)user.getChild(i);
			
			if(userNode.getName().equals("type"))
				this.type = Integer.parseInt(userNode.getText());
			else if(userNode.getName().equals("name"))
				this.name = ParseXML.convertToThai(userNode.getText());
			else if(userNode.getName().equals("surname"))
				this.surname = ParseXML.convertToThai(userNode.getText());
			else if(userNode.getName().equals("faculty"))
				this.faculty = ParseXML.convertToThai(userNode.getText());
			else if(userNode.getName().equals("major"))
				this.major = ParseXML.convertToThai(userNode.getText());
			else if(userNode.getName().equals("phone"))
				this.phone = userNode.getText();
			else if(userNode.getName().equals("email"))
				this.email = userNode.getText();
			else if(userNode.getName().equals("studentid"))
				this.studentid = userNode.getText();
			else if(userNode.getName().equals("username"))
				this.username = userNode.getText();
			else if(userNode.getName().equals("password"))
				this.password = userNode.getText();
			else if(userNode.getName().equals("year"))
				this.year = userNode.getText();
			else if(userNode.getName().equals("active"))
			{
				if(userNode.getText().equals("true"))
					this.active = true;
				else
					this.active = false;
			}
			else if(userNode.getName().equals("contactid"))
				this.contactid = Integer.parseInt(userNode.getText());
			else if(userNode.getName().equals("contactactive"))
			{
				if(userNode.getText().equals("false"))
					this.contactactive = false;
				else
					this.contactactive = true;
			}
			else if(userNode.getName().equals("groupregister"))
				this.groupregister = userNode.getText();
			else if(userNode.getName().equals("membergroupid"))
				this.membergroupid = Integer.parseInt(userNode.getText());
			else if(userNode.getName().equals("online"))
			{
				if(userNode.getText().equals("true"))
					this.online = true;
				else
					this.online = false;
			}
		}
	}
		
};