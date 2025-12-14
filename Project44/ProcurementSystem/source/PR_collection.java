import java.util.*;

public class  PR_collection{
	private Vector PR_vector;

	/** build empty PR**/

	public PR_collection() {
		PR_vector = new Vector();
	}

	public Vector getPr_vector() {
		return(PR_vector);
	}

	public void add(PR pr) {
		PR_vector.add(pr);
	}
}