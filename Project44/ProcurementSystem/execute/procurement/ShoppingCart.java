import java.util.*;

public class  ShoppingCart{
	private Vector itemOrdered;

	/** build empty shopping cart **/

	public ShoppingCart() {
		itemOrdered = new Vector();
	}

	public Vector getItemOrdered() {
		return(itemOrdered);
	}

	public void add(ItemOrder itemOrder) {
		itemOrdered.add(itemOrder);
	}

	public void remove(int ii) {
		itemOrdered.remove(ii);
	}
}//ShoppingCart
