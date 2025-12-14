

package ssh2;

import java.io.IOException;


/**
 * This class implements the most basic variant of a ssh2 client. It
 * creates the userauth, and connection layers (i.e. instances of
 * <code>SSH2UserAuth</code>, and <code>SSH2Connection</code>). The
 * only thing which needs to be provided is an initialized
 * <code>SSH2Transport</code> instance, user authentication data. The
 * constructor is active in that it does all the required work to set
 * up the complete protocol stack, hence it can throw exceptions which
 * can occur.
 * <p>
 * This simple client can easily be used as the basis for example to build
 * tunneling capabilities into any java app. requiring secure connections. For
 * doing remote command execution and/or controlling input/output of a command
 * or shell the class <code>SSH2ConsoleRemote</code> can be used to have easy
 * access to command execution and/or input/output as
 * <code>java.io.InputStream</code> and <code>java.io.OutpuStream</code>
 *
 * @see SSH2Transport
 * @see SSH2Connection
 * @see SSH2ConsoleRemote
 * @see SSH2Preferences
 * @see examples.RunRemoteCommand
 * @see examples.RemoteShellScript
 */
public class SSH2SimpleClient {

    protected SSH2Transport  transport;
    protected SSH2Connection connection;
    protected SSH2UserAuth   userAuth;

    /**
     * Simple constructor to use for password authentication.
     *
     * @param transport connected transport layer
     * @param username  name of user
     * @param password  password of user
     *
     * @see SSH2Transport
     */
    public SSH2SimpleClient(SSH2Transport transport,
			    String username, String password)
	throws SSH2Exception
    {
	init(transport, username, new SSH2AuthPassword(password));
    }

    /**
     * Simple constructor to use for publickey authentication.
     *
     * @param transport    connected transport layer
     * @param username     name of user
     * @param keyFile      name of private key file to use for authentication
     * @param keyPassword  password protecting private key file (null if none)
     *
     * @see SSH2Transport
     */
    public SSH2SimpleClient(SSH2Transport transport,
			    String username,
			    String keyFile, String keyPassword)
	throws SSH2Exception, IOException
    {
	SSH2KeyPairFile kpf = new SSH2KeyPairFile();

	kpf.load(keyFile, keyPassword);

	String        alg  = kpf.getAlgorithmName();
	SSH2Signature sign = SSH2Signature.getInstance(alg);

	sign.initSign(kpf.getKeyPair().getPrivate());
	sign.setPublicKey(kpf.getKeyPair().getPublic());

	init(transport, username, new SSH2AuthPublicKey(sign));
    }

    /**
     * Constructor to use for keyboard interactive authentication.
     *
     * @param transport  connected transport layer
     * @param username   name of user
     * @param interactor interactor instance to handle user
     * interaction in authentication
     *
     * @see SSH2Transport
     */
    public SSH2SimpleClient(SSH2Transport transport,
			    String username, SSH2Interactor interactor)
	throws SSH2Exception
    {
	init(transport, username, new SSH2AuthKbdInteract(interactor));
    }

    /**
     * Constructor to use when more than one authentication method
     * need to be used and/or other methods than the ones supported above.
     *
     * @param transport     connected transport layer
     * @param authenticator authenticator instance prepared with needed methods
     *
     * @see SSH2Transport
     */
    public SSH2SimpleClient(SSH2Transport transport,
			    SSH2Authenticator authenticator)
	throws SSH2Exception
    {
	init(transport, authenticator);
    }

    private void init(SSH2Transport transport,
		      String username, SSH2AuthModule authModule)
	throws SSH2Exception
    {
	SSH2Authenticator authenticator = new SSH2Authenticator(username);
	authenticator.addModule(authModule);
	init(transport, authenticator);
    }

    private void init(SSH2Transport transport, SSH2Authenticator authenticator)
	throws SSH2Exception
    {
	this.transport = transport;

	transport.boot();

	if(!transport.waitForKEXComplete()) {
	    throw new SSH2FatalException("Key exchange failed: " +
					 transport.getDisconnectMessage());
	}

	userAuth = new SSH2UserAuth(transport, authenticator);
	if(!userAuth.authenticateUser("ssh-connection")) {
	    throw new SSH2FatalException("Permission denied");
	}

	connection = new SSH2Connection(userAuth, transport);
	transport.setConnection(connection);
	authenticator.clearSensitiveData();

	int alive = transport.getOurPreferences().getIntPreference("alive");
	transport.enableKeepAlive(alive);
    }

    public SSH2Transport getTransport() {
	return transport;
    }

    public SSH2Connection getConnection() {
	return connection;
    }

}
