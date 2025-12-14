import java.util.Vector;

public class Queue {
	protected Vector queue;
	
	public Queue () {
		queue = new Vector ();
	}
	
	public Object remove () throws InterruptedException {
		synchronized (queue) {
			while (queue.isEmpty ()) {
				queue.wait ();
			}
			Object item = queue.firstElement ();
			queue.removeElement (item);
			return item;
		}
	}
	
	public void add (Object item) {
		synchronized (queue) {
			queue.addElement (item);
			queue.notify ();
		}
	}
	
	public boolean isEmpty () {
		return queue.isEmpty ();
	}
}