VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.MDIForm MainMDI 
   BackColor       =   &H8000000C&
   Caption         =   "CE-KMITL Professional Personnel Information System - Version 1.45e Client"
   ClientHeight    =   8190
   ClientLeft      =   60
   ClientTop       =   750
   ClientWidth     =   11880
   Icon            =   "MainMDI.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   0
      Top             =   7440
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   7875
      Width           =   11880
      _ExtentX        =   20955
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   6
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   14111
            MinWidth        =   14111
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   1
            Alignment       =   1
            Enabled         =   0   'False
            Object.Width           =   1058
            MinWidth        =   1058
            TextSave        =   "CAPS"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   2
            Alignment       =   1
            Object.Width           =   1058
            MinWidth        =   1058
            TextSave        =   "NUM"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   3
            Alignment       =   1
            Enabled         =   0   'False
            Object.Width           =   1058
            MinWidth        =   1058
            TextSave        =   "INS"
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Alignment       =   1
            Object.Width           =   1235
            MinWidth        =   1235
            TextSave        =   "7:45 PM"
         EndProperty
         BeginProperty Panel6 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            Object.Width           =   2469
            MinWidth        =   2469
            TextSave        =   "24/3/2003"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.StatusBar StatusBar2 
      Align           =   1  'Align Top
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   11880
      _ExtentX        =   20955
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   5
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   882
            MinWidth        =   882
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   7056
            MinWidth        =   7056
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   2646
            MinWidth        =   2646
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   4410
            MinWidth        =   4410
         EndProperty
         BeginProperty Panel5 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   5821
            MinWidth        =   5821
         EndProperty
      EndProperty
   End
   Begin VB.Menu mSystem 
      Caption         =   "&System"
      Begin VB.Menu mSysSetup 
         Caption         =   "&Setup"
         Begin VB.Menu mSysComMGM 
            Caption         =   "&Company Management"
         End
         Begin VB.Menu mSysUsrMGM 
            Caption         =   "&User Management"
            Begin VB.Menu mSysUsrMGMUsrGrp 
               Caption         =   "User &Group"
            End
            Begin VB.Menu mSysUsrMGMUsrGrpPms 
               Caption         =   "User Group &Permission"
            End
            Begin VB.Menu mSysUsrMGMUsr 
               Caption         =   "&User"
            End
            Begin VB.Menu mSysUsrMGMdash 
               Caption         =   "-"
            End
            Begin VB.Menu mSysUsrMGMUsrSes 
               Caption         =   "User &Session"
            End
         End
         Begin VB.Menu mY 
            Caption         =   "-"
         End
         Begin VB.Menu mSysPreference 
            Caption         =   "&Preference"
         End
      End
      Begin VB.Menu mZ 
         Caption         =   "-"
      End
      Begin VB.Menu mChangeCompany 
         Caption         =   "Change &Company"
      End
      Begin VB.Menu mChangeYear 
         Caption         =   "Change &Data Year"
      End
      Begin VB.Menu mA 
         Caption         =   "-"
      End
      Begin VB.Menu mUserInfo 
         Caption         =   "&User Info"
      End
      Begin VB.Menu mB 
         Caption         =   "-"
      End
      Begin VB.Menu mLogoff 
         Caption         =   "&Log off"
      End
      Begin VB.Menu mExit 
         Caption         =   "E&xit System"
      End
   End
   Begin VB.Menu mHRM 
      Caption         =   "&Human Resource Management"
      Begin VB.Menu mHRMSetup 
         Caption         =   "&Setup"
         Begin VB.Menu mHRMSetupIncomes 
            Caption         =   "&Incomes"
         End
         Begin VB.Menu mHRMSetupDeduction 
            Caption         =   "&Deductions"
         End
      End
      Begin VB.Menu mHRMdash1 
         Caption         =   "-"
      End
      Begin VB.Menu mHRMDept 
         Caption         =   "&Department"
      End
      Begin VB.Menu mHRMPos 
         Caption         =   "&Position"
      End
      Begin VB.Menu mHRMJob 
         Caption         =   "&Job"
      End
      Begin VB.Menu mHRMBanking 
         Caption         =   "&Banking"
         Begin VB.Menu mHRMBankingBank 
            Caption         =   "&Bank"
         End
         Begin VB.Menu mHRMBankingBankBranch 
            Caption         =   "&Bank Branch"
         End
         Begin VB.Menu mHRMBankingdash 
            Caption         =   "-"
         End
         Begin VB.Menu mHRMBankingPRBank 
            Caption         =   "PayRoll-Supported &Bank Branch"
         End
      End
      Begin VB.Menu mHRMdash2 
         Caption         =   "-"
      End
      Begin VB.Menu mHRMEmp 
         Caption         =   "&Employee"
      End
   End
   Begin VB.Menu mPR 
      Caption         =   "&PayRoll System"
      Begin VB.Menu mPRSetup 
         Caption         =   "&Setup"
         Begin VB.Menu mPRSetupWT 
            Caption         =   "Working &Time"
         End
         Begin VB.Menu mPRSetupHoliday 
            Caption         =   "&Holiday"
         End
         Begin VB.Menu mPRSetupdash1 
            Caption         =   "-"
         End
         Begin VB.Menu mPRSetupPTD 
            Caption         =   "Progressive Tax &Deductions"
         End
         Begin VB.Menu mPRSetupPTR 
            Caption         =   "Progressive Tax &Rate"
         End
         Begin VB.Menu mPRSetupSWR 
            Caption         =   "&Social Welfare Rate"
         End
         Begin VB.Menu mPRSetupPFR 
            Caption         =   "&Provident Fund Rate"
         End
      End
      Begin VB.Menu mPRdash1 
         Caption         =   "-"
      End
      Begin VB.Menu mPRLoanMGM 
         Caption         =   "&Loan Management"
      End
      Begin VB.Menu mPRLeaveMGM 
         Caption         =   "Lea&ve Management"
      End
      Begin VB.Menu mPRPeriodProcess 
         Caption         =   "Periodic &Process"
         Begin VB.Menu mPRppLoan 
            Caption         =   "Periodic Process for &Loan"
         End
         Begin VB.Menu mPRppLeave 
            Caption         =   "Periodic Process for Lea&ve"
         End
      End
      Begin VB.Menu mPRdash2 
         Caption         =   "-"
      End
      Begin VB.Menu mPRWageCal 
         Caption         =   "Wage &Calculation"
      End
      Begin VB.Menu mPRWagePay 
         Caption         =   "Wage &Payment"
      End
      Begin VB.Menu mPRDataCvt 
         Caption         =   "&Export Payroll Data for Bank"
         Begin VB.Menu mPRDataCvtTFB 
            Caption         =   "&Thai Farmers Bank PCL."
         End
         Begin VB.Menu mPRDataCvtBAY 
            Caption         =   "Bank of &Ayudhaya PCL."
         End
      End
   End
   Begin VB.Menu mTA 
      Caption         =   "&Time Attendant"
      Begin VB.Menu mTASetup 
         Caption         =   "&Setup"
         Begin VB.Menu mTASetupRecGrp 
            Caption         =   "Recorder &Group"
         End
         Begin VB.Menu mTASetupRec 
            Caption         =   "&Recorder"
         End
      End
      Begin VB.Menu mTAdash1 
         Caption         =   "-"
      End
      Begin VB.Menu mTAEmpCard 
         Caption         =   "&Employee Card"
      End
      Begin VB.Menu mTACardLog 
         Caption         =   "Card Access &Log"
      End
      Begin VB.Menu mTAdash2 
         Caption         =   "-"
      End
      Begin VB.Menu mTAAutoTR 
         Caption         =   "&Automatic Time Record"
      End
      Begin VB.Menu mTAAutolTS 
         Caption         =   "Automatic &Time Sheet"
      End
      Begin VB.Menu mTAdash3 
         Caption         =   "-"
      End
      Begin VB.Menu mTAManualTR 
         Caption         =   "Manual Time &Record"
      End
      Begin VB.Menu mTAManualTS 
         Caption         =   "&Manual Time Sheet"
      End
   End
   Begin VB.Menu mRpt 
      Caption         =   "&Report"
      Begin VB.Menu mRptSys 
         Caption         =   "&System"
         Begin VB.Menu mRptSysCmpList 
            Caption         =   "&Company List"
         End
         Begin VB.Menu mRptSysCmpDetail 
            Caption         =   "&Company Detail"
         End
         Begin VB.Menu mRptSysCmpBrList 
            Caption         =   "&Company Branch List"
         End
         Begin VB.Menu mRptSysUsrGrpList 
            Caption         =   "&User Group List"
         End
         Begin VB.Menu mRptSysUsrList 
            Caption         =   "&User List"
         End
      End
      Begin VB.Menu mRptHRM 
         Caption         =   "&Human Resource Management"
         Begin VB.Menu mRptHRMBankDetail 
            Caption         =   "&Bank Detail"
         End
         Begin VB.Menu mRptHRMBankDetailAll 
            Caption         =   "&Bank Detail ALL"
         End
         Begin VB.Menu mRptHRMBankBrList 
            Caption         =   "&Bank Branch List"
         End
         Begin VB.Menu mRprHRMDedDetail 
            Caption         =   "&Deduction Detail"
         End
         Begin VB.Menu mRprHRMDedList 
            Caption         =   "&Deduction List"
         End
         Begin VB.Menu mRptHRMDeptList 
            Caption         =   "&Department List"
         End
         Begin VB.Menu mRptHRMEmpBAListAll 
            Caption         =   "&Employee Bank Account List ALL"
         End
         Begin VB.Menu mRptHRMEmpBAListByBank 
            Caption         =   "&Employee Bank Account List by Bank"
         End
         Begin VB.Menu mRptHRMEmpBAListByBankBranch 
            Caption         =   "&Employee Bank Account List by Bank Branch"
         End
         Begin VB.Menu mRptHRMEmpBdyList 
            Caption         =   "&Employee Birthday List"
         End
         Begin VB.Menu mRptHRMEmpCard 
            Caption         =   "&Employee Card List by Employee"
         End
         Begin VB.Menu mRptHRMEmpCardAll 
            Caption         =   "&Employee Card List ALL"
         End
         Begin VB.Menu mRptHRMEmpDedList 
            Caption         =   "&Employee Deduction List"
         End
         Begin VB.Menu mRptHRMEmpDeptListOdbEID 
            Caption         =   "&Employee Department List (Ordered by Employee ID)"
         End
         Begin VB.Menu mRptHRMEmpDeptListOdbDept 
            Caption         =   "&Employee Department List (Grouped by Department)"
         End
         Begin VB.Menu mRptHRMEmpDetail 
            Caption         =   "&Employee Detail"
         End
         Begin VB.Menu mRptHRMEmpDetailAll 
            Caption         =   "&Employee Detail ALL"
         End
         Begin VB.Menu mRptHRMEmpIncList 
            Caption         =   "&Employee Incomes List"
         End
         Begin VB.Menu mRptHRMEmpLabel 
            Caption         =   "&Employee Label"
         End
         Begin VB.Menu mRptHRMEmpLabelAll 
            Caption         =   "&Employee Label ALL"
         End
         Begin VB.Menu mRptHRMIncMove 
            Caption         =   "&Employee Wage Movement"
         End
         Begin VB.Menu mRptHRMIncDetail 
            Caption         =   "&Incomes Detail"
         End
         Begin VB.Menu mRptHRMIncList 
            Caption         =   "&Incomes List"
         End
         Begin VB.Menu mRptHRMDetail 
            Caption         =   "&Job Detail"
         End
         Begin VB.Menu mRptHRMJobList 
            Caption         =   "&Job List"
         End
         Begin VB.Menu mRptHRMJobCostByEmp 
            Caption         =   "&Job Costing Report by Employee"
         End
         Begin VB.Menu mRptHRMJobCostByInc 
            Caption         =   "&Job Costing Report by Incomes"
         End
      End
      Begin VB.Menu mRptPR 
         Caption         =   "&Payroll System"
         Begin VB.Menu mRptPRBankTFRpt 
            Caption         =   "&Bank Transfer Report"
         End
         Begin VB.Menu mRptPREmpUsedLvRpt 
            Caption         =   "&Employee Leave Report"
         End
         Begin VB.Menu mRptPRHolidayLst 
            Caption         =   "&Holiday List"
         End
         Begin VB.Menu mRptPRLoanLstByEmp 
            Caption         =   "&Loan List by Employee"
         End
         Begin VB.Menu mRptPRLoanByDate 
            Caption         =   "&Loan List by Date"
         End
         Begin VB.Menu mRptPRLoanDetail 
            Caption         =   "&Loan Detail"
         End
         Begin VB.Menu mRptPRLoanPBbyLoan 
            Caption         =   "&Loan Payback List by Loan No."
         End
         Begin VB.Menu mRptPRLoanPBbyDate 
            Caption         =   "&Loan Payback List by Date"
         End
         Begin VB.Menu mRptPRLoanPBDetail 
            Caption         =   "&Loan Payback Detail"
         End
         Begin VB.Menu mRptPRPdfRate 
            Caption         =   "&Provident Fund Rate Report"
         End
         Begin VB.Menu mRptPRPdfRpt 
            Caption         =   "&Provident Fund Report"
         End
         Begin VB.Menu mRptPRTaxDed 
            Caption         =   "&Progressive Tax Base Deduction Report"
         End
         Begin VB.Menu mRptPRTaxRate 
            Caption         =   "&Progressive Tax Rate Report"
         End
         Begin VB.Menu mRptPRSlipByEID 
            Caption         =   "&Slip by Employee"
         End
         Begin VB.Menu mRptPRSlip 
            Caption         =   "&Slip"
         End
         Begin VB.Menu mRptPRSwfCert 
            Caption         =   "&Social Welfare Certificate"
         End
         Begin VB.Menu mRptPRSwfRate 
            Caption         =   "&Social Welfare Rate Report"
         End
         Begin VB.Menu mRptPRSwfRpt 
            Caption         =   "&Social Welfare Report"
         End
         Begin VB.Menu mRptPRSwfRptCvr 
            Caption         =   "&Social Welfare Report Cover"
         End
         Begin VB.Menu mRptPRSum 
            Caption         =   "&Summary Personal Incomes and Deduction Report"
         End
         Begin VB.Menu mRptPRWTX1 
            Caption         =   "&With Holding Tax 1"
         End
         Begin VB.Menu mRptPRWTX1kor 
            Caption         =   "&With Holding Tax 1kor"
         End
         Begin VB.Menu mRptPRWTX91 
            Caption         =   "&With Holding Tax 91"
         End
         Begin VB.Menu mRptPRWcalDetail 
            Caption         =   "&Wage Calculation Detail"
         End
         Begin VB.Menu mRptPRWcalList 
            Caption         =   "&Wage Calculation List"
         End
         Begin VB.Menu mRptPRWpayDetail 
            Caption         =   "&Wage Payment Detail"
         End
         Begin VB.Menu mRptPRWpayList 
            Caption         =   "&Wage Payment List"
         End
         Begin VB.Menu mRptPRwt 
            Caption         =   "&Working Time"
         End
         Begin VB.Menu mRptPRwtDetail 
            Caption         =   "&Working Time Detail"
         End
      End
      Begin VB.Menu mRptTA 
         Caption         =   "&Time Attendant"
         Begin VB.Menu mRptTAatrListByDT 
            Caption         =   "&Automatic Time Record List by DateTime"
         End
         Begin VB.Menu mRptTAatrListByEID 
            Caption         =   "&Automatic Time Record List by Employee"
         End
         Begin VB.Menu mRptTAatsListByEID 
            Caption         =   "&Automatic Time Sheet List by Employee"
         End
         Begin VB.Menu mRptTAatsListByWD 
            Caption         =   "&Automatic Time Sheet List by WorkDate"
         End
         Begin VB.Menu mRptTAatsLateListByEID 
            Caption         =   "&Automatic Time Sheet Late List by Employee"
         End
         Begin VB.Menu mRptTAatsLateListByWD 
            Caption         =   "&Automatic Time Sheet Late List by WorkDate"
         End
         Begin VB.Menu mRptTAcalByCardID 
            Caption         =   "&Card Access Log by CardID"
         End
         Begin VB.Menu mRptTAcalByDateTime 
            Caption         =   "&Card Access Log by DateTime"
         End
         Begin VB.Menu mRptTAmtrListByDT 
            Caption         =   "&Manual Time Record List by DateTime"
         End
         Begin VB.Menu mRptTAmtrListByEID 
            Caption         =   "&Manual Time Record List by Employee"
         End
         Begin VB.Menu mRptTAmtsListByEID 
            Caption         =   "&Manual Time Sheet List by Employee"
         End
         Begin VB.Menu mRptTAmtsListByWD 
            Caption         =   "&Manual Time Sheet List by WorkDate"
         End
         Begin VB.Menu mRptTAmtsLateListByEID 
            Caption         =   "&Manual Time Sheet Late List by Employee"
         End
         Begin VB.Menu mRptTAmtsLateListByWD 
            Caption         =   "&Manual Time Sheet Late List by WorkDate"
         End
         Begin VB.Menu mRptTARecGrp 
            Caption         =   "&Recorder Group"
         End
         Begin VB.Menu mRptTARec 
            Caption         =   "&Recorder"
         End
      End
   End
   Begin VB.Menu mWindows 
      Caption         =   "&Windows"
      WindowList      =   -1  'True
      Begin VB.Menu mTileHWindow 
         Caption         =   "Tile &Holizontal"
      End
      Begin VB.Menu mTileVWindow 
         Caption         =   "Tile &Vertical"
      End
      Begin VB.Menu mCascadeWindow 
         Caption         =   "&Cascade Window"
      End
      Begin VB.Menu mArrangeIcon 
         Caption         =   "&Arrange Icons"
      End
   End
   Begin VB.Menu mHelp 
      Caption         =   "&Help"
      Begin VB.Menu mAbout 
         Caption         =   "&About System"
      End
   End
