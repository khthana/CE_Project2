import java.util.*;

public class  ItemVector{
	private Vector itemVector;

	
	public ItemVector() {
		itemVector = new Vector();
	}

	public Vector getItemVector() {
		return(itemVector);
	}

	public void add(Item item) {
		itemVector.add(item);
	}

	public void remove(int ii) {
		itemVector.remove(ii);
	}
}
