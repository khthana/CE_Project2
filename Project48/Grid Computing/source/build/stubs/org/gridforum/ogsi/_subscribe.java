/**
 * _subscribe.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.gridforum.ogsi;

public class _subscribe  implements java.io.Serializable {
    private org.gridforum.ogsi.ExtensibilityType subscriptionExpression;
    private org.gridforum.ogsi.LocatorType sink;
    private org.gridforum.ogsi.ExtendedDateTimeType expirationTime;

    public _subscribe() {
    }

    public org.gridforum.ogsi.ExtensibilityType getSubscriptionExpression() {
        return subscriptionExpression;
    }

    public void setSubscriptionExpression(org.gridforum.ogsi.ExtensibilityType subscriptionExpression) {
        this.subscriptionExpression = subscriptionExpression;
    }

    public org.gridforum.ogsi.LocatorType getSink() {
        return sink;
    }

    public void setSink(org.gridforum.ogsi.LocatorType sink) {
        this.sink = sink;
    }

    public org.gridforum.ogsi.ExtendedDateTimeType getExpirationTime() {
        return expirationTime;
    }

    public void setExpirationTime(org.gridforum.ogsi.ExtendedDateTimeType expirationTime) {
        this.expirationTime = expirationTime;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _subscribe)) return false;
        _subscribe other = (_subscribe) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.subscriptionExpression==null && other.getSubscriptionExpression()==null) || 
             (this.subscriptionExpression!=null &&
              this.subscriptionExpression.equals(other.getSubscriptionExpression()))) &&
            ((this.sink==null && other.getSink()==null) || 
             (this.sink!=null &&
              this.sink.equals(other.getSink()))) &&
            ((this.expirationTime==null && other.getExpirationTime()==null) || 
             (this.expirationTime!=null &&
              this.expirationTime.equals(other.getExpirationTime())));
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
        if (getSubscriptionExpression() != null) {
            _hashCode += getSubscriptionExpression().hashCode();
        }
        if (getSink() != null) {
            _hashCode += getSink().hashCode();
        }
        if (getExpirationTime() != null) {
            _hashCode += getExpirationTime().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_subscribe.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">subscribe"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("subscriptionExpression");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "subscriptionExpression"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("sink");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "sink"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "LocatorType"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("expirationTime");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "expirationTime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtendedDateTimeType"));
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