End
Attribute VB_Name = "MainMDI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private logoffFLAG As Boolean

Private Sub mAbout_Click()

Load About
About.Show

End Sub

Private Sub mChangeCompany_Click()

Co = MsgBox("Do you want to change company?", vbExclamation + vbYesNo)
If Co = vbYes Then

    MainMDI.StatusBar2.Panels(1).Text = ""
    MainMDI.StatusBar2.Panels(2).Text = ""

    cmpFLAG = False
    CurCmp = ""

    Load CompanySelect
    CompanySelect.Show

End If

End Sub

Private Sub mChangeYear_Click()

dyrFLAG = False
Load DataYearSelect
DataYearSelect.Show
    
End Sub

Private Sub MDIForm_Load()

logoffFLAG = False
Load UserLogin
UserLogin.Show

End Sub

Private Sub MDIForm_Unload(Cancel As Integer)

If logoffFLAG = False Then
    Co = MsgBox("Do you want to exit system?", vbExclamation + vbYesNo)
    If Co = vbNo Then
        Cancel = 1
    Else
        SignOff
        If sConn.State = adStateOpen Then
            sConn.Close
            Set sConn = Nothing
        End If
    End If
Else
    If sConn.State = adStateOpen Then
        sConn.Close
        Set sConn = Nothing
    End If
