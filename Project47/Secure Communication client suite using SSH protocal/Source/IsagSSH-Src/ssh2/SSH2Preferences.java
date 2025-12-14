
package ssh2;

import java.util.Properties;
import java.util.Hashtable;
import java.util.Enumeration;

/**
 * This class is a container for all protocol preferences and the
 * packet version used in the class <code>SSH2Transport</code>. It can
 * be created using a hard-coded list of preferences or it can be
 * created from a <code>java.util.Properties</code> instance. All
 * preferences for algorithms are comma separated lists in order of
 * preference (as defined in the trasport protocol spec.).
 * <p>
 * This class contains the negotiation logic to select preferences
 * from lists of client and server preferences. It also contains the
 * functionality to select a key exchange algorithm given the
 * available algorithms and host key types. These functions are used
 * from the <code>SSH2Transport</code> class.
 * <p>
 * !!! TODO COMPLETE THIS LIST !!!
 * The preferences that can be set are the following:
 * <table border="1">
 * <tr>
 * <th>Property name</th><th>Description</th>
 * </tr>
 * <tr>
 * <td>kex-algorithms</td><td>Key exchange algorithms</td>
 * </tr>
 * <tr>
 * <td>server-host-key-algorithms</td><td>Host key algorithms</td>
 * </tr>
 * <tr>
 * <td>enc-algorithms-cli2srv</td>
 * <td>Encryption algorithms client to server</td>
 * </tr>
 * <tr>
 * <td>enc-algorithms-srv2cli</td>
 * <td>Encryption algorithms server to client</td>
 * </tr>
 * <tr>
 * <td>mac-algorithms-cli2srv</td><td>Mac algorithms client to server</td>
 * </tr>
 * <tr>
 * <td>mac-algorithms-srv2cli</td><td>Mac algorithms server to client</td>
 * </tr>
 * <tr>
 * <td>comp-algorithms-cli2srv</td>
 * <td>Compression algorithms client to server</td>
 * </tr>
 * <tr>
 * <td>comp-algorithms-srv2cli</td>
 * <td>Compression algorithms server to client</td>
 * </tr>
 * <tr>
 * <td>languages-cli2srv</td><td>Language tags client to server</td>
 * </tr>
 * <tr>
 * <td>languages-srv2cli</td><td>Language tags server to client</td>
 * </tr>
 * <tr>
 * <td>compression</td><td>Outgoing compression level 0-9 (default 6)</td>
 * </tr>
 * <tr>
 * <td>package-version</td><td>Package version for protocol version string</td>
 * </tr>
 * <tr>
 * <td>alive</td><td>Seconds between keepalive packets 
 * (default 0 = no keepalive packets sent)</td>
 * </tr>
 * <tr>
 * <td>rx-init-win-sz</td><td>Initial receive window size</td>
 * </tr>
 * <tr>
 * <td>rx-max-pkt-sz</td><td>Maximum size of packets we accept</td>
 * </tr>
 * <tr>
 * <td>tx-max-pkt-sz</td><td>Maximum size of packets we send</td>
 * </tr>
 * <tr>
 * <td>x11-displayt</td><td>X11 display MindTerm tries to connect to</td>
 * </tr>
 * <tr>
 * <td>queued-rx-chan</td><td>Enable queuing on the receive channel</td>
 * </tr>
 * <tr>
 * <td>default-pkt-sz</td><td>Default packet size</td>
 * </tr>
 * <tr>
 * <td>pkt-pool-sz</td><td>Size of PDU pool</td>
 * </tr>
 * <tr>
 * <td>term-min-lat</td><td>Use no-latency mode when writing to terminal</td>
 * </tr>
 * <tr>
 * <td>int-in-buf-sz</td><td>Size of internal IO buffers</td>
 * </tr>
 * <tr>
 * <td>queue-depth</td><td>Default depth of queues</td>
 * </tr>
 * <tr>
 * <td>queue-hiwater</td><td>Highwater mark for queues</td>
 * </tr>
 * <tr>
 * <td>log-level</td><td>Debug level 0-7</td>
 * </tr>
 * <tr>
 * <td>log-file</td><td>File to write debug messages to</td>
 * </tr>
 * <tr>
 * <td>log-append</td><td>If "false" then the log-file is truncated</td>
 * </tr>
 * </table>
 * <p>
 * The available algorithms are the following
 * (provided their classes are included):
 * <table border="1">
 * <tr>
 * <th>Type</th><th>Algorithms</th>
 * </tr>
 * <tr>
 * <td>Key exchange</td>
 * <td>diffie-hellman-group1-sha1,diffie-hellman-group-exchange-sha1</td>
 * </tr>
 * <tr>
 * <td>Host key</td>
 * <td>ssh-dss,ssh-rsa</td>
 * </tr>
 * <tr>
 * <td>Ciphers</td>
 * <td>
 *   3des-cbc,
 *   3des-ecb,
 *   3des-cfb,
 *   3des-ofb,
 *   3des-ctr,
 *   blowfish-cbc,
 *   blowfish-ecb,
 *   blowfish-cfb,
 *   blowfish-ofb,
 *   blowfish-ctr,
 *   aes128-cbc,
 *   aes192-cbc,
 *   aes256-cbc,
 *   aes128-ctr,
 *   aes192-ctr,
 *   aes256-ctr,
 *   twofish128-cbc,
 *   twofish128-ctr,
 *   twofish192-cbc,
 *   twofish256-cbc,
 *   cast128-cbc,
 *   cast128-ecb,
 *   cast128-cfb,
 *   cast128-ofb,
 *   idea-cbc,
 *   idea-ecb,
 *   idea-cfb,
 *   idea-ofb,
 *   arcfour
 * </td>
 * </tr>
 * <td>Macs</td>
 * <td>hmac-sha1,hmac-md5,hmac-ripemd160,hmac-sha1-96,hmac-md5-96,hmac-ripemd160-96</td>
 * </tr>
 * </table>
 *
 * @see SSH2Transport
 * @see SSH2Connection
 */
