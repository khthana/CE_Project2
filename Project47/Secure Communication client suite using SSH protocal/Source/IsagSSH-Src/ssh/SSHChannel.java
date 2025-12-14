
package ssh;

public abstract class SSHChannel extends Thread {

  protected int                channelId;
  protected SSHChannelListener listener;

  public SSHChannel(int channelId) {
    super();
    setName(this.getClass().getName() + "[" + channelId + "]");
    this.channelId = channelId;
    this.listener  = null;
  }

  public void setSSHChannelListener(SSHChannelListener listener) {
    this.listener = listener;
  }

  public int getId() {
    return channelId;
  }

  public abstract void serviceLoop() throws Exception;

  public void close() {
  }

  public void run() {

    if (util.Util.isNetscapeJava()) {
      try {
        netscape.security.PrivilegeManager.enablePrivilege("TerminalEmulator");
      } catch (netscape.security.ForbiddenTargetException e) {
      }
    }

    try {
      serviceLoop();
    } catch (Exception e) {

      if(SSH.DEBUGMORE) {
	System.out.println("--- channel exit (exception is not an error):");
	e.printStackTrace();
	System.out.println("---");
      }

      close();
      if(listener != null)
	listener.close(this);

    } catch (ThreadDeath death) {
      SSH.logExtra("Channel killed " + channelId + " " + this);
      throw death;
    }
  }

}
