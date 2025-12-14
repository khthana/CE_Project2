
package ssh2;

/**
 * An interfaces for classes which creates instances of classes which
 * implements <code>SSH2StreamFiler</code>.
 */
public interface SSH2StreamFilterFactory {
    /**
     * Instance constructor
     */
    public SSH2StreamFilter createFilter(SSH2Connection connection,
					 SSH2StreamChannel channel);

}
