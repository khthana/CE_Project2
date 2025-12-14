/**
 * MatrixServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.globus.progtutorial.stubs.MatrixService.service;

public class MatrixServiceLocator extends org.apache.axis.client.Service implements org.globus.progtutorial.stubs.MatrixService.service.MatrixService {

    // Use to get a proxy class for MatrixServicePort
    private final java.lang.String MatrixServicePort_address = "http://localhost:8080/ogsa/services/";

    public java.lang.String getMatrixServicePortAddress() {
        return MatrixServicePort_address;
    }

    // The WSDD service name defaults to the port name.
    private java.lang.String MatrixServicePortWSDDServiceName = "MatrixServicePort";

    public java.lang.String getMatrixServicePortWSDDServiceName() {
        return MatrixServicePortWSDDServiceName;
    }

    public void setMatrixServicePortWSDDServiceName(java.lang.String name) {
        MatrixServicePortWSDDServiceName = name;
    }

    public org.globus.progtutorial.stubs.MatrixService.MatrixPortType getMatrixServicePort() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(MatrixServicePort_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getMatrixServicePort(endpoint);
    }

    public org.globus.progtutorial.stubs.MatrixService.MatrixPortType getMatrixServicePort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub _stub = new org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub(portAddress, this);
            _stub.setPortName(getMatrixServicePortWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
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
            if (org.globus.progtutorial.stubs.MatrixService.MatrixPortType.class.isAssignableFrom(serviceEndpointInterface)) {
                org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub _stub = new org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub(new java.net.URL(MatrixServicePort_address), this);
                _stub.setPortName(getMatrixServicePortWSDDServiceName());
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
        String inputPortName = portName.getLocalPart();
        if ("MatrixServicePort".equals(inputPortName)) {
            return getMatrixServicePort();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService/service", "MatrixService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("MatrixServicePort"));
        }
        return ports.iterator();
    }

}
