package dtw.webmail;

import java.util.*;
import java.io.*;
import org.apache.oro.text.regex.*;
import org.exolab.castor.xml.*;
import org.exolab.castor.mapping.Mapping;

import dtw.webmail.util.*;
import dtw.webmail.model.*;


public class JwmaKernel {

	//class attributes
	private static JwmaKernel mySelf=null;
	
	
	//instance attributes
	private Log syslog;
	private Log debuglog;
	private Properties myServiceProperties;
 	private PatternCompiler compiler;
 	private Pattern myUrlMatchPattern = null;
	private String urlmatchpattern;
	private int poolsize;
	/* Pool of non shareable pattern matchers */
	private Vector matcherPool;
	
	private String myDataDir;
	private Unmarshaller myUnmarshaller;
	private Mapping myMapping;
	private JwmaPreferencesImpl preferencesTemplate;
        
        private int LimitFilesize;
	
	
	private String mySiteurl;
	private String myController;
	private String myMailClientProtocol;
        private String myAntiviruspath;
        private String myAntivirusProgramName;
        private String myAntivirusParameter;
	private String mySmtphost;
	
	private Hashtable myViews;
	
	
	 private JwmaKernel() {
		mySelf=this;
		myViews=new Hashtable(15);
	 }//constructor 

	 public void setup(String location) 
			throws Exception {
		
		
			//load properties
			
			myServiceProperties=
				PropertiesLoader.loadProperties(location + "/" + serviceproperties);
			
			String dirprefix=
				myServiceProperties.getProperty("jwma.dirprefix") + "/";
				
			myDataDir= dirprefix + 
				myServiceProperties.getProperty("jwma.datadir") + "/";
			
			String myLogDir= dirprefix +
				myServiceProperties.getProperty("jwma.logdir") + "/";
			
			//prepare logs
			syslog= prepareLog(
				myServiceProperties.getProperty("jwma.syslog.active"),
				myLogDir + myServiceProperties.getProperty("jwma.syslog.file"),
				myServiceProperties.getProperty("jwma.syslog.logstampformat")
			);
			
			debuglog= prepareLog(
				myServiceProperties.getProperty("jwma.debuglog.active"),
				myLogDir + myServiceProperties.getProperty("jwma.debuglog.file"),
				myServiceProperties.getProperty("jwma.debuglog.logstampformat")
			);	
			
			debuglog.write("Prepared for logging");
			
			//prepare unmarshaller (xml->object)
			String mappingfile= dirprefix + 
				myServiceProperties.getProperty("jwma.mappingfile");
			String sitetemplate=dirprefix +
				myServiceProperties.getProperty("jwma.preftemplate");
			
			myMapping=new Mapping();
			myMapping.loadMapping(mappingfile);
			
                        myUnmarshaller=new Unmarshaller(myMapping);
			
			preferencesTemplate=loadPreferences(sitetemplate);
			
			debuglog.write("Loaded persistancy mapping and preferences template.");
			
			//prepare matcher	
			compiler = new Perl5Compiler();
    		myUrlMatchPattern = compiler.compile(
    			myServiceProperties.getProperty("jwma.urlmatchpattern")
    		);
    		initMatcherPool(
    			Integer.parseInt(myServiceProperties.getProperty("jwma.matcherpool"))
    		);
    		
    		debuglog.write("Prepared matchers.");
    		
    		//load service values
    		mySiteurl=
    			myServiceProperties.getProperty("jwma.siteurl");
			myController= mySiteurl + "/" + 
				myServiceProperties.getProperty("jwma.controller");
			myMailClientProtocol=
				myServiceProperties.getProperty("jwma.mailclientprotocol");
			mySmtphost=
				myServiceProperties.getProperty("jwma.smtphost");
                        myAntiviruspath=
                                myServiceProperties.getProperty("jwma.antiviruspath");
                        myAntivirusProgramName=
                                myServiceProperties.getProperty("jwma.antivirusprogramname");
                        myAntivirusParameter=
                                myServiceProperties.getProperty("jwma.antivirusparameter");
                        LimitFilesize = 
                                Integer.parseInt(myServiceProperties.getProperty("jwma.filesizelimit"));
    		//ensure its in right place
			System.getProperties().put("mail.smtp.host", mySmtphost);
    			
    		debuglog.write("Loaded service settings.");
    		
    		//load views
    		String viewprefix=
    			myServiceProperties.getProperty("view.urlprefix")+"/";
    			
    		myViews.put(LOGIN_VIEW,
    			viewprefix+myServiceProperties.getProperty(LOGIN_VIEW)
    		);
    		myViews.put(ERROR_VIEW,
    			viewprefix+myServiceProperties.getProperty(ERROR_VIEW)
    		);
    		myViews.put(LOGGEDOUT_VIEW,
    			viewprefix+myServiceProperties.getProperty(LOGGEDOUT_VIEW)
    		);
    		myViews.put(FOLDER_VIEW,
    			viewprefix+myServiceProperties.getProperty(FOLDER_VIEW)
    		);
    		myViews.put(MAILBOX_VIEW,
    			viewprefix+myServiceProperties.getProperty(MAILBOX_VIEW)
    		);
    		myViews.put(MESSAGE_VIEW,
    			viewprefix+myServiceProperties.getProperty(MESSAGE_VIEW)
    		);
    		myViews.put(COMPOSE_VIEW,
    			viewprefix+myServiceProperties.getProperty(COMPOSE_VIEW)
    		);
    		myViews.put(PREFERENCES_VIEW,
    			viewprefix+myServiceProperties.getProperty(PREFERENCES_VIEW)
    		);
    		myViews.put(FIRSTTIME_VIEW,
    			viewprefix+myServiceProperties.getProperty(FIRSTTIME_VIEW)
    		);
    		myViews.put(ADDRESSBOOK_VIEW,
    			viewprefix+myServiceProperties.getProperty(ADDRESSBOOK_VIEW)
    		);
       		myViews.put(SCAN_VIEW,
    			viewprefix+myServiceProperties.getProperty(SCAN_VIEW)
    		);
                myViews.put(SUCCESSFUL_VIEW,viewprefix+myServiceProperties.getProperty(SUCCESSFUL_VIEW));

    		debuglog.write("Loaded views.");
		
		
	}//setup
	
