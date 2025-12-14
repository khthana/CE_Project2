unit COMSVCSLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 4/2/2001 13:57:17 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\WINNT\System32\COMSVCS.DLL (1)
// IID\LCID: {2A005C00-A5DE-11CF-9E66-00AA00A3F464}\0
// Helpfile: C:\WINNT\System32\cossdk.chm
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// Errors:
//   Hint: Member 'Property' of 'ISharedPropertyGroup' changed to 'Property_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  COMSVCSLibMajorVersion = 1;
  COMSVCSLibMinorVersion = 0;

  LIBID_COMSVCSLib: TGUID = '{2A005C00-A5DE-11CF-9E66-00AA00A3F464}';

  IID_ISecurityCertificateColl: TGUID = '{CAFC823B-B441-11D1-B82B-0000F8757E2A}';
  CLASS_SecurityCertificate: TGUID = '{ECABB0A4-7F19-11D2-978E-0000F8757E2A}';
  IID_ISecurityIdentityColl: TGUID = '{CAFC823C-B441-11D1-B82B-0000F8757E2A}';
  CLASS_SecurityIdentity: TGUID = '{ECABB0A5-7F19-11D2-978E-0000F8757E2A}';
  IID_ISecurityCallersColl: TGUID = '{CAFC823D-B441-11D1-B82B-0000F8757E2A}';
  CLASS_SecurityCallers: TGUID = '{ECABB0A6-7F19-11D2-978E-0000F8757E2A}';
  IID_ISecurityCallContext: TGUID = '{CAFC823E-B441-11D1-B82B-0000F8757E2A}';
  CLASS_SecurityCallContext: TGUID = '{ECABB0A7-7F19-11D2-978E-0000F8757E2A}';
  IID_IGetSecurityCallContext: TGUID = '{CAFC823F-B441-11D1-B82B-0000F8757E2A}';
  CLASS_GetSecurityCallContextAppObject: TGUID = '{ECABB0A8-7F19-11D2-978E-0000F8757E2A}';
  IID_IContextState: TGUID = '{3C05E54B-A42A-11D2-AFC4-00C04F8EE1C4}';
  IID_IObjectContext: TGUID = '{51372AE0-CAE7-11CF-BE81-00AA00A2FA25}';
  IID_IObjectContextActivity: TGUID = '{51372AFC-CAE7-11CF-BE81-00AA00A2FA25}';
  IID_IObjectContextInfo: TGUID = '{75B52DDB-E8ED-11D1-93AD-00AA00BA3258}';
  IID_IObjectConstruct: TGUID = '{41C4F8B3-7439-11D2-98CB-00C04F8EE1C4}';
  IID_IObjectConstructString: TGUID = '{41C4F8B2-7439-11D2-98CB-00C04F8EE1C4}';
  IID_IObjectControl: TGUID = '{51372AEC-CAE7-11CF-BE81-00AA00A2FA25}';
  IID_IObjectContextTip: TGUID = '{92FD41CA-BAD9-11D2-9A2D-00C04F797BC9}';
  IID_IPlaybackControl: TGUID = '{51372AFD-CAE7-11CF-BE81-00AA00A2FA25}';
  IID_ISecurityProperty: TGUID = '{51372AEA-CAE7-11CF-BE81-00AA00A2FA25}';
  IID_ICrmCompensator: TGUID = '{BBC01830-8D3B-11D1-82EC-00A0C91EEDE9}';
  IID_ICrmCompensatorVariants: TGUID = '{F0BAF8E4-7804-11D1-82E9-00A0C91EEDE9}';
  IID_ICrmLogControl: TGUID = '{A0E174B3-D26E-11D2-8F84-00805FC7BCD9}';
  IID_ICrmFormatLogRecords: TGUID = '{9C51D821-C98B-11D1-82FB-00A0C91EEDE9}';
  CLASS_Dummy30040732: TGUID = '{ECABB0A9-7F19-11D2-978E-0000F8757E2A}';
  IID_ObjectControl: TGUID = '{7DC41850-0C31-11D0-8B79-00AA00B8A790}';
  IID_IMTxAS: TGUID = '{74C08641-CEDB-11CF-8B49-00AA00B8A790}';
  CLASS_AppServer: TGUID = '{71E38F91-7E88-11CF-9EDE-0080C78B7F89}';
  IID_ObjectContext: TGUID = '{74C08646-CEDB-11CF-8B49-00AA00B8A790}';
  IID_SecurityProperty: TGUID = '{E74A7215-014D-11D1-A63C-00A0C911B4E0}';
  IID_ContextInfo: TGUID = '{19A5A02C-0AC8-11D2-B286-00C04F8EF934}';
  IID_ITransactionContext: TGUID = '{7999FC21-D3C6-11CF-ACAB-00A024A55AEF}';
  CLASS_TransactionContext: TGUID = '{7999FC25-D3C6-11CF-ACAB-00A024A55AEF}';
  IID_ITransactionContextEx: TGUID = '{7999FC22-D3C6-11CF-ACAB-00A024A55AEF}';
  CLASS_TransactionContextEx: TGUID = '{5CB66670-D3D4-11CF-ACAB-00A024A55AEF}';
  IID_ICreateWithTipTransactionEx: TGUID = '{455ACF59-5345-11D2-99CF-00C04F797BC9}';
  IID_ICreateWithTransactionEx: TGUID = '{455ACF57-5345-11D2-99CF-00C04F797BC9}';
  CLASS_ByotServerEx: TGUID = '{ECABB0AA-7F19-11D2-978E-0000F8757E2A}';
  IID_ITransaction: TGUID = '{0FB15084-AF41-11CE-BD2B-204C4F4F5020}';
  IID_ISharedProperty: TGUID = '{2A005C01-A5DE-11CF-9E66-00AA00A3F464}';
  CLASS_SharedProperty: TGUID = '{2A005C05-A5DE-11CF-9E66-00AA00A3F464}';
  IID_ISharedPropertyGroup: TGUID = '{2A005C07-A5DE-11CF-9E66-00AA00A3F464}';
  CLASS_SharedPropertyGroup: TGUID = '{2A005C0B-A5DE-11CF-9E66-00AA00A3F464}';
  IID_ISharedPropertyGroupManager: TGUID = '{2A005C0D-A5DE-11CF-9E66-00AA00A3F464}';
  CLASS_SharedPropertyGroupManager: TGUID = '{2A005C11-A5DE-11CF-9E66-00AA00A3F464}';
  IID_IMtsEvents: TGUID = '{BACEDF4D-74AB-11D0-B162-00AA00BA3258}';
  IID_IMtsEventInfo: TGUID = '{D56C3DC1-8482-11D0-B170-00AA00BA3258}';
  CLASS_COMEvents: TGUID = '{ECABB0AB-7F19-11D2-978E-0000F8757E2A}';
  IID_IMTSLocator: TGUID = '{D19B8BFD-7F88-11D0-B16E-00AA00BA3258}';
  CLASS_CoMTSLocator: TGUID = '{ECABB0AC-7F19-11D2-978E-0000F8757E2A}';
  IID_IMtsGrp: TGUID = '{4B2E958C-0393-11D1-B1AB-00AA00BA3258}';
  CLASS_MtsGrp: TGUID = '{4B2E958D-0393-11D1-B1AB-00AA00BA3258}';
  IID_IComThreadEvents: TGUID = '{683130A5-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComUserEvent: TGUID = '{683130A4-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComAppEvents: TGUID = '{683130A6-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComInstanceEvents: TGUID = '{683130A7-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComTransactionEvents: TGUID = '{683130A8-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComMethodEvents: TGUID = '{683130A9-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComObjectEvents: TGUID = '{683130AA-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComResourceEvents: TGUID = '{683130AB-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComSecurityEvents: TGUID = '{683130AC-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComObjectPoolEvents: TGUID = '{683130AD-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComObjectPoolEvents2: TGUID = '{683130AE-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComObjectConstructionEvents: TGUID = '{683130AF-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComActivityEvents: TGUID = '{683130B0-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComIdentityEvents: TGUID = '{683130B1-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComQCEvents: TGUID = '{683130B2-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComExceptionEvents: TGUID = '{683130B3-2E50-11D2-98A5-00C04F8EE1C4}';
  IID_IComCRMEvents: TGUID = '{683130B5-2E50-11D2-98A5-00C04F8EE1C4}';
  CLASS_ComServiceEvents: TGUID = '{ECABB0C3-7F19-11D2-978E-0000F8757E2A}';
  IID_ICrmMonitorLogRecords: TGUID = '{70C8E441-C7ED-11D1-82FB-00A0C91EEDE9}';
  CLASS_CRMClerk: TGUID = '{ECABB0BD-7F19-11D2-978E-0000F8757E2A}';
  IID_ICrmMonitor: TGUID = '{70C8E443-C7ED-11D1-82FB-00A0C91EEDE9}';
  CLASS_CRMRecoveryClerk: TGUID = '{ECABB0BE-7F19-11D2-978E-0000F8757E2A}';
  IID_ICrmMonitorClerks: TGUID = '{70C8E442-C7ED-11D1-82FB-00A0C91EEDE9}';
  IID_ILBEvents: TGUID = '{683130B4-2E50-11D2-98A5-00C04F8EE1C4}';
  CLASS_LBEvents: TGUID = '{ECABB0C1-7F19-11D2-978E-0000F8757E2A}';
  IID_IMessageMover: TGUID = '{588A085A-B795-11D1-8054-00C04FC340EE}';
  CLASS_MessageMover: TGUID = '{ECABB0BF-7F19-11D2-978E-0000F8757E2A}';
  IID_IDispenserManager: TGUID = '{5CB31E10-2B5F-11CF-BE10-00AA00A2FA25}';
  IID_IDispenserManagerShutdownGuarantee: TGUID = '{5CB31E11-2B5F-11CF-BE10-00AA00A2FA25}';
  IID_IDispenserDriver: TGUID = '{208B3651-2B48-11CF-BE10-00AA00A2FA25}';
  IID_IHolder: TGUID = '{BF6A1850-2B45-11CF-BE10-00AA00A2FA25}';
  CLASS_DispenserManager: TGUID = '{ECABB0C0-7F19-11D2-978E-0000F8757E2A}';
  IID_IReceiveAppData: TGUID = '{413DAFB0-BCF4-11D1-861D-0080C729264D}';
  IID_IGetAppData: TGUID = '{B60040E0-BCF3-11D1-861D-0080C729264D}';
  CLASS_TrackerServer: TGUID = '{ECABAFB9-7F19-11D2-978E-0000F8757E2A}';
  IID_IEventServer: TGUID = '{F1CB0608-EC04-11D1-93AE-00AA00BA3258}';
  IID_IProcessTerminateNotify: TGUID = '{3194B4CF-EF32-11D1-93AE-00AA00BA3258}';
  CLASS_EventServer: TGUID = '{ECABAFBC-7F19-11D2-978E-0000F8757E2A}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagTransactionVote
type
  tagTransactionVote = TOleEnum;
const
  TxCommit = $00000000;
  TxAbort = $00000001;

// Constants for enum __MIDL___MIDL_itf_autosvcs_0343_0001
type
  __MIDL___MIDL_itf_autosvcs_0343_0001 = TOleEnum;
const
  mtsErrCtxAborted = $8004E002;
  mtsErrCtxAborting = $8004E003;
  mtsErrCtxNoContext = $8004E004;
  mtsErrCtxNotRegistered = $8004E005;
  mtsErrCtxSynchTimeout = $8004E006;
  mtsErrCtxOldReference = $8004E007;
  mtsErrCtxRoleNotFound = $8004E00C;
  mtsErrCtxNoSecurity = $8004E00D;
  mtsErrCtxWrongThread = $8004E00E;
  mtsErrCtxTMNotAvailable = $8004E00F;
  comQCErrApplicationNotQueued = $80110600;
  comQCErrNoQueueableInterfaces = $80110601;
  comQCErrQueuingServiceNotAvailable = $80110602;
  comQCErrQueueTransactMismatch = $80110603;
  comqcErrRecorderMarshalled = $80110604;
  comqcErrOutParam = $80110605;
  comqcErrRecorderNotTrusted = $80110606;
  comqcErrPSLoad = $80110607;
  comqcErrMarshaledObjSameTxn = $80110608;
  comqcErrInvalidMessage = $80110650;
  comqcErrMsmqSidUnavailable = $80110651;
  comqcErrWrongMsgExtension = $80110652;
  comqcErrMsmqServiceUnavailable = $80110653;
  comqcErrMsgNotAuthenticated = $80110654;
  comqcErrMsmqConnectorUsed = $80110655;
  comqcErrBadMarshaledObject = $80110656;

// Constants for enum __MIDL___MIDL_itf_autosvcs_0343_0002
type
  __MIDL___MIDL_itf_autosvcs_0343_0002 = TOleEnum;
const
  LockSetGet = $00000000;
  LockMethod = $00000001;

// Constants for enum __MIDL___MIDL_itf_autosvcs_0343_0003
type
  __MIDL___MIDL_itf_autosvcs_0343_0003 = TOleEnum;
const
  Standard = $00000000;
  Process = $00000001;

// Constants for enum tagCRMFLAGS
type
  tagCRMFLAGS = TOleEnum;
const
  CRMFLAG_FORGETTARGET = $00000001;
  CRMFLAG_WRITTENDURINGPREPARE = $00000002;
  CRMFLAG_WRITTENDURINGCOMMIT = $00000004;
  CRMFLAG_WRITTENDURINGABORT = $00000008;
  CRMFLAG_WRITTENDURINGRECOVERY = $00000010;
  CRMFLAG_WRITTENDURINGREPLAY = $00000020;
  CRMFLAG_REPLAYINPROGRESS = $00000040;

// Constants for enum tagCRMREGFLAGS
type
  tagCRMREGFLAGS = TOleEnum;
const
  CRMREGFLAG_PREPAREPHASE = $00000001;
  CRMREGFLAG_COMMITPHASE = $00000002;
  CRMREGFLAG_ABORTPHASE = $00000004;
  CRMREGFLAG_ALLPHASES = $00000007;
  CRMREGFLAG_FAILIFINDOUBTSREMAIN = $00000010;

// Constants for enum tagCrmTransactionState
type
  tagCrmTransactionState = TOleEnum;
const
  TxState_Active = $00000000;
  TxState_Committed = $00000001;
  TxState_Aborted = $00000002;
  TxState_Indoubt = $00000003;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISecurityCertificateColl = interface;
  ISecurityCertificateCollDisp = dispinterface;
  ISecurityIdentityColl = interface;
  ISecurityIdentityCollDisp = dispinterface;
  ISecurityCallersColl = interface;
  ISecurityCallersCollDisp = dispinterface;
  ISecurityCallContext = interface;
  ISecurityCallContextDisp = dispinterface;
  IGetSecurityCallContext = interface;
  IGetSecurityCallContextDisp = dispinterface;
  IContextState = interface;
  IObjectContext = interface;
  IObjectContextActivity = interface;
  IObjectContextInfo = interface;
  IObjectConstruct = interface;
  IObjectConstructString = interface;
  IObjectConstructStringDisp = dispinterface;
  IObjectControl = interface;
  IObjectContextTip = interface;
  IPlaybackControl = interface;
  ISecurityProperty = interface;
  ICrmCompensator = interface;
  ICrmCompensatorVariants = interface;
  ICrmLogControl = interface;
  ICrmFormatLogRecords = interface;
  ObjectControl = interface;
  IMTxAS = interface;
  IMTxASDisp = dispinterface;
  ObjectContext = interface;
  ObjectContextDisp = dispinterface;
  SecurityProperty = interface;
  SecurityPropertyDisp = dispinterface;
  ContextInfo = interface;
  ContextInfoDisp = dispinterface;
  ITransactionContext = interface;
  ITransactionContextDisp = dispinterface;
  ITransactionContextEx = interface;
  ICreateWithTipTransactionEx = interface;
  ICreateWithTransactionEx = interface;
  ITransaction = interface;
  ISharedProperty = interface;
  ISharedPropertyDisp = dispinterface;
  ISharedPropertyGroup = interface;
  ISharedPropertyGroupDisp = dispinterface;
  ISharedPropertyGroupManager = interface;
  ISharedPropertyGroupManagerDisp = dispinterface;
  IMtsEvents = interface;
  IMtsEventsDisp = dispinterface;
  IMtsEventInfo = interface;
  IMtsEventInfoDisp = dispinterface;
  IMTSLocator = interface;
  IMTSLocatorDisp = dispinterface;
  IMtsGrp = interface;
  IMtsGrpDisp = dispinterface;
  IComThreadEvents = interface;
  IComUserEvent = interface;
  IComAppEvents = interface;
  IComInstanceEvents = interface;
  IComTransactionEvents = interface;
  IComMethodEvents = interface;
  IComObjectEvents = interface;
  IComResourceEvents = interface;
  IComSecurityEvents = interface;
  IComObjectPoolEvents = interface;
  IComObjectPoolEvents2 = interface;
  IComObjectConstructionEvents = interface;
  IComActivityEvents = interface;
  IComIdentityEvents = interface;
  IComQCEvents = interface;
  IComExceptionEvents = interface;
  IComCRMEvents = interface;
  ICrmMonitorLogRecords = interface;
  ICrmMonitor = interface;
  ICrmMonitorClerks = interface;
  ICrmMonitorClerksDisp = dispinterface;
  ILBEvents = interface;
  IMessageMover = interface;
  IMessageMoverDisp = dispinterface;
  IDispenserManager = interface;
  IDispenserManagerShutdownGuarantee = interface;
  IDispenserDriver = interface;
  IHolder = interface;
  IReceiveAppData = interface;
  IGetAppData = interface;
  IEventServer = interface;
  IProcessTerminateNotify = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SecurityCertificate = ISecurityCertificateColl;
  SecurityIdentity = ISecurityIdentityColl;
  SecurityCallers = ISecurityCallersColl;
  SecurityCallContext = ISecurityCallContext;
  GetSecurityCallContextAppObject = IGetSecurityCallContext;
  Dummy30040732 = IObjectContext;
  AppServer = IMTxAS;
  TransactionContext = ITransactionContext;
  TransactionContextEx = ITransactionContextEx;
  ByotServerEx = ICreateWithTipTransactionEx;
  SharedProperty = ISharedProperty;
  SharedPropertyGroup = ISharedPropertyGroup;
  SharedPropertyGroupManager = ISharedPropertyGroupManager;
  COMEvents = IMtsEvents;
  CoMTSLocator = IMTSLocator;
  MtsGrp = IMtsGrp;
  ComServiceEvents = IComThreadEvents;
  CRMClerk = ICrmLogControl;
  CRMRecoveryClerk = ICrmMonitor;
  LBEvents = ILBEvents;
  MessageMover = IMessageMover;
  DispenserManager = IDispenserManager;
  TrackerServer = IReceiveAppData;
  EventServer = IEventServer;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}
  PUserType1 = ^TGUID; {*}
  PIUnknown1 = ^IUnknown; {*}
  PPPrivateAlias1 = ^Pointer; {*}
  PUserType2 = ^TGUID; {*}
  PUserType3 = ^TGUID; {*}
  PUserType4 = ^COMSVCSEVENTINFO; {*}
  PByte1 = ^Byte; {*}
  PUserType5 = ^CLSIDDATA; {*}
  PUserType6 = ^appData; {*}

  tagBLOB = packed record
    cbSize: LongWord;
    pBlobData: ^Byte;
  end;

  tagCrmLogRecordRead = packed record
    dwCrmFlags: LongWord;
    dwSequenceNumber: LongWord;
    blobUserData: TGUID;
  end;

  Error_Constants = __MIDL___MIDL_itf_autosvcs_0343_0001; 

  BOID = packed record
    rgb: array[0..15] of Byte;
  end;

  XACTTRANSINFO = packed record
    uow: TGUID;
    isoLevel: Integer;
    isoFlags: LongWord;
    grfTCSupported: LongWord;
    grfRMSupported: LongWord;
    grfTCSupportedRetaining: LongWord;
    grfRMSupportedRetaining: LongWord;
  end;

  LockModes = __MIDL___MIDL_itf_autosvcs_0343_0002; 
  ReleaseModes = __MIDL___MIDL_itf_autosvcs_0343_0003; 

  __MIDL___MIDL_itf_autosvcs_0279_0001 = packed record
    cbSize: LongWord;
    dwPid: LongWord;
    lTime: Int64;
    lMicroTime: Integer;
    perfCount: Int64;
    guidApp: TGUID;
    sMachineName: PWideChar;
  end;

  COMSVCSEVENTINFO = TGUID; 
  ULONG_PTR = LongWord; 

  CAppStatistics = packed record
    m_cTotalCalls: LongWord;
    m_cTotalInstances: LongWord;
    m_cTotalClasses: LongWord;
    m_cCallsPerSecond: LongWord;
  end;

  APPSTATISTICS = TGUID; 

  CCLSIDData = packed record
    m_clsid: TGUID;
    m_cReferences: LongWord;
    m_cBound: LongWord;
    m_cPooled: LongWord;
    m_cInCall: LongWord;
    m_dwRespTime: LongWord;
    m_cCallsCompleted: LongWord;
    m_cCallsFailed: LongWord;
  end;

  CLSIDDATA = TGUID; 

  CAppData = packed record
    m_idApp: LongWord;
    m_szAppGuid: array[0..39] of Word;
    m_dwAppProcessId: LongWord;
    m_AppStatistics: TGUID;
  end;

  appData = TGUID; 
  PrivateAlias1 = array[0..59] of Word; {*}

// *********************************************************************//
// Interface: ISecurityCertificateColl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823B-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCertificateColl = interface(IDispatch)
    ['{CAFC823B-B441-11D1-B82B-0000F8757E2A}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(const name: WideString): OleVariant; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[const name: WideString]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ISecurityCertificateCollDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823B-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCertificateCollDisp = dispinterface
    ['{CAFC823B-B441-11D1-B82B-0000F8757E2A}']
    property Count: Integer readonly dispid 1610743808;
    property Item[const name: WideString]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISecurityIdentityColl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823C-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityIdentityColl = interface(IDispatch)
    ['{CAFC823C-B441-11D1-B82B-0000F8757E2A}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(const name: WideString): OleVariant; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[const name: WideString]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ISecurityIdentityCollDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823C-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityIdentityCollDisp = dispinterface
    ['{CAFC823C-B441-11D1-B82B-0000F8757E2A}']
    property Count: Integer readonly dispid 1610743808;
    property Item[const name: WideString]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISecurityCallersColl
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823D-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCallersColl = interface(IDispatch)
    ['{CAFC823D-B441-11D1-B82B-0000F8757E2A}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(lIndex: Integer): ISecurityIdentityColl; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property Item[lIndex: Integer]: ISecurityIdentityColl read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ISecurityCallersCollDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823D-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCallersCollDisp = dispinterface
    ['{CAFC823D-B441-11D1-B82B-0000F8757E2A}']
    property Count: Integer readonly dispid 1610743808;
    property Item[lIndex: Integer]: ISecurityIdentityColl readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: ISecurityCallContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823E-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCallContext = interface(IDispatch)
    ['{CAFC823E-B441-11D1-B82B-0000F8757E2A}']
    function  Get_Count: Integer; safecall;
    function  Get_Item(const name: WideString): OleVariant; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  IsCallerInRole(const bstrRole: WideString): WordBool; safecall;
    function  IsSecurityEnabled: WordBool; safecall;
    function  IsUserInRole(var pUser: OleVariant; const bstrRole: WideString): WordBool; safecall;
    property Count: Integer read Get_Count;
    property Item[const name: WideString]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ISecurityCallContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823E-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  ISecurityCallContextDisp = dispinterface
    ['{CAFC823E-B441-11D1-B82B-0000F8757E2A}']
    property Count: Integer readonly dispid 1610743813;
    property Item[const name: WideString]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    function  IsCallerInRole(const bstrRole: WideString): WordBool; dispid 1610743814;
    function  IsSecurityEnabled: WordBool; dispid 1610743815;
    function  IsUserInRole(var pUser: OleVariant; const bstrRole: WideString): WordBool; dispid 1610743816;
  end;

// *********************************************************************//
// Interface: IGetSecurityCallContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823F-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  IGetSecurityCallContext = interface(IDispatch)
    ['{CAFC823F-B441-11D1-B82B-0000F8757E2A}']
    function  GetSecurityCallContext: ISecurityCallContext; safecall;
  end;

// *********************************************************************//
// DispIntf:  IGetSecurityCallContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {CAFC823F-B441-11D1-B82B-0000F8757E2A}
// *********************************************************************//
  IGetSecurityCallContextDisp = dispinterface
    ['{CAFC823F-B441-11D1-B82B-0000F8757E2A}']
    function  GetSecurityCallContext: ISecurityCallContext; dispid 1610743808;
  end;

// *********************************************************************//
// Interface: IContextState
// Flags:     (0)
// GUID:      {3C05E54B-A42A-11D2-AFC4-00C04F8EE1C4}
// *********************************************************************//
  IContextState = interface(IUnknown)
    ['{3C05E54B-A42A-11D2-AFC4-00C04F8EE1C4}']
    function  SetDeactivateOnReturn(bDeactivate: WordBool): HResult; stdcall;
    function  GetDeactivateOnReturn(out pbDeactivate: WordBool): HResult; stdcall;
    function  SetMyTransactionVote(txVote: tagTransactionVote): HResult; stdcall;
    function  GetMyTransactionVote(out ptxVote: tagTransactionVote): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectContext
// Flags:     (0)
// GUID:      {51372AE0-CAE7-11CF-BE81-00AA00A2FA25}
// *********************************************************************//
  IObjectContext = interface(IUnknown)
    ['{51372AE0-CAE7-11CF-BE81-00AA00A2FA25}']
    function  CreateInstance(var rclsid: TGUID; var riid: TGUID; out ppv: Pointer): HResult; stdcall;
    function  SetComplete: HResult; stdcall;
    function  SetAbort: HResult; stdcall;
    function  EnableCommit: HResult; stdcall;
    function  DisableCommit: HResult; stdcall;
    function  IsInTransaction: Integer; stdcall;
    function  IsSecurityEnabled: Integer; stdcall;
    function  IsCallerInRole(const bstrRole: WideString; out pfIsInRole: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectContextActivity
// Flags:     (0)
// GUID:      {51372AFC-CAE7-11CF-BE81-00AA00A2FA25}
// *********************************************************************//
  IObjectContextActivity = interface(IUnknown)
    ['{51372AFC-CAE7-11CF-BE81-00AA00A2FA25}']
    function  GetActivityId(out pGUID: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectContextInfo
// Flags:     (0)
// GUID:      {75B52DDB-E8ED-11D1-93AD-00AA00BA3258}
// *********************************************************************//
  IObjectContextInfo = interface(IUnknown)
    ['{75B52DDB-E8ED-11D1-93AD-00AA00BA3258}']
    function  IsInTransaction: Integer; stdcall;
    function  GetTransaction(var pptrans: IUnknown): HResult; stdcall;
    function  GetTransactionId(out pGUID: TGUID): HResult; stdcall;
    function  GetActivityId(out pGUID: TGUID): HResult; stdcall;
    function  GetContextId(out pGUID: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectConstruct
// Flags:     (0)
// GUID:      {41C4F8B3-7439-11D2-98CB-00C04F8EE1C4}
// *********************************************************************//
  IObjectConstruct = interface(IUnknown)
    ['{41C4F8B3-7439-11D2-98CB-00C04F8EE1C4}']
    function  Construct(const pCtorObj: IDispatch): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectConstructString
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41C4F8B2-7439-11D2-98CB-00C04F8EE1C4}
// *********************************************************************//
  IObjectConstructString = interface(IDispatch)
    ['{41C4F8B2-7439-11D2-98CB-00C04F8EE1C4}']
    function  Get_ConstructString: WideString; safecall;
    property ConstructString: WideString read Get_ConstructString;
  end;

// *********************************************************************//
// DispIntf:  IObjectConstructStringDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {41C4F8B2-7439-11D2-98CB-00C04F8EE1C4}
// *********************************************************************//
  IObjectConstructStringDisp = dispinterface
    ['{41C4F8B2-7439-11D2-98CB-00C04F8EE1C4}']
    property ConstructString: WideString readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IObjectControl
// Flags:     (0)
// GUID:      {51372AEC-CAE7-11CF-BE81-00AA00A2FA25}
// *********************************************************************//
  IObjectControl = interface(IUnknown)
    ['{51372AEC-CAE7-11CF-BE81-00AA00A2FA25}']
    function  Activate: HResult; stdcall;
    procedure Deactivate; stdcall;
    function  CanBePooled: Integer; stdcall;
  end;

// *********************************************************************//
// Interface: IObjectContextTip
// Flags:     (0)
// GUID:      {92FD41CA-BAD9-11D2-9A2D-00C04F797BC9}
// *********************************************************************//
  IObjectContextTip = interface(IUnknown)
    ['{92FD41CA-BAD9-11D2-9A2D-00C04F797BC9}']
    function  GetTipUrl(out pTipUrl: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IPlaybackControl
// Flags:     (0)
// GUID:      {51372AFD-CAE7-11CF-BE81-00AA00A2FA25}
// *********************************************************************//
  IPlaybackControl = interface(IUnknown)
    ['{51372AFD-CAE7-11CF-BE81-00AA00A2FA25}']
    function  FinalClientRetry: HResult; stdcall;
    function  FinalServerRetry: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISecurityProperty
// Flags:     (0)
// GUID:      {51372AEA-CAE7-11CF-BE81-00AA00A2FA25}
// *********************************************************************//
  ISecurityProperty = interface(IUnknown)
    ['{51372AEA-CAE7-11CF-BE81-00AA00A2FA25}']
    function  GetDirectCreatorSID(pSID: PPPrivateAlias1): HResult; stdcall;
    function  GetOriginalCreatorSID(pSID: PPPrivateAlias1): HResult; stdcall;
    function  GetDirectCallerSID(pSID: PPPrivateAlias1): HResult; stdcall;
    function  GetOriginalCallerSID(pSID: PPPrivateAlias1): HResult; stdcall;
    function  ReleaseSID(var pSID: Pointer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmCompensator
// Flags:     (0)
// GUID:      {BBC01830-8D3B-11D1-82EC-00A0C91EEDE9}
// *********************************************************************//
  ICrmCompensator = interface(IUnknown)
    ['{BBC01830-8D3B-11D1-82EC-00A0C91EEDE9}']
    function  SetLogControl(const pLogControl: ICrmLogControl): HResult; stdcall;
    function  BeginPrepare: HResult; stdcall;
    function  PrepareRecord(crmLogRec: TGUID; out pfForget: Integer): HResult; stdcall;
    function  EndPrepare(out pfOkToPrepare: Integer): HResult; stdcall;
    function  BeginCommit(fRecovery: Integer): HResult; stdcall;
    function  CommitRecord(crmLogRec: TGUID; out pfForget: Integer): HResult; stdcall;
    function  EndCommit: HResult; stdcall;
    function  BeginAbort(fRecovery: Integer): HResult; stdcall;
    function  AbortRecord(crmLogRec: TGUID; out pfForget: Integer): HResult; stdcall;
    function  EndAbort: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmCompensatorVariants
// Flags:     (0)
// GUID:      {F0BAF8E4-7804-11D1-82E9-00A0C91EEDE9}
// *********************************************************************//
  ICrmCompensatorVariants = interface(IUnknown)
    ['{F0BAF8E4-7804-11D1-82E9-00A0C91EEDE9}']
    function  SetLogControlVariants(const pLogControl: ICrmLogControl): HResult; stdcall;
    function  BeginPrepareVariants: HResult; stdcall;
    function  PrepareRecordVariants(var pLogRecord: OleVariant; out pbForget: WordBool): HResult; stdcall;
    function  EndPrepareVariants(out pbOkToPrepare: WordBool): HResult; stdcall;
    function  BeginCommitVariants(bRecovery: WordBool): HResult; stdcall;
    function  CommitRecordVariants(var pLogRecord: OleVariant; out pbForget: WordBool): HResult; stdcall;
    function  EndCommitVariants: HResult; stdcall;
    function  BeginAbortVariants(bRecovery: WordBool): HResult; stdcall;
    function  AbortRecordVariants(var pLogRecord: OleVariant; out pbForget: WordBool): HResult; stdcall;
    function  EndAbortVariants: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmLogControl
// Flags:     (0)
// GUID:      {A0E174B3-D26E-11D2-8F84-00805FC7BCD9}
// *********************************************************************//
  ICrmLogControl = interface(IUnknown)
    ['{A0E174B3-D26E-11D2-8F84-00805FC7BCD9}']
    function  Get_TransactionUOW(out pVal: WideString): HResult; stdcall;
    function  RegisterCompensator(lpcwstrProgIdCompensator: PWideChar; 
                                  lpcwstrDescription: PWideChar; lCrmRegFlags: Integer): HResult; stdcall;
    function  WriteLogRecordVariants(var pLogRecord: OleVariant): HResult; stdcall;
    function  ForceLog: HResult; stdcall;
    function  ForgetLogRecord: HResult; stdcall;
    function  ForceTransactionToAbort: HResult; stdcall;
    function  WriteLogRecord(var rgBlob: TGUID; cBlob: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmFormatLogRecords
// Flags:     (0)
// GUID:      {9C51D821-C98B-11D1-82FB-00A0C91EEDE9}
// *********************************************************************//
  ICrmFormatLogRecords = interface(IUnknown)
    ['{9C51D821-C98B-11D1-82FB-00A0C91EEDE9}']
    function  GetColumnCount(out plColumnCount: Integer): HResult; stdcall;
    function  GetColumnHeaders(out pHeaders: OleVariant): HResult; stdcall;
    function  GetColumn(crmLogRec: TGUID; out pFormattedLogRecord: OleVariant): HResult; stdcall;
    function  GetColumnVariants(LogRecord: OleVariant; out pFormattedLogRecord: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ObjectControl
// Flags:     (256) OleAutomation
// GUID:      {7DC41850-0C31-11D0-8B79-00AA00B8A790}
// *********************************************************************//
  ObjectControl = interface(IUnknown)
    ['{7DC41850-0C31-11D0-8B79-00AA00B8A790}']
    function  Activate: HResult; stdcall;
    function  Deactivate: HResult; stdcall;
    function  CanBePooled(out pbPoolable: WordBool): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMTxAS
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74C08641-CEDB-11CF-8B49-00AA00B8A790}
// *********************************************************************//
  IMTxAS = interface(IDispatch)
    ['{74C08641-CEDB-11CF-8B49-00AA00B8A790}']
    function  GetObjectContext: ObjectContext; safecall;
    function  SafeRef(vRefIn: OleVariant): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMTxASDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74C08641-CEDB-11CF-8B49-00AA00B8A790}
// *********************************************************************//
  IMTxASDisp = dispinterface
    ['{74C08641-CEDB-11CF-8B49-00AA00B8A790}']
    function  GetObjectContext: ObjectContext; dispid 1610743808;
    function  SafeRef(vRefIn: OleVariant): OleVariant; dispid 1610743809;
  end;

// *********************************************************************//
// Interface: ObjectContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74C08646-CEDB-11CF-8B49-00AA00B8A790}
// *********************************************************************//
  ObjectContext = interface(IDispatch)
    ['{74C08646-CEDB-11CF-8B49-00AA00B8A790}']
    function  CreateInstance(const bstrProgID: WideString): OleVariant; safecall;
    procedure SetComplete; safecall;
    procedure SetAbort; safecall;
    procedure EnableCommit; safecall;
    procedure DisableCommit; safecall;
    function  IsInTransaction: WordBool; safecall;
    function  IsSecurityEnabled: WordBool; safecall;
    function  IsCallerInRole(const bstrRole: WideString): WordBool; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Item(const name: WideString): OleVariant; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Security: SecurityProperty; safecall;
    function  Get_ContextInfo: ContextInfo; safecall;
    property Count: Integer read Get_Count;
    property Item[const name: WideString]: OleVariant read Get_Item; default;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Security: SecurityProperty read Get_Security;
    property ContextInfo: ContextInfo read Get_ContextInfo;
  end;

// *********************************************************************//
// DispIntf:  ObjectContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {74C08646-CEDB-11CF-8B49-00AA00B8A790}
// *********************************************************************//
  ObjectContextDisp = dispinterface
    ['{74C08646-CEDB-11CF-8B49-00AA00B8A790}']
    function  CreateInstance(const bstrProgID: WideString): OleVariant; dispid 1610743808;
    procedure SetComplete; dispid 1610743809;
    procedure SetAbort; dispid 1610743810;
    procedure EnableCommit; dispid 1610743811;
    procedure DisableCommit; dispid 1610743812;
    function  IsInTransaction: WordBool; dispid 1610743813;
    function  IsSecurityEnabled: WordBool; dispid 1610743814;
    function  IsCallerInRole(const bstrRole: WideString): WordBool; dispid 1610743815;
    property Count: Integer readonly dispid 1610743840;
    property Item[const name: WideString]: OleVariant readonly dispid 0; default;
    property _NewEnum: IUnknown readonly dispid -4;
    property Security: SecurityProperty readonly dispid 1610743843;
    property ContextInfo: ContextInfo readonly dispid 1610743844;
  end;

// *********************************************************************//
// Interface: SecurityProperty
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E74A7215-014D-11D1-A63C-00A0C911B4E0}
// *********************************************************************//
  SecurityProperty = interface(IDispatch)
    ['{E74A7215-014D-11D1-A63C-00A0C911B4E0}']
    function  GetDirectCallerName: WideString; safecall;
    function  GetDirectCreatorName: WideString; safecall;
    function  GetOriginalCallerName: WideString; safecall;
    function  GetOriginalCreatorName: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  SecurityPropertyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E74A7215-014D-11D1-A63C-00A0C911B4E0}
// *********************************************************************//
  SecurityPropertyDisp = dispinterface
    ['{E74A7215-014D-11D1-A63C-00A0C911B4E0}']
    function  GetDirectCallerName: WideString; dispid 1610743808;
    function  GetDirectCreatorName: WideString; dispid 1610743809;
    function  GetOriginalCallerName: WideString; dispid 1610743810;
    function  GetOriginalCreatorName: WideString; dispid 1610743811;
  end;

// *********************************************************************//
// Interface: ContextInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19A5A02C-0AC8-11D2-B286-00C04F8EF934}
// *********************************************************************//
  ContextInfo = interface(IDispatch)
    ['{19A5A02C-0AC8-11D2-B286-00C04F8EF934}']
    function  IsInTransaction: WordBool; safecall;
    function  GetTransaction: IUnknown; safecall;
    function  GetTransactionId: WideString; safecall;
    function  GetActivityId: WideString; safecall;
    function  GetContextId: WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  ContextInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {19A5A02C-0AC8-11D2-B286-00C04F8EF934}
// *********************************************************************//
  ContextInfoDisp = dispinterface
    ['{19A5A02C-0AC8-11D2-B286-00C04F8EF934}']
    function  IsInTransaction: WordBool; dispid 100671488;
    function  GetTransaction: IUnknown; dispid 1610743811;
    function  GetTransactionId: WideString; dispid 1610743812;
    function  GetActivityId: WideString; dispid 1610743813;
    function  GetContextId: WideString; dispid 1610743814;
  end;

// *********************************************************************//
// Interface: ITransactionContext
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7999FC21-D3C6-11CF-ACAB-00A024A55AEF}
// *********************************************************************//
  ITransactionContext = interface(IDispatch)
    ['{7999FC21-D3C6-11CF-ACAB-00A024A55AEF}']
    function  CreateInstance(const pszProgId: WideString): OleVariant; safecall;
    procedure Commit; safecall;
    procedure Abort; safecall;
  end;

// *********************************************************************//
// DispIntf:  ITransactionContextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7999FC21-D3C6-11CF-ACAB-00A024A55AEF}
// *********************************************************************//
  ITransactionContextDisp = dispinterface
    ['{7999FC21-D3C6-11CF-ACAB-00A024A55AEF}']
    function  CreateInstance(const pszProgId: WideString): OleVariant; dispid 0;
    procedure Commit; dispid 1;
    procedure Abort; dispid 2;
  end;

// *********************************************************************//
// Interface: ITransactionContextEx
// Flags:     (0)
// GUID:      {7999FC22-D3C6-11CF-ACAB-00A024A55AEF}
// *********************************************************************//
  ITransactionContextEx = interface(IUnknown)
    ['{7999FC22-D3C6-11CF-ACAB-00A024A55AEF}']
    function  CreateInstance(var rclsid: TGUID; var riid: TGUID; out pObject: Pointer): HResult; stdcall;
    function  Commit: HResult; stdcall;
    function  Abort: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICreateWithTipTransactionEx
// Flags:     (0)
// GUID:      {455ACF59-5345-11D2-99CF-00C04F797BC9}
// *********************************************************************//
  ICreateWithTipTransactionEx = interface(IUnknown)
    ['{455ACF59-5345-11D2-99CF-00C04F797BC9}']
    function  CreateInstance(const bstrTipUrl: WideString; var rclsid: TGUID; var riid: TGUID; 
                             out pObject: Pointer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICreateWithTransactionEx
// Flags:     (0)
// GUID:      {455ACF57-5345-11D2-99CF-00C04F797BC9}
// *********************************************************************//
  ICreateWithTransactionEx = interface(IUnknown)
    ['{455ACF57-5345-11D2-99CF-00C04F797BC9}']
    function  CreateInstance(const pTransaction: ITransaction; var rclsid: TGUID; var riid: TGUID; 
                             out pObject: Pointer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ITransaction
// Flags:     (0)
// GUID:      {0FB15084-AF41-11CE-BD2B-204C4F4F5020}
// *********************************************************************//
  ITransaction = interface(IUnknown)
    ['{0FB15084-AF41-11CE-BD2B-204C4F4F5020}']
    function  Commit(fRetaining: Integer; grfTC: LongWord; grfRM: LongWord): HResult; stdcall;
    function  Abort(var pboidReason: TGUID; fRetaining: Integer; fAsync: Integer): HResult; stdcall;
    function  GetTransactionInfo(out pinfo: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ISharedProperty
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C01-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedProperty = interface(IDispatch)
    ['{2A005C01-A5DE-11CF-9E66-00AA00A3F464}']
    function  Get_Value: OleVariant; safecall;
    procedure Set_Value(pVal: OleVariant); safecall;
    property Value: OleVariant read Get_Value write Set_Value;
  end;

// *********************************************************************//
// DispIntf:  ISharedPropertyDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C01-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedPropertyDisp = dispinterface
    ['{2A005C01-A5DE-11CF-9E66-00AA00A3F464}']
    property Value: OleVariant dispid 0;
  end;

// *********************************************************************//
// Interface: ISharedPropertyGroup
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C07-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedPropertyGroup = interface(IDispatch)
    ['{2A005C07-A5DE-11CF-9E66-00AA00A3F464}']
    function  CreatePropertyByPosition(Index: SYSINT; out fExists: WordBool): ISharedProperty; safecall;
    function  Get_PropertyByPosition(Index: SYSINT): ISharedProperty; safecall;
    function  CreateProperty(const name: WideString; out fExists: WordBool): ISharedProperty; safecall;
    function  Get_Property_(const name: WideString): ISharedProperty; safecall;
    property PropertyByPosition[Index: SYSINT]: ISharedProperty read Get_PropertyByPosition;
    property Property_[const name: WideString]: ISharedProperty read Get_Property_;
  end;

// *********************************************************************//
// DispIntf:  ISharedPropertyGroupDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C07-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedPropertyGroupDisp = dispinterface
    ['{2A005C07-A5DE-11CF-9E66-00AA00A3F464}']
    function  CreatePropertyByPosition(Index: SYSINT; out fExists: WordBool): ISharedProperty; dispid 1;
    property PropertyByPosition[Index: SYSINT]: ISharedProperty readonly dispid 2;
    function  CreateProperty(const name: WideString; out fExists: WordBool): ISharedProperty; dispid 3;
    property Property_[const name: WideString]: ISharedProperty readonly dispid 4;
  end;

// *********************************************************************//
// Interface: ISharedPropertyGroupManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C0D-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedPropertyGroupManager = interface(IDispatch)
    ['{2A005C0D-A5DE-11CF-9E66-00AA00A3F464}']
    function  CreatePropertyGroup(const name: WideString; var dwIsoMode: Integer; 
                                  var dwRelMode: Integer; out fExists: WordBool): ISharedPropertyGroup; safecall;
    function  Get_Group(const name: WideString): ISharedPropertyGroup; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    property Group[const name: WideString]: ISharedPropertyGroup read Get_Group;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  ISharedPropertyGroupManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2A005C0D-A5DE-11CF-9E66-00AA00A3F464}
// *********************************************************************//
  ISharedPropertyGroupManagerDisp = dispinterface
    ['{2A005C0D-A5DE-11CF-9E66-00AA00A3F464}']
    function  CreatePropertyGroup(const name: WideString; var dwIsoMode: Integer; 
                                  var dwRelMode: Integer; out fExists: WordBool): ISharedPropertyGroup; dispid 1;
    property Group[const name: WideString]: ISharedPropertyGroup readonly dispid 2;
    property _NewEnum: IUnknown readonly dispid -4;
  end;

// *********************************************************************//
// Interface: IMtsEvents
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BACEDF4D-74AB-11D0-B162-00AA00BA3258}
// *********************************************************************//
  IMtsEvents = interface(IDispatch)
    ['{BACEDF4D-74AB-11D0-B162-00AA00BA3258}']
    function  Get_PackageName: WideString; safecall;
    function  Get_PackageGuid: WideString; safecall;
    procedure PostEvent(var vEvent: OleVariant); safecall;
    function  Get_FireEvents: WordBool; safecall;
    function  GetProcessID: Integer; safecall;
    property PackageName: WideString read Get_PackageName;
    property PackageGuid: WideString read Get_PackageGuid;
    property FireEvents: WordBool read Get_FireEvents;
  end;

// *********************************************************************//
// DispIntf:  IMtsEventsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BACEDF4D-74AB-11D0-B162-00AA00BA3258}
// *********************************************************************//
  IMtsEventsDisp = dispinterface
    ['{BACEDF4D-74AB-11D0-B162-00AA00BA3258}']
    property PackageName: WideString readonly dispid 1;
    property PackageGuid: WideString readonly dispid 2;
    procedure PostEvent(var vEvent: OleVariant); dispid 5;
    property FireEvents: WordBool readonly dispid 6;
    function  GetProcessID: Integer; dispid 7;
  end;

// *********************************************************************//
// Interface: IMtsEventInfo
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56C3DC1-8482-11D0-B170-00AA00BA3258}
// *********************************************************************//
  IMtsEventInfo = interface(IDispatch)
    ['{D56C3DC1-8482-11D0-B170-00AA00BA3258}']
    function  Get_Names: IUnknown; safecall;
    function  Get_DisplayName: WideString; safecall;
    function  Get_EventID: WideString; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Value(const sKey: WideString): OleVariant; safecall;
    property Names: IUnknown read Get_Names;
    property DisplayName: WideString read Get_DisplayName;
    property EventID: WideString read Get_EventID;
    property Count: Integer read Get_Count;
    property Value[const sKey: WideString]: OleVariant read Get_Value;
  end;

// *********************************************************************//
// DispIntf:  IMtsEventInfoDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56C3DC1-8482-11D0-B170-00AA00BA3258}
// *********************************************************************//
  IMtsEventInfoDisp = dispinterface
    ['{D56C3DC1-8482-11D0-B170-00AA00BA3258}']
    property Names: IUnknown readonly dispid 1610743808;
    property DisplayName: WideString readonly dispid 1;
    property EventID: WideString readonly dispid 1610743810;
    property Count: Integer readonly dispid 1610743811;
    property Value[const sKey: WideString]: OleVariant readonly dispid 1610743812;
  end;

// *********************************************************************//
// Interface: IMTSLocator
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D19B8BFD-7F88-11D0-B16E-00AA00BA3258}
// *********************************************************************//
  IMTSLocator = interface(IDispatch)
    ['{D19B8BFD-7F88-11D0-B16E-00AA00BA3258}']
    function  GetEventDispatcher: IUnknown; safecall;
  end;

// *********************************************************************//
// DispIntf:  IMTSLocatorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D19B8BFD-7F88-11D0-B16E-00AA00BA3258}
// *********************************************************************//
  IMTSLocatorDisp = dispinterface
    ['{D19B8BFD-7F88-11D0-B16E-00AA00BA3258}']
    function  GetEventDispatcher: IUnknown; dispid 1;
  end;

// *********************************************************************//
// Interface: IMtsGrp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B2E958C-0393-11D1-B1AB-00AA00BA3258}
// *********************************************************************//
  IMtsGrp = interface(IDispatch)
    ['{4B2E958C-0393-11D1-B1AB-00AA00BA3258}']
    function  Get_Count: Integer; safecall;
    procedure Item(lIndex: Integer; out ppUnkDispatcher: IUnknown); safecall;
    procedure Refresh; safecall;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IMtsGrpDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4B2E958C-0393-11D1-B1AB-00AA00BA3258}
// *********************************************************************//
  IMtsGrpDisp = dispinterface
    ['{4B2E958C-0393-11D1-B1AB-00AA00BA3258}']
    property Count: Integer readonly dispid 1;
    procedure Item(lIndex: Integer; out ppUnkDispatcher: IUnknown); dispid 2;
    procedure Refresh; dispid 3;
  end;

// *********************************************************************//
// Interface: IComThreadEvents
// Flags:     (16) Hidden
// GUID:      {683130A5-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComThreadEvents = interface(IUnknown)
    ['{683130A5-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnThreadStart(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; dwThread: LongWord; 
                            dwTheadCnt: LongWord): HResult; stdcall;
    function  OnThreadTerminate(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                dwThread: LongWord; dwTheadCnt: LongWord): HResult; stdcall;
    function  OnThreadBindToApartment(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                      AptID: Largeuint; dwActCnt: LongWord; dwLowCnt: LongWord): HResult; stdcall;
    function  OnThreadUnBind(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; AptID: Largeuint; 
                             dwActCnt: LongWord): HResult; stdcall;
    function  OnThreadWorkEnque(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                MsgWorkID: Largeuint; QueueLen: LongWord): HResult; stdcall;
    function  OnThreadWorkPrivate(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                  MsgWorkID: Largeuint): HResult; stdcall;
    function  OnThreadWorkPublic(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                 MsgWorkID: Largeuint; QueueLen: LongWord): HResult; stdcall;
    function  OnThreadWorkRedirect(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                   MsgWorkID: Largeuint; QueueLen: LongWord; ThreadNum: Largeuint): HResult; stdcall;
    function  OnThreadWorkReject(var pinfo: COMSVCSEVENTINFO; ThreadID: Largeuint; 
                                 MsgWorkID: Largeuint; QueueLen: LongWord): HResult; stdcall;
    function  OnThreadAssignApartment(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                                      AptID: Largeuint): HResult; stdcall;
    function  OnThreadUnassignApartment(var pinfo: COMSVCSEVENTINFO; AptID: Largeuint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComUserEvent
// Flags:     (16) Hidden
// GUID:      {683130A4-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComUserEvent = interface(IUnknown)
    ['{683130A4-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnUserEvent(var pinfo: COMSVCSEVENTINFO; var pvarEvent: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComAppEvents
// Flags:     (16) Hidden
// GUID:      {683130A6-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComAppEvents = interface(IUnknown)
    ['{683130A6-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnAppActivation(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
    function  OnAppShutdown(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
    function  OnAppForceShutdown(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComInstanceEvents
// Flags:     (16) Hidden
// GUID:      {683130A7-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComInstanceEvents = interface(IUnknown)
    ['{683130A7-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnObjectCreate(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                             var clsid: TGUID; var tsid: TGUID; CtxtID: Largeuint; 
                             ObjectID: Largeuint): HResult; stdcall;
    function  OnObjectDestroy(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComTransactionEvents
// Flags:     (16) Hidden
// GUID:      {683130A8-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComTransactionEvents = interface(IUnknown)
    ['{683130A8-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnTransactionStart(var pinfo: COMSVCSEVENTINFO; var guidTx: TGUID; var tsid: TGUID; 
                                 fRoot: Integer): HResult; stdcall;
    function  OnTransactionPrepare(var pinfo: COMSVCSEVENTINFO; var guidTx: TGUID; fVoteYes: Integer): HResult; stdcall;
    function  OnTransactionAbort(var pinfo: COMSVCSEVENTINFO; var guidTx: TGUID): HResult; stdcall;
    function  OnTransactionCommit(var pinfo: COMSVCSEVENTINFO; var guidTx: TGUID): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComMethodEvents
// Flags:     (16) Hidden
// GUID:      {683130A9-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComMethodEvents = interface(IUnknown)
    ['{683130A9-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnMethodCall(var pinfo: COMSVCSEVENTINFO; oid: Largeuint; var guidCid: TGUID; 
                           var guidRid: TGUID; iMeth: LongWord): HResult; stdcall;
    function  OnMethodReturn(var pinfo: COMSVCSEVENTINFO; oid: Largeuint; var guidCid: TGUID; 
                             var guidRid: TGUID; iMeth: LongWord; hresult: HResult): HResult; stdcall;
    function  OnMethodException(var pinfo: COMSVCSEVENTINFO; oid: Largeuint; var guidCid: TGUID; 
                                var guidRid: TGUID; iMeth: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComObjectEvents
// Flags:     (16) Hidden
// GUID:      {683130AA-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComObjectEvents = interface(IUnknown)
    ['{683130AA-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnObjectActivate(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint; ObjectID: Largeuint): HResult; stdcall;
    function  OnObjectDeactivate(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint; ObjectID: Largeuint): HResult; stdcall;
    function  OnDisableCommit(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint): HResult; stdcall;
    function  OnEnableCommit(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint): HResult; stdcall;
    function  OnSetComplete(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint): HResult; stdcall;
    function  OnSetAbort(var pinfo: COMSVCSEVENTINFO; CtxtID: Largeuint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComResourceEvents
// Flags:     (16) Hidden
// GUID:      {683130AB-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComResourceEvents = interface(IUnknown)
    ['{683130AB-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnResourceCreate(var pinfo: COMSVCSEVENTINFO; ObjectID: Largeuint; 
                               pszType: PWideChar; resId: Largeuint; enlisted: Integer): HResult; stdcall;
    function  OnResourceAllocate(var pinfo: COMSVCSEVENTINFO; ObjectID: Largeuint; 
                                 pszType: PWideChar; resId: Largeuint; enlisted: Integer; 
                                 NumRated: LongWord; Rating: LongWord): HResult; stdcall;
    function  OnResourceRecycle(var pinfo: COMSVCSEVENTINFO; ObjectID: Largeuint; 
                                pszType: PWideChar; resId: Largeuint): HResult; stdcall;
    function  OnResourceDestroy(var pinfo: COMSVCSEVENTINFO; ObjectID: Largeuint; hr: HResult; 
                                pszType: PWideChar; resId: Largeuint): HResult; stdcall;
    function  OnResourceTrack(var pinfo: COMSVCSEVENTINFO; ObjectID: Largeuint; pszType: PWideChar; 
                              resId: Largeuint; enlisted: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComSecurityEvents
// Flags:     (16) Hidden
// GUID:      {683130AC-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComSecurityEvents = interface(IUnknown)
    ['{683130AC-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnAuthenticate(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                             ObjectID: Largeuint; var guidIID: TGUID; iMeth: LongWord; 
                             cbByteOrig: LongWord; var pSidOriginalUser: Byte; cbByteCur: LongWord; 
                             var pSidCurrentUser: Byte; bCurrentUserInpersonatingInProc: Integer): HResult; stdcall;
    function  OnAuthenticateFail(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                                 ObjectID: Largeuint; var guidIID: TGUID; iMeth: LongWord; 
                                 cbByteOrig: LongWord; var pSidOriginalUser: Byte; 
                                 cbByteCur: LongWord; var pSidCurrentUser: Byte; 
                                 bCurrentUserInpersonatingInProc: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComObjectPoolEvents
// Flags:     (16) Hidden
// GUID:      {683130AD-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComObjectPoolEvents = interface(IUnknown)
    ['{683130AD-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnObjPoolPutObject(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                                 nReason: SYSINT; dwAvailable: LongWord; oid: Largeuint): HResult; stdcall;
    function  OnObjPoolGetObject(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                                 var guidObject: TGUID; dwAvailable: LongWord; oid: Largeuint): HResult; stdcall;
    function  OnObjPoolRecycleToTx(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                                   var guidObject: TGUID; var guidTx: TGUID; objid: Largeuint): HResult; stdcall;
    function  OnObjPoolGetFromTx(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID; 
                                 var guidObject: TGUID; var guidTx: TGUID; objid: Largeuint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComObjectPoolEvents2
// Flags:     (16) Hidden
// GUID:      {683130AE-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComObjectPoolEvents2 = interface(IUnknown)
    ['{683130AE-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnObjPoolCreateObject(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                                    dwObjsCreated: LongWord; oid: Largeuint): HResult; stdcall;
    function  OnObjPoolDestroyObject(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                                     dwObjsCreated: LongWord; oid: Largeuint): HResult; stdcall;
    function  OnObjPoolCreateDecision(var pinfo: COMSVCSEVENTINFO; dwThreadsWaiting: LongWord; 
                                      dwAvail: LongWord; dwCreated: LongWord; dwMin: LongWord; 
                                      dwMax: LongWord): HResult; stdcall;
    function  OnObjPoolTimeout(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                               var guidActivity: TGUID; dwTimeout: LongWord): HResult; stdcall;
    function  OnObjPoolCreatePool(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                                  dwMin: LongWord; dwMax: LongWord; dwTimeout: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComObjectConstructionEvents
// Flags:     (16) Hidden
// GUID:      {683130AF-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComObjectConstructionEvents = interface(IUnknown)
    ['{683130AF-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnObjectConstruct(var pinfo: COMSVCSEVENTINFO; var guidObject: TGUID; 
                                sConstructString: PWideChar; oid: Largeuint): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComActivityEvents
// Flags:     (16) Hidden
// GUID:      {683130B0-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComActivityEvents = interface(IUnknown)
    ['{683130B0-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnActivityCreate(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID): HResult; stdcall;
    function  OnActivityDestroy(var pinfo: COMSVCSEVENTINFO; var guidActivity: TGUID): HResult; stdcall;
    function  OnActivityEnter(var pinfo: COMSVCSEVENTINFO; var guidCurrent: TGUID; 
                              var guidEntered: TGUID; dwThread: LongWord): HResult; stdcall;
    function  OnActivityTimeout(var pinfo: COMSVCSEVENTINFO; var guidCurrent: TGUID; 
                                var guidEntered: TGUID; dwThread: LongWord; dwTimeout: LongWord): HResult; stdcall;
    function  OnActivityReenter(var pinfo: COMSVCSEVENTINFO; var guidCurrent: TGUID; 
                                dwThread: LongWord; dwCallDepth: LongWord): HResult; stdcall;
    function  OnActivityLeave(var pinfo: COMSVCSEVENTINFO; var guidCurrent: TGUID; 
                              var guidLeft: TGUID): HResult; stdcall;
    function  OnActivityLeaveSame(var pinfo: COMSVCSEVENTINFO; var guidCurrent: TGUID; 
                                  dwCallDepth: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComIdentityEvents
// Flags:     (16) Hidden
// GUID:      {683130B1-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComIdentityEvents = interface(IUnknown)
    ['{683130B1-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnIISRequestInfo(var pinfo: COMSVCSEVENTINFO; objid: Largeuint; 
                               pszClientIP: PWideChar; pszServerIP: PWideChar; pszURL: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComQCEvents
// Flags:     (16) Hidden
// GUID:      {683130B2-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComQCEvents = interface(IUnknown)
    ['{683130B2-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnQCRecord(var pinfo: COMSVCSEVENTINFO; objid: Largeuint; szQueue: PrivateAlias1; 
                         var guidMsgId: TGUID; var guidWorkFlowId: TGUID; msmqhr: HResult): HResult; stdcall;
    function  OnQCQueueOpen(var pinfo: COMSVCSEVENTINFO; szQueue: PrivateAlias1; 
                            QueueID: Largeuint; hr: HResult): HResult; stdcall;
    function  OnQCReceive(var pinfo: COMSVCSEVENTINFO; QueueID: Largeuint; var guidMsgId: TGUID; 
                          var guidWorkFlowId: TGUID; hr: HResult): HResult; stdcall;
    function  OnQCReceiveFail(var pinfo: COMSVCSEVENTINFO; QueueID: Largeuint; msmqhr: HResult): HResult; stdcall;
    function  OnQCMoveToReTryQueue(var pinfo: COMSVCSEVENTINFO; var guidMsgId: TGUID; 
                                   var guidWorkFlowId: TGUID; RetryIndex: LongWord): HResult; stdcall;
    function  OnQCMoveToDeadQueue(var pinfo: COMSVCSEVENTINFO; var guidMsgId: TGUID; 
                                  var guidWorkFlowId: TGUID): HResult; stdcall;
    function  OnQCPlayback(var pinfo: COMSVCSEVENTINFO; objid: Largeuint; var guidMsgId: TGUID; 
                           var guidWorkFlowId: TGUID; hr: HResult): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComExceptionEvents
// Flags:     (16) Hidden
// GUID:      {683130B3-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComExceptionEvents = interface(IUnknown)
    ['{683130B3-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnExceptionUser(var pinfo: COMSVCSEVENTINFO; code: LongWord; address: Largeuint; 
                              pszStackTrace: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IComCRMEvents
// Flags:     (16) Hidden
// GUID:      {683130B5-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  IComCRMEvents = interface(IUnknown)
    ['{683130B5-2E50-11D2-98A5-00C04F8EE1C4}']
    function  OnCRMRecoveryStart(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
    function  OnCRMRecoveryDone(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
    function  OnCRMCheckpoint(var pinfo: COMSVCSEVENTINFO; guidApp: TGUID): HResult; stdcall;
    function  OnCRMBegin(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID; guidActivity: TGUID; 
                         guidTx: TGUID; szProgIdCompensator: PrivateAlias1; 
                         szDescription: PrivateAlias1): HResult; stdcall;
    function  OnCRMPrepare(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMCommit(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMAbort(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMIndoubt(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMDone(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMRelease(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMAnalyze(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID; 
                           dwCrmRecordType: LongWord; dwRecordSize: LongWord): HResult; stdcall;
    function  OnCRMWrite(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID; fVariants: Integer; 
                         dwRecordSize: LongWord): HResult; stdcall;
    function  OnCRMForget(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMForce(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID): HResult; stdcall;
    function  OnCRMDeliver(var pinfo: COMSVCSEVENTINFO; guidClerkCLSID: TGUID; fVariants: Integer; 
                           dwRecordSize: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmMonitorLogRecords
// Flags:     (0)
// GUID:      {70C8E441-C7ED-11D1-82FB-00A0C91EEDE9}
// *********************************************************************//
  ICrmMonitorLogRecords = interface(IUnknown)
    ['{70C8E441-C7ED-11D1-82FB-00A0C91EEDE9}']
    function  Get_Count(out pVal: Integer): HResult; stdcall;
    function  Get_TransactionState(out pVal: tagCrmTransactionState): HResult; stdcall;
    function  Get_StructuredRecords(out pVal: WordBool): HResult; stdcall;
    function  GetLogRecord(dwIndex: LongWord; var pCrmLogRec: TGUID): HResult; stdcall;
    function  GetLogRecordVariants(IndexNumber: OleVariant; out pLogRecord: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmMonitor
// Flags:     (0)
// GUID:      {70C8E443-C7ED-11D1-82FB-00A0C91EEDE9}
// *********************************************************************//
  ICrmMonitor = interface(IUnknown)
    ['{70C8E443-C7ED-11D1-82FB-00A0C91EEDE9}']
    function  GetClerks(out pClerks: ICrmMonitorClerks): HResult; stdcall;
    function  HoldClerk(Index: OleVariant; out pItem: OleVariant): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: ICrmMonitorClerks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {70C8E442-C7ED-11D1-82FB-00A0C91EEDE9}
// *********************************************************************//
  ICrmMonitorClerks = interface(IDispatch)
    ['{70C8E442-C7ED-11D1-82FB-00A0C91EEDE9}']
    function  Item(Index: OleVariant): OleVariant; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  ProgIdCompensator(Index: OleVariant): OleVariant; safecall;
    function  Description(Index: OleVariant): OleVariant; safecall;
    function  TransactionUOW(Index: OleVariant): OleVariant; safecall;
    function  ActivityId(Index: OleVariant): OleVariant; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  ICrmMonitorClerksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {70C8E442-C7ED-11D1-82FB-00A0C91EEDE9}
// *********************************************************************//
  ICrmMonitorClerksDisp = dispinterface
    ['{70C8E442-C7ED-11D1-82FB-00A0C91EEDE9}']
    function  Item(Index: OleVariant): OleVariant; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function  ProgIdCompensator(Index: OleVariant): OleVariant; dispid 2;
    function  Description(Index: OleVariant): OleVariant; dispid 3;
    function  TransactionUOW(Index: OleVariant): OleVariant; dispid 4;
    function  ActivityId(Index: OleVariant): OleVariant; dispid 5;
  end;

// *********************************************************************//
// Interface: ILBEvents
// Flags:     (16) Hidden
// GUID:      {683130B4-2E50-11D2-98A5-00C04F8EE1C4}
// *********************************************************************//
  ILBEvents = interface(IUnknown)
    ['{683130B4-2E50-11D2-98A5-00C04F8EE1C4}']
    function  TargetUp(const bstrServerName: WideString; const bstrClsidEng: WideString): HResult; stdcall;
    function  TargetDown(const bstrServerName: WideString; const bstrClsidEng: WideString): HResult; stdcall;
    function  EngineDefined(const bstrPropName: WideString; var varPropValue: OleVariant; 
                            const bstrClsidEng: WideString): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IMessageMover
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {588A085A-B795-11D1-8054-00C04FC340EE}
// *********************************************************************//
  IMessageMover = interface(IDispatch)
    ['{588A085A-B795-11D1-8054-00C04FC340EE}']
    function  Get_SourcePath: WideString; safecall;
    procedure Set_SourcePath(const pVal: WideString); safecall;
    function  Get_DestPath: WideString; safecall;
    procedure Set_DestPath(const pVal: WideString); safecall;
    function  Get_CommitBatchSize: Integer; safecall;
    procedure Set_CommitBatchSize(pVal: Integer); safecall;
    function  MoveMessages: Integer; safecall;
    property SourcePath: WideString read Get_SourcePath write Set_SourcePath;
    property DestPath: WideString read Get_DestPath write Set_DestPath;
    property CommitBatchSize: Integer read Get_CommitBatchSize write Set_CommitBatchSize;
  end;

// *********************************************************************//
// DispIntf:  IMessageMoverDisp
// Flags:     (4560) Hidden Dual NonExtensible OleAutomation Dispatchable
// GUID:      {588A085A-B795-11D1-8054-00C04FC340EE}
// *********************************************************************//
  IMessageMoverDisp = dispinterface
    ['{588A085A-B795-11D1-8054-00C04FC340EE}']
    property SourcePath: WideString dispid 1;
    property DestPath: WideString dispid 2;
    property CommitBatchSize: Integer dispid 3;
    function  MoveMessages: Integer; dispid 4;
  end;

// *********************************************************************//
// Interface: IDispenserManager
// Flags:     (16) Hidden
// GUID:      {5CB31E10-2B5F-11CF-BE10-00AA00A2FA25}
// *********************************************************************//
  IDispenserManager = interface(IUnknown)
    ['{5CB31E10-2B5F-11CF-BE10-00AA00A2FA25}']
    function  RegisterDispenser(const __MIDL_0011: IDispenserDriver; szDispenserName: PWideChar; 
                                out __MIDL_0012: IHolder): HResult; stdcall;
    function  GetContext(out __MIDL_0013: ULONG_PTR; out __MIDL_0014: ULONG_PTR): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IDispenserManagerShutdownGuarantee
// Flags:     (16) Hidden
// GUID:      {5CB31E11-2B5F-11CF-BE10-00AA00A2FA25}
// *********************************************************************//
  IDispenserManagerShutdownGuarantee = interface(IUnknown)
    ['{5CB31E11-2B5F-11CF-BE10-00AA00A2FA25}']
    function  IsComPlusApp(out pfIsComPlusApp: Integer): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IDispenserDriver
// Flags:     (16) Hidden
// GUID:      {208B3651-2B48-11CF-BE10-00AA00A2FA25}
// *********************************************************************//
  IDispenserDriver = interface(IUnknown)
    ['{208B3651-2B48-11CF-BE10-00AA00A2FA25}']
    function  CreateResource(ResTypId: ULONG_PTR; out pResId: ULONG_PTR; 
                             out pSecsFreeBeforeDestroy: Integer): HResult; stdcall;
    function  RateResource(ResTypId: ULONG_PTR; resId: ULONG_PTR; 
                           fRequiresTransactionEnlistment: Integer; out pRating: LongWord): HResult; stdcall;
    function  EnlistResource(resId: ULONG_PTR; TransId: ULONG_PTR): HResult; stdcall;
    function  ResetResource(resId: ULONG_PTR): HResult; stdcall;
    function  DestroyResource(resId: ULONG_PTR): HResult; stdcall;
    function  DestroyResourceS(resId: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IHolder
// Flags:     (16) Hidden
// GUID:      {BF6A1850-2B45-11CF-BE10-00AA00A2FA25}
// *********************************************************************//
  IHolder = interface(IUnknown)
    ['{BF6A1850-2B45-11CF-BE10-00AA00A2FA25}']
    function  AllocResource(__MIDL_0015: ULONG_PTR; out __MIDL_0016: ULONG_PTR): HResult; stdcall;
    function  FreeResource(__MIDL_0017: ULONG_PTR): HResult; stdcall;
    function  TrackResource(__MIDL_0018: ULONG_PTR): HResult; stdcall;
    function  TrackResourceS(__MIDL_0019: PWideChar): HResult; stdcall;
    function  UntrackResource(__MIDL_0020: ULONG_PTR; __MIDL_0021: Integer): HResult; stdcall;
    function  UntrackResourceS(__MIDL_0022: PWideChar; __MIDL_0023: Integer): HResult; stdcall;
    function  Close: HResult; stdcall;
    function  RequestDestroyResource(__MIDL_0024: ULONG_PTR): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IReceiveAppData
// Flags:     (16) Hidden
// GUID:      {413DAFB0-BCF4-11D1-861D-0080C729264D}
// *********************************************************************//
  IReceiveAppData = interface(IUnknown)
    ['{413DAFB0-BCF4-11D1-861D-0080C729264D}']
    function  Register(pAppGuid: PWideChar; dwAppProcessId: LongWord; out pidApp: LongWord; 
                       out pPushRate: LongWord): HResult; stdcall;
    function  PushAppData(idApp: LongWord; appData: APPSTATISTICS; nCLSIDs: LongWord; 
                          var clsids: CLSIDDATA): HResult; stdcall;
    function  Unregister(idApp: LongWord): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IGetAppData
// Flags:     (16) Hidden
// GUID:      {B60040E0-BCF3-11D1-861D-0080C729264D}
// *********************************************************************//
  IGetAppData = interface(IUnknown)
    ['{B60040E0-BCF3-11D1-861D-0080C729264D}']
    function  SetPushRate(dwPushRate: LongWord): HResult; stdcall;
    function  GetApps(out nApps: LongWord; out aAppData: PUserType6): HResult; stdcall;
    function  GetAppData(idApp: LongWord; out nCLSIDs: LongWord; out aAppData: PUserType5): HResult; stdcall;
    function  GetCLSIDData(idApp: LongWord; clsid: TGUID; out ppAppData: PUserType5): HResult; stdcall;
    function  Shutdown: HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IEventServer
// Flags:     (16) Hidden
// GUID:      {F1CB0608-EC04-11D1-93AE-00AA00BA3258}
// *********************************************************************//
  IEventServer = interface(IUnknown)
    ['{F1CB0608-EC04-11D1-93AE-00AA00BA3258}']
    function  DispatchManyEvents(dwPid: LongWord; var appGuid: TGUID; dwEvents: LongWord; 
                                 cbSize: LongWord; var pBuf: Byte): HResult; stdcall;
    function  DispatchOneEvent(dwPid: LongWord; var appGuid: TGUID; cbSize: LongWord; var pBuf: Byte): HResult; stdcall;
    function  AddProcess(dwPid: LongWord; var guidApp: TGUID; out pdwInitialEventMask: LongWord; 
                         out ppUnkCallfactory: IUnknown): HResult; stdcall;
    function  RemoveProcess(dwPid: LongWord): HResult; stdcall;
    function  GetCallFactoryObject(dwPid: LongWord; out ppUnkCallfactory: IUnknown): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IProcessTerminateNotify
// Flags:     (0)
// GUID:      {3194B4CF-EF32-11D1-93AE-00AA00BA3258}
// *********************************************************************//
  IProcessTerminateNotify = interface(IUnknown)
    ['{3194B4CF-EF32-11D1-93AE-00AA00BA3258}']
    procedure ProcessShutdown(dwPid: LongWord); stdcall;
  end;

// *********************************************************************//
// The Class CoSecurityCertificate provides a Create and CreateRemote method to          
// create instances of the default interface ISecurityCertificateColl exposed by              
// the CoClass SecurityCertificate. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecurityCertificate = class
    class function Create: ISecurityCertificateColl;
    class function CreateRemote(const MachineName: string): ISecurityCertificateColl;
  end;

// *********************************************************************//
// The Class CoSecurityIdentity provides a Create and CreateRemote method to          
// create instances of the default interface ISecurityIdentityColl exposed by              
// the CoClass SecurityIdentity. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecurityIdentity = class
    class function Create: ISecurityIdentityColl;
    class function CreateRemote(const MachineName: string): ISecurityIdentityColl;
  end;

// *********************************************************************//
// The Class CoSecurityCallers provides a Create and CreateRemote method to          
// create instances of the default interface ISecurityCallersColl exposed by              
// the CoClass SecurityCallers. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecurityCallers = class
    class function Create: ISecurityCallersColl;
    class function CreateRemote(const MachineName: string): ISecurityCallersColl;
  end;

// *********************************************************************//
// The Class CoSecurityCallContext provides a Create and CreateRemote method to          
// create instances of the default interface ISecurityCallContext exposed by              
// the CoClass SecurityCallContext. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSecurityCallContext = class
    class function Create: ISecurityCallContext;
    class function CreateRemote(const MachineName: string): ISecurityCallContext;
  end;

// *********************************************************************//
// The Class CoGetSecurityCallContextAppObject provides a Create and CreateRemote method to          
// create instances of the default interface IGetSecurityCallContext exposed by              
// the CoClass GetSecurityCallContextAppObject. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoGetSecurityCallContextAppObject = class
    class function Create: IGetSecurityCallContext;
    class function CreateRemote(const MachineName: string): IGetSecurityCallContext;
  end;

// *********************************************************************//
// The Class CoDummy30040732 provides a Create and CreateRemote method to          
// create instances of the default interface IObjectContext exposed by              
// the CoClass Dummy30040732. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDummy30040732 = class
    class function Create: IObjectContext;
    class function CreateRemote(const MachineName: string): IObjectContext;
  end;

// *********************************************************************//
// The Class CoAppServer provides a Create and CreateRemote method to          
// create instances of the default interface IMTxAS exposed by              
// the CoClass AppServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAppServer = class
    class function Create: IMTxAS;
    class function CreateRemote(const MachineName: string): IMTxAS;
  end;

// *********************************************************************//
// The Class CoTransactionContext provides a Create and CreateRemote method to          
// create instances of the default interface ITransactionContext exposed by              
// the CoClass TransactionContext. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransactionContext = class
    class function Create: ITransactionContext;
    class function CreateRemote(const MachineName: string): ITransactionContext;
  end;

// *********************************************************************//
// The Class CoTransactionContextEx provides a Create and CreateRemote method to          
// create instances of the default interface ITransactionContextEx exposed by              
// the CoClass TransactionContextEx. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTransactionContextEx = class
    class function Create: ITransactionContextEx;
    class function CreateRemote(const MachineName: string): ITransactionContextEx;
  end;

// *********************************************************************//
// The Class CoByotServerEx provides a Create and CreateRemote method to          
// create instances of the default interface ICreateWithTipTransactionEx exposed by              
// the CoClass ByotServerEx. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoByotServerEx = class
    class function Create: ICreateWithTipTransactionEx;
    class function CreateRemote(const MachineName: string): ICreateWithTipTransactionEx;
  end;

// *********************************************************************//
// The Class CoSharedProperty provides a Create and CreateRemote method to          
// create instances of the default interface ISharedProperty exposed by              
// the CoClass SharedProperty. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSharedProperty = class
    class function Create: ISharedProperty;
    class function CreateRemote(const MachineName: string): ISharedProperty;
  end;

// *********************************************************************//
// The Class CoSharedPropertyGroup provides a Create and CreateRemote method to          
// create instances of the default interface ISharedPropertyGroup exposed by              
// the CoClass SharedPropertyGroup. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSharedPropertyGroup = class
    class function Create: ISharedPropertyGroup;
    class function CreateRemote(const MachineName: string): ISharedPropertyGroup;
  end;

// *********************************************************************//
// The Class CoSharedPropertyGroupManager provides a Create and CreateRemote method to          
// create instances of the default interface ISharedPropertyGroupManager exposed by              
// the CoClass SharedPropertyGroupManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSharedPropertyGroupManager = class
    class function Create: ISharedPropertyGroupManager;
    class function CreateRemote(const MachineName: string): ISharedPropertyGroupManager;
  end;

// *********************************************************************//
// The Class CoCOMEvents provides a Create and CreateRemote method to          
// create instances of the default interface IMtsEvents exposed by              
// the CoClass COMEvents. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCOMEvents = class
    class function Create: IMtsEvents;
    class function CreateRemote(const MachineName: string): IMtsEvents;
  end;

// *********************************************************************//
// The Class CoCoMTSLocator provides a Create and CreateRemote method to          
// create instances of the default interface IMTSLocator exposed by              
// the CoClass CoMTSLocator. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCoMTSLocator = class
    class function Create: IMTSLocator;
    class function CreateRemote(const MachineName: string): IMTSLocator;
  end;

// *********************************************************************//
// The Class CoMtsGrp provides a Create and CreateRemote method to          
// create instances of the default interface IMtsGrp exposed by              
// the CoClass MtsGrp. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMtsGrp = class
    class function Create: IMtsGrp;
    class function CreateRemote(const MachineName: string): IMtsGrp;
  end;

// *********************************************************************//
// The Class CoComServiceEvents provides a Create and CreateRemote method to          
// create instances of the default interface IComThreadEvents exposed by              
// the CoClass ComServiceEvents. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoComServiceEvents = class
    class function Create: IComThreadEvents;
    class function CreateRemote(const MachineName: string): IComThreadEvents;
  end;

// *********************************************************************//
// The Class CoCRMClerk provides a Create and CreateRemote method to          
// create instances of the default interface ICrmLogControl exposed by              
// the CoClass CRMClerk. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCRMClerk = class
    class function Create: ICrmLogControl;
    class function CreateRemote(const MachineName: string): ICrmLogControl;
  end;

// *********************************************************************//
// The Class CoCRMRecoveryClerk provides a Create and CreateRemote method to          
// create instances of the default interface ICrmMonitor exposed by              
// the CoClass CRMRecoveryClerk. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCRMRecoveryClerk = class
    class function Create: ICrmMonitor;
    class function CreateRemote(const MachineName: string): ICrmMonitor;
  end;

// *********************************************************************//
// The Class CoLBEvents provides a Create and CreateRemote method to          
// create instances of the default interface ILBEvents exposed by              
// the CoClass LBEvents. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLBEvents = class
    class function Create: ILBEvents;
    class function CreateRemote(const MachineName: string): ILBEvents;
  end;

// *********************************************************************//
// The Class CoMessageMover provides a Create and CreateRemote method to          
// create instances of the default interface IMessageMover exposed by              
// the CoClass MessageMover. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoMessageMover = class
    class function Create: IMessageMover;
    class function CreateRemote(const MachineName: string): IMessageMover;
  end;

// *********************************************************************//
// The Class CoDispenserManager provides a Create and CreateRemote method to          
// create instances of the default interface IDispenserManager exposed by              
// the CoClass DispenserManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDispenserManager = class
    class function Create: IDispenserManager;
    class function CreateRemote(const MachineName: string): IDispenserManager;
  end;

// *********************************************************************//
// The Class CoTrackerServer provides a Create and CreateRemote method to          
// create instances of the default interface IReceiveAppData exposed by              
// the CoClass TrackerServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoTrackerServer = class
    class function Create: IReceiveAppData;
    class function CreateRemote(const MachineName: string): IReceiveAppData;
  end;

// *********************************************************************//
// The Class CoEventServer provides a Create and CreateRemote method to          
// create instances of the default interface IEventServer exposed by              
// the CoClass EventServer. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoEventServer = class
    class function Create: IEventServer;
    class function CreateRemote(const MachineName: string): IEventServer;
  end;

implementation

uses ComObj;

class function CoSecurityCertificate.Create: ISecurityCertificateColl;
begin
  Result := CreateComObject(CLASS_SecurityCertificate) as ISecurityCertificateColl;
end;

class function CoSecurityCertificate.CreateRemote(const MachineName: string): ISecurityCertificateColl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SecurityCertificate) as ISecurityCertificateColl;
end;

class function CoSecurityIdentity.Create: ISecurityIdentityColl;
begin
  Result := CreateComObject(CLASS_SecurityIdentity) as ISecurityIdentityColl;
end;

class function CoSecurityIdentity.CreateRemote(const MachineName: string): ISecurityIdentityColl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SecurityIdentity) as ISecurityIdentityColl;
end;

class function CoSecurityCallers.Create: ISecurityCallersColl;
begin
  Result := CreateComObject(CLASS_SecurityCallers) as ISecurityCallersColl;
end;

class function CoSecurityCallers.CreateRemote(const MachineName: string): ISecurityCallersColl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SecurityCallers) as ISecurityCallersColl;
end;

class function CoSecurityCallContext.Create: ISecurityCallContext;
begin
  Result := CreateComObject(CLASS_SecurityCallContext) as ISecurityCallContext;
end;

class function CoSecurityCallContext.CreateRemote(const MachineName: string): ISecurityCallContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SecurityCallContext) as ISecurityCallContext;
end;

class function CoGetSecurityCallContextAppObject.Create: IGetSecurityCallContext;
begin
  Result := CreateComObject(CLASS_GetSecurityCallContextAppObject) as IGetSecurityCallContext;
end;

class function CoGetSecurityCallContextAppObject.CreateRemote(const MachineName: string): IGetSecurityCallContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_GetSecurityCallContextAppObject) as IGetSecurityCallContext;
end;

class function CoDummy30040732.Create: IObjectContext;
begin
  Result := CreateComObject(CLASS_Dummy30040732) as IObjectContext;
end;

class function CoDummy30040732.CreateRemote(const MachineName: string): IObjectContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Dummy30040732) as IObjectContext;
end;

class function CoAppServer.Create: IMTxAS;
begin
  Result := CreateComObject(CLASS_AppServer) as IMTxAS;
end;

class function CoAppServer.CreateRemote(const MachineName: string): IMTxAS;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AppServer) as IMTxAS;
end;

class function CoTransactionContext.Create: ITransactionContext;
begin
  Result := CreateComObject(CLASS_TransactionContext) as ITransactionContext;
end;

class function CoTransactionContext.CreateRemote(const MachineName: string): ITransactionContext;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransactionContext) as ITransactionContext;
end;

class function CoTransactionContextEx.Create: ITransactionContextEx;
begin
  Result := CreateComObject(CLASS_TransactionContextEx) as ITransactionContextEx;
end;

class function CoTransactionContextEx.CreateRemote(const MachineName: string): ITransactionContextEx;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TransactionContextEx) as ITransactionContextEx;
end;

class function CoByotServerEx.Create: ICreateWithTipTransactionEx;
begin
  Result := CreateComObject(CLASS_ByotServerEx) as ICreateWithTipTransactionEx;
end;

class function CoByotServerEx.CreateRemote(const MachineName: string): ICreateWithTipTransactionEx;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ByotServerEx) as ICreateWithTipTransactionEx;
end;

class function CoSharedProperty.Create: ISharedProperty;
begin
  Result := CreateComObject(CLASS_SharedProperty) as ISharedProperty;
end;

class function CoSharedProperty.CreateRemote(const MachineName: string): ISharedProperty;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SharedProperty) as ISharedProperty;
end;

class function CoSharedPropertyGroup.Create: ISharedPropertyGroup;
begin
  Result := CreateComObject(CLASS_SharedPropertyGroup) as ISharedPropertyGroup;
end;

class function CoSharedPropertyGroup.CreateRemote(const MachineName: string): ISharedPropertyGroup;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SharedPropertyGroup) as ISharedPropertyGroup;
end;

class function CoSharedPropertyGroupManager.Create: ISharedPropertyGroupManager;
begin
  Result := CreateComObject(CLASS_SharedPropertyGroupManager) as ISharedPropertyGroupManager;
end;

class function CoSharedPropertyGroupManager.CreateRemote(const MachineName: string): ISharedPropertyGroupManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SharedPropertyGroupManager) as ISharedPropertyGroupManager;
end;

class function CoCOMEvents.Create: IMtsEvents;
begin
  Result := CreateComObject(CLASS_COMEvents) as IMtsEvents;
end;

class function CoCOMEvents.CreateRemote(const MachineName: string): IMtsEvents;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_COMEvents) as IMtsEvents;
end;

class function CoCoMTSLocator.Create: IMTSLocator;
begin
  Result := CreateComObject(CLASS_CoMTSLocator) as IMTSLocator;
end;

class function CoCoMTSLocator.CreateRemote(const MachineName: string): IMTSLocator;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CoMTSLocator) as IMTSLocator;
end;

class function CoMtsGrp.Create: IMtsGrp;
begin
  Result := CreateComObject(CLASS_MtsGrp) as IMtsGrp;
end;

class function CoMtsGrp.CreateRemote(const MachineName: string): IMtsGrp;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MtsGrp) as IMtsGrp;
end;

class function CoComServiceEvents.Create: IComThreadEvents;
begin
  Result := CreateComObject(CLASS_ComServiceEvents) as IComThreadEvents;
end;

class function CoComServiceEvents.CreateRemote(const MachineName: string): IComThreadEvents;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ComServiceEvents) as IComThreadEvents;
end;

class function CoCRMClerk.Create: ICrmLogControl;
begin
  Result := CreateComObject(CLASS_CRMClerk) as ICrmLogControl;
end;

class function CoCRMClerk.CreateRemote(const MachineName: string): ICrmLogControl;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CRMClerk) as ICrmLogControl;
end;

class function CoCRMRecoveryClerk.Create: ICrmMonitor;
begin
  Result := CreateComObject(CLASS_CRMRecoveryClerk) as ICrmMonitor;
end;

class function CoCRMRecoveryClerk.CreateRemote(const MachineName: string): ICrmMonitor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CRMRecoveryClerk) as ICrmMonitor;
end;

class function CoLBEvents.Create: ILBEvents;
begin
  Result := CreateComObject(CLASS_LBEvents) as ILBEvents;
end;

class function CoLBEvents.CreateRemote(const MachineName: string): ILBEvents;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LBEvents) as ILBEvents;
end;

class function CoMessageMover.Create: IMessageMover;
begin
  Result := CreateComObject(CLASS_MessageMover) as IMessageMover;
end;

class function CoMessageMover.CreateRemote(const MachineName: string): IMessageMover;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MessageMover) as IMessageMover;
end;

class function CoDispenserManager.Create: IDispenserManager;
begin
  Result := CreateComObject(CLASS_DispenserManager) as IDispenserManager;
end;

class function CoDispenserManager.CreateRemote(const MachineName: string): IDispenserManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DispenserManager) as IDispenserManager;
end;

class function CoTrackerServer.Create: IReceiveAppData;
begin
  Result := CreateComObject(CLASS_TrackerServer) as IReceiveAppData;
end;

class function CoTrackerServer.CreateRemote(const MachineName: string): IReceiveAppData;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TrackerServer) as IReceiveAppData;
end;

class function CoEventServer.Create: IEventServer;
begin
  Result := CreateComObject(CLASS_EventServer) as IEventServer;
end;

class function CoEventServer.CreateRemote(const MachineName: string): IEventServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EventServer) as IEventServer;
end;

end.
