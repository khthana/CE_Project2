VERSION 5.00
Begin {C0E45035-5775-11D0-B388-00A0C9055D8E} DataEn 
   ClientHeight    =   8880
   ClientLeft      =   1605
   ClientTop       =   2055
   ClientWidth     =   10875
   _ExtentX        =   19182
   _ExtentY        =   15663
   FolderFlags     =   1
   TypeLibGuid     =   "{E6A70514-1C0B-48C2-AA1B-DB89AD6F6703}"
   TypeInfoGuid    =   "{C1AA5627-7F31-4F25-A7A6-417960B71801}"
   TypeInfoCookie  =   0
   Version         =   4
   NumConnections  =   1
   BeginProperty Connection1 
      ConnectionName  =   "Conn"
      ConnDispId      =   1001
      SourceOfData    =   3
      ConnectionSource=   "Provider=SQLOLEDB.1;Password=danainat;Persist Security Info=True;User ID=danainat;Initial Catalog=MRP;Data Source=MRP"
      Expanded        =   -1  'True
      IsSQL           =   -1  'True
      QuoteChar       =   34
      SeparatorChar   =   46
   EndProperty
   NumRecordsets   =   14
   BeginProperty Recordset1 
      CommandName     =   "deleteFG"
      CommDispId      =   1017
      RsDispId        =   1343
      CommandText     =   $"DataEn.dsx":0000
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   2
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P2 
         RealName        =   "Param2"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset2 
      CommandName     =   "getFG"
      CommDispId      =   1023
      RsDispId        =   1312
      CommandText     =   $"DataEn.dsx":0045
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   3
      BeginProperty Field1 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "ItemID"
         Caption         =   "ItemID"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   300
         Scale           =   0
         Type            =   202
         Name            =   "ItemName"
         Caption         =   "ItemName"
      EndProperty
      BeginProperty Field3 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "LeadTime"
         Caption         =   "LeadTime"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset3 
      CommandName     =   "getChild"
      CommDispId      =   1030
      RsDispId        =   1378
      CommandText     =   $"DataEn.dsx":0110
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   6
      BeginProperty Field1 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "ItemID"
         Caption         =   "ItemID"
      EndProperty
      BeginProperty Field2 
         Precision       =   0
         Size            =   1073741823
         Scale           =   0
         Type            =   203
         Name            =   "ItemName"
         Caption         =   "ItemName"
      EndProperty
      BeginProperty Field3 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "ParentID"
         Caption         =   "ParentID"
      EndProperty
      BeginProperty Field4 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "Level"
         Caption         =   "Level"
      EndProperty
      BeginProperty Field5 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "Unit"
         Caption         =   "Unit"
      EndProperty
      BeginProperty Field6 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "LeadTime"
         Caption         =   "LeadTime"
      EndProperty
      NumGroups       =   0
      ParamCount      =   1
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset4 
      CommandName     =   "getItemDes"
      CommDispId      =   1034
      RsDispId        =   1052
      CommandText     =   $"DataEn.dsx":01EF
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   0
         Size            =   300
         Scale           =   0
         Type            =   202
         Name            =   "ItemName"
         Caption         =   "ItemName"
      EndProperty
      BeginProperty Field2 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "LeadTime"
         Caption         =   "LeadTime"
      EndProperty
      NumGroups       =   0
      ParamCount      =   1
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset5 
      CommandName     =   "getLowLevel"
      CommDispId      =   1142
      RsDispId        =   1383
      CommandText     =   "select itemID, max([Level]) as Low from BOM group by itemID"
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      IsRSReturning   =   -1  'True
      NumFields       =   2
      BeginProperty Field1 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "itemID"
         Caption         =   "itemID"
      EndProperty
      BeginProperty Field2 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "Low"
         Caption         =   "Low"
      EndProperty
      NumGroups       =   0
      ParamCount      =   0
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset6 
      CommandName     =   "updateLowLevel"
      CommDispId      =   1148
      RsDispId        =   1151
      CommandText     =   "update InventoryDetail set LowestLevel = ? where ItemID = ?"
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   2
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P2 
         RealName        =   "Param2"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset7 
      CommandName     =   "addToBOM"
      CommDispId      =   1197
      RsDispId        =   -1
      CommandText     =   "INSERT BOM (BOMID, ModuleID, ParentModuleID, [Level], Unit, ItemID) VALUES (?, ?, ?, ?, ?, ?)"
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   6
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P2 
         RealName        =   "Param2"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P3 
         RealName        =   "Param3"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P4 
         RealName        =   "Param4"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P5 
         RealName        =   "Param5"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P6 
         RealName        =   "Param6"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset8 
      CommandName     =   "deleteBOM"
      CommDispId      =   1206
      RsDispId        =   -1
      CommandText     =   $"DataEn.dsx":0235
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   1
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   15
         Scale           =   255
         Size            =   8
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset9 
      CommandName     =   "getThisChild"
      CommDispId      =   1235
      RsDispId        =   1239
      CommandText     =   $"DataEn.dsx":0254
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      IsRSReturning   =   -1  'True
      NumFields       =   6
      BeginProperty Field1 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "BOMID"
         Caption         =   "BOMID"
      EndProperty
      BeginProperty Field2 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "ItemID"
         Caption         =   "ItemID"
      EndProperty
      BeginProperty Field3 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "ParentID"
         Caption         =   "ParentID"
      EndProperty
      BeginProperty Field4 
         Precision       =   15
         Size            =   8
         Scale           =   0
         Type            =   5
         Name            =   "Unit"
         Caption         =   "Unit"
      EndProperty
      BeginProperty Field5 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "Level"
         Caption         =   "Level"
      EndProperty
      BeginProperty Field6 
         Precision       =   10
         Size            =   4
         Scale           =   0
         Type            =   3
         Name            =   "LeadTime"
         Caption         =   "LeadTime"
      EndProperty
      NumGroups       =   0
      ParamCount      =   2
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P2 
         RealName        =   "Param2"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset10 
      CommandName     =   "deleteBomItem"
      CommDispId      =   1263
      RsDispId        =   1267
      CommandText     =   "delete BOM_ where BOMID = ? and ItemID <> ?"
      ActiveConnectionName=   "Conn"
      CommandType     =   1
      Locktype        =   3
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   2
      BeginProperty P1 
         RealName        =   "Param1"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P2 
         RealName        =   "Param2"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   4
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset11 
      CommandName     =   "dbo_addItem"
      CommDispId      =   1352
      RsDispId        =   1369
      CommandText     =   "dbo.addItem"
      ActiveConnectionName=   "Conn"
      Locktype        =   3
      CallSyntax      =   "{? = CALL dbo.addItem( ?, ?, ?, ?, ?, ?, ?) }"
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   8
      BeginProperty P1 
         RealName        =   "@RETURN_VALUE"
         UserName        =   "RETURN_VALUE"
         Direction       =   4
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   0   'False
      EndProperty
      BeginProperty P2 
         RealName        =   "@Bom"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P3 
         RealName        =   "@Item"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P4 
         RealName        =   "@Name"
         Direction       =   1
         Precision       =   0
         Scale           =   0
         Size            =   255
         DataType        =   200
         HostType        =   8
         Required        =   -1  'True
      EndProperty
      BeginProperty P5 
         RealName        =   "@Parent"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P6 
         RealName        =   "@Level"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P7 
         RealName        =   "@Unit"
         Direction       =   1
         Precision       =   15
         Scale           =   0
         Size            =   0
         DataType        =   5
         HostType        =   5
         Required        =   -1  'True
      EndProperty
      BeginProperty P8 
         RealName        =   "@Leadtime"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset12 
      CommandName     =   "dbo_updateCritical"
      CommDispId      =   1357
      RsDispId        =   -1
      CommandText     =   "dbo.updateCritical"
      ActiveConnectionName=   "Conn"
      CallSyntax      =   "{? = CALL dbo.updateCritical( ?, ?) }"
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   3
      BeginProperty P1 
         RealName        =   "@RETURN_VALUE"
         Direction       =   4
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   0   'False
      EndProperty
      BeginProperty P2 
         RealName        =   "@Item"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P3 
         RealName        =   "@Lead"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset13 
      CommandName     =   "dbo_addFG"
      CommDispId      =   1359
      RsDispId        =   -1
      CommandText     =   "dbo.addFG"
      ActiveConnectionName=   "Conn"
      CallSyntax      =   "{? = CALL dbo.addFG( ?, ?, ?) }"
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   4
      BeginProperty P1 
         RealName        =   "@RETURN_VALUE"
         Direction       =   4
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   0   'False
      EndProperty
      BeginProperty P2 
         RealName        =   "@Item"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      BeginProperty P3 
         RealName        =   "@Name"
         Direction       =   1
         Precision       =   0
         Scale           =   0
         Size            =   255
         DataType        =   200
         HostType        =   8
         Required        =   -1  'True
      EndProperty
      BeginProperty P4 
         RealName        =   "@Lead"
         Direction       =   1
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
   BeginProperty Recordset14 
      CommandName     =   "dbo_tableUpdated"
      CommDispId      =   1363
      RsDispId        =   1368
      CommandText     =   "dbo.tableUpdated"
      ActiveConnectionName=   "Conn"
      Locktype        =   3
      CallSyntax      =   "{? = CALL dbo.tableUpdated( ?) }"
      IsRSReturning   =   -1  'True
      NumFields       =   0
      NumGroups       =   0
      ParamCount      =   2
      BeginProperty P1 
         RealName        =   "@RETURN_VALUE"
         Direction       =   4
         Precision       =   10
         Scale           =   0
         Size            =   0
         DataType        =   3
         HostType        =   3
         Required        =   0   'False
      EndProperty
      BeginProperty P2 
         RealName        =   "@name"
         Direction       =   1
         Precision       =   0
         Scale           =   0
         Size            =   30
         DataType        =   200
         HostType        =   8
         Required        =   -1  'True
      EndProperty
      RelationCount   =   0
      AggregateCount  =   0
   EndProperty
End
Attribute VB_Name = "DataEn"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"DataEnvironment"
Option Explicit

