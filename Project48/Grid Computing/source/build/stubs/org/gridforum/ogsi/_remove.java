/**
 * _remove.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.gridforum.ogsi;

public class _remove  implements java.io.Serializable {
    private org.gridforum.ogsi.ExtensibilityType matchExpression;

    public _remove() {
    }

    public org.gridforum.ogsi.ExtensibilityType getMatchExpression() {
        return matchExpression;
    }

    public void setMatchExpression(org.gridforum.ogsi.ExtensibilityType matchExpression) {
        this.matchExpression = matchExpression;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _remove)) return false;
        _remove other = (_remove) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.matchExpression==null && other.getMatchExpression()==null) || 
             (this.matchExpression!=null &&
              this.matchExpression.equals(other.getMatchExpression())));
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
        if (getMatchExpression() != null) {
            _hashCode += getMatchExpression().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_remove.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">remove"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("matchExpression");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "matchExpression"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"));
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
