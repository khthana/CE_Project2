/**
 * Gis_GetMapServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class Gis_GetMapServicesServiceLocator extends org.apache.axis.client.Service implements giswebservices.generated.Gis_GetMapServicesService {

    public Gis_GetMapServicesServiceLocator() {
    }


    public Gis_GetMapServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public Gis_GetMapServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for Gis_GetMapServices
    private java.lang.String Gis_GetMapServices_address = "http://localhost:8080/GisServer/services/Gis_GetMapServices";

    public java.lang.String getGis_GetMapServicesAddress() {
        return Gis_GetMapServices_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String Gis_GetMapServicesWSDDServiceName = "Gis_GetMapServices";

    public java.lang.String getGis_GetMapServicesWSDDServiceName() {
        return Gis_GetMapServicesWSDDServiceName;
    }

    public void setGis_GetMapServicesWSDDServiceName(java.lang.String name) {
        Gis_GetMapServicesWSDDServiceName = name;
    }

    public giswebservices.generated.Gis_GetMapServices getGis_GetMapServices() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(Gis_GetMapServices_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGis_GetMapServices(endpoint);
    }

    public giswebservices.generated.Gis_GetMapServices getGis_GetMapServices(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            giswebservices.generated.Gis_GetMapServicesSoapBindingStub _stub = new giswebservices.generated.Gis_GetMapServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getGis_GetMapServicesWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGis_GetMapServicesEndpointAddress(java.lang.String address) {
        Gis_GetMapServices_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (giswebservices.generated.Gis_GetMapServices.class.isAssignableFrom(serviceEndpointInterface)) {
                giswebservices.generated.Gis_GetMapServicesSoapBindingStub _stub = new giswebservices.generated.Gis_GetMapServicesSoapBindingStub(new java.net.URL(Gis_GetMapServices_address), this);
                _stub.setPortName(getGis_GetMapServicesWSDDServiceName());
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
        if ("Gis_GetMapServices".equals(inputPortName)) {
            return getGis_GetMapServices();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://giswebservices", "Gis_GetMapServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://giswebservices", "Gis_GetMapServices"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("Gis_GetMapServices".equals(portName)) {
            setGis_GetMapServicesEndpointAddress(address);
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
