import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class Passpos extends Panel implements Recipient {
	private native void sendposition();
	private native void getposition();
	private native String getname();
	private native void sendname(String prompt);
	protected native void CallMain();
	private native void CallMove(int arr[]);
	private native void sendadver(int arr[]);
	
	protected String my_name,his_name;
	protected int myA,hisA,count,myCol,hisCol;
	protected int mySkin,hisSkin,my_adver,his_adver;
	protected double myX, myY, myZ, hisX, hisY, hisZ;
	protected boolean new_user;
	protected List myList;
	protected Chatboard cb;
	protected double xx[], yy[];
	protected String name[];
	
	public Passpos () 
	{
		setLayout (new BorderLayout ());
		myList = new List (1, false);
		myList.addItem ("Boardcast");
		myList.select (0);
		add (myList);
		new_user = true;
		my_name = getname();
		my_adver = 1;
		xx = new double[50];
		yy = new double[50];
		name = new String[50];
		for (int i=0; i<50; i++) {
			name[i] = "";
		}
		count = 0;	
	}
	
	public void sendCB (Chatboard cb)
	{
		this.cb = cb;
	}
	
	public void sendHuman (String human)
	{
		cb.getHuman (human);
	}
	
	public boolean handleEvent (Event evt)
	{
		String select;
		if (!(evt.target == myList))
		{
			return super.handleEvent (evt);
		}
		if (evt.id == Event.LIST_SELECT)
		{
			select = myList.getSelectedItem ();
			sendHuman (select);
		}
		return true;
	}
	
	public void Move (int command)
	{	
		int arr[] = new int [1];
		arr[0] = command;
		CallMove(arr);
	}
	
	protected MessageOutput messageOut;

	public void setMessageOutput (MessageOutput messageOut) {
		this.messageOut = messageOut;
	}
	
	private void get_skin(int skin) {
		mySkin = skin;
	}
	
	private void get_color(int col) {
		myCol = col;
	}
	
	private void get_command(int a) {
		myA = a;
	}
	
	private void get_position_x(double x) {
		myX = x;
	}
	
	private void get_position_y(double y) {
		myY = y;
	}
	
	private void get_position_z(double z) {
		myZ = z;
		transmit(my_name,myX,myY,myZ);
	}
	
	private void changeList() {
		for (int i=0; i<count; i++) {
			boolean check = false;
			int k = 0;
			double difX = Math.abs (myX - xx[i] );
			double difY = Math.abs (myY - yy[i]);
			for (int j=0; j<myList.getItemCount(); j++) {
				if (name[i].equals(myList.getItem(j))) {
					check = true;
					k = j;
				}
			}
			if ((difX <= 90) && (difY <= 90)) {	
				if (!check) {
					myList.addItem (name[i]);	
				}
			}
			else {
				if (check) {
					myList.delItem (k);
				}
			}
		}
			
	}
		
	protected void transmit (String my_name, double x, double y, double z) {
		try {
			messageOut.writeBoolean(new_user);
			new_user = false;
			messageOut.writeUTF(my_name);
			messageOut.writeInt(mySkin);
			messageOut.writeInt(myCol);
			messageOut.writeInt(myA);
			messageOut.writeInt(my_adver);
			messageOut.writeDouble (x);
			messageOut.writeDouble (y);
            messageOut.writeDouble (z);
            messageOut.send ();
            changeList ();
		} catch (IOException ignored) {
		}
	}

	public void send_adver (int adver) {
		int arr[] = new int [1];
		my_adver = adver;
		if (my_name.equals("Admin"))
		{ transmit(my_name,myX,myY,myZ); }	
		arr[0] = adver;
		sendadver(arr);
	}
	
	public MessageOutput getMessageOutput () {
		return new DeliveryOutputStream (this);
	}
	
	private int send_skin () {
		return(hisSkin);
	}
	
	private int send_color () {
		return(hisCol);
	}
	
	private int send_command () {
		return(hisA);
	}
	
	private double send_position_x () {
		return(hisX);
	}
	
	private double send_position_y () {
		return(hisY);
	}
	
	private double send_position_z () {
		return(hisZ);
	}
	
	public void receive (DataInputStream dataIn) {
        try {
       		boolean new_regis = dataIn.readBoolean ();
			if (new_regis) {
				getposition();			
			} 		
       		his_name = dataIn.readUTF ();
       		hisSkin = dataIn.readInt ();
       		hisCol = dataIn.readInt ();
       		hisA = dataIn.readInt ();
       		his_adver = dataIn.readInt ();
       		hisX = dataIn.readDouble (); 
       		hisY = dataIn.readDouble (); 
       		hisZ = dataIn.readDouble ();
       		if ((my_adver != his_adver) && (his_name.equals("Admin")))
       			{ send_adver (his_adver); }
       			
			boolean ch = false;
			for (int k=0; k<count; k++) {
				if (his_name.equals(name[k])) {
					xx[k] = hisX;
					yy[k] = hisY;
					ch = true;
				}
			}
			if (!ch) {
				name[count] = his_name;
				xx[count] = hisX;
				yy[count] = hisY;
				count++;
			}
			receiveList ();
			sendname(his_name);
			sendposition();    
        } catch (IOException ignored) {
        }
	}
	
	public void receiveList () {
		int j=0;
		double difX = Math.abs (myX - hisX);
		double difY = Math.abs (myY - hisY);
		boolean check1 = false;
		for (int i=0; i<myList.getItemCount(); i++) {
			if (his_name.equals(myList.getItem(i))) {
				check1 = true;
				j = i;
			}
		}
		if ((difX <= 90) && (difY <= 90)) {
			if (!check1) {				
				myList.addItem(his_name);
			}
		} 
		else {
			if (check1) {
				myList.delItem(j);
			}
		}
	}
	
	static {
    	System.loadLibrary("MyImpOfCallMain");
  	}
}