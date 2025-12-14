package IsagFtp.ssh;
import java.io.IOException;

public interface SSHChannelListener {
  public SSHPdu prepare(SSHPdu pdu) throws IOException ;
  public void transmit(SSHPdu pdu);
  public void receive(SSHPdu pdu);
  public void close(SSHChannel chan);
}
