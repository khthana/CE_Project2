package proj_lib.db;

public class StoreLink{	
	private String thesisName;
	private String thesisLocate;

	public StoreLink(String N, String L) {
		thesisName= N;
		thesisLocate= L;
	}

	public String getThesisName() {
		return( thesisName );
	}

	public String getThesisLocate() {
		return( thesisLocate );
	}

	public void setThesisName( String name ) {
		thesisName = name;
	}

	public void setThesisLocate( String locate ) {
		thesisLocate = locate;
	}

}// class Thesis*/