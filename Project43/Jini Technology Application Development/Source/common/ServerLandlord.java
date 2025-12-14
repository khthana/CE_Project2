package project.common;

import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import net.jini.core.lease.*;
import com.sun.jini.lease.landlord.*;

public class ServerLandlord extends UnicastRemoteObject implements Landlord {
              // cookie -> ServerResource
    protected Hashtable resources = new Hashtable();
    protected long MAXLEASETIME = 20*1000;        // 20 Secounds
    protected LeasePolicy policy;
	protected int nowClient = 0;

    public ServerLandlord() throws RemoteException {
        policy = new LeaseDurationPolicy(MAXLEASETIME, MAXLEASETIME, this, null, null);
	}

    public long renew(Object cookie, long duration)
            throws LeaseDeniedException, UnknownLeaseException, RemoteException {
        synchronized (this) {
            ServerResource sr = (ServerResource)resources.get(cookie);
            if (sr == null)
                throw new UnknownLeaseException();

            return policy.renew(sr, duration);
        }
    }

    public Landlord.RenewResults renewAll(Object[] cookie, long[] duration)
            throws RemoteException {
        long[] granted = new long[cookie.length];
        Vector denied = new Vector();

        for (int i = 0; i < cookie.length; i++) {
            try {
                granted[i] = renew(cookie[i], duration[i]);
            } catch (LeaseException lex) {
                granted[i] = -1;
                denied.add(lex);
            }
        }
        return new Landlord.RenewResults(granted,
                denied.isEmpty() ? null : (Exception[]) denied.toArray());
    }

    public void cancel(Object cookie) 
            throws UnknownLeaseException, RemoteException {
        synchronized (this) {
            ServerResource sr = (ServerResource)resources.get(cookie);
            if (sr == null)
                throw new UnknownLeaseException();

            resources.remove(cookie);
        }
    }

    public Map cancelAll(Object[] cookie) 
            throws RemoteException {
        Map map = null;
        for (int i = 0; i < cookie.length; i++) {
            try {
                cancel(cookie[i]);
            } catch (LeaseException ex) {
                if (map == null)
                    map = new HashMap();
                map.put(cookie[i], ex);
            }
        }
		if (map != null){
			return map;
		} else return null;
    }

    // The following methods are not part of the Landlord interface
    //    and can only be called by directly using this object.
    public Lease newLease(Object sessionData, long duration) {
         expireLeases(); // Make room for new Leases

		 ServerResource sr = new ServerResource(sessionData);
		
			try {
				sr.lease = policy.leaseFor(sr, duration);
				synchronized(this) {
					resources.put(sr.getCookie(), sr);
				}
				return sr.lease;
			} catch (LeaseDeniedException e) {};
			return null;
    }

    public void expireLeases() {
        synchronized (this) {
            Vector deleteList = new Vector();
            for (Enumeration e = resources.elements(); e.hasMoreElements();) {
                ServerResource sr = (ServerResource) e.nextElement();
                if (!policy.ensureCurrent(sr)) {
                    deleteList.addElement(sr.getCookie());
		        }
            }
            for (Enumeration e = deleteList.elements(); e.hasMoreElements();) {
                Object cookie = e.nextElement();
                resources.remove(cookie);
            }
        }
    }

    // The cookie is an *internal* reference for the LandlordLease. No one outside
    //    the lease can access it.
    public Object getSessionData(Lease lease) {
        Object sessiondata = null;
        expireLeases();                // Make sure this lease hasn't expired
        synchronized (this) {
            for (Enumeration e = resources.elements();e.hasMoreElements();) {
                ServerResource sr = (ServerResource) e.nextElement();
                if (lease.equals(sr.lease)) {
                    sessiondata = sr.sessionData;
                    break;
                }
            }
        }
        return sessiondata;
    }
	//This methos is use for check if there's client connect to service.
	public int howManyClientNow(){
		return nowClient;
	}
}