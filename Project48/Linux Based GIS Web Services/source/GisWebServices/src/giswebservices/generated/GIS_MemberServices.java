/**
 * GIS_MemberServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface GIS_MemberServices extends java.rmi.Remote {
    public int insertMember(java.lang.String name, java.lang.String address, java.lang.String phone, java.lang.String email, java.lang.String username, java.lang.String password, int ownID) throws java.rmi.RemoteException;
    public java.lang.String listMember(int ownID) throws java.rmi.RemoteException;
    public java.lang.String listNewMember(int ownID) throws java.rmi.RemoteException;
    public java.lang.String detailMember(int memberID) throws java.rmi.RemoteException;
    public java.lang.String detailAllMember(int ownerID) throws java.rmi.RemoteException;
    public int deleteMember(java.lang.String sessionkey, int memID) throws java.rmi.RemoteException;
    public int updateMember(java.lang.String sessionkey, java.lang.String name, java.lang.String address, java.lang.String phone, java.lang.String email) throws java.rmi.RemoteException;
    public int activateMember(java.lang.String sessionkey, int memID, boolean isActive) throws java.rmi.RemoteException;
    public int permitMember(java.lang.String sessionkey, int memID, boolean isWritable) throws java.rmi.RemoteException;
    public int renewPassword(java.lang.String sessionkey, java.lang.String oldPassword, java.lang.String newPassword) throws java.rmi.RemoteException;
}
