
/*
 * @(#)ServerApp.java
 *
 * 03L7246 (c) Copyright IBM Corp. 1996, 1998
 *
 * The program is provided "as is" without any warranty express or
 * implied, including the warranty of non-infringement and the implied
 * warranties of merchantibility and fitness for a particular purpose.
 * IBM will not be liable for any damages suffered by you as a result
 * of using the Program. In no event will IBM be liable for any
 * special, indirect or consequential damages or lost profits even if
 * IBM has been advised of the possibility of their occurrence. IBM
 * will not be liable for any third party claims against you.
 */

import java.awt.Frame;
import java.net.URL;
import java.net.UnknownHostException;
import java.io.File;
import java.util.Properties;
import java.util.Vector;
import com.ibm.maf.*;
import com.ibm.aglet.*;
import com.ibm.aglet.system.*;
import com.ibm.aglets.MAFAgentSystem_AgletsImpl;
import com.ibm.aglets.tahiti.Tahiti;

import java.security.AccessController;
import java.security.PrivilegedAction;
import com.ibm.awb.misc.*;

/**
 * The ServerApp example illustrates how to embed the AgletsServer facility
 * into an application program.
 *
 * @version     1.00    $Date: 2001/07/28 06:31:21 $
 * @author      Mitsuru Oshima
 * @see com.ibm.aglet.system.AgletRuntime
 * @see com.ibm.aglets.Tahiti.Main
 */
public class SimpleServerApp extends ContextAdapter {

        public MAFAgentSystem maf_system;
        public AgletRuntime runtime;
        public boolean success = false;
        public String protocol = "atp";
        public AgletContext cxt;
        public AgletID id;
	public FutureReply future;
	public String ok = "";
	AgletProxy p;
        AgletProxy station;
	// additional options
	final static Opt options[] = {
		Opt.Entry("-protocol", "maf.protocol", null),
		Opt.Entry("-username", "username", null),
		Opt.Entry("-password", "password", null),
	};

	public void agletActivated(ContextEvent ev) {
		System.out.println("Aglet Activated : " + ev.getAgletProxy());
	}
	public void agletArrived(ContextEvent ev) {
		try{
		AgletProxy pro = cxt.getAgletProxy(id);
		Message m = new Message("getResult");
		System.out.println("Recent Proxy :" +pro);
		FutureReply future1= pro.sendAsyncMessage(m);
       //future1.waitForReply();
		if(future1.isAvailable()){
		    int k =future1.getIntReply();
			System.out.println("CAN REPLY WITH "+k);
		}else{System.out.println("BAD BAD BAD");}

	     if (pro==p)
	     {
		System.out.println("GOD BLESS ME...AK");
	     }
	    //pro.sendMessage(m);
		System.out.println("Aglet Arrived : " + pro);

	        ok = cxt.getProperty("r").toString();
		System.out.println("The results: "+ok);

        }catch(Exception e) {
			System.out.println("Problems occurred" + e);
		}

	}
	public void agletCloned(ContextEvent ev) {
		System.out.println("Aglet Cloned : " + ev.getAgletProxy());
	}
	public void agletCreated(ContextEvent ev) {
		System.out.println("Aglet Created : " + ev.getAgletProxy());
	}
	public void agletDeactivated(ContextEvent ev) {
		System.out.println("Aglet Deactivated : " + ev.getAgletProxy());
	}
	public void agletDispatched(ContextEvent ev) {
		System.out.println("Aglet Dispatched : " + ev.getAgletProxy());
	}
	public void agletDisposed(ContextEvent ev) {
		System.out.println("Aglet Disposed : " + ev.getAgletProxy());
		ok = cxt.getProperty("r").toString();
		System.out.println("The results: "+ok);

	}
	public void agletReverted(ContextEvent ev) {
		System.out.println("Aglet Reverted : " + ev.getAgletProxy());
	}
	public void initServer(SimpleServerApp s) throws java.lang.Exception {
		Opt.setopt(options);
        // Initialize logging system.
        String initializerName = System.getProperty("aglets.logger.class",
                   "org.aglets.log.quiet.QuietInitializer");
        Class.forName(initializerName);

        //set the system properties
        System.setProperty("aglets.class.path","c:\\aglets-2.0.2\\public");
        System.setProperty("aglets.export.path","c:\\aglets-2.0.2\\public");

		runtime = AgletRuntime.init(null);
        if (runtime != null) {
             System.out.print("Runtime Object created") ;
        }

        String[] r =
           (String[])AccessController.doPrivileged(new PrivilegedAction() {
                  public Object run() {
                      String[] results = new String[2];
                      String userName = System.getProperty("user.name");
                      System.out.println("Result0 = "+System.getProperty("username") );
                      System.out.println("Result1 = "+System.getProperty("password"));
                      results[0] = System.getProperty("username", "aglet_key");
                      results[1] = System.getProperty("password", "aglets");

                      return results;
                  }
           });
        String username = r[0];
        String password = r[1];
        System.out.println("R0 = "+r[0]);
        System.out.println("R1 = "+r[1]);
        Object obj = runtime.authenticateOwner(username, password);
        if (obj == null) {
            System.err.println("Cannot authenticate the user \"" + username + "\"");
                     throw new Exception("User authentication failed.");
        }

       /*
        * User authentication (optional)
        * If this program requests user identification from dialog box,
        * we need the following call.
        */

       /*
        * if (Main.login(runtime) == null) return;
        */

        maf_system = new MAFAgentSystem_AgletsImpl(runtime);
        protocol =  (String) AccessController.doPrivileged(new PrivilegedAction() {
                       public Object run() {
                          return System.getProperty("maf.protocol", "atp");
                       }
                    });

        MAFAgentSystem.initMAFAgentSystem(maf_system, protocol);


		Tahiti.initializeGUI();
		Tahiti.installFactories();

        cxt = runtime.createAgletContext("test");

        cxt.addContextListener(s);

        Tahiti.installSecurity();
        MAFAgentSystem.startMAFAgentSystem(maf_system, protocol);

        // start contexts
        cxt.start();
        success = true;
	}

	public void showMessage(ContextEvent ev) {
		System.out.println("messages : " + ev.getMessage());
	}

    public void startAglet(String name){
	if(success){
		 try {
			  /*
			   * From this point, you can use contexts.
			   * (creating, dispatching an aglet, etc.)
			   */
                        station = cxt.createAglet(null,"testAglet.StationaryAglet",null);
			p = cxt.createAglet(null, "testAglet.SimpleCirculateAglet", station);

			id = p.getAgletID();
			String hosts = "atp://thinh:4434";

			Message msg = new Message("startTrip",hosts);
			Message msg1 = new Message("getResult",null);
			Object obj =p.sendMessage(msg);
			//AgletProxy temp=cxt.getAgletProxy(id);
			//Object obj2 =temp.sendMessage(msg1);
			//ok=obj2.toString();
			System.out.println("Send successfully" );
		 }catch (Exception e) {
			  System.out.println("Start context error:" + e);
		 }
         }else{
		  System.out.println("The server was not started properly");
	 }

     }

     public String getBack(){
	     return cxt.getProperty("r").toString();
	 }
 
}
