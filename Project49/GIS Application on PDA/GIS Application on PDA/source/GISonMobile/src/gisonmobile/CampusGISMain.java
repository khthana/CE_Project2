package gisonmobile;

import gisonmobile.page.*;
import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;

public class CampusGISMain extends MIDlet implements CommandListener{

    public static CampusGISMain instance;
    public Display display;
    public LocationServices location;
    
    //////////// Constant  //////////////////
    
    public static final int SHOW_ANNOUNCEMENT_BY_GROUPNAME = 1;
    public static final int SHOW_ANNOUNCEMENT_BY_OWNER = 2;
    public static final int SHOW_ALL_ANNOUNCEMENT = 3;
    public static final int SHOW_GROUP_ANNOUNCEMENT = 4;
    public static final int SHOW_CONTACT_ANNOUNCEMENT = 5;
    public static final int SHOW_ALL_CALENDAR = 6;
    public static final int SHOW_GROUP_CALENDAR = 7;
    public static final int SHOW_CONTACT_CALENDAR = 8;
    public static final int SHOW_ALL_GROUP = 9;
    public static final int SHOW_MY_GROUP = 10;
    public static final int SHOW_STUDY_GROUP = 11;
    public static final int SHOW_INTERESTING_GROUP = 12;
    public static final int SHOW_ALL_USER = 13;
    public static final int SHOW_ONLINE_USER = 101;
    public static final int SHOW_MY_CONTACT = 14;
    public static final int SHOW_NO_ACTIVATE_CONTACT = 15;
    public static final int SHOW_TEACHER = 16;
    public static final int SHOW_STUDENT = 17;
    public static final int SHOW_NO_ACTIVATE_MEMBER = 18;
    public static final int SHOW_NO_ACTIVATE_MEMBERGROUP = 19;
    public static final int SHOW_CREATE_GROUP = 20;
    public static final int SHOW_EDIT_GROUP = 21;
    public static final int SHAPE_CIRCLE   = 0;
	public static final int SHAPE_RECT     = 1;
	public static final int USER_EVENT     = 100;
    ////////////////////////////////////////
    
    //////////// Temp ////////////
    public boolean loading=false;
    //////////////////////////////
    
	
	/////////// Option Preference /////////////
	public String mode="";
	public String position=""; 
	public String ipServer="";
	public String showMyPosition="";
	public String showContactPosition="";
	public String showBusPosition="";
	public String loadAnnouncement="";
	public String loadGroup="";
	public String loadUser="";
	public int x,y,width,height,zoomLevel,saveState=-1;
	///////////////////////////////////////////

	/////////  Detail User ////////
	public Announcement[] announce=null;
	public Group[] groups=null;
	public User[] users=null;
	public Announcement[] tmpAnnounce=null;
	public Group[] tmpGroups=null;
	public User[] tmpUsers=null;
	public User profile=null;
	public String sessionkey="";
    public Layer[] layers=null;
    public int searchLayerID;
    public MyRecordElement myRecord=null;
    public MyContactElement[] contacts=null;
    public BusElement[] bus=null;
	////////////////////////////
	
    public MainPage mainpage;
    public Image wait;
    public Image study_group_image;
    public Image interesting_group_image;
    private Alert alert;
    private Command backCommand = new Command("Back",Command.BACK,1);
    
    public CampusGISMain() {
        instance = this;
    }

    public void startApp() {
       display = Display.getDisplay(this);
       ShowTitle();
       try
       {
            wait    = Image.createImage("/tinyline/wait.png");
            study_group_image    = Image.createImage("/tinyline/logo.png");
            interesting_group_image    = Image.createImage("/tinyline/wait.png");
       }catch(Exception e){}
       
       location = new LocationServices();
       alert = new Alert("Initial Alert");
       alert.addCommand(backCommand);
       alert.setCommandListener(this);
       
       DataRecord.loadOption();
       DataRecord.loadAnnouncements();
       DataRecord.loadGroups();
       DataRecord.loadUsers();
       DataRecord.loadProfile();
 //      DataRecord.loadInformation();
       mainpage = new MainPage();
       CampusGISMain.instance.location.update();
       
       
       
       try{Thread.sleep(4000);}catch(Exception ex){}
       if (CampusGISMain.instance.mode.equals(""))
       {
    	   CampusGISMain.instance.ShowChooseModePage();
       }
       else
       {
    	   if (CampusGISMain.instance.mode.equals("Online"))
    	   {
    		   CampusGISMain.instance.ShowLoginPage();
    	   }else
    	   {	
    		   CampusGISMain.instance.ShowMainPage();
    	   }
       }
    }

