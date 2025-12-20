/**
 * InformationServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package gisoncampusservices.generated;

public class InformationServicesServiceLocator extends org.apache.axis.client.Service implements gisoncampusservices.generated.InformationServicesService {

    public InformationServicesServiceLocator() {
    }


    public InformationServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public InformationServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for InformationServices
    private java.lang.String InformationServices_address = "http://localhost:8080/GISonCampusServices/services/InformationServices";

    public java.lang.String getInformationServicesAddress() {
        return InformationServices_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String InformationServicesWSDDServiceName = "InformationServices";

    public java.lang.String getInformationServicesWSDDServiceName() {
        return InformationServicesWSDDServiceName;
    }

    public void setInformationServicesWSDDServiceName(java.lang.String name) {
        InformationServicesWSDDServiceName = name;
    }

    public gisoncampusservices.generated.InformationServices getInformationServices() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(InformationServices_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getInformationServices(endpoint);
    }

    public gisoncampusservices.generated.InformationServices getInformationServices(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            gisoncampusservices.generated.InformationServicesSoapBindingStub _stub = new gisoncampusservices.generated.InformationServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getInformationServicesWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setInformationServicesEndpointAddress(java.lang.String address) {
        InformationServices_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (gisoncampusservices.generated.InformationServices.class.isAssignableFrom(serviceEndpointInterface)) {
                gisoncampusservices.generated.InformationServicesSoapBindingStub _stub = new gisoncampusservices.generated.InformationServicesSoapBindingStub(new java.net.URL(InformationServices_address), this);
                _stub.setPortName(getInformationServicesWSDDServiceName());
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
        if ("InformationServices".equals(inputPortName)) {
            return getInformationServices();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://gisoncampusservices", "InformationServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://gisoncampusservices", "InformationServices"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("InformationServices".equals(portName)) {
            setInformationServicesEndpointAddress(address);
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
