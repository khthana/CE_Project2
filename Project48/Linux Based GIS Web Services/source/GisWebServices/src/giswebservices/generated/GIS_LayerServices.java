/**
 * GIS_LayerServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface GIS_LayerServices extends java.rmi.Remote {
    public int insertLayer(java.lang.String sessionkey, java.lang.String name, boolean isPublic, java.lang.String geomType, java.lang.String xmlTable) throws java.rmi.RemoteException;
    public java.lang.String listLayer(java.lang.String sessionkey) throws java.rmi.RemoteException;
    public java.lang.String searchLayer(java.lang.String sessionkey, java.lang.String likeName, java.lang.String likeOwner) throws java.rmi.RemoteException;
    public int deleteLayer(java.lang.String sessionkey, int layerID) throws java.rmi.RemoteException;
    public int updateLayer(java.lang.String sessionkey, int layerID, java.lang.String layerName) throws java.rmi.RemoteException;
    public int publicLayer(java.lang.String sessionkey, int layerID, boolean isPublic) throws java.rmi.RemoteException;
    public java.lang.String listMyLayer(java.lang.String sessionkey) throws java.rmi.RemoteException;
}