public class SSH2Preferences {

    public static final String PKG_VERSION    = "package-version";

    /**
     * Transport layer preferences
     */
    public static final String KEX_ALGORITHMS   = "kex-algorithms";
    public static final String HOST_KEY_ALG     = "server-host-key-algorithms";
    public static final String CIPHERS_C2S      = "enc-algorithms-cli2srv";
    public static final String CIPHERS_S2C      = "enc-algorithms-srv2cli";
    public static final String MACS_C2S         = "mac-algorithms-cli2srv";
    public static final String MACS_S2C         = "mac-algorithms-srv2cli";
    public static final String COMP_C2S         = "comp-algorithms-cli2srv";
    public static final String COMP_S2C         = "comp-algorithms-srv2cli";
    public static final String LANG_C2S         = "languages-cli2srv";
    public static final String LANG_S2C         = "languages-srv2cli";
    public static final String COMP_LEVEL       = "compression";
    public static final String ALIVE            = "alive";

    /**
     * Connection layer preferences
     */
    public static final String RX_INIT_WIN_SZ = "rx-init-win-sz";
    public static final String RX_MAX_PKT_SZ  = "rx-max-pkt-sz";
    public static final String TX_MAX_PKT_SZ  = "tx-max-pkt-sz";
    public static final String X11_DISPLAY    = "x11-display";
    public static final String QUEUED_RX_CHAN = "queued-rx-chan";

    /**
     * Misc internal preferences
     */
    public static final String DEFAULT_PKT_SZ = "default-pkt-sz";
    public static final String PKT_POOL_SZ    = "pkt-pool-sz";
    public static final String TERM_MIN_LAT   = "term-min-lat";
    public static final String INT_IO_BUF_SZ  = "int-io-buf-sz";
    public static final String QUEUE_DEPTH    = "queue-depth";
    public static final String QUEUE_HIWATER  = "queue-hiwater";
    public static final String LOG_LEVEL      = "log-level";
    public static final String LOG_FILE       = "log-file";
    public static final String LOG_APPEND     = "log-append";

    /**
     * Socket option preferences
     * Examples:
     *
     * Enable TCP_NODELAY for the socket connected to the server:
     *     socketoption.transport.tcp-nodelay = true
     *
     * Enable TCP_NODELAY for all sockets to local forward '127.0.0.1:4711':
     *     socketoption.local.127.0.0.1.4711.tcp-nodelay = true
     */
    public static final String SOCK_OPT           = "socketoption.";
    public static final String SOCK_OPT_TRANSPORT = "transport";
    public static final String SOCK_OPT_LOCAL     = "local.";
    public static final String SOCK_OPT_REMOTE    = "remote.";
    public static final String SO_TCP_NODELAY     = "tcp-nodelay";

