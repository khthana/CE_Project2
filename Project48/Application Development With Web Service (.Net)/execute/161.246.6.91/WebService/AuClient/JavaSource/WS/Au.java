/**
 * Au.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public interface Au extends java.rmi.Remote {
    public java.lang.String getCourseAll() throws java.rmi.RemoteException;
    public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException;
    public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException;
    public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException;
    public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException;
    public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException;
}
