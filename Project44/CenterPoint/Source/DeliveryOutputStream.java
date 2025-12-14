import java.io.*;

public class DeliveryOutputStream extends MessageOutput {
	protected ByteArrayOutputStream byteArrayOut;
	protected Recipient recipient;
	
	public DeliveryOutputStream (Recipient recipient) {
		super (new ByteArrayOutputStream ());
		byteArrayOut = (ByteArrayOutputStream) out;
		this.recipient = recipient;
	}
	
	public void send () {
		byte[] buffer = byteArrayOut.toByteArray ();
		ByteArrayInputStream byteArrayIn = new ByteArrayInputStream (buffer);
		recipient.receive (new DataInputStream (byteArrayIn));
		byteArrayOut.reset ();
	}
}