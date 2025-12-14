package dtw.webmail.model;

public class JwmaException 
		extends Exception 
		implements JwmaError {

	public JwmaException(String msg) {
		super(msg);
	}//constructor

}//JwmaException