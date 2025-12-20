package gisonmobile;

import gisonmobile.page.*;

import com.wingfoot.soap.*;
import com.wingfoot.soap.transport.*;
import javax.microedition.lcdui.*;

public class ConnectService extends Thread implements CommandListener{
    String service;
    String method;
    Object[] result;
	Param[] args;
    String error = "";
    String command="";
    
    public ConnectService()
    {
    	
    }
    
	private class Param
	{
		public Object name;
		public Object value;
		public int type;

		public Param(String n,String v,int t)
		{
			name = n;
			value = v;
			type = t;
		}

		public String name()
		{
			return (String)name;
		}

		public String value()
		{
			return (String)value;
		}

	};

	public void run()
    {
        try {
			
			// Prepare the Envelope
			Envelope requestEnvelope = new Envelope();

			requestEnvelope.setSchema("http://www.w3.org/2001/XMLSchema");
			requestEnvelope.setSchemaInstance(
				"http://www.w3.org/2001/XMLSchema-instance");
			requestEnvelope.setEncodingStyle("http://schemas.xmlsoap.org/soap/encoding/");

			for(int i=0;i<args.length;i++)
            {
				if(args[i].type == 0)
					requestEnvelope.setBody(args[i].name(),args[i].value() );
				else if(args[i].type == 1)
					requestEnvelope.setBody(args[i].name(),new com.wingfoot.soap.encoding.Float(args[i].value()) );
            }

            /* Prepare the call*/
            Call call = new Call(requestEnvelope);
            call.setMethodName(method);
            call.setTargetObjectURI("http://gisoncampusservices");

            /* Prepare the transport*/
            HTTPTransport transport = new HTTPTransport(
                    "http://"+CampusGISMain.instance.ipServer+":8080/GISonCampusServices/services/"+service,
                    null);

            /* Make the call*/
            Envelope responseEnvelope = call.invoke(transport);
            System.out.println("test");
            if (responseEnvelope != null) {
                if (responseEnvelope.isFaultGenerated()) {
                    Fault f = responseEnvelope.getFault();
                    error = f.getFaultString();
                } else {
                    int count = responseEnvelope.getParameterCount();
                    result = new Object[count];
                    System.out.println(count);
                    for(int i=0;i!=result.length;++i)
                        result[i] = responseEnvelope.getParameter(i);
                    checkResult();
                }
            }
        } catch (Exception ex) {
        	System.out.println("Error request service "+ex.getMessage());
			CampusGISMain.instance.ShowErrorPage("Error request service",ex.getMessage());
		}
    }
	
	public String getResult()
	{
		return (String)result[0];
	}

    public void makeRequest(String service, String method,Param[] args) {
        error = "";
        this.service = service;
        this.method = method;
		this.args = args;
		if(command.equals(""))
			command = method;
		
		
		start();
		
    }