End If

End Sub

Private Sub mExit_Click()

Unload MainMDI

End Sub

Private Sub mHRMBankingBank_Click()

Dim frmCalled As New Bank
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMBankingBankBranch_Click()

Dim frmCalled As New BankBranch
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMBankingPRBank_Click()

Dim frmCalled As New BankBranchPayRoll
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMDept_Click()

Dim frmCalled As New Department
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMEmp_Click()

Dim frmCalled As New Employee
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMJob_Click()

Dim frmCalled As New Job
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMPos_Click()

Dim frmCalled As New Position
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMSetupDeduction_Click()

Dim frmCalled As New Deductions
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mHRMSetupIncomes_Click()

Dim frmCalled As New Incomes
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mLogoff_Click()

Co = MsgBox("Do you want to log off?", vbExclamation + vbYesNo)
If Co = vbYes Then

LogOff

End If

End Sub

Private Sub mPRDataCvtBAY_Click()

Dim frmCalled As New ExportPRDataForBAY
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRDataCvtTFB_Click()

Dim frmCalled As New ExportPRDataForTFB
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRLeaveMGM_Click()

Dim frmCalled As New Leave
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub


Private Sub mPRLoanMGM_Click()

Dim frmCalled As New Loan
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRppLeave_Click()

Dim frmCalled As New PeriodicProcessLeave
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRppLoan_Click()

