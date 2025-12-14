package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import java.rmi.*;
import java.util.*;
import net.jini.discovery.*;
import net.jini.core.lookup.*;
import net.jini.core.lease.*;

public class ServerListener implements DiscoveryListener, Runnable {
    // Hashtable of registration leases keyed by the lookup service
    private Hashtable leases = new Hashtable();
    private ServiceItem item;          // Item to be registered with lookup
    private static final long ltime = Lease.ANY;
    private static final int mtime = 20*1000;       // 20 seconds (Minimum lease)

    private LookupDiscovery ld;        // The discovery object we're listening to

	private DaemondBrowser displayer;

    public ServerListener(LookupDiscovery ld, Object object, DaemondBrowser b) {
        item = new ServiceItem(null, object, null);
        this.ld = ld;
		this.displayer = b;
	
        // Start the new thread to renew the leases
		displayer.display("Start Looking for Lookup Service.");
        //new Thread(this).start();
    }

    // Automatically called when new lookup service(s) are discovered
    public synchronized void discovered(DiscoveryEvent dev) {
        ServiceRegistrar[] lookup = dev.getRegistrars();
		//Inform about service that just was found
		displayer.display("Found "+lookup.length+" new Lookup Service(s)");
		
		//The Section below is commented because it's not necessary anymore
		//I use JoinManager instead for register service.

		/*
        // For each discovered service, see if we're already registered.
        // If not, register
        for (int i = 0; i < lookup.length; i++) {
            if (leases.containsKey(lookup[i]) == false) {
                // Not already registered
                try {
                    //Register
                    ServiceRegistration ret = lookup[i].register(item, ltime);
					//Display Registration on DisplayBoard
					displayBoard.setTitle("Robot Simulation : Registered");
					System.out.println("Register Service at Lookup Service("+i+")");
                    // You must assign the serviceID based on what the
                    // lookup service returns
                    if (item.serviceID == null) {
                        item.serviceID = ret.getServiceID();
                    }
                    // Save this registration
                    leases.put(lookup[i], ret);
                    // There's a new lease, notify the renewal thread
                    notify();
                } catch (RemoteException ex) {
                    System.out.println("ServerListener error: " + ex);
                }
            }
            // else we were already registered in this service
        }*/
    }

    // Automatically called when lookup service(s) are no longer available
    public synchronized void discarded(DiscoveryEvent dev) {
        ServiceRegistrar[] lookup = dev.getRegistrars();
        for (int i = 0; i < lookup.length; i++) {
            if (leases.containsKey(lookup[i]) == true) {
                // Remove the registration. If the lookup service comes
                // back later, we'll re-register at that time.
                leases.remove(lookup[i]);
            }
        }
    }

    public synchronized void run() {
        while (true) {
            long nextRenewal = Long.MAX_VALUE;
            long now = System.currentTimeMillis();

            Enumeration e = leases.keys();
            // Loop to renew all leases that are about to expire
            // and also to find the time when the next lease will
            // expire so we know when to run the loop again.
            while (e.hasMoreElements()) {
                ServiceRegistrar lookup = (ServiceRegistrar) e.nextElement();
                ServiceRegistration sr = (ServiceRegistration) leases.get(lookup);
                Lease l = sr.getLease();
                long expire = l.getExpiration();

                // See if the current lease has the minimum time.
                // If we can't renew it, discard that lookup service.
                // That will generate an event to the discarded() method
                // which will actually remove the lease from our list.
                try {
                    if (expire <= now + mtime) {
                        l.renew(ltime);
                        expire = l.getExpiration();
                    } 
                    if (nextRenewal > expire - mtime) {
                        nextRenewal = expire - mtime;
                    }
                } catch (LeaseDeniedException lex) {
                } catch (UnknownLeaseException lex) {
                    ld.discard(lookup);
                } catch (RemoteException ex) {
                    ld.discard(lookup);
                }
            }
            try {
                // Wait until the next renewal time. A new lease
                // will notify us prematurely in case the new
                // lease has a smaller time until it must be renewed
                wait(nextRenewal - now);
            } catch (InterruptedException ex) {};
        }
    }

	public void cancelAllLease() throws Exception{
		Enumeration e = leases.keys();
		while(e.hasMoreElements()){
			ServiceRegistrar lookup = (ServiceRegistrar) e.nextElement();
            ServiceRegistration sr = (ServiceRegistration) leases.get(lookup);
            Lease l = sr.getLease();
			l.cancel();
		}
	}
}