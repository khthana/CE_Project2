package WS;

public class NeoProxy implements WS.Neo {
  private boolean _useJNDI = true;
  private String _endpoint = null;
  private WS.Neo neo = null;
  
  public NeoProxy() {
    _initNeoProxy();
  }
  
  private void _initNeoProxy() {
  
  if (_useJNDI) {
    try{
      javax.naming.InitialContext ctx = new javax.naming.InitialContext();
      neo = ((WS.NeoService)ctx.lookup("java:comp/env/service/NeoService")).getNeo();
      }
    catch (javax.naming.NamingException namingException) {}
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (neo == null) {
    try{
      neo = (new WS.NeoServiceLocator()).getNeo();
      }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  if (neo != null) {
    if (_endpoint != null)
      ((javax.xml.rpc.Stub)neo)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    else
      _endpoint = (String)((javax.xml.rpc.Stub)neo)._getProperty("javax.xml.rpc.service.endpoint.address");
  }
  
}


public void useJNDI(boolean useJNDI) {
  _useJNDI = useJNDI;
  neo = null;
  
}

public String getEndpoint() {
  return _endpoint;
}

public void setEndpoint(String endpoint) {
  _endpoint = endpoint;
  if (neo != null)
    ((javax.xml.rpc.Stub)neo)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
  
}

public WS.Neo getNeo() {
  if (neo == null)
    _initNeoProxy();
  return neo;
}

public java.lang.String getCourseAll() throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.getCourseAll();
}

public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.buyClass(classID, email, receiveID);
}

public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.reservation(classID, email, name, surname, phoneNo);
}

public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.getCourse(subject, period);
}

public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.getCourseFromEmail(email);
}

public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException{
  if (neo == null)
    _initNeoProxy();
  return neo.cancel(classID, email);
}


}