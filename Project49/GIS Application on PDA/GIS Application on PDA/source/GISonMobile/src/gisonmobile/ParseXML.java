package gisonmobile;

import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;

import org.kxml.parser.*;
import org.kxml.kdom.*;

public class ParseXML
{
	
	public ParseXML()
	{
		
	}
	
	public static String convertToThai(String word)
	{
		char data[] = new char[word.length()];
		for(int i =0;i!=word.length();++i)
			if(word.charAt(i) > 127 && word.charAt(i) < 3424)
				data[i] = (char)(word.charAt(i)+3424);
			else
				data[i] = word.charAt(i);
		return new String(data);
	}
	
	public static void loadOption(String xmlStr)
	{
		try
		{		
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader xmlReader = new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count = rootElement.getChildCount();
			for(int i =1 ;i!=count;i+=2)
			{
				Node tmpNode = (Node)rootElement.getChild(i);
				if(tmpNode.getName().equals("mode"))
					CampusGISMain.instance.mode = tmpNode.getText();
				else if(tmpNode.getName().equals("position"))
					CampusGISMain.instance.position = tmpNode.getText();
				else if(tmpNode.getName().equals("ipserver"))
					CampusGISMain.instance.ipServer = tmpNode.getText();
				else if(tmpNode.getName().equals("x"))
					CampusGISMain.instance.x = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("y"))
					CampusGISMain.instance.y = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("width"))
					CampusGISMain.instance.width = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("height"))
					CampusGISMain.instance.height = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("zoomlevel"))
					CampusGISMain.instance.zoomLevel = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("savestate"))
					CampusGISMain.instance.saveState = Integer.parseInt(tmpNode.getText());
				else if(tmpNode.getName().equals("showmyposition"))
					CampusGISMain.instance.showMyPosition = tmpNode.getText();
				else if(tmpNode.getName().equals("showcontactposition"))
					CampusGISMain.instance.showContactPosition = tmpNode.getText();
				else if(tmpNode.getName().equals("showbusposition"))
					CampusGISMain.instance.showBusPosition = tmpNode.getText();
				else if(tmpNode.getName().equals("loadannouncement"))
					CampusGISMain.instance.loadAnnouncement = tmpNode.getText();
				else if(tmpNode.getName().equals("loadgroup"))
					CampusGISMain.instance.loadGroup = tmpNode.getText();
				else if(tmpNode.getName().equals("loaduser"))
					CampusGISMain.instance.loadUser = tmpNode.getText();
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
			CampusGISMain.instance.mode = "";
			CampusGISMain.instance.position = "Manual";
			CampusGISMain.instance.ipServer = "161.246.6.214";
			CampusGISMain.instance.x = -1;
			CampusGISMain.instance.y = -1;
			CampusGISMain.instance.width = -1;
			CampusGISMain.instance.height = -1;
			CampusGISMain.instance.zoomLevel = -1;
			CampusGISMain.instance.saveState = -1;
			CampusGISMain.instance.showMyPosition = "No";
			CampusGISMain.instance.showContactPosition = "No";
			CampusGISMain.instance.showBusPosition = "No";
			CampusGISMain.instance.loadAnnouncement = "No";
			CampusGISMain.instance.loadGroup = "No";
			CampusGISMain.instance.loadUser = "No";
		}
		
	}
	
	public static void loadAnnouncements (String xmlStr,boolean isTemp)
	{
		try
		{		
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			
			int count =  rootElement.getChildCount();
			if(isTemp)
			{
				CampusGISMain.instance.tmpAnnounce = new Announcement[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.tmpAnnounce[i/2] = new Announcement((Element)rootElement.getChild(i));	
				} 
			}
			else
			{
				CampusGISMain.instance.announce = new Announcement[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.announce[i/2] = new Announcement((Element)rootElement.getChild(i));	
				} 
			}
				
		}
		catch(Exception ex){System.out.println("Load Announcements error in DataRecord Class "+ex.getMessage());}
	}

	public static void loadGroups (String xmlStr,boolean isTemp)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			
			int count =  rootElement.getChildCount();
			if(isTemp)
			{
				CampusGISMain.instance.tmpGroups = new Group[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.tmpGroups[i/2] = new Group((Element)rootElement.getChild(i));	
				} 
			}
			else
			{
				CampusGISMain.instance.groups = new Group[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.groups[i/2] = new Group((Element)rootElement.getChild(i));	
				} 
			}
				
		}
		catch(Exception ex){System.out.println("Load Groups error in DataRecord Class : "+ex.getMessage());}
	}
	
	public static void loadUsers (String xmlStr,boolean isTemp)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			
			int count =  rootElement.getChildCount();
			
			if(isTemp)
			{
				CampusGISMain.instance.tmpUsers = new User[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.tmpUsers[i/2] = new User((Element)rootElement.getChild(i));	
				}
			}
			else
			{
				CampusGISMain.instance.users = new User[count/2];
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.users[i/2] = new User((Element)rootElement.getChild(i));	
				}
			}
			 
		}
		catch(Exception ex){System.out.println("Load Users error in DataRecord Class : "+ex.getMessage());}
	}
	
	public static void loadProfile (String xmlStr)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			
			int count =  rootElement.getChildCount();
			
			for(int i=1;i!=count;i+=2)
			{
				CampusGISMain.instance.profile = new User((Element)rootElement.getChild(i));	
			} 
		}
		catch(Exception ex){System.out.println("Load profile error in DataRecord Class : "+ex.getMessage());}
	}
	
	public static void loadLayers (String xmlStr)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count =  rootElement.getChildCount();
			CampusGISMain.instance.layers = new Layer[count/2];
			for(int i=1;i!=count;i+=2)
			{
				CampusGISMain.instance.layers[i/2] = new Layer((Element)rootElement.getChild(i));	
			} 
		}
		catch(Exception ex){System.out.println("Load ID Class : "+ex.getMessage());}
	}
	
	public static void loadNearbyID (String xmlStr)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count =  rootElement.getChildCount();
			CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearbyID = new int[count/2];
			
			for(int i=1;i!=count;i+=2)
			{
				CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearbyID[i/2] = Integer.parseInt(((Node)rootElement.getChild(i)).getText());	
			} 
			
		}
		catch(Exception ex){System.out.println("Load ID Class : "+ex.getMessage());}
	}
	
	public static void loadNearestID (String xmlStr)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count =  rootElement.getChildCount();
			for(int i=1;i!=count;i+=2)
			{
				CampusGISMain.instance.layers[CampusGISMain.instance.searchLayerID].nearestID = Integer.parseInt(((Node)rootElement.getChild(i)).getText());	
			} 
		}
		catch(Exception ex){System.out.println("Load ID Class : "+ex.getMessage());}
	}
	
	public static void loadObjectElement (String xmlStr,int option)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count =  rootElement.getChildCount();
			
			if(option == ObjectElement.LOAD_CONTACT)
			{	
				CampusGISMain.instance.contacts = new MyContactElement[count/2];		
				
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.contacts[i/2] = new MyContactElement((Element)rootElement.getChild(i));	
				} 
			}
			else if(option == ObjectElement.LOAD_RECORD)
			{				
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.myRecord = new MyRecordElement((Element)rootElement.getChild(i));	
				}
			}
			else if(option == ObjectElement.LOAD_BUS)
			{
				CampusGISMain.instance.bus = new BusElement[count/2];		
				for(int i=1;i!=count;i+=2)
				{
					CampusGISMain.instance.bus[i/2] = new BusElement((Element)rootElement.getChild(i));	
				} 
			}
			
		}
		catch(Exception ex){System.out.println("Load ObjectElement Class : "+ex.getMessage());}
	}
	
	public static void loadLayer (String xmlStr)
	{
		try
		{
			xmlStr = xmlStr.replace('&', ' ');
			byte[] xmlByteArray = xmlStr.getBytes();
			ByteArrayInputStream xmlStream = new ByteArrayInputStream( xmlByteArray );
			InputStreamReader  xmlReader= new InputStreamReader( xmlStream );
			XmlParser parser = new XmlParser(xmlReader);
			Document  doc = new Document();
			doc.parse(parser);
			Element rootElement = doc.getRootElement();
			int count =  rootElement.getChildCount();
			CampusGISMain.instance.layers = new Layer[count];
			
			for(int i=0;i!=count;i+=1)
			{
				CampusGISMain.instance.layers[i] = new Layer((Element)rootElement.getChild(i));
			} 
			
		}
		catch(Exception ex){ex.printStackTrace();}
	}	
};