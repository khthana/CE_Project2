/**
 * GIS_MemberServicesServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public class GIS_MemberServicesServiceLocator extends org.apache.axis.client.Service implements giswebservices.generated.GIS_MemberServicesService {

    public GIS_MemberServicesServiceLocator() {
    }


    public GIS_MemberServicesServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public GIS_MemberServicesServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for GIS_MemberServices
    private java.lang.String GIS_MemberServices_address = "http://localhost:8080/GisServer/services/GIS_MemberServices";

    public java.lang.String getGIS_MemberServicesAddress() {
        return GIS_MemberServices_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String GIS_MemberServicesWSDDServiceName = "GIS_MemberServices";

    public java.lang.String getGIS_MemberServicesWSDDServiceName() {
        return GIS_MemberServicesWSDDServiceName;
    }

    public void setGIS_MemberServicesWSDDServiceName(java.lang.String name) {
        GIS_MemberServicesWSDDServiceName = name;
    }

    public giswebservices.generated.GIS_MemberServices getGIS_MemberServices() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(GIS_MemberServices_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getGIS_MemberServices(endpoint);
    }

    public giswebservices.generated.GIS_MemberServices getGIS_MemberServices(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            giswebservices.generated.GIS_MemberServicesSoapBindingStub _stub = new giswebservices.generated.GIS_MemberServicesSoapBindingStub(portAddress, this);
            _stub.setPortName(getGIS_MemberServicesWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setGIS_MemberServicesEndpointAddress(java.lang.String address) {
        GIS_MemberServices_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (giswebservices.generated.GIS_MemberServices.class.isAssignableFrom(serviceEndpointInterface)) {
                giswebservices.generated.GIS_MemberServicesSoapBindingStub _stub = new giswebservices.generated.GIS_MemberServicesSoapBindingStub(new java.net.URL(GIS_MemberServices_address), this);
                _stub.setPortName(getGIS_MemberServicesWSDDServiceName());
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
        if ("GIS_MemberServices".equals(inputPortName)) {
            return getGIS_MemberServices();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://giswebservices", "GIS_MemberServicesService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://giswebservices", "GIS_MemberServices"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(java.lang.String portName, java.lang.String address) throws javax.xml.rpc.ServiceException {
        
if ("GIS_MemberServices".equals(portName)) {
            setGIS_MemberServicesEndpointAddress(address);
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
