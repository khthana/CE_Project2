/**
 * GetMapServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package gisoncampusservices.generated;

public class GetMapServicesServiceLocator extends org.apache.axis.client.Service implements gisoncampusservices.generated.GetMapServicesService {

    public GetMapServicesServiceLocator() {
    }


    public GetMapServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public GetMapServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for GetMapServices
    private java.lang.String GetMapServices_address = "http://localhost:8080/GISonCampusServices/services/GetMapServices";

    public java.lang.String getGetMapServicesAddress() {
        return GetMapServices_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String GetMapServicesWSDDServiceName = "GetMapServices";

    public java.lang.String getGetMapServicesWSDDServiceName() {
        return GetMapServicesWSDDServiceName;
    }

    public void setGetMapServicesWSDDServiceName(java.lang.String name) {
        GetMapServicesWSDDServiceName = name;
    }

    public gisoncampusservices.generated.GetMapServices getGetMapServices() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(GetMapServices_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGetMapServices(endpoint);
    }

    public gisoncampusservices.generated.GetMapServices getGetMapServices(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            gisoncampusservices.generated.GetMapServicesSoapBindingStub _stub = new gisoncampusservices.generated.GetMapServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getGetMapServicesWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGetMapServicesEndpointAddress(java.lang.String address) {
        GetMapServices_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (gisoncampusservices.generated.GetMapServices.class.isAssignableFrom(serviceEndpointInterface)) {
                gisoncampusservices.generated.GetMapServicesSoapBindingStub _stub = new gisoncampusservices.generated.GetMapServicesSoapBindingStub(new java.net.URL(GetMapServices_address), this);
                _stub.setPortName(getGetMapServicesWSDDServiceName());
                return _stub;
            }
        }
        catch (java.lang.Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        java.lang.String inputPortName = portName.getLocalPart();
        if ("GetMapServices".equals(inputPortName)) {
            return getGetMapServices();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://gisoncampusservices", "GetMapServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://gisoncampusservices", "GetMapServices"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("GetMapServices".equals(portName)) {
            setGetMapServicesEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
