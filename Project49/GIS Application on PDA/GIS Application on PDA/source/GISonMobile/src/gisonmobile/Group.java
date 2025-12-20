package gisonmobile;

//import javax.microedition.lcdui.AlertType;

import org.kxml.kdom.*;

public class Group
{	
	public final static int STUDY_GROUP = 0;
	public final static int INTERESTING_GROUP = 1;
	public int id,type;
	public String name,details,moderator;
	public boolean mygroup=false;
	
	public Group(Element group)
	{
		int count = group.getChildCount();
		
		for(int i =1 ;i!=count;i+=2)
		{
			this.id = Integer.parseInt(group.getAttribute("id").getValue());
			Node groupNode = (Node)group.getChild(i);
			
			if(groupNode.getName().equals("type"))
				this.type = Integer.parseInt(groupNode.getText());
			else if(groupNode.getName().equals("name"))
				this.name = ParseXML.convertToThai(groupNode.getText());
			else if(groupNode.getName().equals("details"))
				this.details = ParseXML.convertToThai(groupNode.getText());
			else if(groupNode.getName().equals("moderator"))
				this.moderator = groupNode.getText();
			else if(groupNode.getName().equals("mygroup"))
			{
				if(groupNode.getText().equals("true"))
					this.mygroup = true;
				else
					this.mygroup = false;
			}
				
		}
	}
		
};