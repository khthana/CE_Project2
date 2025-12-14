
package ssh;

public class SSHChannelMulticaster implements SSHChannelListener {
  public SSHPdu prepare(SSHPdu pdu) {
    return pdu;
  }
  public void receive(SSHPdu pdu) {
  }
  public void transmit(SSHPdu pdu) {
  }
  public void close(SSHChannel chan) {
  }
}
