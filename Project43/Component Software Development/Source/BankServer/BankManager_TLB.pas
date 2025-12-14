unit BankManager_TLB;

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
// File generated on 4/17/2001 13:17:23 from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\ball\OlalaProject\BankProject\BankManager\Server\BankManager.tlb (1)
// IID\LCID: {B15B1400-327B-11D5-8C7C-B49BE349D911}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
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
  BankManagerMajorVersion = 1;
  BankManagerMinorVersion = 0;

  LIBID_BankManager: TGUID = '{B15B1400-327B-11D5-8C7C-B49BE349D911}';

  IID_IAccount: TGUID = '{B15B1401-327B-11D5-8C7C-B49BE349D911}';
  CLASS_Account: TGUID = '{B15B1403-327B-11D5-8C7C-B49BE349D911}';
  IID_IBankTransaction: TGUID = '{DCC7EE60-328F-11D5-8C7C-8C92464BF820}';
  CLASS_BankTransaction: TGUID = '{DCC7EE62-328F-11D5-8C7C-8C92464BF820}';
  IID_IBankController: TGUID = '{F60E9920-3297-11D5-8C7C-8C92464BF820}';
  CLASS_BankController: TGUID = '{F60E9922-3297-11D5-8C7C-8C92464BF820}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IAccount = interface;
  IAccountDisp = dispinterface;
  IBankTransaction = interface;
  IBankTransactionDisp = dispinterface;
  IBankController = interface;
  IBankControllerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Account = IAccount;
  BankTransaction = IBankTransaction;
  BankController = IBankController;


// *********************************************************************//
// Interface: IAccount
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B15B1401-327B-11D5-8C7C-B49BE349D911}
// *********************************************************************//
  IAccount = interface(IDispatch)
    ['{B15B1401-327B-11D5-8C7C-B49BE349D911}']
    function  getBalance(const AccountID: WideString): Currency; safecall;
    function  getAccountName(const AccountID: WideString): WideString; safecall;
    function  getCredit(const CreditCardID: WideString): Currency; safecall;
    procedure setAccountName(const AccountID: WideString; const newAccountName: WideString); safecall;
    procedure setPassword(const AccountID: WideString; const oldPassword: WideString; 
                          const newPassword: WideString); safecall;
    function  deposit(const AccountID: WideString; Amount: Currency): WideString; safecall;
    function  withdraw(const ID: WideString; IDType: SYSINT; Amount: Currency; 
                       const Password: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAccountDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B15B1401-327B-11D5-8C7C-B49BE349D911}
// *********************************************************************//
  IAccountDisp = dispinterface
    ['{B15B1401-327B-11D5-8C7C-B49BE349D911}']
    function  getBalance(const AccountID: WideString): Currency; dispid 1;
    function  getAccountName(const AccountID: WideString): WideString; dispid 2;
    function  getCredit(const CreditCardID: WideString): Currency; dispid 3;
    procedure setAccountName(const AccountID: WideString; const newAccountName: WideString); dispid 4;
    procedure setPassword(const AccountID: WideString; const oldPassword: WideString; 
                          const newPassword: WideString); dispid 5;
    function  deposit(const AccountID: WideString; Amount: Currency): WideString; dispid 6;
    function  withdraw(const ID: WideString; IDType: SYSINT; Amount: Currency; 
                       const Password: WideString): WideString; dispid 7;
  end;