    private void checkResult()
    {
        if(command == "login")
        {
			String r = (String)result[0];

            if(!r.substring(0,5).equals("Error"))
            {
                CampusGISMain.instance.sessionkey = (String) result[0];
                CampusGISMain.instance.ShowMainPage();
                ConnectService con4 = new ConnectService();
     		    con4.getProfile();
            }else
			{
            	CampusGISMain.instance.ShowErrorPage("Error Connection",r);
			}
        }
        if(command == "logout")
        {
        	 if (((String)result[0] ).equals("OK") )
             {
             	CampusGISMain.instance.ShowAlertPage("Sucess","Logout Complete");    
             }
             else
                 CampusGISMain.instance.ShowErrorPage("Error Connection","Logout Failed");
        }
        else if(command == "signup")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Register Sucessful","Please login with your username and password");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Registering Failed");
        }
        else if (command == "getProfile")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadProfile((String)result[0]);
            	DataRecord.saveProfile((String)result[0]);
            	CampusGISMain.instance.ShowAlertPage("Sucess","Load My Profile Complete");
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if (command == "getProfileList")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadUsers((String)result[0],false);
            	DataRecord.saveUsers((String)result[0]);
            	CampusGISMain.instance.ShowUsersPage();
            	CampusGISMain.instance.ShowAlertPage("Sucess","Load User Complete");
            
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if (command == "getNoActiveProfileList")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadUsers((String)result[0],false);
        		CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBER);
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "editProfile")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Save Sucessful","Modify complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Editing Failed");
        }
        else if(command == "addContact")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Add Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Add Contact Failed");
        }
        else if(command == "removeContact")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Remove Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Remove Contact Failed");
        }
        else if(command == "activateContact")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Activation Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Activate Contact Failed");
        }
        else if(command == "activateMember")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Activation Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Activate Member Failed");
        }
        else if(command == "getNoActiveMemberGroupList")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadUsers((String)result[0],false);
        		CampusGISMain.instance.ShowModeratorPage(CampusGISMain.SHOW_NO_ACTIVATE_MEMBERGROUP);
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "activateMemberGroup")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Activation Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Activate Member Group Failed");
        }
        else if(command == "getInformation")
        {
            if (((String)result[0] ).equals("OK") )
            {
          //  	ParseXML.loadInformation((String)result[0]);
          //  	DataRecord.saveInformation((String)result[0]);
            	CampusGISMain.instance.ShowAlertPage("Sucess","Download Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Activate Member Group Failed");
        }
        else if(command == "createGroup")
        {
        	if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Create Group Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Create Group Fails");
        }
        else if(command == "registerToGroup")
        {
        	if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Registering Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Registering Fails");
        }
        else if(command == "departGroup")
        {
        	if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Sucess","Leaving Group Complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Leaving Group Fails");
        }
        else if(command == "getDetails")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "updateDetails")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Success","Update complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Update Failed");
        }
        else if(command == "getGroupList")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadGroups((String)result[0],false);
            	CampusGISMain.instance.ShowGroupsPage();
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getAllGroupList")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadGroups((String)result[0],false);
				DataRecord.saveGroups((String)result[0]);
				CampusGISMain.instance.ShowAlertPage("Sucess","Loading Groups Complete");
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "groupPost")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Success","Post complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Post Failed");
        }
        else if(command == "groupPostAsCalendar")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Success","Post complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Post Failed");
        }
        else if(command == "post")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Success","Post complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Post Failed");
        }
        else if(command == "postAsCalendar")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	CampusGISMain.instance.ShowAlertPage("Success","Post complete");    
            }
            else
                CampusGISMain.instance.ShowErrorPage("Error Connection","Post Failed");
        }
        else if(command == "getAllAnnouncements")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadAnnouncements((String)result[0],false);
            	DataRecord.saveAnnouncements((String)result[0]);
            	CampusGISMain.instance.ShowAlertPage("Sucess","Loading Announcement Complete");
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getAnnouncements")
        {
        	if (!((String)result[0]).substring(0,5).equals("Error"))
            {
        		ParseXML.loadAnnouncements((String)result[0],false);
        		CampusGISMain.instance.ShowAnnouncementsPage();
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "listMapLayer")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadLayers((String)result[0]);
			}
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getMap")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	CampusGISMain.instance.mainpage.setSVGString((String)result[0]);
            	DataRecord.saveMap((String)result[0]);
            	CampusGISMain.instance.ShowAlertPage("Download Sucessful","Download Map Complete");
			}
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "searchNearbyArea")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadNearbyID((String)result[0]);
            	CampusGISMain.instance.mainpage.displayMode = MainPage.SEARCH_MODE;
            	CampusGISMain.instance.ShowMainPage();
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "searchNearestArea")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadNearestID((String)result[0]);
            	CampusGISMain.instance.mainpage.displayMode = MainPage.SEARCH_MODE;
            	CampusGISMain.instance.ShowMainPage();
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "updatePosition")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	    
            }
     //       else
     //           CampusGISMain.instance.ShowErrorPage("Error Connection","Update Position Failed");
        }
        else if(command == "updateBusPosition")
        {
            if (((String)result[0] ).equals("OK") )
            {
            	    
            }
       //     else
        //        CampusGISMain.instance.ShowErrorPage("Error Connection","Update Position Failed");
        } 
        else if(command == "listMapLayer")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadLayer((String)result[0]);
            	CampusGISMain.instance.ShowSearchPage();
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getContactsPosition")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadObjectElement((String)result[0],ObjectElement.LOAD_CONTACT);
            	System.out.println("Load Contact");
            }else System.out.println("Error : "+(String)result[0]);
      //      else
      //      	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getMyRecordPosition")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadObjectElement((String)result[0],ObjectElement.LOAD_RECORD);
            	CampusGISMain.instance.mainpage.drawRecordPosition(CampusGISMain.instance.mainpage.svgStr);
            	System.out.println("Record");
            }
            else
            	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        else if(command == "getBusPosition")
        {
            if (!((String)result[0]).substring(0,5).equals("Error"))
            {
            	ParseXML.loadObjectElement((String)result[0],ObjectElement.LOAD_BUS);
            	System.out.println("Load Bus");
            }else System.out.println("Error : "+(String)result[0]);
      //      else
      //      	CampusGISMain.instance.ShowErrorPage("Error Connection",(String)result[0]);
        }
        
        
        CampusGISMain.instance.loading = false;
    }

    ////////////////  UserServices //////////////////
    public void login(String u,String p)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","login",
			new Param[]
				{	new Param("username",u,0),
					new Param("password",p,0)
				});
		CampusGISMain.instance.ShowRunningPage("Connecting ...");
    }
    
    public void logout()
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","logout",
				new Param[]
					{	new Param("sessionkey",CampusGISMain.instance.sessionkey,0)
					});
		CampusGISMain.instance.ShowRunningPage("Sign out ...");
    }
    
    public void signup(String type,String name,String surname,String year,String faculty,String major,String phone,String email,String studentid,String username,String password)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","signup",
				new Param[]
					{	new Param("type",type,0),
						new Param("name",name,0),
						new Param("surname",surname,0),
						new Param("year",year,0),
						new Param("faculty",faculty,0),
						new Param("major",major,0),
						new Param("phone",phone,0),
						new Param("email",email,0),
						new Param("studentid",studentid,0),
						new Param("username",username,0),
						new Param("password",password,0)
					});
    }

    public void getProfile()
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","getProfile",
				new Param[]
					{	new Param("sessionkey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void getProfileList()
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","getProfileList",
				new Param[]
					{	new Param("sessionkey",CampusGISMain.instance.sessionkey,0),
					});
    }
    
    public void getNoActiveProfileList()
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","getNoActiveProfileList",
				new Param[]
					{	new Param("sessionkey",CampusGISMain.instance.sessionkey,0),
					});
    }
    
    public void editProfile(String year,String phone,String email,String password)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","editProfile",
				new Param[]
					{	
						new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("year",year,0),
						new Param("phone",phone,0),
						new Param("email",email,0),
						new Param("password",password,0)
					});
    }
    
    public void addContact(String ID)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","addContact",
				new Param[]
					{	
						new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("mateid",ID,0)
					});
    }
    
    public void removeContact(String ID)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","removeContact",
				new Param[]
					{	
						new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("mateid",ID,0)
					});
    }
    
    public void activateContact(String ID)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","activateContact",
				new Param[]
					{	
						new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("mateid",ID,0)
					});
    }
    
    public void activateMember(String ID)
    {
    	CampusGISMain.instance.loading = true;
		makeRequest("UserServices","activateMember",
				new Param[]
					{	
						new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("memberids",ID,0)
					});
    }
    
    public void getNoActiveMemberGroupList()
    {
    	CampusGISMain.instance.loading = true;
    	System.out.println("555");
    	makeRequest("UserServices","getNoActiveMemberGroupList",
				new Param[]
				          
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void activateMemberGroup(String membergroupids)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("UserServices","activateMemberGroup",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("membergroupids",membergroupids,0)
					});
    }
    
    public void getInformation()
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("UserServices","getInformation",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
    					
					});
    }
    /////////////////////////////////////////////////////////////////
    
    ////////////////// GroupServices ////////////////////////////////
    public void createGroup(String name,String type,String details,String moderatorid)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","createGroup",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("name",name,0),
    					new Param("type",type,0),
    					new Param("details",details,0),
    					new Param("moderatorid",moderatorid,0),
					});
    }
    
    public void registerToGroup(String groupname)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","registerToGroup",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0)
					});
    }
    
    public void departGroup(String groupname)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","departGroup",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0)
					});
    }
    
    public void getDetails(String groupname)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","getDetails",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0)
					});
    }
    
    public void updateDetails(String groupname,String details)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","updateDetails",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0),
    					new Param("details",details,0)
					});
    }
    
    public void getGroupList(String start_,String num)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","getGroupList",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("start_",start_,0),
    					new Param("num",num,0)
					});
    }
    
    public void getAllGroupList()
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("GroupServices","getAllGroupList",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    
    //////////////////////////////////////////////////////
    
    
    //////////////////AnnouncementServices  //////////////////////
    public void groupPost(String groupname,String topic,String content)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("AnnouncementServices","groupPost",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0),
    					new Param("topic",topic,0),
    					new Param("content",content,0)
    					
					});
    }
    
    public void groupPostAsCalendar(String groupname,String topic,String content,String location,String startTime,String endTime)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("AnnouncementServices","groupPostAsCalendar",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("groupname",groupname,0),
    					new Param("topic",topic,0),
    					new Param("content",content,0),
    					new Param("location",location,0),
    					new Param("startTime",startTime,0),
    					new Param("endTime",endTime,0)
    					
					});
    }
    
    public void post(String topic,String content)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("AnnouncementServices","post",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("topic",topic,0),
    					new Param("content",content,0)
    					
					});
    }
    
    public void postAsCalendar(String topic,String content,String location,String startTime,String endTime)
    {
    	CampusGISMain.instance.loading = true;
    	makeRequest("AnnouncementServices","postAsCalendar",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("topic",topic,0),
    					new Param("content",content,0),
    					new Param("location",location,0),
    					new Param("startTime",startTime,0),
    					new Param("endTime",endTime,0)
    					
					});
    }
    
    public void getAllAnnouncements()
    {
    	makeRequest("AnnouncementServices","getAllAnnouncements",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void getAnnouncements(String start_,String num)
    {
    	makeRequest("AnnouncementServices","getAnnouncements",
				new Param[]
					{	
    					new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
    					new Param("start_",start_,0),
    					new Param("num",num,0)
					});
    }
    ///////////////////////////////////////////////////////////////
    
    ///////////////// GetMapServices  ///////////////////////////
    public void listMapLayer()
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("GetMapServices","listMapLayer",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void getMap( String posX, String posY, String width, String height,String layers)
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("GetMapServices","getMap",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("posX",posX,0),
						new Param("posY",posY,0),
						new Param("width",width,0),
						new Param("height",height,0),
						new Param("layers",layers,0)
					});
			CampusGISMain.instance.ShowRunningPage("Downloading ...");
		
    }
    
    public void searchNearbyArea( String posX, String posY, String width, String height,String layer,String currentLadtitude,String currentLongitude,String radian)
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("GetMapServices","searchNearbyArea",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("posX",posX,0),
						new Param("posY",posY,0),
						new Param("width",width,0),
						new Param("height",height,0),
						new Param("layer",layer,0),
						new Param("currentLadtitude",currentLadtitude,0),
						new Param("currentLongitude",currentLongitude,0),
						new Param("radian",radian,0)
					});
		
    }
    
    public void searchNearestArea( String posX, String posY, String width, String height,String layer,String currentLadtitude,String currentLongitude)
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("GetMapServices","searchNearestArea",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("posX",posX,0),
						new Param("posY",posY,0),
						new Param("width",width,0),
						new Param("height",height,0),
						new Param("layer",layer,0),
						new Param("layer",layer,0),
						new Param("currentLadtitude",currentLadtitude,0),
						new Param("currentLongitude",currentLongitude,0)
					});
    }
    /////////////////////////////////////////////////////////////
    
    
    ///////////////// PositionServices  ///////////////////////////
    public void updatePosition( String posX, String posY)
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("PositionServices","updatePosition",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("posX",posX,0),
						new Param("posY",posY,0)
					});
    }
    
    public void updateBusPosition( String posX, String posY,String busID)
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("PositionServices","updateBusPosition",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0),
						new Param("posX",posX,0),
						new Param("posY",posY,0),
						new Param("busID",busID,0)
					});
    }
    
    public void getContactsPosition()
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("PositionServices","getContactsPosition",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void getMyRecordPosition()
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("PositionServices","getMyRecordPosition",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    
    public void getBusPosition()
    {
    	CampusGISMain.instance.loading = true;
			makeRequest("PositionServices","getBusPosition",
				new Param[]
					{	new Param("sessionKey",CampusGISMain.instance.sessionkey,0)
					});
    }
    ///////////////////////////////////////////////////////////////
    
    public void commandAction(Command c, Displayable d)
    {
    	if(c == Alert.DISMISS_COMMAND)
    	{
    		command = "";
    	}
    }

}
