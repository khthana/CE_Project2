/**
 * _createServiceResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.gridforum.ogsi;

public class _createServiceResponse  implements java.io.Serializable {
    private org.gridforum.ogsi.LocatorType locator;
    private org.gridforum.ogsi.TerminationTimeType currentTerminationTime;
    private org.gridforum.ogsi.ExtensibilityType extensibilityOutput;

    public _createServiceResponse() {
    }

    public org.gridforum.ogsi.LocatorType getLocator() {
        return locator;
    }

    public void setLocator(org.gridforum.ogsi.LocatorType locator) {
        this.locator = locator;
    }

    public org.gridforum.ogsi.TerminationTimeType getCurrentTerminationTime() {
        return currentTerminationTime;
    }

    public void setCurrentTerminationTime(org.gridforum.ogsi.TerminationTimeType currentTerminationTime) {
        this.currentTerminationTime = currentTerminationTime;
    }

    public org.gridforum.ogsi.ExtensibilityType getExtensibilityOutput() {
        return extensibilityOutput;
    }

    public void setExtensibilityOutput(org.gridforum.ogsi.ExtensibilityType extensibilityOutput) {
        this.extensibilityOutput = extensibilityOutput;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _createServiceResponse)) return false;
        _createServiceResponse other = (_createServiceResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.locator==null && other.getLocator()==null) || 
             (this.locator!=null &&
              this.locator.equals(other.getLocator()))) &&
            ((this.currentTerminationTime==null && other.getCurrentTerminationTime()==null) || 
             (this.currentTerminationTime!=null &&
              this.currentTerminationTime.equals(other.getCurrentTerminationTime()))) &&
            ((this.extensibilityOutput==null && other.getExtensibilityOutput()==null) || 
             (this.extensibilityOutput!=null &&
              this.extensibilityOutput.equals(other.getExtensibilityOutput())));
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
        if (getLocator() != null) {
            _hashCode += getLocator().hashCode();
        }
        if (getCurrentTerminationTime() != null) {
            _hashCode += getCurrentTerminationTime().hashCode();
        }
        if (getExtensibilityOutput() != null) {
            _hashCode += getExtensibilityOutput().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_createServiceResponse.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">createServiceResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("locator");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "locator"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "LocatorType"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("currentTerminationTime");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "currentTerminationTime"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeType"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("extensibilityOutput");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "extensibilityOutput"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"));
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
