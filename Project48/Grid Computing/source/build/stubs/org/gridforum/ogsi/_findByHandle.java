/**
 * _findByHandle.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.gridforum.ogsi;

public class _findByHandle  implements java.io.Serializable {
    private org.gridforum.ogsi.LocatorType handleSet;
    private org.gridforum.ogsi.LocatorType gsrExclusionSet;

    public _findByHandle() {
    }

    public org.gridforum.ogsi.LocatorType getHandleSet() {
        return handleSet;
    }

    public void setHandleSet(org.gridforum.ogsi.LocatorType handleSet) {
        this.handleSet = handleSet;
    }

    public org.gridforum.ogsi.LocatorType getGsrExclusionSet() {
        return gsrExclusionSet;
    }

    public void setGsrExclusionSet(org.gridforum.ogsi.LocatorType gsrExclusionSet) {
        this.gsrExclusionSet = gsrExclusionSet;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _findByHandle)) return false;
        _findByHandle other = (_findByHandle) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.handleSet==null && other.getHandleSet()==null) || 
             (this.handleSet!=null &&
              this.handleSet.equals(other.getHandleSet()))) &&
            ((this.gsrExclusionSet==null && other.getGsrExclusionSet()==null) || 
             (this.gsrExclusionSet!=null &&
              this.gsrExclusionSet.equals(other.getGsrExclusionSet())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getHandleSet() != null) {
            _hashCode += getHandleSet().hashCode();
        }
        if (getGsrExclusionSet() != null) {
            _hashCode += getGsrExclusionSet().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_findByHandle.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">findByHandle"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("handleSet");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "handleSet"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "LocatorType"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("gsrExclusionSet");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "gsrExclusionSet"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "LocatorType"));
        elemField.setMinOccurs(0);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
