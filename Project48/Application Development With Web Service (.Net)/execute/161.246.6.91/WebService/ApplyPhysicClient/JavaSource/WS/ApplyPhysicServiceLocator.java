/**
 * ApplyPhysicServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public class ApplyPhysicServiceLocator extends com.ibm.ws.webservices.engine.client.Service implements WS.ApplyPhysicService {

    // Use to get a proxy class for applyPhysic
    private final java.lang.String applyPhysic_address = "http://localhost:9080/ApplyPhysic/services/ApplyPhysic";

    public java.lang.String getApplyPhysicAddress() {
        return applyPhysic_address;
    }

    // The WSDD port name defaults to the port name.
    private java.lang.String applyPhysicWSDDPortName = "ApplyPhysic";

    public java.lang.String getApplyPhysicWSDDPortName() {
        return applyPhysicWSDDPortName;
    }

    public void setApplyPhysicWSDDPortName(java.lang.String name) {
        applyPhysicWSDDPortName = name;
    }

    public WS.ApplyPhysic getApplyPhysic() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(applyPhysic_address);
        }
        catch (java.net.MalformedURLException e) {
            return null; // unlikely as URL was validated in WSDL2Java
        }
        return getApplyPhysic(endpoint);
    }

    public WS.ApplyPhysic getApplyPhysic(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            WS.ApplyPhysicSoapBindingStub _stub = new WS.ApplyPhysicSoapBindingStub(portAddress, this);
            _stub.setPortName(getApplyPhysicWSDDPortName());
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
            if (WS.ApplyPhysic.class.isAssignableFrom(serviceEndpointInterface)) {
                WS.ApplyPhysicSoapBindingStub _stub = new WS.ApplyPhysicSoapBindingStub(new java.net.URL(applyPhysic_address), this);
                _stub.setPortName(getApplyPhysicWSDDPortName());
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
        if ("ApplyPhysic".equals(inputPortName)) {
            return getApplyPhysic();
        }
        else  {
            throw new javax.xml.rpc.ServiceException();
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "ApplyPhysicService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://WS","ApplyPhysic"));
        }
        return ports.iterator();
    }

    public javax.xml.rpc.Call[] getCalls(javax.xml.namespace.QName portName) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
        if  (portName.getLocalPart().equals("ApplyPhysic")) {
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
