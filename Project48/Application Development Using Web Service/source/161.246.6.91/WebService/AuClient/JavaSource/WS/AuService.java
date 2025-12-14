/**
 * AuService.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public interface AuService extends javax.xml.rpc.Service {
    public java.lang.String getAuAddress();

    public WS.Au getAu() throws javax.xml.rpc.ServiceException;

    public WS.Au getAu(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
