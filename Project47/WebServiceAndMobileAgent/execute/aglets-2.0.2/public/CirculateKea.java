import com.ibm.aglet.*;
import com.ibm.aglet.util.*;
import com.ibm.agletx.util.SeqPlanItinerary;
import java.util.Vector;
import java.util.Enumeration;
import java.awt.*;
import java.awt.event.*;
public class CirculateKea extends Aglet {
	StringBuffer buffer;
	SeqPlanItinerary itinerary;
	Vector proxies;

	public void getLocalInfo(Message msg) {
		buffer.append("Username : " + getProperty("user.name"));
		buffer.append("\n");
		buffer.append("Home directory : " + getProperty("user.home"));
		buffer.append("\n");
		buffer.append("Currect working directory : " 
					  + getProperty("user.dir"));
		buffer.append("\n");
		buffer.append("Machine architecture : " + getProperty("os.arch"));
		buffer.append("\n");
		buffer.append("OS name : " + getProperty("os.name"));
		buffer.append("\n");
		buffer.append("OS version : " + getProperty("os.version"));
		buffer.append("\n");
		buffer.append("Java version : " + getProperty("java.version"));
		buffer.append("\n");
	}
	private String getProperty(String key) {
		return System.getProperty(key, "Unknown");
	}
	public void getProxies(Message msg) {
		Enumeration e = getAgletContext().getAgletProxies(ACTIVE);

		while (e.hasMoreElements()) {
			proxies.addElement(e.nextElement());
		} 
	}
	public boolean handleMessage(Message msg) {
		if (msg.sameKind("getLocalInfo")) {
			getLocalInfo(msg);
			return true;
		} else if (msg.sameKind("getProxies")) {
			getProxies(msg);
			return true;
		} else if (msg.sameKind("printResult")) {
			System.out.println(buffer);
			Enumeration e = proxies.elements();

			while (e.hasMoreElements()) {
				AgletProxy p = (AgletProxy)e.nextElement();

				try {
					System.out.println(p.getAgletInfo());
				} catch (InvalidAgletException ex) {
					System.out.println("InvalidAglet");
				} 
			} 
			return true;
		} 
		return false;
	}
	private void init() {
		buffer = new StringBuffer();
		proxies = new Vector();
	}
	public void oncemore() {
		try {
			itinerary.startTrip();
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
	}
	public void onCreation(Object ini) {
		itinerary = new SeqPlanItinerary(this);
		itinerary.addPlan("atp://ktack:4999/","printResult");
		itinerary.addPlan("atp://ktack:4555/","printResult");
		itinerary.addPlan(getAgletContext().getHostingURL().toString(), 
						  "printResult");
	}
	public void start() {
		init();
		oncemore();
	}
}
