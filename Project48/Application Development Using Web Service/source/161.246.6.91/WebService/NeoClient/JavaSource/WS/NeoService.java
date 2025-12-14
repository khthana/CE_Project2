/**
 * NeoService.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public interface NeoService extends javax.xml.rpc.Service {
    public java.lang.String getNeoAddress();

    public WS.Neo getNeo() throws javax.xml.rpc.ServiceException;

    public WS.Neo getNeo(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
