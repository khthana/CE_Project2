/**
 * GIS_OwnerServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface GIS_OwnerServices extends java.rmi.Remote {
    public int insertOwner(java.lang.String name, java.lang.String address, java.lang.String phone, java.lang.String email, java.lang.String website, java.lang.String username, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String listOwner() throws java.rmi.RemoteException;
    public java.lang.String searchOwner(java.lang.String name, java.lang.String address, java.lang.String phone, java.lang.String email, java.lang.String website) throws java.rmi.RemoteException;
    public java.lang.String detailOwner(int ownerID) throws java.rmi.RemoteException;
    public int updateOwner(java.lang.String sessionkey, java.lang.String name, java.lang.String address, java.lang.String phone, java.lang.String email, java.lang.String website) throws java.rmi.RemoteException;
    public int deleteOwner(java.lang.String sessionkey, int ownID) throws java.rmi.RemoteException;
    public java.lang.String listNewOwner(java.lang.String sessionkey) throws java.rmi.RemoteException;
    public int activateOwner(java.lang.String sessionkey, int ownID, boolean isActive) throws java.rmi.RemoteException;
}
