package project.service.robotsim;

import net.jini.core.lease.*;
import com.sun.jini.lease.landlord.*;

public class ServerResource implements LeasedResource {
    protected static int token = 0;
    protected Integer cookie;
    protected long expiration;

    public Lease lease;        // Only a copy (not the client's)
    public Object sessionData;

    // Simple resource mapper -- we use a static int to ensure that
    // each lease resource will have a unique cookie
    public ServerResource(Object sessionData) {
        synchronized (ServerResource.class) {
            cookie = new Integer(token++);
        }
        this.sessionData = sessionData;
    }

    public long getExpiration() {
        return expiration;
    }

    public void setExpiration(long expire) {
        expiration = expire;
    }

    public Object getCookie() {
        return cookie;
    }
}
