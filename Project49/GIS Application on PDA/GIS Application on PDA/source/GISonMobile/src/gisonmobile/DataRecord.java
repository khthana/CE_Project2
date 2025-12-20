package gisonmobile;

//import javax.microedition.lcdui.*;


public class DataRecord {

	public DataRecord()
	{	

	}
	
	public static void saveMap(String map)
	{
		final String map2 = map;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(map2,"file:///"+FileConnect.getRoots()+"GISonCampus/map.svg");
			}
		}.start();
	}
	
	public static void saveInformation(String in)
	{
		final String in2 = in;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(in2,"file:///"+FileConnect.getRoots()+"GISonCampus/information.xml");
			}
		}.start();
	}
	/*
	public static void loadInformation()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String option = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/information.xml");
				ParseXML.loadInformation(option);
			}
		}.start();
	}*/

	public static void saveOption()
	{
		new Thread()
		{
			public void run()
			{
				String option = "<?xml version=\"1.0\"?>\r\n"
					+ "<options>\n"
					+ "<mode>"+CampusGISMain.instance.mode+"</mode>\n"
					+ "<position>"+CampusGISMain.instance.position+"</position>\n"
					+ "<ipserver>"+CampusGISMain.instance.ipServer+"</ipserver>\n"
					+ "<x>"+CampusGISMain.instance.x+"</x>\n"
					+ "<y>"+CampusGISMain.instance.y+"</y>\n"
					+ "<width>"+CampusGISMain.instance.width+"</width>\n"
					+ "<height>"+CampusGISMain.instance.height+"</height>\n"
					+ "<zoomlevel>"+CampusGISMain.instance.zoomLevel+"</zoomlevel>\n"
					+ "<savestate>"+CampusGISMain.instance.saveState+"</savestate>\n"
					+ "<showmyposition>"+CampusGISMain.instance.showMyPosition+"</showmyposition>\n"
					+ "<showcontactposition>"+CampusGISMain.instance.showContactPosition+"</showcontactposition>\n"
					+ "<showbusposition>"+CampusGISMain.instance.showBusPosition+"</showbusposition>\n"
					+ "<loadannouncement>"+CampusGISMain.instance.loadAnnouncement+"</loadannouncement>\n"
					+"<loadgroup>"+CampusGISMain.instance.loadGroup+"</loadgroup>\n"
					+"<loaduser>"+CampusGISMain.instance.loadUser+"</loaduser>\n"
					+ "</options>";
				FileConnect con = new FileConnect();
				con.saveFile(option,"file:///"+FileConnect.getRoots()+"GISonCampus/option.xml");
				CampusGISMain.instance.loading = false;
				CampusGISMain.instance.ShowAlertPage("Sucess", "Save Complete");
			}
		}.start();
	}

	public static void loadOption()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String option = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/option.xml");
				ParseXML.loadOption(option);
			}
		}.start();
	}
	
	public static void saveAnnouncements(String xmlString)
	{
		final String announce = xmlString;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(announce,"file:///"+FileConnect.getRoots()+"GISonCampus/announcements.xml");
			}
		}.start();
		try
	    {
			Thread.sleep(2000);
	    }catch(Exception ex){}
	}
	
	public static void loadAnnouncements()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String announcements = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/announcements.xml");
				ParseXML.loadAnnouncements(announcements,false);
			}
		}.start();
	}
	
	public static void saveGroups(String xmlString)
	{
		final String groups = xmlString;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(groups,"file:///"+FileConnect.getRoots()+"GISonCampus/groups.xml");
			}
		}.start();
	}
	
	public static void loadGroups()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String groups = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/groups.xml");
				ParseXML.loadGroups(groups,false);
			}
		}.start();
	}
	
	public static void saveUsers(String xmlString)
	{
		final String users = xmlString;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(users,"file:///"+FileConnect.getRoots()+"GISonCampus/users.xml");
			}
		}.start();
	}
	
	public static void loadUsers()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String users = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/users.xml");
				ParseXML.loadUsers(users,false);
			}
		}.start();
	}
	
	public static void saveProfile(String xmlString)
	{
		final String profile = xmlString;
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				con.saveFile(profile,"file:///"+FileConnect.getRoots()+"GISonCampus/profile.xml");
			}
		}.start();
	}
	
	public static void loadProfile()
	{
		new Thread()
		{
			public void run()
			{
				FileConnect con = new FileConnect();
				String profile = con.readFile("file:///"+FileConnect.getRoots()+"GISonCampus/profile.xml");
				ParseXML.loadProfile(profile);
			}
		}.start();
	}
	
}

