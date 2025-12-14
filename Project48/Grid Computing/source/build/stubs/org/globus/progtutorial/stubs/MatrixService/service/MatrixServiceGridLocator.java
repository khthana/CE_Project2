/**
 * MatrixServiceGridLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.globus.progtutorial.stubs.MatrixService.service;

public class MatrixServiceGridLocator extends org.globus.ogsa.impl.core.service.ServiceLocator implements org.globus.ogsa.GridLocator {
    public org.globus.progtutorial.stubs.MatrixService.MatrixPortType getMatrixServicePort(org.gridforum.ogsi.HandleType handle) throws org.gridforum.ogsi.FaultType, org.globus.ogsa.GridServiceException {
        setStubClass(org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub.class);
        return (org.globus.progtutorial.stubs.MatrixService.MatrixPortType) getServicePort(handle);
    }
    public org.globus.progtutorial.stubs.MatrixService.MatrixPortType getMatrixServicePort(org.gridforum.ogsi.LocatorType locator) throws org.gridforum.ogsi.FaultType, org.globus.ogsa.GridServiceException {
        setStubClass(org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub.class);
        return (org.globus.progtutorial.stubs.MatrixService.MatrixPortType) getServicePort(locator);
    }
    public org.globus.progtutorial.stubs.MatrixService.MatrixPortType getMatrixServicePort(java.net.URL url) throws org.globus.ogsa.GridServiceException {
        setStubClass(org.globus.progtutorial.stubs.MatrixService.bindings.MatrixServiceSOAPBindingStub.class);
        return (org.globus.progtutorial.stubs.MatrixService.MatrixPortType) getServicePort(url);
    }

}
