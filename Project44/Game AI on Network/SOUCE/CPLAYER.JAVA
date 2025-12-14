public class  CPlayer {
	public int id = -1;
	public String name = "";
	public int tableId = -1;
	public int seat = -1;
	
	
	public CPlayer(){
		id = -1;
		name = "";
	}
	public CPlayer(int i,String namein){
		id = i;
		name = namein;
	}


	public String toLobby(){
		String textOutput;
		textOutput = "id "+id+")"+name+" joined the world\n";
		//textOutput like id 1)noel joined the world
		return textOutput;
	}
}