    public void pauseApp() {
    }

    public void destroyApp(boolean unconditional) {
    }

    public static void quitApp() {
        instance.destroyApp(true);
        instance.notifyDestroyed();
        instance = null;	
    }

    public void ShowTitle() {
        display.setCurrent(new TitlePage());
    }

    public void ShowChooseModePage() {
        display.setCurrent(new ChooseModePage());
    }

    public void ShowLoginPage() {
        display.setCurrent(new LoginPage());
    }
	
    public void ShowSignupPage() {
        display.setCurrent(new SignupPage());
    }

    public void ShowAnnouncementsPage() {
        display.setCurrent(new AnnouncementsPage());
    }
    
    public void ShowAnnouncementsPage(String str,int type) {
        display.setCurrent(new AnnouncementsPage(str,type));
    }
    
    public void ShowAnnouncementsPage(String str,int type,int start) {
        display.setCurrent(new AnnouncementsPage(str,type,start));
    }
    
    public void ShowAnnouncementPage(Announcement announce) {
        display.setCurrent(new AnnouncementPage(announce));
    }
    
    public void ShowGroupPage(Group group) {
        display.setCurrent(new GroupPage(group));
    }
    public void ShowIMPage() {
        display.setCurrent(new IMPage());
    }

    public void ShowGroupsPage() {
        display.setCurrent(new GroupsPage());
    }
    
    public void ShowUserPage(User user) {
        display.setCurrent(new UserPage(user));
    }
    
    public void ShowUsersPage() {
        display.setCurrent(new UsersPage());
    }
    
    public void ShowUsersPage(int type) {
        display.setCurrent(new UsersPage(type));
    }
    
    public void ShowUsersPage(int type,int start) {
        display.setCurrent(new UsersPage(type,start));
    }
    
    public void ShowGroupsPage(int type) {
        display.setCurrent(new GroupsPage(type));
    }
    
    public void ShowGroupsPage(int type,int start) {
        display.setCurrent(new GroupsPage(type,start));
    }

    public void ShowCalendarsPage() {
        display.setCurrent(new CalendarsPage());
    }
    
    public void ShowCalendarsPage(int type) {
        display.setCurrent(new CalendarsPage(type));
    }
    
    public void ShowCalendarsPage(int type,int start) {
        display.setCurrent(new CalendarsPage(type,start));
    }
    
    public void ShowCalendarPage(EventCalendar calendar) {
        display.setCurrent(new CalendarPage(calendar));
    }
	
    public void ShowModeratorPage() {
        display.setCurrent(new ModeratorPage());
    }
    
    public void ShowModeratorPage(int type) {
        display.setCurrent(new ModeratorPage(type));
    }
    
    public void ShowPostAnnouncementPage(int type)
	{
		display.setCurrent(new PostAnnouncementPage(type));
	}
    
    public void ShowPostAnnouncementPage(String groupName,int type)
	{
		display.setCurrent(new PostAnnouncementPage(groupName,type));
	}
    
    public void ShowSearchPage()
	{
		display.setCurrent(new SearchPage());
	}
    
	public void ShowPreferencePage()
	{
		display.setCurrent(new PreferencePage());
	}


    public void ShowMainPage() {
       display.setCurrent(mainpage);
    }

    public void ShowAlertPage(String title,String msg)
	{
		alert.setTitle(title);
		alert.setString(msg);
		alert.setType(AlertType.CONFIRMATION);
		alert.setTimeout(2000);
		alert.setImage(null);
		display.setCurrent(alert);
	}
    
	public void ShowErrorPage(String title,String msg)
	{		
		alert.setTitle(title);
		alert.setString(msg);
		alert.setType(AlertType.ERROR);
		alert.setTimeout(5000);
		alert.setImage(null);
		display.setCurrent(alert);
	}

	public void ShowRunningPage(String msg){	
		alert.setTitle("Campus GIS : Running");
		alert.setString(msg);
		alert.setType(AlertType.INFO);
		alert.setTimeout(10000);
		alert.setImage(wait);
		display.setCurrent(alert);
    }
	
	 public void commandAction(Command c, Displayable d) {
	        if (c == backCommand) {    
				CampusGISMain.instance.ShowMainPage();
	        }
	    }
}
