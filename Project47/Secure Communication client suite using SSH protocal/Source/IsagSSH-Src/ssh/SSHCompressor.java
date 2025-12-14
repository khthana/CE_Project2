
package ssh;

public abstract class SSHCompressor {

    public final static int COMPRESS_MODE   = 1;
    public final static int UNCOMPRESS_MODE = 2;

    // !!! TODO
    public static SSHCompressor getInstance(String algorithm,
					    int mode, int level)
	throws SSHCompressionException
    {
	if("zlib".equals(algorithm)) {
	    try {
		Class compCl =
		    Class.forName("ssh.SSHCompressorZLib");
		SSHCompressor comp = (SSHCompressor)compCl.newInstance();
		comp.init(mode, level);
		return comp;
	    } catch (Exception e) {
		throw new SSHCompressionException(e.getMessage());
	    }
	}
	return null;
    }

    public abstract void init(int mode, int level);
    public abstract void compress(SSHPduOutputStream pdu)
	throws SSHCompressionException;
    public abstract void uncompress(SSHPduInputStream pdu)
	throws SSHCompressionException;
    public abstract long numOfCompressedBytes();
    public abstract long numOfUncompressedBytes();

}
