/**
 * _requestTerminationBeforeResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.gridforum.ogsi;

public class _requestTerminationBeforeResponse  implements java.io.Serializable {
    private org.gridforum.ogsi.TerminationTimeType currentTerminationTime;

    public _requestTerminationBeforeResponse() {
    }

    public org.gridforum.ogsi.TerminationTimeType getCurrentTerminationTime() {
        return currentTerminationTime;
    }

    public void setCurrentTerminationTime(org.gridforum.ogsi.TerminationTimeType currentTerminationTime) {
        this.currentTerminationTime = currentTerminationTime;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _requestTerminationBeforeResponse)) return false;
        _requestTerminationBeforeResponse other = (_requestTerminationBeforeResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.currentTerminationTime==null && other.getCurrentTerminationTime()==null) || 
             (this.currentTerminationTime!=null &&
              this.currentTerminationTime.equals(other.getCurrentTerminationTime())));
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
        if (getCurrentTerminationTime() != null) {
            _hashCode += getCurrentTerminationTime().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_requestTerminationBeforeResponse.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">requestTerminationBeforeResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("currentTerminationTime");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "currentTerminationTime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeType"));
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