Dim frmCalled As New PeriodicProcessLoan
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupHoliday_Click()

Dim frmCalled As New Holiday
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupPFR_Click()

Dim frmCalled As New ProvidentFundRate
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupPTD_Click()

Dim frmCalled As New ProgressiveTaxBaseDeduction
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupPTR_Click()

Dim frmCalled As New ProgressiveTaxRate
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupSWR_Click()

Dim frmCalled As New SocialWelfareRate
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRSetupWT_Click()

Dim frmCalled As New WorkingTime
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRWageCal_Click()

Dim frmCalled As New WageCalculation
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mPRWagePay_Click()

Dim frmCalled As New WagePayment
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mRprHRMDedDetail_Click()

CallReport "rp_hrm_deduction_detail", "Report: Deduction Detail", True

End Sub

Private Sub mRprHRMDedList_Click()

CallReport "rp_hrm_deduction_list", "Report: Deduction List", True

End Sub

Private Sub mRptHRMBankBrList_Click()

CallReport "rp_hrm_bankbranch_listbank", "Report: Bank Branch List", False

End Sub

Private Sub mRptHRMBankDetail_Click()

CallReport "rp_hrm_bank_detail", "Report: Bank Deatil", False

End Sub

Private Sub mRptHRMBankDetailAll_Click()

CallReport "rp_hrm_bank_detail_all", "Report: Bank Deatil ALL", False

End Sub

Private Sub mRptHRMDeptList_Click()

CallReport "rp_hrm_department_all", "Report: Department List", True

End Sub

Private Sub mRptHRMDetail_Click()

CallReport "rp_hrm_job", "Report: Job Detail", True

End Sub

Private Sub mRptHRMEmpBAListAll_Click()

CallReport "rp_hrm_employee_bank_all", "Report: Employee Bank Account List ALL", True

End Sub

Private Sub mRptHRMEmpBAListByBank_Click()

CallReport "rp_hrm_employee_bank_select_by_BankID", "Report: Employee Bank Account List by Bank", True

