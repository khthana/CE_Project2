/**
 * _multiplyMatrix.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.globus.progtutorial.stubs.MatrixService;

public class _multiplyMatrix  implements java.io.Serializable {
    private int[] value1;
    private int[] value2;
    private int value3;

    public _multiplyMatrix() {
    }

    public int[] getValue1() {
        return value1;
    }

    public void setValue1(int[] value1) {
        this.value1 = value1;
    }

    public int[] getValue2() {
        return value2;
    }

    public void setValue2(int[] value2) {
        this.value2 = value2;
    }

    public int getValue3() {
        return value3;
    }

    public void setValue3(int value3) {
        this.value3 = value3;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof _multiplyMatrix)) return false;
        _multiplyMatrix other = (_multiplyMatrix) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.value1==null && other.getValue1()==null) || 
             (this.value1!=null &&
              java.util.Arrays.equals(this.value1, other.getValue1()))) &&
            ((this.value2==null && other.getValue2()==null) || 
             (this.value2!=null &&
              java.util.Arrays.equals(this.value2, other.getValue2()))) &&
            this.value3 == other.getValue3();
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
        if (getValue1() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getValue1());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getValue1(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getValue2() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getValue2());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getValue2(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        _hashCode += getValue3();
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(_multiplyMatrix.class);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", ">multiplyMatrix"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("value1");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value1"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("value2");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value2"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("value3");
        elemField.setXmlName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value3"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
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
