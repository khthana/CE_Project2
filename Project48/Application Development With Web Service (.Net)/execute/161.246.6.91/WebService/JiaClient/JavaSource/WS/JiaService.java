/**
 * JiaService.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public interface JiaService extends javax.xml.rpc.Service {
    public java.lang.String getJiaAddress();

    public WS.Jia getJia() throws javax.xml.rpc.ServiceException;

    public WS.Jia getJia(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