	 private Log prepareLog(String setting,String path,String stampformat) 
	 		throws Exception {
	 	
	 	Log lg=null;
	 	try {
	 		lg=Log.createFileLog(path,stampformat);
			lg.setActive(new Boolean(setting).booleanValue());
			
		} catch (Exception ex) {
			throw new Exception("Creating log failed:"+ex.getMessage());
		}
	 	
		return lg;
	  }//prepareLog
	
	  public Log sysLog(){
	 	return syslog;
	  }//syslog

	  public Log debugLog(){
	 	return debuglog;
	  }//debugLog

	  public String getSiteUrl() {
	 	return mySiteurl;
	  }//getSiteUrl

	  public String getControllerUrl() {
	 	return myController;
	  }//getControllerUrl
          
          public int getFileLimit() {
            return LimitFilesize;
          }//getLimitFileSize
	
	  public String getMailClientProtocol() {
	 	return myMailClientProtocol;
	  }//getMailClientProtocol
          
          public String getAntiviruspath()
          {
                return myAntiviruspath;
          }//getAntiviruspath
          
          public String getAntivirusName()
          {
                return myAntivirusProgramName;
          }//getAntivirusName
          
          public String getAntivirusParameter()
          {
                return myAntivirusParameter;
          }//getAntivirusParater

	  public String getSmtpHost() {
	 	return mySmtphost;
	  }//getSmtpHost

	  public String getViewUrl(String view) {
	 	return (String)myViews.get(view);
	  }//getViewUrl

	  public Pattern getUrlMatchPattern() {
	 	return myUrlMatchPattern;
	  }//getUrlMatchPattern
	
	  public JwmaPreferencesImpl getPreferencesTemplate() {
	 	return preferencesTemplate.getClone();
	  }//getPreferencesTemplate

	  public JwmaPreferencesImpl loadPreferences(String filename) 
	 		throws Exception {
	 	FileReader reader=null;
	 	if(filename.startsWith("/")) {
	 		reader=new FileReader(filename);
	 	} else {	
			reader=new FileReader(myDataDir+filename);
		}
		
		JwmaPreferencesImpl prefs=(JwmaPreferencesImpl)myUnmarshaller.unmarshal(reader);
	 	reader.close();
	 	return prefs;
	  }//loadPreferences

	  public void savePreferences(String filename,JwmaPreferencesImpl prefs) 
	 		throws Exception {
 	    	
 	    FileWriter writer= new FileWriter(myDataDir+filename);
        Marshaller myMarshaller=new Marshaller(writer);
	    myMarshaller.setMapping(myMapping);
		myMarshaller.marshal(prefs);
		writer.flush();
		writer.close();
	  }//savePreferences

/*** Matcher Pool related methods ***********************************************************/
	
	 private void initMatcherPool(int size){
		matcherPool=new Vector(size);
		for(int i=0;i<size;i++){
			matcherPool.addElement(new Perl5Matcher());
		
		}	
	 }//initMatcherPool

	 private void flushMatcherPool(int size){
	 	
	 	//wait until pool complete
	 	while(matcherPool.size()!=size){
	 		try { 
					wait(); 
			} catch(Exception ex) {
					//do nothing but wait again :)
			}
	 	} 
	 	//remove all elements
	 	matcherPool.removeAllElements();
	 }//flushMatcherPool

	 public synchronized PatternMatcher getMatcher() {
		boolean served=false;
		PatternMatcher freeMatcher=null;
		while (!served) {
			if(matcherPool.size()==0){
				try { 
					wait(); 
				} catch(Exception ex) {
					//do nothing but wait again :)
				}
			} else {
				freeMatcher = (PatternMatcher) matcherPool.firstElement();	
				matcherPool.removeElementAt(0);
				served=true;
			}
		}
		return freeMatcher;
	 }//getMatcher

	 public synchronized void releaseMatcher(PatternMatcher matcher){
		matcherPool.addElement(matcher);
		notifyAll();		
	 }//releaseMatcher
	
/*************************************************************************/	
	
	
	public static JwmaKernel getReference() {
		if(mySelf!=null) {
			return mySelf;		
		} else {
			return new JwmaKernel();
		}
	}//getReference

	 private static final String serviceproperties="jwma.properties";
	
	 public static final String LOGIN_VIEW="view.login";

	 public static final String ERROR_VIEW="view.error";

	 public static final String LOGGEDOUT_VIEW="view.loggedout";

	 public static final String FOLDER_VIEW="view.folder";

	 public static final String MAILBOX_VIEW="view.mailbox";

	 public static final String MESSAGE_VIEW="view.message";
	 
	 public static final String COMPOSE_VIEW="view.compose";
	 
	 public static final String PREFERENCES_VIEW="view.preferences";
	 
	 public static final String FIRSTTIME_VIEW="view.firsttime";
         public static final String SCAN_VIEW="view.scan";
         public static final String SUCCESSFUL_VIEW="view.successful";

     public static final String ADDRESSBOOK_VIEW="view.addressbook";
	
}//JwmaKernel