    final static String[] kexFields = {
	KEX_ALGORITHMS,
	HOST_KEY_ALG,
	CIPHERS_C2S,
	CIPHERS_S2C,
	MACS_C2S,
	MACS_S2C,
	COMP_C2S,
	COMP_S2C,
	LANG_C2S,
	LANG_S2C
    };

    final static String[][] ciphers = {
	{ "3des-cbc",        "3DES/CBC" },
	{ "3des-ecb",        "3DES/ECB" },
	{ "3des-cfb",        "3DES/CFB" },
	{ "3des-ofb",        "3DES/OFB" },
	{ "3des-ctr",        "3DES/CTR" },
	{ "blowfish-cbc",    "Blowfish/CBC" },
	{ "blowfish-ecb",    "Blowfish/ECB" },
	{ "blowfish-cfb",    "Blowfish/CFB" },
	{ "blowfish-ofb",    "Blowfish/OFB" },
	{ "blowfish-ctr",    "Blowfish/CTR" },
	{ "aes128-cbc",      "AES/CBC" },
	{ "aes192-cbc",      "AES/CBC" },
	{ "aes256-cbc",      "AES/CBC" },
	{ "aes128-ctr",      "AES/CTR" },
	{ "aes192-ctr",      "AES/CTR" },
	{ "aes256-ctr",      "AES/CTR" },
	{ "rijndael128-cbc", "Rijndael/CBC" },
	{ "rijndael192-cbc", "Rijndael/CBC" },
	{ "rijndael256-cbc", "Rijndael/CBC" },
	{ "twofish128-cbc",  "Twofish/CBC" },
	{ "twofish128-ctr",  "Twofish/CTR" },
	{ "twofish192-cbc",  "Twofish/CBC" },
	{ "twofish256-cbc",  "Twofish/CBC" },
	{ "twofish-cbc",     "Twofish/CBC" },
	{ "twofish-ecb",     "Twofish/ECB" },
	{ "twofish-cfb",     "Twofish/CFB" },
	{ "twofish-ofb",     "Twofish/OFB" },
	{ "cast128-cbc",     "CAST128/CBC" },
	{ "cast128-ecb",     "CAST128/ECB" },
	{ "cast128-cfb",     "CAST128/CFB" },
	{ "cast128-ofb",     "CAST128/OFB" },
	{ "idea-cbc",        "IDEA/CBC" },
	{ "idea-ecb",        "IDEA/ECB" },
	{ "idea-cfb",        "IDEA/CFB" },
	{ "idea-ofb",        "IDEA/OFB" },
	{ "arcfour",         "RC4/OFB" }
    };

    final static String[][] macs = {
	{ "hmac-sha1", "HmacSHA1" },
	{ "hmac-md5", "HmacMD5" },
	{ "hmac-ripemd160", "HmacRIPEMD160" },
	{ "hmac-sha1-96", "HmacSHA1-96" },
	{ "hmac-md5-96", "HmacMD5-96" },
	{ "hmac-ripemd160-96", "HmacRIPEMD160-96" },
	{ "hmac-ripemd160@openssh.com", "HmacRIPEMD160" }
    };

    private final static Properties defaultProperties = new Properties();

    static {
	String stdCiphers =
	    "aes128-ctr,aes128-cbc,blowfish-ctr,blowfish-cbc,aes256-ctr,aes256-cbc,3des-cre,3des-cbc,arcfour";
	defaultProperties.put(KEX_ALGORITHMS, "diffie-hellman-group1-sha1");
	defaultProperties.put(HOST_KEY_ALG, "ssh-dss,ssh-rsa");
	defaultProperties.put(CIPHERS_C2S, stdCiphers);
	defaultProperties.put(CIPHERS_S2C, stdCiphers);
	defaultProperties.put(MACS_C2S, "hmac-md5,hmac-sha1");
	defaultProperties.put(MACS_S2C, "hmac-md5,hmac-sha1");
	defaultProperties.put(COMP_C2S, "none");
	defaultProperties.put(COMP_S2C, "none");
	defaultProperties.put(LANG_C2S, "");
	defaultProperties.put(LANG_S2C, "");

	defaultProperties.put(RX_INIT_WIN_SZ, "32768");
	defaultProperties.put(RX_MAX_PKT_SZ,  "8192");
	defaultProperties.put(TX_MAX_PKT_SZ,  "8192");
	defaultProperties.put(X11_DISPLAY, "127.0.0.1:0");
	defaultProperties.put(QUEUED_RX_CHAN, "true");
	defaultProperties.put(DEFAULT_PKT_SZ, "8192");
	defaultProperties.put(PKT_POOL_SZ, "64");
	defaultProperties.put(TERM_MIN_LAT, "false");
	defaultProperties.put(INT_IO_BUF_SZ, "65536");
	defaultProperties.put(QUEUE_DEPTH, "64");
	defaultProperties.put(QUEUE_HIWATER, "32");
	defaultProperties.put(LOG_LEVEL, "3");
	defaultProperties.put(ALIVE, "0");
    };

