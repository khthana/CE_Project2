/**
 * AuSoapBindingStub.java
 *
 * This file was auto-generated from WSDL
 * by the IBM Web services WSDL2Java emitter.
 * cf50427.04 v71004111635
 */

package WS;

public class AuSoapBindingStub extends com.ibm.ws.webservices.engine.client.Stub implements WS.Au {
    public AuSoapBindingStub(java.net.URL endpointURL, javax.xml.rpc.Service service) throws com.ibm.ws.webservices.engine.WebServicesFault {
        if (service == null) {
            super.service = new com.ibm.ws.webservices.engine.client.Service();
        }
        else {
            super.service = service;
        }
        super.engine = ((com.ibm.ws.webservices.engine.client.Service) super.service).getEngine();
        initTypeMapping();
        super.cachedEndpoint = endpointURL;
        super.connection = ((com.ibm.ws.webservices.engine.client.Service) super.service).getConnection(endpointURL);
        super.messageContexts = new com.ibm.ws.webservices.engine.MessageContext[6];
    }

    private void initTypeMapping() {
        javax.xml.rpc.encoding.TypeMapping tm = super.getTypeMapping(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
        java.lang.Class javaType = null;
        javax.xml.namespace.QName xmlType = null;
        com.ibm.ws.webservices.engine.encoding.SerializerFactory sf = null;
        com.ibm.ws.webservices.engine.encoding.DeserializerFactory df = null;
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _getCourseAllOperation0 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getgetCourseAllOperation0() {
        if (_getCourseAllOperation0 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
            };
            _getCourseAllOperation0 = new com.ibm.ws.webservices.engine.description.OperationDesc("getCourseAll", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourseAllReturn"));
            _getCourseAllOperation0.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"));
            _getCourseAllOperation0.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourseAll"));
            _getCourseAllOperation0.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _getCourseAllOperation0;
    }

    private int _getCourseAllIndex0 = 0;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getgetCourseAllInvoke0(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_getCourseAllIndex0];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getgetCourseAllOperation0());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_getCourseAllIndex0] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public java.lang.String getCourseAll() throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getgetCourseAllInvoke0(new java.lang.Object[] {}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return (java.lang.String) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue();
        } catch (java.lang.Exception _exception) {
            return (java.lang.String) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), java.lang.String.class);
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _buyClassOperation1 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getbuyClassOperation1() {
        if (_buyClassOperation1 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "ClassID"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Email"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "ReceiveID"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
            };
            _buyClassOperation1 = new com.ibm.ws.webservices.engine.description.OperationDesc("buyClass", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "buyClassReturn"));
            _buyClassOperation1.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "boolean"));
            _buyClassOperation1.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "buyClass"));
            _buyClassOperation1.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _buyClassOperation1;
    }

    private int _buyClassIndex1 = 1;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getbuyClassInvoke1(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_buyClassIndex1];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getbuyClassOperation1());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_buyClassIndex1] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public boolean buyClass(int classID, java.lang.String email, java.lang.String receiveID) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getbuyClassInvoke1(new java.lang.Object[] {new java.lang.Integer(classID), email, receiveID}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return ((java.lang.Boolean) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue()).booleanValue();
        } catch (java.lang.Exception _exception) {
            return ((java.lang.Boolean) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), boolean.class)).booleanValue();
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _reservationOperation2 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getreservationOperation2() {
        if (_reservationOperation2 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "ClassID"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Email"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Name"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Surname"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "PhoneNo"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
            };
            _reservationOperation2 = new com.ibm.ws.webservices.engine.description.OperationDesc("reservation", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "reservationReturn"));
            _reservationOperation2.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "boolean"));
            _reservationOperation2.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "reservation"));
            _reservationOperation2.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _reservationOperation2;
    }

    private int _reservationIndex2 = 2;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getreservationInvoke2(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_reservationIndex2];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getreservationOperation2());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_reservationIndex2] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public boolean reservation(int classID, java.lang.String email, java.lang.String name, java.lang.String surname, java.lang.String phoneNo) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getreservationInvoke2(new java.lang.Object[] {new java.lang.Integer(classID), email, name, surname, phoneNo}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return ((java.lang.Boolean) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue()).booleanValue();
        } catch (java.lang.Exception _exception) {
            return ((java.lang.Boolean) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), boolean.class)).booleanValue();
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _getCourseOperation3 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getgetCourseOperation3() {
        if (_getCourseOperation3 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Subject"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Period"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false), 
            };
            _getCourseOperation3 = new com.ibm.ws.webservices.engine.description.OperationDesc("getCourse", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourseReturn"));
            _getCourseOperation3.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"));
            _getCourseOperation3.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourse"));
            _getCourseOperation3.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _getCourseOperation3;
    }

    private int _getCourseIndex3 = 3;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getgetCourseInvoke3(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_getCourseIndex3];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getgetCourseOperation3());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_getCourseIndex3] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public java.lang.String getCourse(java.lang.String subject, int period) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getgetCourseInvoke3(new java.lang.Object[] {subject, new java.lang.Integer(period)}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return (java.lang.String) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue();
        } catch (java.lang.Exception _exception) {
            return (java.lang.String) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), java.lang.String.class);
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _getCourseFromEmailOperation4 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getgetCourseFromEmailOperation4() {
        if (_getCourseFromEmailOperation4 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Email"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
            };
            _getCourseFromEmailOperation4 = new com.ibm.ws.webservices.engine.description.OperationDesc("getCourseFromEmail", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourseFromEmailReturn"));
            _getCourseFromEmailOperation4.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"));
            _getCourseFromEmailOperation4.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "getCourseFromEmail"));
            _getCourseFromEmailOperation4.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _getCourseFromEmailOperation4;
    }

    private int _getCourseFromEmailIndex4 = 4;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getgetCourseFromEmailInvoke4(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_getCourseFromEmailIndex4];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getgetCourseFromEmailOperation4());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_getCourseFromEmailIndex4] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public java.lang.String getCourseFromEmail(java.lang.String email) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getgetCourseFromEmailInvoke4(new java.lang.Object[] {email}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return (java.lang.String) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue();
        } catch (java.lang.Exception _exception) {
            return (java.lang.String) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), java.lang.String.class);
        }
    }

    private com.ibm.ws.webservices.engine.description.OperationDesc _cancelOperation5 = null;
    private com.ibm.ws.webservices.engine.description.OperationDesc _getcancelOperation5() {
        if (_cancelOperation5 == null) {
            com.ibm.ws.webservices.engine.description.ParameterDesc[] _params = new com.ibm.ws.webservices.engine.description.ParameterDesc[] {
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "ClassID"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "int"), int.class, false, false), 
                new com.ibm.ws.webservices.engine.description.ParameterDesc(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "Email"), com.ibm.ws.webservices.engine.description.ParameterDesc.IN, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "string"), java.lang.String.class, false, false), 
            };
            _cancelOperation5 = new com.ibm.ws.webservices.engine.description.OperationDesc("cancel", _params, com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "cancelReturn"));
            _cancelOperation5.setReturnType(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://www.w3.org/2001/XMLSchema", "boolean"));
            _cancelOperation5.setElementQName(com.ibm.ws.webservices.engine.utils.QNameTable.createQName("http://WS", "cancel"));
            _cancelOperation5.setSoapAction("");
            com.ibm.ws.webservices.engine.description.FaultDesc _fault = null;
        }
        return _cancelOperation5;
    }

    private int _cancelIndex5 = 5;
    private synchronized com.ibm.ws.webservices.engine.client.Stub.Invoke _getcancelInvoke5(Object[] parameters) throws com.ibm.ws.webservices.engine.WebServicesFault  {
        com.ibm.ws.webservices.engine.MessageContext mc = super.messageContexts[_cancelIndex5];
        if (mc == null) {
            mc = new com.ibm.ws.webservices.engine.MessageContext(super.engine);
            mc.setOperation(_getcancelOperation5());
            mc.setUseSOAPAction(true);
            mc.setSOAPActionURI("");
            mc.setOperationStyle("wrapped");
            mc.setOperationUse("literal");
            mc.setEncodingStyle(com.ibm.ws.webservices.engine.Constants.URI_LITERAL_ENC);
            mc.setProperty(com.ibm.ws.webservices.engine.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
            mc.setProperty(com.ibm.ws.webservices.engine.WebServicesEngine.PROP_DOMULTIREFS, Boolean.FALSE);
            super.primeMessageContext(mc);
            super.messageContexts[_cancelIndex5] = mc;
        }
        try {
            mc = (com.ibm.ws.webservices.engine.MessageContext) mc.clone();
        }
        catch (CloneNotSupportedException cnse) {
            throw com.ibm.ws.webservices.engine.WebServicesFault.makeFault(cnse);
        }
        return new com.ibm.ws.webservices.engine.client.Stub.Invoke(connection, mc, parameters);
    }

    public boolean cancel(int classID, java.lang.String email) throws java.rmi.RemoteException {
        if (super.cachedEndpoint == null) {
            throw new com.ibm.ws.webservices.engine.NoEndPointException();
        }
        java.util.Vector _resp = null;
        try {
            _resp = _getcancelInvoke5(new java.lang.Object[] {new java.lang.Integer(classID), email}).invoke();

        } catch (com.ibm.ws.webservices.engine.WebServicesFault wsf) {
            throw wsf;
        } 
        try {
            return ((java.lang.Boolean) ((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue()).booleanValue();
        } catch (java.lang.Exception _exception) {
            return ((java.lang.Boolean) com.ibm.ws.webservices.engine.utils.JavaUtils.convert(((com.ibm.ws.webservices.engine.xmlsoap.ext.ParamValue) _resp.get(0)).getValue(), boolean.class)).booleanValue();
        }
    }

}