End Sub

Private Sub mRptHRMEmpBAListByBankBranch_Click()

CallReport "rp_hrm_employee_bank_select_by_BankBrID", "Report: Employee Bank Account List by Bank Branch", True

End Sub

Private Sub mRptHRMEmpBdyList_Click()

CallReport "rp_hrm_employee_birthday", "Report: Employee Birthday List", True

End Sub

Private Sub mRptHRMEmpCard_Click()

CallReport "rp_hrm_employee_card", "Report: Employee Card List by Employee", True

End Sub

Private Sub mRptHRMEmpCardAll_Click()

CallReport "rp_hrm_employee_card_all", "Report: Employee Card List ALL", True

End Sub

Private Sub mRptHRMEmpDedList_Click()

CallReport "rp_hrm_employee_deduction", "Report: Employee Deduction List", True

End Sub

Private Sub mRptHRMEmpDeptListOdbDept_Click()

CallReport "rp_employee_department_by_deptLevel", "Report: Employee Department List (Grouped by Department)", True

End Sub

Private Sub mRptHRMEmpDeptListOdbEID_Click()

CallReport "rp_hrm_employee_department", "Report: Employee Department List (Ordered by Employee ID)", True

End Sub

Private Sub mRptHRMEmpDetail_Click()

CallReport "rp_hrm_employee_detail", "Report: Employee Detail", True

End Sub

Private Sub mRptHRMEmpDetailAll_Click()

CallReport "rp_hrm_employee_detail_all", "Report: Employee Detail ALL", True

End Sub

Private Sub mRptHRMEmpIncList_Click()

CallReport "rp_hrm_employee_incomes", "Report: Employee Incomes List", True

End Sub

Private Sub mRptHRMEmpLabel_Click()

CallReport "rp_hrm_employee_label", "Report: Employee Label", True

End Sub

Private Sub mRptHRMEmpLabelAll_Click()

CallReport "rp_hrm_employee_label_all", "Report: Employee Label ALL", True

End Sub

Private Sub mRptHRMIncDetail_Click()

CallReport "rp_hrm_income_detail", "Report: Incomes Detail", True

End Sub

Private Sub mRptHRMIncList_Click()

CallReport "rp_hrm_income_list", "Report: Incomes List", True

End Sub

Private Sub mRptHRMIncMove_Click()

CallReport "rp_hrm_incomes_change", "Report: Incomes Movement", True

End Sub

Private Sub mRptHRMJobCostByEmp_Click()

CallReport "rp_hrm_job_cost_by_eid", "Report: Job Costing Report by Employee", True

End Sub

Private Sub mRptHRMJobCostByInc_Click()

CallReport "rp_hrm_job_cost_by_income_code", "Report: Job Costing Report by Incomes", True

End Sub

Private Sub mRptHRMJobList_Click()

CallReport "rp_hrm_job_all", "Report: Job List", True

End Sub

Private Sub mRptPRBankTFRpt_Click()

CallReport "rp_bank_transfer_by_bankbranch", "Report: Bank Transfer Report", True

End Sub

Private Sub mRptPREmpUsedLvRpt_Click()

CallReport "rp_pr_employee_leave_used", "Report: Employee Leave Report", False

End Sub

Private Sub mRptPRHolidayLst_Click()

CallReport "rp_pr_holiday", "Report: Holiday List", True

End Sub

Private Sub mRptPRLoanByDate_Click()

CallReport "rp_pr_loan_by_month", "Report: Loan List by Date", True

End Sub

Private Sub mRptPRLoanDetail_Click()

CallReport "rp_pr_loan_detail", "Report: Loan Detail", True

End Sub

Private Sub mRptPRLoanLstByEmp_Click()

CallReport "rp_pr_loan_by_EID", "Report: Loan List by Employee", True

End Sub

Private Sub mRptPRLoanPBbyDate_Click()

CallReport "rp_pr_loan_payback_by_month", "Report: Loan Payback List by Date", True

End Sub

Private Sub mRptPRLoanPBbyLoan_Click()

CallReport "rp_pr_loan_payback_by_loan_no", "Report: Loan Payback List by Loan No.", True

End Sub

Private Sub mRptPRLoanPBDetail_Click()

CallReport "rp_pr_loan_payback_information", "Report: Loan Payback Detail", True

End Sub

Private Sub mRptPRPdfRate_Click()

CallReport "rp_pr_provident_fund", "Report: Provident Fund Rate Report", True

End Sub

Private Sub mRptPRPdfRpt_Click()

CallReport "rp_pr_pdf_detail", "Report: Provident Fund Report", True

End Sub

Private Sub mRptPRSlip_Click()

CallReport "rp_pr_slip_r", "Report: Slip", True

End Sub

Private Sub mRptPRSlipByEID_Click()

CallReport "rp_pr_slip", "Report: Slip by Employee", True

End Sub

Private Sub mRptPRSum_Click()

CallReport "rp_pr_sum_incomes_deduction", "Report: Summary Personal Incomes and Deduction Report", True

End Sub

Private Sub mRptPRSwfCert_Click()

CallReport "rp_pr_swf_cert", "Report: Social Welfare Certificate", True

End Sub

Private Sub mRptPRSwfRate_Click()

CallReport "rp_pr_social_welfare", "Report: Social Welfare Rate Report", True

End Sub

Private Sub mRptPRSwfRpt_Click()

CallReport "rp_pr_swf_detail", "Report: Social Welfare Report", True

End Sub

Private Sub mRptPRSwfRptCvr_Click()

CallReport "rp_pr_swr_cover", "Report: Social Welfare Report Cover", True

End Sub

Private Sub mRptPRTaxDed_Click()

CallReport "rp_pr_progressive_tax_deduction", "Report: Progressive Tax Base Deduction Report", True

