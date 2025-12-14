/**
 * JiaServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public class JiaServiceLocator extends com.ibm.ws.webservices.engine.client.Service implements WS.JiaService {

    // Use to get a proxy class for jia
    private final java.lang.String jia_address = "http://localhost:9080/Jia/services/Jia";

    public java.lang.String getJiaAddress() {
        return jia_address;
    }

    // The WSDD port name defaults to the port name.
    private java.lang.String jiaWSDDPortName = "Jia";

    public java.lang.String getJiaWSDDPortName() {
        return jiaWSDDPortName;
    }

    public void setJiaWSDDPortName(java.lang.String name) {
        jiaWSDDPortName = name;
    }

    public WS.Jia getJia() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(jia_address);
        }
        catch (java.net.MalformedURLException e) {
            return null; // unlikely as URL was validated in WSDL2Java
        }
        return getJia(endpoint);
    }

    public WS.Jia getJia(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            WS.JiaSoapBindingStub _stub = new WS.JiaSoapBindingStub(portAddress, this);
            _stub.setPortName(getJiaWSDDPortName());
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
            if (WS.Jia.class.isAssignableFrom(serviceEndpointInterface)) {
                WS.JiaSoapBindingStub _stub = new WS.JiaSoapBindingStub(new java.net.URL(jia_address), this);
                _stub.setPortName(getJiaWSDDPortName());
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
        if ("Jia".equals(inputPortName)) {
            return getJia();
        }
        else  {
            throw new javax.xml.rpc.ServiceException();
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "JiaService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://WS","Jia"));
        }
        return ports.iterator();
    }

    public javax.xml.rpc.Call[] getCalls(javax.xml.namespace.QName portName) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            throw new javax.xml.rpc.ServiceException("WSWS3062E: Error: portName should not be null.");
        }
        if  (portName.getLocalPart().equals("Jia")) {
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
