/**
 * NeoServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public class NeoServiceLocator extends com.ibm.ws.webservices.engine.client.Service implements WS.NeoService {

    // Use to get a proxy class for neo
    private final java.lang.String neo_address = "http://localhost:9080/Neo/services/Neo";

    public java.lang.String getNeoAddress() {
        return neo_address;
    }

    // The WSDD port name defaults to the port name.
    private java.lang.String neoWSDDPortName = "Neo";

    public java.lang.String getNeoWSDDPortName() {
        return neoWSDDPortName;
    }

    public void setNeoWSDDPortName(java.lang.String name) {
        neoWSDDPortName = name;
    }

    public WS.Neo getNeo() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(neo_address);
        }
        catch (java.net.MalformedURLException e) {
            return null; // unlikely as URL was validated in WSDL2Java
        }
        return getNeo(endpoint);
    }

    public WS.Neo getNeo(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            WS.NeoSoapBindingStub _stub = new WS.NeoSoapBindingStub(portAddress, this);
            _stub.setPortName(getNeoWSDDPortName());
            return _stub;
        }
        catch (com.ibm.ws.webservices.engine.WebServicesFault e) {
            return null;
        }
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (WS.Neo.class.isAssignableFrom(serviceEndpointInterface)) {
                WS.NeoSoapBindingStub _stub = new WS.NeoSoapBindingStub(new java.net.URL(neo_address), this);
                _stub.setPortName(getNeoWSDDPortName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("WSWS3273E: Error: There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        String inputPortName = portName.getLocalPart();
        if ("Neo".equals(inputPortName)) {
            return getNeo();
        }
        else  {
            throw new javax.xml.rpc.ServiceException();
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "NeoService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://WS","Neo"));
        }
        return ports.iterator();
    }

    public javax.xml.rpc.Call[] getCalls(javax.xml.namespace.QName portName) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
        if  (portName.getLocalPart().equals("Neo")) {
            return new javax.xml.rpc.Call[] {
                createCall(portName, "getCourseAll"),
                createCall(portName, "buyClass"),
                createCall(portName, "reservation"),
                createCall(portName, "getCourse"),
                createCall(portName, "getCourseFromEmail"),
                createCall(portName, "cancel"),
            };
        }
        else {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
    }
}
