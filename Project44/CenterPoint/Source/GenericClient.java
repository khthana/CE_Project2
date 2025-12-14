import java.io.*;
import java.net.*;
import java.util.*;

public class GenericClient extends Thread {
	protected InputStream in;
	protected OutputStream out;
	protected Queue queue;
	protected Hashtable registry;
	protected MessageOutput messageOut;
	
	static private int clientNumber;
	static private synchronized int nextClientNum () { return clientNumber ++; }
	
	public GenericClient (InputStream in, OutputStream out) throws IOException {
		super ("GenericClient-" + nextClientNum ());
		this.in = in;
		this.out = out;
		registry = new Hashtable ();
		queue = new Queue ();
		QueueOutputStream queueOut = new QueueOutputStream (queue);
		messageOut = new RoutingOutputStream (queueOut);
	}
	
	protected boolean finished;
	
	public void shutdown () throws IOException {
		finished = true;
		interrupt ();
		out.close ();
	}
	
	public void run () {
		QueueInputStream queueIn = new QueueInputStream (queue);
		MessageOutputStream messageOut = new MessageOutputStream (out);
		GenericMessageCopier copier = 
			new GenericMessageCopier (this, queueIn, messageOut);
		try {
			copier.start ();
			demux ();
		} catch (IOException ex) {
			if (!finished)
				ex.printStackTrace ();
		} finally {
			copier.finish ();
			closedown ();
		}
	}
	
	protected void demux () throws IOException {
		MessageInputStream messageIn = new MessageInputStream (in);
		MultiplexInputStream multiplexIn = new MultiplexInputStream (messageIn);
		while (!Thread.interrupted ()) {
			multiplexIn.receive ();
			Client client = (Client) registry.get (multiplexIn.getLabel ());
			if (client != null) {
				try {
					client.receive (new DataInputStream (multiplexIn));
				} catch (RuntimeException ex) {
					ex.printStackTrace ();
				}
			}
		}
	}
	
	protected void closedown () {
		try {
			out.close ();
		} catch (IOException ex) {
			ex.printStackTrace ();
		}
		synchronized (registry) {
			Enumeration clients = registry.keys ();
			while (clients.hasMoreElements ()) {
				deregister ((String) clients.nextElement ());
			}
		}
	}
	
	public void register (String label, Client client) {
		synchronized (registry) {
			deregister (label);
			registry.put (label, client);
			client.setMessageOutput (new MultiplexOutputStream (messageOut, label));
		}
	}
	
	protected void deregister (String label) {
		synchronized (registry) {
			Client client = (Client) registry.remove (label);
			if (client != null)
				client.disconnected ();
		}
	}
}
			