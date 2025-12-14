/**
 * Gis_GetMapServices.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.2.1 Aug 08, 2005 (11:49:10 PDT) WSDL2Java emitter.
 */

package giswebservices.generated;

public interface Gis_GetMapServices extends java.rmi.Remote {
    public java.lang.String requestSVG(java.lang.String sessionKey, java.lang.String xmlMapRequst, double posX, double posY, double width, double height) throws java.rmi.RemoteException;
    public java.lang.String requestNearbySVG(java.lang.String sessionKey, java.lang.String xmlMapRequst, int layerID, double posX, double posY, double width, double height, double currentLadtitude, double currentLongitude, double radian, java.lang.String xFill, java.lang.String xStroke) throws java.rmi.RemoteException;
    public java.lang.String requestNearestSVG(java.lang.String sessionKey, java.lang.String xmlMapRequst, int layerID, double posX, double posY, double width, double height, double currentLadtitude, double currentLongitude, java.lang.String xFill, java.lang.String xStroke) throws java.rmi.RemoteException;
    public java.lang.String getSvgG(java.lang.String sessionKey, java.lang.String xmlMapRequst, double posX, double posY, double width, double height) throws java.rmi.RemoteException;
}
