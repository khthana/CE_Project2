/***
get properties of database and web server

***/
package myutil;

import java.util.*;
import java.io.*;

public class server{
	private static String DBServerIP="";
	private static String DBServerPort="";
	private static String DBName="";
	private static String RootWeb="";
	private static String user="";
	private static String password="";
	private static String propFile="C:\\ApacheGroup\\Tomcat41\\webapps\\proj\\WEB-INF\\classes\\servercf\\server.cf"; //for win32
	//	private static String propFile="/usr/tomcat4/webapps/gdl/WEB-INF/classes/servercf/server.cf";		// for linux

	// Constractor
	public server() throws IOException {
		loadProperties();
	}

	// set get username
	public static void setUsername(String username){
			user=username;
	}
	public static String getUsername(){
			return user;
	}
	
	// set get password
	public static void setPassword(String pw){
			password=pw;
	}
	public static String getPassword(){
			return password;
	}
	
	// set get Database server IP
	public static void setDBServerIP(String ip){
			DBServerIP=ip;
	}
	public static String getDBServerIP(){
			return DBServerIP;
	}

	// set get Database server Port
	public static void setDBServerPort(String port){
			DBServerPort=port;
	}
	public static String getDBServerPort(){
			return DBServerPort;
	}
	// set get Database server Port
	public static void setDBName(String name){
			DBName=name;
	}
	public static String getDBName(){
			return DBName;
	}

	// set get Root Directory of Web
	public static void setRootWeb(String path){
			RootWeb=path;
	}
	public static String getRootWeb(){
			return RootWeb;
	}
	
	private void loadProperties() throws IOException {
		Properties props = new Properties();
		InputStream in = new FileInputStream(propFile);
		props.load(in);		
		in.close();
		setDBServerIP(props.getProperty("DBServerIP"));		
		setDBServerPort(props.getProperty("DBServerPort"));
		setDBName(props.getProperty("DBName"));
		setRootWeb(props.getProperty("RootWeb"));
		setUsername(props.getProperty("username"));
		setPassword(props.getProperty("password"));
	}
}// end clas server