// *********************************************************************//
// Interface: IBankTransaction
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DCC7EE60-328F-11D5-8C7C-8C92464BF820}
// *********************************************************************//
  IBankTransaction = interface(IDispatch)
    ['{DCC7EE60-328F-11D5-8C7C-8C92464BF820}']
    function  getTransactionType(const TransactionID: WideString): SYSINT; safecall;
    function  getAccount(const TransactionID: WideString): WideString; safecall;
    function  getRelateAccount(const TransactionID: WideString): WideString; safecall;
    function  getAmount(const TransactionID: WideString): Currency; safecall;
    function  getTime(const TransactionID: WideString): TDateTime; safecall;
    function  create(TransactionType: SYSINT; const Account: WideString; 
                     const RelateAccount: WideString; Amount: Currency; Time: TDateTime): WideString; safecall;
    function  findByTransactionID(const TransactionID: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IBankTransactionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {DCC7EE60-328F-11D5-8C7C-8C92464BF820}
// *********************************************************************//
  IBankTransactionDisp = dispinterface
    ['{DCC7EE60-328F-11D5-8C7C-8C92464BF820}']
    function  getTransactionType(const TransactionID: WideString): SYSINT; dispid 1;
    function  getAccount(const TransactionID: WideString): WideString; dispid 2;
    function  getRelateAccount(const TransactionID: WideString): WideString; dispid 3;
    function  getAmount(const TransactionID: WideString): Currency; dispid 4;
    function  getTime(const TransactionID: WideString): TDateTime; dispid 5;
    function  create(TransactionType: SYSINT; const Account: WideString; 
                     const RelateAccount: WideString; Amount: Currency; Time: TDateTime): WideString; dispid 6;
    function  findByTransactionID(const TransactionID: WideString): OleVariant; dispid 7;
  end;

// *********************************************************************//
// Interface: IBankController
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F60E9920-3297-11D5-8C7C-8C92464BF820}
// *********************************************************************//
  IBankController = interface(IDispatch)
    ['{F60E9920-3297-11D5-8C7C-8C92464BF820}']
    function  payByDebitCard(const DebitCardID: WideString; const DestinationAccountID: WideString; 
                             Amount: Currency): WideString; safecall;
    function  payByCreditCard(const CreditCardID: WideString; 
                              const DestinationAccountID: WideString; Amount: Currency): WideString; safecall;
    function  transfer(const SourceID: WideString; const DestinationAccountID: WideString; 
                       Amount: Currency; const Password: WideString): WideString; safecall;
    function  checkTransfer(const DestinationAccountID: WideString; 
                            const TransactionID: WideString; Amount: Currency): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IBankControllerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F60E9920-3297-11D5-8C7C-8C92464BF820}
// *********************************************************************//
  IBankControllerDisp = dispinterface
    ['{F60E9920-3297-11D5-8C7C-8C92464BF820}']
    function  payByDebitCard(const DebitCardID: WideString; const DestinationAccountID: WideString; 
                             Amount: Currency): WideString; dispid 1;
    function  payByCreditCard(const CreditCardID: WideString; 
                              const DestinationAccountID: WideString; Amount: Currency): WideString; dispid 2;
    function  transfer(const SourceID: WideString; const DestinationAccountID: WideString; 
                       Amount: Currency; const Password: WideString): WideString; dispid 3;
    function  checkTransfer(const DestinationAccountID: WideString; 
                            const TransactionID: WideString; Amount: Currency): WordBool; dispid 4;
  end;

// *********************************************************************//
// The Class CoAccount provides a Create and CreateRemote method to          
// create instances of the default interface IAccount exposed by              
// the CoClass Account. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoAccount = class
    class function Create: IAccount;
    class function CreateRemote(const MachineName: string): IAccount;
  end;

// *********************************************************************//
// The Class CoBankTransaction provides a Create and CreateRemote method to          
// create instances of the default interface IBankTransaction exposed by              
// the CoClass BankTransaction. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBankTransaction = class
    class function Create: IBankTransaction;
    class function CreateRemote(const MachineName: string): IBankTransaction;
  end;

// *********************************************************************//
// The Class CoBankController provides a Create and CreateRemote method to          
// create instances of the default interface IBankController exposed by              
// the CoClass BankController. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBankController = class
    class function Create: IBankController;
    class function CreateRemote(const MachineName: string): IBankController;
  end;

implementation

uses ComObj;

class function CoAccount.Create: IAccount;
begin
  Result := CreateComObject(CLASS_Account) as IAccount;
end;

class function CoAccount.CreateRemote(const MachineName: string): IAccount;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Account) as IAccount;
end;

class function CoBankTransaction.Create: IBankTransaction;
begin
  Result := CreateComObject(CLASS_BankTransaction) as IBankTransaction;
end;

class function CoBankTransaction.CreateRemote(const MachineName: string): IBankTransaction;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BankTransaction) as IBankTransaction;
end;

class function CoBankController.Create: IBankController;
begin
  Result := CreateComObject(CLASS_BankController) as IBankController;
end;

class function CoBankController.CreateRemote(const MachineName: string): IBankController;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BankController) as IBankController;
end;

end.