End Sub

Private Sub mRptPRTaxRate_Click()

CallReport "rp_pr_progressive_tax_rate", "Report: Progressive Tax Rate Report", True

End Sub

Private Sub mRptPRWcalDetail_Click()

CallReport "rp_pr_wage_calc_detail_all", "Report: Wage Calculation Detail", True

End Sub

Private Sub mRptPRWcalList_Click()

CallReport "rp_pr_wage_calc_information_all", "Report: Wage Calculation List", True

End Sub

Private Sub mRptPRWpayDetail_Click()

CallReport "rp_pr_wage_payment_detail", "Report: Wage Payment Detail", True

End Sub

Private Sub mRptPRWpayList_Click()

CallReport "rp_pr_wage_payment_list", "Report: Wage Payment List", True

End Sub

Private Sub mRptPRwt_Click()

CallReport "rp_pr_working_time_all", "Report: Working Time", True

End Sub

Private Sub mRptPRwtDetail_Click()

CallReport "rp_pr_working_time_detail", "Report: Working Time Detail", True

End Sub

Private Sub mRptPRWTX1_Click()

CallReport "rp_pr_Tax_1", "Report: With Holding Tax 1", True

End Sub

Private Sub mRptPRWTX1kor_Click()

CallReport "rp_pr_Tax_1_kor", "Report: With Holding Tax 1kor", True

End Sub

Private Sub mRptPRWTX91_Click()

CallReport "rp_pr_tax_91", "Report: With Holding Tax 91", True

End Sub

Private Sub mRptSysCmpDetail_Click()

CallReport "rp_st_company_detail", "Report: Company Detail", False

End Sub

Private Sub mRptSysCmpList_Click()

CallReport "rp_st_company_list", "Report: Company List", False

End Sub

Private Sub mRptSysUsrGrpList_Click()

CallReport "rp_st_user_group_list", "Report: User Group List", False

End Sub

Private Sub mRptSysUsrList_Click()

CallReport "rp_st_user_list", "Report: User List", False

End Sub

Private Sub mRptTAatrListByDT_Click()

CallReport "rp_ta_auto_time_record_by_DateTime", "Report: Automatic Time Record List by DateTime", True

End Sub

Private Sub mRptTAatrListByEID_Click()

CallReport "rp_ta_auto_time_record_by_EID", "Report: Automatic Time Record List by Employee", True

End Sub

Private Sub mRptTAatsLateListByEID_Click()

CallReport "rp_ta_auto_time_sheet_late_by_EID", "Report: Automatic Time Sheet Late List by EID", True

End Sub

Private Sub mRptTAatsLateListByWD_Click()

CallReport "rp_ta_auto_time_sheet_late_by_WorkDate", "Report: Automatic Time Sheet Late List by WorkDate", True

End Sub

Private Sub mRptTAatsListByEID_Click()

CallReport "rp_ta_auto_time_sheet_by_EID", "Report: Automatic Time Sheet List by Employee", True

End Sub

Private Sub mRptTAatsListByWD_Click()

CallReport "rp_ta_auto_time_sheet_by_WorkDate", "Report: Automatic Time Sheet List by WorkDate", True

End Sub

Private Sub mRptTAcalByCardID_Click()

CallReport "rp_ta_card_accesslog_CardID", "Report: Card Access Log by Card ID", False

End Sub

Private Sub mRptTAcalByDateTime_Click()

CallReport "rp_ta_card_accesslog_DateTime", "Report: Card Access Log by DateTime", False

End Sub

Private Sub mRptTAmtrListByDT_Click()

CallReport "rp_ta_manual_time_record_by_DateTime", "Report: Manual Time Record List by DateTime", True

End Sub

Private Sub mRptTAmtrListByEID_Click()

CallReport "rp_ta_manual_time_record_by_EID", "Report: Manual Time Record List by Employee", True

End Sub

Private Sub mRptTAmtsLateListByEID_Click()

CallReport "rp_ta_manual_time_sheet_late_by_EID", "Report: Manual Time Sheet Late List by EID", True

End Sub

Private Sub mRptTAmtsLateListByWD_Click()

CallReport "rp_ta_manual_time_sheet_late_by_WorkDate", "Report: Manual Time Sheet Late List by WorkDate", True

End Sub

Private Sub mRptTAmtsListByEID_Click()

CallReport "rp_ta_auto_time_sheet_by_EID", "Report: Manual Time Sheet List by Employee", True

End Sub

Private Sub mRptTAmtsListByWD_Click()

CallReport "rp_ta_manual_time_sheet_by_WorkDate", "Report: Manual Time Sheet List by WorkDate", True

End Sub

Private Sub mRptTARec_Click()

CallReport "rp_ta_recodergrouplist", "Report: Recorder List", False

End Sub

Private Sub mRptTARecGrp_Click()

CallReport "rp_ta_recodergroup", "Report: Recorder Group List", False

End Sub

Private Sub mSysComMGM_Click()

Dim frmCalled As New Company
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mSysPreference_Click()

Load Preference
Preference.Show

End Sub

Private Sub mSysUsrMGMUsr_Click()

Dim frmCalled As New User
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mSysUsrMGMUsrGrp_Click()

Dim frmCalled As New UserGroup
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mSysUsrMGMUsrGrpPms_Click()

Dim frmCalled As New UserGroupPermission
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mSysUsrMGMUsrSes_Click()

Dim frmCalled As New UserSession
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTAAutolTS_Click()

Dim frmCalled As New AutoTimeSheet
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTAAutoTR_Click()

Dim frmCalled As New AutoTimeRecord
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTACardLog_Click()

Dim frmCalled As New CardAccessLog
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTAEmpCard_Click()

