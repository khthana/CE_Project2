//micropayment server
import java.net.*;
import java.io.*;
import com.bill4u.impl.micropayments.*;
import java.sql.*;
import java.util.*;

class MPServerImpl extends Thread {    
	private boolean isRunning = false;
	private Socket sock = null;
	private ObjectOutputStream oos = null;
	private ObjectInputStream ois = null;
	private Vector clientThreads;
	private Connection conn;
	MPServerImpl(Socket sock, Vector clientThreads) throws IOException {
		this.sock = sock;
		this.clientThreads = clientThreads;
		oos = new ObjectOutputStream (sock.getOutputStream());
		ois = new ObjectInputStream (sock.getInputStream());
		sock.setSoTimeout(1000); // set blocking timeout
		String data = "jdbc:mysql://localhost/bill4udb";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(data,"root","admin");
		} catch (Exception e) {
			System.err.println("Error: " + e.toString());
		}
	}
	public void run() {
		while (isRunning) {
			try {
				Object obj = ois.readObject();
				if (!obj.getClass().getSuperclass().getName().equals("com.bill4u.impl.micropayments.MPSMessage")) {
					System.err.println("Error...read class: " + obj.getClass().getName() + " - unknown!");
					obj = null;
				} else {
					switch (((MPSMessage)obj).getType() ) {
						case MPSMessage.SignupRequest: {
							SignupRequest sr = (SignupRequest)obj;
							String custAcct = sr.getcustAcctNumber();
							if(custAcct.length() != 8) {
								oos.writeObject(new SignupResponse("Oops! Invalid customer number entered. Please ensure it is correct.",false));
								System.err.println("Invalid account number: " + custAcct);
								break;
							}
							Statement st = conn.createStatement();
							ResultSet rec = st.executeQuery("select custid, signupid from customer where custid = '" + custAcct + "'");
							System.out.println("Looking up customer data for customer account number: " + custAcct);
							if(!rec.next()) {
								oos.writeObject(new SignupResponse("Oops! We could not find the account number entered. Please ensure it is correct.", false));
								System.err.println("Could not find account number: " + custAcct);
								st.close();
								break;
							}
							String signupid = rec.getString("signupid");
							if(!signupid.equals("0")) {
								oos.writeObject(new SignupResponse("Oops! That customer account number is already in use. Please contact technical support immediately.", false));
								System.err.println("Customer account number: " + custAcct + " has already been confirmed");
								st.close();
								break;
							}
							String newSignupID = Long.toString(MPServer.getRandom());
							int numRecs = st.executeUpdate("update customer set signupid = '" + newSignupID + "' where custid = '" + custAcct + "'");
							if (numRecs!=1) {
								oos.writeObject(new SignupResponse("Oop! We had an internal database error! Please contact technical support.",false)); //should never occur!
								System.err.println("Could not update customer record, account number: " + custAcct);
								st.close();
								break;
							}
							System.out.println("Customer account number: " + custAcct + " successfully confirmed and setup");
							oos.writeObject(new SignupResponse("Thank you. Your MicroPay service has been confirmed and is now ready for use.", true, newSignupID));
							st.close();
						}
						break;
						case MPSMessage.ChargeRequest: {
							ChargeRequest cr = (ChargeRequest)obj;
							String acctNumber = cr.getAcctNumber();
							String pinNumber = cr.getPinNumber();
							String chargeInfo = cr.getChargeInfo();
							String signupID = cr.getSignupID();
							String vendorID = cr.getVendorID();
							int chargeAmount = cr.getChargeAmount();
							System.out.println("Recieved MicroPayment request from customer account number: " + acctNumber);
							Statement st = conn.createStatement();
							// verify correct vendor id
							ResultSet rec = st.executeQuery("select vendorid from vendors where vendorid = '" + vendorID + "'");
							if(!rec.next()) {
								oos.writeObject(new ChargeResponse("Error - the vendor information supplied is invalid. Please contact MicroPay technical support immediately", false));
								System.err.println("Could not find vendor account number: " + acctNumber);
								st.close();
								break;
							}
							String retVendorID = rec.getString("vendorid");
							// verify customer exists and has sufficient funds
							rec = st.executeQuery("select custid, balance, pincode, signupid from customer where custid = '" + acctNumber + "'");
							if(!rec.next()) {
								oos.writeObject(new ChargeResponse("Error - the customer information supplied is invalid. Please contact MicroPay technical support immediately", false));
								System.err.println("Could not find customer account number: " + acctNumber);
								st.close();
								break;
							}
							String retAccNumber = rec.getString("custid");
							int retBalance = rec.getInt("balance");
							String retPinCode = rec.getString("pincode");
							String retSignupID = rec.getString("signupid");
							if(!retPinCode.equals(pinNumber)) {
								oos.writeObject(new ChargeResponse("Error - the supplied PIN code is incorrect.", false, true));
								System.err.println("Incorrect Pin code entered for customer account: " + acctNumber);
								st.close();
								break;
							}
							if(!retSignupID.equals(signupID)) {
								oos.writeObject(new ChargeResponse("Error - account verification failed. Please contact MicroPay technical support for further assistance.", false));
								System.err.println("Incorrect signup ID for customer account: " + acctNumber);
								st.close();
								break;
							}
							if(retBalance < chargeAmount) {
								oos.writeObject(new ChargeResponse("You do not have enough credit in your account. Please upload more credit using the MicroPay web site.", false));
								System.err.println("Insufficient credit for customer account: " + acctNumber + " balance="+retBalance+" chargeAmount="+chargeAmount);
								st.close();
								break;
							}
							Calendar c = Calendar.getInstance();
							String dateTime = c.get(Calendar.YEAR) + "-" + (c.get(Calendar.MONTH)+1) + "-" + c.get(Calendar.DAY_OF_MONTH) + " " + c.get(Calendar.HOUR_OF_DAY) + ":" + c.get(Calendar.MINUTE) + ":" + c.get(Calendar.SECOND);
							int numRecs = st.executeUpdate("insert into transactions (custid, info, amount, date, type, status, vendorid) values ('" +acctNumber + "', '" + chargeInfo + "', '" + chargeAmount + "', '" + dateTime + "', 'DEBIT', 'PENDING', '" +vendorID + "')");
							if (numRecs!=1) {
								oos.writeObject(new ChargeResponse("We had an internal database error! Please contact technical support.",false)); //should never occur!
								System.err.println("Could not add transaction for customer account number: " + acctNumber);
								st.close();
								break;
							}
							try {
								oos.writeObject(new ChargeResponse("Thank you. The MicroPayment has been successfully processed.", true));
							} catch(IOException ioe) {
								//if we get an exception the response packet didn't get to the client so void the transaction we've just created
								rec = st.executeQuery("select transactionid from transactions where custid = '" + acctNumber + "' and info = '" +chargeInfo + "' and amount = '" + chargeAmount + "' and date = '" + dateTime + "' and type = 'DEBIT' and status = 'PENDING'");
								if(!rec.next()) {
									System.err.println("A serious database error occurred - could not void transaction for customer account number: "+ acctNumber);
									st.close();
									throw ioe;
								}
								//void the transaction id returned from the nasty SQL statement above
								numRecs = st.executeUpdate("update transactions set status = 'VOID' where transactionid = '" + rec.getString("transactionid") + "'");
								if (numRecs!=1) {
									System.err.println("A serious database error occurred - could not void transaction for customer account number: "+ acctNumber);
									st.close();
									throw ioe;
								}
								//throw ioe which will terminate this running thread
								throw ioe;
							}
							boolean updateError = false;
							// update the customer account balance
							numRecs = st.executeUpdate("update customer set balance = balance- "+ chargeAmount + " where custid = " + acctNumber);
							if (numRecs!=1) {
								System.err.println("Critical database error: Could not update balance for customer account number: " +acctNumber);
								updateError = true;
								st.close();
							}
							//update vendor account balance
							numRecs = st.executeUpdate("update vendors set balance = balance+" + chargeAmount + " where vendorid = " + vendorID);
							if (numRecs!=1) {
								System.err.println("Critical database error: Could not update balance for vendor account number: " + vendorID);
								updateError = true;
								st.close();
							}
							//update transaction table and mark transaction processed
							numRecs = st.executeUpdate("update transactions set status = 'PROCESSED' where custid = '" + acctNumber + "' and info = '" + chargeInfo + "' and amount = '" + chargeAmount + "' and date = '" + dateTime + "' and type = 'DEBIT' and status ='PENDING'");
							if (numRecs!=1) {
								System.err.println("Critical database error: Could not mark set status to PROCESSED for transaction relating to customer account number: " + acctNumber);
								updateError = true;
								st.close();
							}
							if(updateError) throw new IOException("CRITICAL ERROR: COULD NOT UPDATE DATABASE...PLEASE CHECK DATABASE INTEGRITIY!");
								else System.out.println("MicroPayment processed for customer account number: " + acctNumber);
						}
						break;
						default: {
							System.err.println("Error...read class: " + obj.getClass().getName() + " - unhandled!");
							obj = null;
						}
						break;
					}
				}
			} catch (ClassNotFoundException cnfe) {
				System.err.println("Error - read object found unrecognised class!");
				isRunning = false;
			} catch (SQLException sqle) {
				isRunning = false;
				System.err.println(sqle.toString());
			} catch (SocketTimeoutException ste) {
			// the readObject call timedout, but that's okay!
			} catch (EOFException eofe) {
				isRunning = false;
			} catch (IOException ioe) {
				System.err.println("Error - IO Exception encountered: " + ioe.toString());
				isRunning = false;
			}
		}
		try {
			oos.close();
			ois.close();
			sock.close();
		} catch (IOException ioe) {
				System.err.println("Error: " + ioe.toString());
		}
		clientThreads.remove(this);
	}

	public void start() {
		isRunning = true;
		super.start();
	}
	public void stopThread() {
		isRunning = false;
	}
}


