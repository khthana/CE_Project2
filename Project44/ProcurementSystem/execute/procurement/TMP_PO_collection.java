import java.util.*;

public class  TMP_PO_collection{
	private Vector TMP_PO_vector;

	/** build empty PR**/

	public TMP_PO_collection() {
		TMP_PO_vector = new Vector();
	}

	public Vector getTmp_Po_vector() {
		return(TMP_PO_vector);
	}

	public void add(TMP_PO tmp) {
		TMP_PO_vector.add(tmp);
	}

     public TMP_PO itemAt(int ii){
			return((TMP_PO)TMP_PO_vector.elementAt(ii));
	 }

	public void remove(int ii) {
		
		TMP_PO_vector.remove(ii);
	}
}