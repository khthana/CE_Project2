/**
 * GIS_UserServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface GIS_UserServices extends java.rmi.Remote {
    public java.lang.String login(java.lang.String username, java.lang.String password) throws java.rmi.RemoteException;
    public java.lang.String logout(java.lang.String sessionkey) throws java.rmi.RemoteException;
    public java.lang.String detailUser(java.lang.String sessionkey) throws java.rmi.RemoteException;
}