    private Properties preferences;
    private Hashtable  kexAgreedAlgs;

    private boolean sameKEXGuess;
    private boolean haveAgreed;
    private String  disagreeType;

    public SSH2Preferences() {
	this.preferences   = new Properties(defaultProperties);
	this.kexAgreedAlgs = new Hashtable();
    }

    public SSH2Preferences(Properties props) {
	this();
	Enumeration names = props.propertyNames();
	while(names.hasMoreElements()) {
	    String name  = (String)names.nextElement();
	    String value = props.getProperty(name);
	    preferences.put(name, value);
	}
    }

    public static Properties getDefaultProperties() {
	return defaultProperties;
    }

    public void readFrom(SSH2TransportPDU pdu) {
	for(int i = 0; i < 10; i++) {
	    setPreference(kexFields[i], pdu.readJavaString());
	}
    }

    public void writeTo(SSH2TransportPDU pdu) {
	for(int i = 0; i < 10; i++) {
	    pdu.writeString(getPreference(kexFields[i]));
	}
    }

    public String getPreference(String type) {
	return preferences.getProperty(type);
    }

    public int getIntPreference(String type) {
	try {
	    return Integer.parseInt(getPreference(type));
	} catch (NumberFormatException e) {
	    throw new NumberFormatException("Illegal value of '" + type +
					    "' expected integer but got '" +
					    getPreference(type) + "'");
	}
    }

    public void setPreference(String type, String value) {
	preferences.put(type, value);
    }

    public String getAgreedKEXAlgorithm() {
	return (String)kexAgreedAlgs.get(KEX_ALGORITHMS);
    }

    public String getAgreedHostKeyAlgorithm() {
	return (String)kexAgreedAlgs.get(HOST_KEY_ALG);
    }

    public String getAgreedCipher(boolean transmitter, boolean weAreAServer) {
	String type = ((transmitter ^ weAreAServer) ? CIPHERS_C2S : CIPHERS_S2C);
	return (String)kexAgreedAlgs.get(type);
    }

    public String getAgreedMac(boolean transmitter, boolean weAreAServer) {
	String type = ((transmitter ^ weAreAServer) ? MACS_C2S : MACS_S2C);
	return (String)kexAgreedAlgs.get(type);
    }

    public String getAgreedCompression(boolean transmitter,
				       boolean weAreAServer)
    {
	String type = ((transmitter ^ weAreAServer) ? COMP_C2S : COMP_S2C);
	return (String)kexAgreedAlgs.get(type);
    }

    public boolean isSupported(String type, String item) {
	String list = getPreference(type);
	return SSH2ListUtil.isInList(list, item);
    }

