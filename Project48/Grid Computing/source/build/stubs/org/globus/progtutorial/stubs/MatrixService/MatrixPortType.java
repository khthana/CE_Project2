/**
 * MatrixPortType.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.globus.progtutorial.stubs.MatrixService;

public interface MatrixPortType extends org.gridforum.ogsi.GridService {
    public int getValue() throws java.rmi.RemoteException, org.gridforum.ogsi.FaultType;
    public org.gridforum.ogsi.ExtensibilityType setServiceData(org.gridforum.ogsi.ExtensibilityType updateExpression) throws java.rmi.RemoteException, org.gridforum.ogsi.ModifiabilityViolationFaultType, org.gridforum.ogsi.PartialFailureFaultType, org.gridforum.ogsi.TypeViolationFaultType, org.gridforum.ogsi.MutabilityViolationFaultType, org.gridforum.ogsi.CardinalityViolationFaultType, org.gridforum.ogsi.ExtensibilityTypeFaultType, org.gridforum.ogsi.IncorrectValueFaultType, org.gridforum.ogsi.ExtensibilityNotSupportedFaultType, org.gridforum.ogsi.FaultType;
    public void destroy() throws java.rmi.RemoteException, org.gridforum.ogsi.ServiceNotDestroyedFaultType, org.gridforum.ogsi.FaultType;
    public void multiplyMatrix(int[] value1, int[] value2, int value3) throws java.rmi.RemoteException, org.gridforum.ogsi.FaultType;
    public org.gridforum.ogsi.TerminationTimeType requestTerminationAfter(org.gridforum.ogsi.ExtendedDateTimeType terminationTime) throws java.rmi.RemoteException, org.gridforum.ogsi.TerminationTimeUnchangedFaultType, org.gridforum.ogsi.FaultType;
    public org.gridforum.ogsi.TerminationTimeType requestTerminationBefore(org.gridforum.ogsi.ExtendedDateTimeType terminationTime) throws java.rmi.RemoteException, org.gridforum.ogsi.TerminationTimeUnchangedFaultType, org.gridforum.ogsi.FaultType;
    public org.gridforum.ogsi.ExtensibilityType findServiceData(org.gridforum.ogsi.ExtensibilityType queryExpression) throws java.rmi.RemoteException, org.gridforum.ogsi.TargetInvalidFaultType, org.gridforum.ogsi.ExtensibilityTypeFaultType, org.gridforum.ogsi.ExtensibilityNotSupportedFaultType, org.gridforum.ogsi.FaultType;
}
