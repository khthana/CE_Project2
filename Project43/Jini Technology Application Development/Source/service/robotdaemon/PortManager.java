package project.service.robotdaemon;

import project.common.*;
import project.service.robotdaemon.*;

import javax.comm.*;
import java.io.*;
import java.util.*;

public class PortManager implements SerialPortEventListener, 
					                CommPortOwnershipListener{
    
	private SerialParameters parameters;
	private CommPortIdentifier portId;
    private SerialPort sPort;

    private OutputStream os;
    private InputStream is;

	private MessageProcessor processor;
	private RobotRoomImpl robotRoom;
	
	private boolean open;

	public PortManager(SerialParameters param,MessageProcessor mp,RobotRoomImpl room){
		this.parameters = param;
		this.processor = mp;
		this.robotRoom = room;
	}

	public void openConnection(){

		// Obtain a CommPortIdentifier object for the port you want to open.
		try {
			robotRoom.display("Open port: name = "+parameters.getPortName());
			robotRoom.display("Open port: baudrate = "+parameters.getBaudRateString());
			portId = CommPortIdentifier.getPortIdentifier(parameters.getPortName());
		} 
		catch(Exception e){
			robotRoom.portNotReady();
			robotRoom.display("ERROR:Can't open port "+parameters.getPortName());
			robotRoom.display(e.toString());
		}
		//catch (NoSuchPortException e) {
		//	throw new SerialConnectionException(e.getMessage());
		//}

		// Open the port represented by the CommPortIdentifier object. Give
		// the open call a relatively long timeout of 30 seconds to allow
		// a different application to reliquish the port if the user 
		// wants to.
		try {
			sPort = (SerialPort)portId.open("RobotDaemond", 10000);
			robotRoom.portReady();
		} catch (PortInUseException e) {
			robotRoom.portNotReady();
			robotRoom.display("ERROR:Port "+parameters.getPortName()+" is busy.");
	      }

		// Set the parameters of the connection. If they won't set, close the
		// port before throwing an exception.
		try {
			setConnectionParameters();
		} catch (SerialConnectionException e) {	
			sPort.close();
			robotRoom.portNotReady();
			robotRoom.display("ERROR:Can't set parameters at Port "+parameters.getPortName());
		  }

		// Open the input and output streams for the connection. If they won't
		// open, close the port before throwing an exception.
		try {
			os = sPort.getOutputStream();
			is = sPort.getInputStream();
		} catch (IOException e) {
			sPort.close();
			robotRoom.portNotReady();
			robotRoom.display("ERROR:Can't open stream connection at Port "+parameters.getPortName());
		  }

		// Create a new KeyHandler to respond to key strokes in the 
		// messageAreaOut. Add the KeyHandler as a keyListener to the 
		// messageAreaOut.

		// Add this object as an event listener for the serial port.
		try {
			sPort.addEventListener(this);
		} catch (TooManyListenersException e) {
			sPort.close();
			robotRoom.portNotReady();
			robotRoom.display("ERROR:Too many listeners added at Port "+parameters.getPortName());
		  }

		// Set notifyOnDataAvailable to true to allow event driven input.
		sPort.notifyOnDataAvailable(true);

		// Set notifyOnBreakInterrup to allow event driven break handling.
		sPort.notifyOnBreakInterrupt(true);

		// Set receive timeout to allow breaking out of polling loop during
		// input handling.
		try {
			sPort.enableReceiveTimeout(30);
		} catch (UnsupportedCommOperationException e) {
		   }

		// Add ownership listener to allow ownership event handling.
		portId.addPortOwnershipListener(this);

		//Success open port
		open = true;
		robotRoom.portReady();
		robotRoom.display("Open port: OK");
	}

    public void closeConnection() {
		// If port is alread closed just return.
		if (!open) {
			return;
		}

		// Check to make sure sPort has reference to avoid a NPE.
		if (sPort != null) {
			try {
			// close the i/o streams.
	    		os.close();
	    		is.close();
			} catch (IOException e) {
				robotRoom.display("ERROR:"+e.toString());
			   }

			// Close the port.
			sPort.close();

			// Remove the ownership listener.
			portId.removePortOwnershipListener(this);
		}
		
		//Port Close ready
		open = false;
		robotRoom.portNotReady();
		robotRoom.display("Port "+parameters.getPortName()+" is closed.");
	}

    public void setConnectionParameters() throws SerialConnectionException {

		// Save state of parameters before trying a set.
		int oldBaudRate = sPort.getBaudRate();
		int oldDatabits = sPort.getDataBits();
		int oldStopbits = sPort.getStopBits();
		int oldParity   = sPort.getParity();
		int oldFlowControl = sPort.getFlowControlMode();

		// Set connection parameters, if set fails return parameters object
		// to original state.
		try {
			sPort.setSerialPortParams(parameters.getBaudRate(),
										parameters.getDatabits(),
										parameters.getStopbits(),
										parameters.getParity());
		} catch (UnsupportedCommOperationException e) {
			parameters.setBaudRate(oldBaudRate);
			parameters.setDatabits(oldDatabits);
			parameters.setStopbits(oldStopbits);
			parameters.setParity(oldParity);
			throw new SerialConnectionException("Unsupported parameter");
		  }

		// Set flow control.
		try {
			sPort.setFlowControlMode(parameters.getFlowControlIn() 
									| parameters.getFlowControlOut());
		} catch (UnsupportedCommOperationException e) {
			throw new SerialConnectionException("Unsupported flow control");
		  }
    }

	public void sendData(int newChar){
		try {
	    	os.write(newChar);
	    } catch (IOException e) {
			robotRoom.display("OutputStream write error: " + e);
		  }
	}

	public void ownershipChange(int i){
	}

	public void serialEvent(SerialPortEvent spe){
		// Create a StringBuffer and int to receive input data.
		StringBuffer inputBuffer = new StringBuffer();
		int newData = 0;

		// Determine type of event.
		switch (spe.getEventType()) {

			// Read data until -1 is returned. If \r is received substitute
			// \n for correct newline handling.
			case SerialPortEvent.DATA_AVAILABLE:
				while (newData != -1) {
		    		try {
		    			newData = is.read();
						if (newData == -1) {
							break;
						}
						if ('\r' == (char)newData) {
			   				inputBuffer.append('\n');
						} else {
			    			inputBuffer.append((char)newData);
						  }
		    		} catch (IOException ex) {
		    			robotRoom.display("ERROR:"+ex.toString());
		    			return;
		      		  }
   				}

				//Send received data to processor.
				processor.process((int)inputBuffer.charAt(0));
				break;

			// If break event append BREAK RECEIVED message.
			//case SerialPortEvent.BI:
			//	messageAreaIn.append("\n--- BREAK RECEIVED ---\n");
		}
	}
}