package project.common;

import java.rmi.*;
import java.rmi.server.*;
import java.util.*;
import net.jini.core.lease.*;
import net.jini.core.event.*;
import com.sun.jini.lease.landlord.*;

public class ServerDelivery {
    private Remote source;              // Owner of this delivery object
    private ServerLandlord lord;        // The landlord that manages leases
    private Vector leases;              // Event specific leases
    private long seqnum = 0;

    // The client-specific session data for the event leases
    // holds the listener and the callback data
    private class SessionData {
        public RemoteEventListener listener;
        public MarshalledObject key;
    }

    public ServerDelivery(Remote source, ServerLandlord ll) {
        this.source = source;
        lord = ll;
        leases = new Vector();
    }

    public synchronized EventRegistration addListener(RemoteEventListener l, long duration, MarshalledObject key) {
        SessionData sd = new SessionData();
        sd.listener = l;
        sd.key = key;

        Lease lease = lord.newLease(sd,duration);
        leases.addElement(lease);

        return new EventRegistration(RobotRoomEvent.ID, source, lease, seqnum);
    }

    // Deliver an event to all listeners
    public synchronized void deliver(int type,int fromRobot) {
        long seq = seqnum++;                // Deliver request number
        if (leases.isEmpty())
            return;

        lord.expireLeases();                // Clean up the leases first
        Vector expiredLeases = new Vector();
        // Deliver to each client. Save all the expired leases
        // and remove those leases after the loop
        for (Enumeration e = leases.elements(); e.hasMoreElements();) {
            Lease l = (Lease) e.nextElement();
            SessionData obj = (SessionData) lord.getSessionData(l);
            if (obj == null) {
                expiredLeases.addElement(l);
            } else {
                try {
                    deliverEvent(obj, seq, type,fromRobot);
                } catch (RemoteException rex) {
                    // Can't really do anything here --
                    // cancelling the lease is not allowed;
                    // we'll have to try again next time
                } catch (UnknownEventException uee) {
                    // The client told us it didn't want these events
                    // anymore, cancel it's registration
                    expiredLeases.addElement(l);
	        }
            }
        }

        // Get rid of all the failed clients
        for (Enumeration e = expiredLeases.elements(); e.hasMoreElements();) {
            Lease l = (Lease) e.nextElement();
            leases.remove(l);
        }
    }

    // Actually send the event
    private void deliverEvent(SessionData data, long seq, int type, int fromRobot) 
            throws RemoteException, UnknownEventException {
        RobotRoomEvent event = new RobotRoomEvent(source, seq, data.key, type, fromRobot);
        data.listener.notify(event);
    }
}
