/**
 * GIS_InformationServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface GIS_InformationServices extends java.rmi.Remote {
    public java.lang.String detailInformation(java.lang.String sessionkey, int layerID) throws java.rmi.RemoteException;
    public java.lang.String detailGeomInformation(java.lang.String sessionkey, int layerID) throws java.rmi.RemoteException;
    public java.lang.String detailColumn(java.lang.String sessionkey, int layerID) throws java.rmi.RemoteException;
    public int insertInformation(java.lang.String sessionkey, java.lang.String xmlInsert) throws java.rmi.RemoteException;
    public int updateInformation(java.lang.String sessionkey, java.lang.String xmlInsert) throws java.rmi.RemoteException;
    public int deleteInformation(java.lang.String sessionkey, int layerID, int rowID) throws java.rmi.RemoteException;
    public int insertPin(java.lang.String sessionkey, java.lang.String xmlpin) throws java.rmi.RemoteException;
    public java.lang.String getPin(java.lang.String sessionkey) throws java.rmi.RemoteException;
}
