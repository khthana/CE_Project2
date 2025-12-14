/**
 * MatrixServiceSOAPBindingStub.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis WSDL2Java emitter.
 */

package org.globus.progtutorial.stubs.MatrixService.bindings;

public class MatrixServiceSOAPBindingStub extends org.apache.axis.client.Stub implements org.globus.progtutorial.stubs.MatrixService.MatrixPortType {
    private java.util.Vector cachedSerClasses = new java.util.Vector();
    private java.util.Vector cachedSerQNames = new java.util.Vector();
    private java.util.Vector cachedSerFactories = new java.util.Vector();
    private java.util.Vector cachedDeserFactories = new java.util.Vector();

    static org.apache.axis.description.OperationDesc [] _operations;

    static {
        _operations = new org.apache.axis.description.OperationDesc[7];
        org.apache.axis.description.OperationDesc oper;
        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("getValue");
        oper.setReturnType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        oper.setReturnClass(int.class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value"));
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[0] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("setServiceData");
        oper.addParameter(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "updateExpression"), new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"), org.gridforum.ogsi.ExtensibilityType.class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"));
        oper.setReturnClass(org.gridforum.ogsi.ExtensibilityType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "result"));
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "modifiabilityViolationFault"),
                      "org.gridforum.ogsi.ModifiabilityViolationFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ModifiabilityViolationFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "partialFailureFault"),
                      "org.gridforum.ogsi.PartialFailureFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "PartialFailureFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "typeViolationFault"),
                      "org.gridforum.ogsi.TypeViolationFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TypeViolationFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "mutabilityViolationFault"),
                      "org.gridforum.ogsi.MutabilityViolationFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MutabilityViolationFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "cardinalityViolationFault"),
                      "org.gridforum.ogsi.CardinalityViolationFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "CardinalityViolationFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "extensibilityTypeFault"),
                      "org.gridforum.ogsi.ExtensibilityTypeFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityTypeFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "incorrectValueFault"),
                      "org.gridforum.ogsi.IncorrectValueFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "IncorrectValueFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "extensibilityNotSupportedFault"),
                      "org.gridforum.ogsi.ExtensibilityNotSupportedFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityNotSupportedFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[1] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("destroy");
        oper.setReturnType(org.apache.axis.encoding.XMLType.AXIS_VOID);
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "serviceNotDestroyedFault"),
                      "org.gridforum.ogsi.ServiceNotDestroyedFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ServiceNotDestroyedFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[2] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("multiplyMatrix");
        oper.addParameter(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value1"), new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "ArrayOfInteger"), int[].class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.addParameter(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value2"), new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "ArrayOfInteger"), int[].class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.addParameter(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "value3"), new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"), int.class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.setReturnType(org.apache.axis.encoding.XMLType.AXIS_VOID);
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[3] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("requestTerminationAfter");
        oper.addParameter(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "terminationTime"), new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtendedDateTimeType"), org.gridforum.ogsi.ExtendedDateTimeType.class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeType"));
        oper.setReturnClass(org.gridforum.ogsi.TerminationTimeType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "currentTerminationTime"));
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "terminationTimeUnchangedFault"),
                      "org.gridforum.ogsi.TerminationTimeUnchangedFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeUnchangedFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[4] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("findServiceData");
        oper.addParameter(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "queryExpression"), new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"), org.gridforum.ogsi.ExtensibilityType.class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType"));
        oper.setReturnClass(org.gridforum.ogsi.ExtensibilityType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "result"));
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "targetInvalidFault"),
                      "org.gridforum.ogsi.TargetInvalidFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TargetInvalidFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "extensibilityTypeFault"),
                      "org.gridforum.ogsi.ExtensibilityTypeFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityTypeFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "extensibilityNotSupportedFault"),
                      "org.gridforum.ogsi.ExtensibilityNotSupportedFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityNotSupportedFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[5] = oper;

        oper = new org.apache.axis.description.OperationDesc();
        oper.setName("requestTerminationBefore");
        oper.addParameter(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "terminationTime"), new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtendedDateTimeType"), org.gridforum.ogsi.ExtendedDateTimeType.class, org.apache.axis.description.ParameterDesc.IN, false, false);
        oper.setReturnType(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeType"));
        oper.setReturnClass(org.gridforum.ogsi.TerminationTimeType.class);
        oper.setReturnQName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "currentTerminationTime"));
        oper.setStyle(org.apache.axis.enum.Style.WRAPPED);
        oper.setUse(org.apache.axis.enum.Use.LITERAL);
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "terminationTimeUnchangedFault"),
                      "org.gridforum.ogsi.TerminationTimeUnchangedFaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeUnchangedFaultType"), 
                      true
                     ));
        oper.addFault(new org.apache.axis.description.FaultDesc(
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "fault"),
                      "org.gridforum.ogsi.FaultType",
                      new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType"), 
                      true
                     ));
        _operations[6] = oper;

    }

    public MatrixServiceSOAPBindingStub() throws org.apache.axis.AxisFault {
         this(null);
    }

    public MatrixServiceSOAPBindingStub(java.net.URL endpointURL, javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
         this(service);
         super.cachedEndpoint = endpointURL;
    }

    public MatrixServiceSOAPBindingStub(javax.xml.rpc.Service service) throws org.apache.axis.AxisFault {
        if (service == null) {
            super.service = new org.apache.axis.client.Service();
        } else {
            super.service = service;
        }
            java.lang.Class cls;
            javax.xml.namespace.QName qName;
            java.lang.Class beansf = org.apache.axis.encoding.ser.BeanSerializerFactory.class;
            java.lang.Class beandf = org.apache.axis.encoding.ser.BeanDeserializerFactory.class;
            java.lang.Class enumsf = org.apache.axis.encoding.ser.EnumSerializerFactory.class;
            java.lang.Class enumdf = org.apache.axis.encoding.ser.EnumDeserializerFactory.class;
            java.lang.Class arraysf = org.apache.axis.encoding.ser.ArraySerializerFactory.class;
            java.lang.Class arraydf = org.apache.axis.encoding.ser.ArrayDeserializerFactory.class;
            java.lang.Class simplesf = org.apache.axis.encoding.ser.SimpleSerializerFactory.class;
            java.lang.Class simpledf = org.apache.axis.encoding.ser.SimpleDeserializerFactory.class;
            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "CardinalityViolationFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.CardinalityViolationFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ServiceHasTerminatedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ServiceHasTerminatedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MembershipContentRuleType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.MembershipContentRuleType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ReferenceType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ReferenceType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TypeViolationFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.TypeViolationFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "IncorrectValueFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.IncorrectValueFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ContentCreationFailedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ContentCreationFailedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "UnsupportedMemberInterfaceFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.UnsupportedMemberInterfaceFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">add");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._add.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "NoAdditionalReferencesAvailableFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.NoAdditionalReferencesAvailableFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">addResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._addResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">setServiceDataResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._setServiceDataResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">findByHandle");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._findByHandle.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">setServiceData");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._setServiceData.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">destroy");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._destroy.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TargetInvalidFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.TargetInvalidFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">requestTerminationBeforeResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._requestTerminationBeforeResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ServiceAlreadyExistsFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ServiceAlreadyExistsFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">findServiceData");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._findServiceData.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "HandleType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.HandleType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(simplesf);
            cachedDeserFactories.add(simpledf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "NoSuchServiceStartedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.NoSuchServiceStartedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", ">getValueResponse");
            cachedSerQNames.add(qName);
            cls = org.globus.progtutorial.stubs.MatrixService._getValueResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtendedDateTimeType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ExtendedDateTimeType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(simplesf);
            cachedDeserFactories.add(simpledf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityTypeFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ExtensibilityTypeFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">findServiceDataResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._findServiceDataResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "AddRefusedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.AddRefusedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">subscribe");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._subscribe.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "EntryContentType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.EntryContentType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.FaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "OperationExtensibilityType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.OperationExtensibilityType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">removeResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._removeResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "CreateServiceExtensibilityType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.CreateServiceExtensibilityType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "InvalidHandleFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.InvalidHandleFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", ">getValue");
            cachedSerQNames.add(qName);
            cls = org.globus.progtutorial.stubs.MatrixService._getValue.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "RedirectionFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.RedirectionFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "NoReferencesAvailableFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.NoReferencesAvailableFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "PartialFailureFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.PartialFailureFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", ">multiplyMatrixResponse");
            cachedSerQNames.add(qName);
            cls = org.globus.progtutorial.stubs.MatrixService._multiplyMatrixResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", ">multiplyMatrix");
            cachedSerQNames.add(qName);
            cls = org.globus.progtutorial.stubs.MatrixService._multiplyMatrix.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "FaultCodeType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.FaultCodeType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(simplesf);
            cachedDeserFactories.add(simpledf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">requestTerminationAfterResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._requestTerminationAfterResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">requestTerminationBefore");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._requestTerminationBefore.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">destroyResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._destroyResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TemporarilyUnavailableFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.TemporarilyUnavailableFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "RemoveFailedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.RemoveFailedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MaxIntervalType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.MaxIntervalType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(simplesf);
            cachedDeserFactories.add(simpledf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">requestTerminationAfter");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._requestTerminationAfter.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "EntryType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.EntryType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MutabilityViolationFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.MutabilityViolationFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">remove");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._remove.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "LocatorType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.LocatorType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityNotSupportedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ExtensibilityNotSupportedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ServiceNotDestroyedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ServiceNotDestroyedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">createServiceResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._createServiceResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ModifiabilityViolationFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ModifiabilityViolationFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "SubscribeByNameType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.SubscribeByNameType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "WSDLReferenceType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.WSDLReferenceType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">deliverNotification");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._deliverNotification.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "InfinityType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.InfinityType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(enumsf);
            cachedDeserFactories.add(enumdf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MatchByLocatorEquivalenceType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.MatchByLocatorEquivalenceType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.TerminationTimeType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "NoSuchServiceFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.NoSuchServiceFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">subscribeResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._subscribeResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "MatchFailedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.MatchFailedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "ExtensibilityType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.ExtensibilityType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "QNamesType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.QNamesType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">createService");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._createService.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", ">findByHandleResponse");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi._findByHandleResponse.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "TerminationTimeUnchangedFaultType");
            cachedSerQNames.add(qName);
            cls = org.gridforum.ogsi.TerminationTimeUnchangedFaultType.class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(beansf);
            cachedDeserFactories.add(beandf);

            qName = new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "ArrayOfInteger");
            cachedSerQNames.add(qName);
            cls = int[].class;
            cachedSerClasses.add(cls);
            cachedSerFactories.add(arraysf);
            cachedDeserFactories.add(arraydf);

    }

    private org.apache.axis.client.Call createCall() throws java.rmi.RemoteException {
        try {
            org.apache.axis.client.Call _call =
                    (org.apache.axis.client.Call) super.service.createCall();
            if (super.maintainSessionSet) {
                _call.setMaintainSession(super.maintainSession);
            }
            if (super.cachedUsername != null) {
                _call.setUsername(super.cachedUsername);
            }
            if (super.cachedPassword != null) {
                _call.setPassword(super.cachedPassword);
            }
            if (super.cachedEndpoint != null) {
                _call.setTargetEndpointAddress(super.cachedEndpoint);
            }
            if (super.cachedTimeout != null) {
                _call.setTimeout(super.cachedTimeout);
            }
            if (super.cachedPortName != null) {
                _call.setPortName(super.cachedPortName);
            }
            java.util.Enumeration keys = super.cachedProperties.keys();
            while (keys.hasMoreElements()) {
                java.lang.String key = (java.lang.String) keys.nextElement();
                _call.setProperty(key, super.cachedProperties.get(key));
            }
            // All the type mapping information is registered
            // when the first call is made.
            // The type mapping information is actually registered in
            // the TypeMappingRegistry of the service, which
            // is the reason why registration is only needed for the first call.
            synchronized (this) {
                if (firstCall()) {
                    // must set encoding style before registering serializers
                    _call.setEncodingStyle(null);
                    for (int i = 0; i < cachedSerFactories.size(); ++i) {
                        java.lang.Class cls = (java.lang.Class) cachedSerClasses.get(i);
                        javax.xml.namespace.QName qName =
                                (javax.xml.namespace.QName) cachedSerQNames.get(i);
                        java.lang.Class sf = (java.lang.Class)
                                 cachedSerFactories.get(i);
                        java.lang.Class df = (java.lang.Class)
                                 cachedDeserFactories.get(i);
                        _call.registerTypeMapping(cls, qName, sf, df, false);
                    }
                }
            }
            return _call;
        }
        catch (java.lang.Throwable t) {
            throw new org.apache.axis.AxisFault("Failure trying to get the Call object", t);
        }
    }

    public int getValue() throws java.rmi.RemoteException, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[0]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#getValue");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "getValue"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return ((java.lang.Integer) _resp).intValue();
            } catch (java.lang.Exception _exception) {
                return ((java.lang.Integer) org.apache.axis.utils.JavaUtils.convert(_resp, int.class)).intValue();
            }
        }
    }

    public org.gridforum.ogsi.ExtensibilityType setServiceData(org.gridforum.ogsi.ExtensibilityType updateExpression) throws java.rmi.RemoteException, org.gridforum.ogsi.ModifiabilityViolationFaultType, org.gridforum.ogsi.PartialFailureFaultType, org.gridforum.ogsi.TypeViolationFaultType, org.gridforum.ogsi.MutabilityViolationFaultType, org.gridforum.ogsi.CardinalityViolationFaultType, org.gridforum.ogsi.ExtensibilityTypeFaultType, org.gridforum.ogsi.IncorrectValueFaultType, org.gridforum.ogsi.ExtensibilityNotSupportedFaultType, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[1]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#setServiceData");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "setServiceData"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {updateExpression});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.gridforum.ogsi.ExtensibilityType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.gridforum.ogsi.ExtensibilityType) org.apache.axis.utils.JavaUtils.convert(_resp, org.gridforum.ogsi.ExtensibilityType.class);
            }
        }
    }

    public void destroy() throws java.rmi.RemoteException, org.gridforum.ogsi.ServiceNotDestroyedFaultType, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[2]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#destroy");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "destroy"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        extractAttachments(_call);
    }

    public void multiplyMatrix(int[] value1, int[] value2, int value3) throws java.rmi.RemoteException, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[3]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#multiplyMatrix");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService", "multiplyMatrix"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {value1, value2, new java.lang.Integer(value3)});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        extractAttachments(_call);
    }

    public org.gridforum.ogsi.TerminationTimeType requestTerminationAfter(org.gridforum.ogsi.ExtendedDateTimeType terminationTime) throws java.rmi.RemoteException, org.gridforum.ogsi.TerminationTimeUnchangedFaultType, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[4]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#requestTerminationAfter");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "requestTerminationAfter"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {terminationTime});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.gridforum.ogsi.TerminationTimeType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.gridforum.ogsi.TerminationTimeType) org.apache.axis.utils.JavaUtils.convert(_resp, org.gridforum.ogsi.TerminationTimeType.class);
            }
        }
    }

    public org.gridforum.ogsi.ExtensibilityType findServiceData(org.gridforum.ogsi.ExtensibilityType queryExpression) throws java.rmi.RemoteException, org.gridforum.ogsi.TargetInvalidFaultType, org.gridforum.ogsi.ExtensibilityTypeFaultType, org.gridforum.ogsi.ExtensibilityNotSupportedFaultType, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[5]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#findServiceData");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "findServiceData"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {queryExpression});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.gridforum.ogsi.ExtensibilityType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.gridforum.ogsi.ExtensibilityType) org.apache.axis.utils.JavaUtils.convert(_resp, org.gridforum.ogsi.ExtensibilityType.class);
            }
        }
    }

    public org.gridforum.ogsi.TerminationTimeType requestTerminationBefore(org.gridforum.ogsi.ExtendedDateTimeType terminationTime) throws java.rmi.RemoteException, org.gridforum.ogsi.TerminationTimeUnchangedFaultType, org.gridforum.ogsi.FaultType {
        if (super.cachedEndpoint == null) {
            throw new org.apache.axis.NoEndPointException();
        }
        org.apache.axis.client.Call _call = createCall();
        _call.setOperation(_operations[6]);
        _call.setUseSOAPAction(true);
        _call.setSOAPActionURI("http://www.globus.org/namespaces/2004/02/progtutorial/MatrixService#requestTerminationBefore");
        _call.setEncodingStyle(null);
        _call.setProperty(org.apache.axis.client.Call.SEND_TYPE_ATTR, Boolean.FALSE);
        _call.setProperty(org.apache.axis.AxisEngine.PROP_DOMULTIREFS, Boolean.FALSE);
        _call.setSOAPVersion(org.apache.axis.soap.SOAPConstants.SOAP11_CONSTANTS);
        _call.setOperationName(new javax.xml.namespace.QName("http://www.gridforum.org/namespaces/2003/03/OGSI", "requestTerminationBefore"));

        setRequestHeaders(_call);
        setAttachments(_call);
        java.lang.Object _resp = _call.invoke(new java.lang.Object[] {terminationTime});

        if (_resp instanceof java.rmi.RemoteException) {
            throw (java.rmi.RemoteException)_resp;
        }
        else {
            extractAttachments(_call);
            try {
                return (org.gridforum.ogsi.TerminationTimeType) _resp;
            } catch (java.lang.Exception _exception) {
                return (org.gridforum.ogsi.TerminationTimeType) org.apache.axis.utils.JavaUtils.convert(_resp, org.gridforum.ogsi.TerminationTimeType.class);
            }
        }
    }

}