    public SSH2KeyExchanger
	selectKEXAlgorithm(SSH2Preferences peerPrefs, boolean weAreAServer)
	throws SSH2KEXFailedException
    {
	SSH2KeyExchanger kexImpl = null;
	String           cliKEXList, srvKEXList, cliHKAList, srvHKAList;

	if(weAreAServer) {
	    cliKEXList = peerPrefs.getPreference(KEX_ALGORITHMS);
	    srvKEXList = getPreference(KEX_ALGORITHMS);
	    cliHKAList = peerPrefs.getPreference(HOST_KEY_ALG);
	    srvHKAList = getPreference(HOST_KEY_ALG);
	} else {
	    cliKEXList = getPreference(KEX_ALGORITHMS);
	    srvKEXList = peerPrefs.getPreference(KEX_ALGORITHMS);
	    cliHKAList = getPreference(HOST_KEY_ALG);
	    srvHKAList = peerPrefs.getPreference(HOST_KEY_ALG);
	}

	String kexAlgorithm     = SSH2ListUtil.getFirstInList(cliKEXList);
	String hostKeyAlgorithm = null;

	while(kexAlgorithm != null) {
	    kexImpl          = SSH2KeyExchanger.getInstance(kexAlgorithm);
	    hostKeyAlgorithm = chooseHostKeyAlgorithm(cliHKAList, srvHKAList,
					      kexImpl.getHostKeyAlgorithms());
	    if(hostKeyAlgorithm != null) {
		break;
	    }
	    cliKEXList = SSH2ListUtil.removeFirstFromList(cliKEXList,
							  kexAlgorithm);
	    kexAlgorithm = SSH2ListUtil.getFirstInList(cliKEXList);
	}

	if(kexAlgorithm == null) {
	    String msg = "Couldn't agree on kex algorithm (our: '" +
		getPreference(KEX_ALGORITHMS) + "', peer: '" +
		peerPrefs.getPreference(KEX_ALGORITHMS) + "')";
	    throw new SSH2KEXFailedException(msg);
	}

	sameKEXGuess =
	    kexAlgorithm.equals(SSH2ListUtil.getFirstInList(srvKEXList)) &&
	    hostKeyAlgorithm.equals(SSH2ListUtil.getFirstInList(srvHKAList));

	kexAgreedAlgs.put(KEX_ALGORITHMS, kexAlgorithm);
	kexAgreedAlgs.put(HOST_KEY_ALG, hostKeyAlgorithm);

	return kexImpl;
    }

    public boolean sameKEXGuess() {
	return sameKEXGuess;
    }

    public boolean canAgree(SSH2Preferences peerPrefs, boolean weAreAServer) {
	haveAgreed = true;
	/*
	 * !!! TODO: we currently ignore language preferences here
	 */
	for(int i = 2; i < 8; i++) {
	    String type = kexFields[i];
	    String alg = choosePref(type, peerPrefs, weAreAServer);
	    if(alg == null) {
		haveAgreed   = false;
		sameKEXGuess = false;
		disagreeType = type;
		break;
	    }
	    kexAgreedAlgs.put(type, alg);
	}
	return haveAgreed;
    }

    public String getDisagreeType() {
	return disagreeType;
    }

    private String chooseHostKeyAlgorithm(String cliHKAList, String srvHKAList,
					 String kexHKAList) {
	String alg = SSH2ListUtil.chooseFromList(cliHKAList, kexHKAList);
	while(alg != null && !SSH2ListUtil.isInList(srvHKAList, alg)) {
	    cliHKAList = SSH2ListUtil.removeFirstFromList(cliHKAList, alg);
	    alg        = SSH2ListUtil.chooseFromList(cliHKAList, kexHKAList);
	}
	return alg;
    }

    private String choosePref(String type, SSH2Preferences peerPrefs,
			      boolean weAreAServer)
    {
	String clientList, serverList;
	if(weAreAServer) {
	    clientList = peerPrefs.getPreference(type);
	    serverList = getPreference(type);
	} else {
	    clientList = getPreference(type);
	    serverList = peerPrefs.getPreference(type);
	}
	return SSH2ListUtil.chooseFromList(clientList, serverList);
    }

    public static String ssh2ToJCECipher(String prefCipher) {
	for(int i = 0; i < ciphers.length; i++) {
	    if(ciphers[i][0].equals(prefCipher))
		return ciphers[i][1];
	}
	return null;
    }

    public static String ssh2ToJCEMac(String prefMac) {
	for(int i = 0; i < macs.length; i++) {
	    if(macs[i][0].startsWith(prefMac))
		return macs[i][1];
	}
	return null;
    }

    public static int getCipherKeyLen(String cipherName) {
	int len = 128;
	if(cipherName != null) {
	    cipherName = cipherName.toLowerCase();
	    if(cipherName.indexOf("128") != -1) {
		len = 128;
	    } else if(cipherName.indexOf("192") != -1) {
		len = 192;
	    } else if(cipherName.indexOf("256") != -1) {
		len = 256;
	    } else if(cipherName.startsWith("twofish") ||
		      cipherName.startsWith("rijndael") ||
		      cipherName.startsWith("aes")) {
		len = 256;
	    } else if(cipherName.startsWith("3des")) {
		len = 192;
	    }
	}
	return len / 8;
    }

    public static int getMacKeyLen(String macName) {
	int len = 16;
	if(macName != null && ((macName.indexOf("SHA") != -1) ||
			       (macName.indexOf("sha") != -1) ||
			       (macName.indexOf("ripemd160") != -1))) {
	    len = 20;
	}
	return len;
    }

}