public class MPServer extends Thread {
	private boolean isRunning = false;
	private ServerSocket sock = null;
	private Vector clientThreads = null;
	static private Random rnd = null;
	MPServer() throws IOException, SocketException {
		int PortNum = 1024;
		final int MaxPortNum = 1024;
		final int ListenBuffer = 16;
		clientThreads = new Vector(5);
		do {
			try {
				sock = new ServerSocket(PortNum,ListenBuffer);
			} catch (BindException e) {
				System.out.println("Failed to bind to port: " + PortNum);
				PortNum++;
				if (PortNum == MaxPortNum) throw new BindException("Failed to bind to all ports in range");
			}
		} while (sock == null);
		sock.setSoTimeout(1000); // Set blocking timeout to 1000ms
		System.out.println("bill4u Micro Payments Server up and running on port: " + PortNum);
	}
	public void run() {
		MPServerImpl mpsi = null;
		while (isRunning) {
			try {
				Socket client = sock.accept();
				System.out.println("Client connected:" + client.getRemoteSocketAddress().toString());
				mpsi = new MPServerImpl(client,clientThreads);
				clientThreads.add(mpsi);
				mpsi.start();
				client = null;
			} catch (SocketTimeoutException ste) {
				// socket time out exception
			} catch (IOException e) {
				System.out.println("Exception : " +e.toString());
				isRunning = false;
			}
		}
	}
	public static long getRandom() {
		if (rnd == null) rnd = new Random(System.currentTimeMillis());
		// must ensure the random number is not equal to 0 as that is reserved for unconfirmed customers!
		long i=0;
		while (i==0) i = rnd.nextLong();
		return i;
	}
	public void start() {
		isRunning = true;
		super.start();
	}
	public void stopThread() {
		Enumeration e = clientThreads.elements();
		while (e.hasMoreElements()) {
			MPServerImpl mpsi = (MPServerImpl)e.nextElement();
			mpsi.stopThread();
			try {
				mpsi.join(3000);
			} catch (InterruptedException ie) {
				System.out.println("Thread failed to stop within specified period");
				System.out.println("Exception : " +ie.toString());
			}
		}
		isRunning = false;
	}
	public static void main (String[] args) {
		try {
			MPServer mps = new MPServer();
			mps.start();
			mps.join();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
}