Dim frmCalled As New EmployeeCard
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTAManualTR_Click()

Dim frmCalled As New ManualTimeRecord
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTAManualTS_Click()

Dim frmCalled As New ManualTimeSheet
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTASetupRec_Click()

Dim frmCalled As New RecorderGroupList
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mTASetupRecGrp_Click()

Dim frmCalled As New RecorderGroup
Load frmCalled
frmCalled.Show
Set frmCalled.Caller = Me

End Sub

Private Sub mUserInfo_Click()

Load UserInfo
UserInfo.Show

End Sub

Private Sub Timer1_Timer()

Dim zCmd As New ADODB.Command
Dim zRs As New ADODB.Recordset
Dim zPr(2) As Variant

On Error GoTo ErrHandler

Set zCmd.ActiveConnection = sConn

zCmd.CommandType = adCmdStoredProc
zCmd.CommandText = "app_user_session_active_confirm"

zPr(0) = CurSes
zPr(1) = CurUser
zPr(2) = CurWst

Set zRs = zCmd.Execute(, zPr)

If zRs("ConfirmedFlag") = 0 Then
    MsgBox "Unable to refresh user active status..." + Chr(13) + Chr(10) + "The system is forced to log off automatically...", vbCritical + vbOKOnly
    LogOff
End If

Exit Sub

ErrHandler:

MsgBox Err.Description, vbCritical + vbOKOnly

End Sub

Public Sub LogOff()

SignOff

logoffFLAG = True

CurUser = ""
CurCmp = ""
CurSes = ""
CurDyr = 0
cmpFLAG = False
dyrFLAG = False

RefreshMenuAccess

Unload MainMDI
Load MainMDI
MainMDI.Show

MainMDI.Timer1.Enabled = False

End Sub

Public Sub SignOff()

Dim zCmd As New ADODB.Command
Dim zRs As New ADODB.Recordset
Dim zPr(2) As Variant

On Error GoTo ErrHandler

Set zCmd.ActiveConnection = sConn

zCmd.CommandType = adCmdStoredProc
zCmd.CommandText = "app_user_session_finish"

zPr(0) = CurSes
zPr(1) = CurUser
zPr(2) = CurWst

Set zRs = zCmd.Execute(, zPr)

Exit Sub

ErrHandler:

End Sub

Public Sub RefreshMenuAccess()

mHRM.Enabled = GetAccess("HRM")
mHRMSetup.Enabled = GetAccess("HRMs")
mHRMSetupIncomes.Enabled = GetAccess("HRMsINC")
mHRMSetupDeduction.Enabled = GetAccess("HRMsDED")
mHRMDept.Enabled = GetAccess("HRMdept")
mHRMPos.Enabled = GetAccess("HRMpos")
mHRMJob.Enabled = GetAccess("HRMjob")
mHRMBanking.Enabled = GetAccess("HRMb")
mHRMBankingBank.Enabled = GetAccess("HRMbBANK")
mHRMBankingBankBranch.Enabled = GetAccess("HRMbBANKBR")
mHRMBankingPRBank.Enabled = GetAccess("HRMbBANKPR")
mHRMEmp.Enabled = GetAccess("HRMemp")

mPR.Enabled = GetAccess("PRS")
mPRSetup.Enabled = GetAccess("PRSs")
mPRSetupWT.Enabled = GetAccess("PRSsWKT")
mPRSetupHoliday.Enabled = GetAccess("PRSsHOL")
mPRSetupPTD.Enabled = GetAccess("PRSsPTD")
mPRSetupPTR.Enabled = GetAccess("PRSsPTR")
mPRSetupSWR.Enabled = GetAccess("PRSsSWR")
mPRSetupPFR.Enabled = GetAccess("PRSsPFR")
mPRLoanMGM.Enabled = GetAccess("PRSloan")
mPRLeaveMGM.Enabled = GetAccess("PRSleave")
mPRPeriodProcess.Enabled = GetAccess("PRSpp")
mPRppLoan.Enabled = GetAccess("PRSppLOAN")
mPRppLeave.Enabled = GetAccess("PRSppLEAVE")
mPRWageCal.Enabled = GetAccess("PRSwc")
mPRWagePay.Enabled = GetAccess("PRSwp")
mPRDataCvt.Enabled = GetAccess("PRSepd")
mPRDataCvtTFB.Enabled = GetAccess("PRSepdTFB")
mPRDataCvtBAY.Enabled = GetAccess("PRSepdBAY")

mTA.Enabled = GetAccess("TA")
mTASetup.Enabled = GetAccess("TAs")
mTASetupRecGrp.Enabled = GetAccess("TAsRG")
mTASetupRec.Enabled = GetAccess("TAsR")
mTAEmpCard.Enabled = GetAccess("TAec")
mTACardLog.Enabled = GetAccess("TAcal")
mTAAutoTR.Enabled = GetAccess("TAatr")
mTAAutolTS.Enabled = GetAccess("TAats")
mTAManualTR.Enabled = GetAccess("TAmtr")
mTAManualTS.Enabled = GetAccess("TAmts")

mRpt.Enabled = GetAccess("RP")
mRptHRM.Enabled = GetAccess("RPh")
mRptHRMBankBrList.Enabled = GetAccess("RPhBBL")
mRptHRMBankDetail.Enabled = GetAccess("RPhBD")
mRptHRMBankDetailAll.Enabled = GetAccess("RPhBDA")
mRprHRMDedDetail.Enabled = GetAccess("RPhDDD")
mRprHRMDedList.Enabled = GetAccess("RPhDDL")
mRptHRMDeptList.Enabled = GetAccess("RPhDPL")
mRptHRMEmpBAListAll.Enabled = GetAccess("RPhEBALA")
mRptHRMEmpBAListByBank.Enabled = GetAccess("RPhEBALB")
mRptHRMEmpBAListByBankBranch.Enabled = GetAccess("RPhEBALBB")
mRptHRMEmpBdyList.Enabled = GetAccess("RPhEBL")
mRptHRMEmpCardAll.Enabled = GetAccess("RPhECLA")
mRptHRMEmpCard.Enabled = GetAccess("RPhECLE")
mRptHRMEmpDetail.Enabled = GetAccess("RPhED")
mRptHRMEmpDetailAll.Enabled = GetAccess("RPhEDA")
mRptHRMEmpDedList.Enabled = GetAccess("RPhEDDL")
mRptHRMEmpDeptListOdbDept.Enabled = GetAccess("RPhEDPLD")
mRptHRMEmpDeptListOdbEID.Enabled = GetAccess("RPhEDPLE")
mRptHRMEmpIncList.Enabled = GetAccess("RPhEIL")
mRptHRMEmpLabel.Enabled = GetAccess("RPhEL")
mRptHRMEmpLabelAll.Enabled = GetAccess("RPhELA")
mRptHRMIncMove.Enabled = GetAccess("RPhEWM")
mRptHRMIncDetail.Enabled = GetAccess("RPhID")
mRptHRMIncList.Enabled = GetAccess("RPhIL")
mRptHRMDetail.Enabled = GetAccess("RPhJD")
mRptHRMJobList.Enabled = GetAccess("RPhJL")
mRptHRMJobCostByEmp.Enabled = GetAccess("RPhJCRE")
mRptHRMJobCostByInc.Enabled = GetAccess("RPhJCRI")
mRptPR.Enabled = GetAccess("RPp")
mRptPRBankTFRpt.Enabled = GetAccess("RPpBTR")
mRptPREmpUsedLvRpt.Enabled = GetAccess("RPpELR")
mRptPRHolidayLst.Enabled = GetAccess("RPpHL")
mRptPRLoanDetail.Enabled = GetAccess("RPpLD")
mRptPRLoanByDate.Enabled = GetAccess("RPpLLD")
mRptPRLoanLstByEmp.Enabled = GetAccess("RPpLLE")
mRptPRLoanPBDetail.Enabled = GetAccess("RPpLPD")
mRptPRLoanPBbyDate.Enabled = GetAccess("RPpLPLD")
mRptPRLoanPBbyLoan.Enabled = GetAccess("RPpLPLLN")
mRptPRPdfRpt.Enabled = GetAccess("RPpPFR")
mRptPRPdfRate.Enabled = GetAccess("RPpPFRR")
mRptPRTaxDed.Enabled = GetAccess("RPpPTBDR")
mRptPRTaxRate.Enabled = GetAccess("RPpPTRR")
mRptPRSlip.Enabled = GetAccess("RPpSL")
mRptPRSlipByEID.Enabled = GetAccess("RPpSLE")
mRptPRSum.Enabled = GetAccess("RPpSPIDR")
mRptPRSwfCert.Enabled = GetAccess("RPpSWC")
mRptPRSwfRpt.Enabled = GetAccess("RPpSWR")
mRptPRSwfRptCvr.Enabled = GetAccess("RPpSWRC")
mRptPRSwfRate.Enabled = GetAccess("RPpSWRR")
mRptPRWcalDetail.Enabled = GetAccess("RPpWCD")
mRptPRWcalList.Enabled = GetAccess("RPpWCL")
mRptPRWTX1.Enabled = GetAccess("RPpWHT1")
mRptPRWTX1kor.Enabled = GetAccess("RPpWHT1k")
mRptPRWTX91.Enabled = GetAccess("RPpWHT91")
mRptPRWpayDetail.Enabled = GetAccess("RPpWPD")
mRptPRWpayList.Enabled = GetAccess("RPpWPL")
mRptPRwtDetail.Enabled = GetAccess("RPpWT")
mRptPRwt.Enabled = GetAccess("RPpWTL")
mRptSys.Enabled = GetAccess("RPs")
mRptSysCmpBrList.Enabled = GetAccess("RPsCBL")
mRptSysCmpDetail.Enabled = GetAccess("RPsCD")
mRptSysCmpList.Enabled = GetAccess("RPsCL")
mRptSysUsrGrpList.Enabled = GetAccess("RPsUGL")
mRptSysUsrList.Enabled = GetAccess("RPsUL")
mRptTA.Enabled = GetAccess("RPt")
mRptTAatrListByDT.Enabled = GetAccess("RPtATRLDT")
mRptTAatrListByEID.Enabled = GetAccess("RPtATRLE")
mRptTAatsListByEID.Enabled = GetAccess("RPtATSLE")
mRptTAatsLateListByEID.Enabled = GetAccess("RPtATSLLE")
mRptTAatsLateListByWD.Enabled = GetAccess("RPtATSLLWD")
mRptTAatsListByWD.Enabled = GetAccess("RPtATSLWD")
mRptTAcalByCardID.Enabled = GetAccess("RPtCALCI")
mRptTAcalByDateTime.Enabled = GetAccess("RPtCALDT")
mRptTAmtrListByDT.Enabled = GetAccess("RPtMTRLDT")
mRptTAmtrListByEID.Enabled = GetAccess("RPtMTRLE")
mRptTAmtsListByEID.Enabled = GetAccess("RPtMTSLE")
mRptTAmtsLateListByEID.Enabled = GetAccess("RPtMTSLLE")
mRptTAmtsLateListByWD.Enabled = GetAccess("RPtMTSLLWD")
mRptTAmtsListByWD.Enabled = GetAccess("RPtMTSLWD")
mRptTARec.Enabled = GetAccess("RPtR")
mRptTARecGrp.Enabled = GetAccess("RPtRG")

End Sub
