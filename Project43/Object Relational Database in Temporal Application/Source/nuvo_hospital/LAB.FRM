VERSION 5.00
Object = "{BF448208-70DE-11CF-947B-0020AF75C4BA}#1.0#0"; "navctl32.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form lab 
   Caption         =   "LAB"
   ClientHeight    =   9600
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   11880
   Icon            =   "lab.frx":0000
   LinkTopic       =   "Form5"
   Picture         =   "lab.frx":030A
   ScaleHeight     =   9600
   ScaleWidth      =   11880
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   8400
      Top             =   240
   End
   Begin VB.TextBox tx_datetime 
      BackColor       =   &H8000000B&
      Height          =   285
      Left            =   9840
      TabIndex        =   44
      Top             =   360
      Width           =   1455
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   8505
      Left            =   360
      TabIndex        =   0
      Top             =   720
      Width           =   10995
      _ExtentX        =   19394
      _ExtentY        =   15002
      _Version        =   393216
      Tabs            =   1
      TabsPerRow      =   5
      TabHeight       =   882
      TabCaption(0)   =   "Insert Lab Result"
      TabPicture(0)   =   "lab.frx":17667C
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Label13"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "txi_date"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Frame3"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "cmn_exit"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).ControlCount=   4
      Begin VB.CommandButton cmn_exit 
         Caption         =   "Exit"
         Height          =   735
         Left            =   9240
         Picture         =   "lab.frx":176996
         Style           =   1  'Graphical
         TabIndex        =   13
         Top             =   7680
         Width           =   1455
      End
      Begin VB.Frame Frame3 
         Height          =   6975
         Left            =   360
         TabIndex        =   21
         Top             =   600
         Width           =   10335
         Begin VB.Frame Frame8 
            Caption         =   "Condition"
            Height          =   855
            Left            =   120
            TabIndex        =   38
            Top             =   240
            Width           =   10095
            Begin VB.ComboBox cbi_dn 
               DataSource      =   "diagnosis_nav"
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   960
               Sorted          =   -1  'True
               TabIndex        =   1
               Text            =   "diagnosis.dia_code"
               Top             =   360
               Width           =   1935
            End
            Begin VB.ComboBox cbi_an 
               DataSource      =   "admission_nav"
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   315
               Left            =   4200
               Sorted          =   -1  'True
               TabIndex        =   3
               Text            =   "admission.ad_code"
               Top             =   360
               Width           =   1935
            End
            Begin VB.OptionButton op_dn 
               Caption         =   "D.N."
               Height          =   255
               Left            =   240
               TabIndex        =   39
               Top             =   360
               Value           =   -1  'True
               Width           =   735
            End
            Begin VB.OptionButton op_an 
               Caption         =   "A.N."
               Height          =   255
               Left            =   3600
               TabIndex        =   2
               Top             =   360
               Width           =   615
            End
         End
         Begin VB.Frame Frame5 
            Caption         =   "ผล X-RAY"
            Height          =   2655
            Left            =   5040
            TabIndex        =   35
            Top             =   1920
            Width           =   5175
            Begin VB.CommandButton cmi_ins3 
               Caption         =   "Insert"
               Height          =   495
               Left            =   3720
               TabIndex        =   11
               Top             =   480
               Width           =   1215
            End
            Begin VB.CommandButton cmi_browse 
               Caption         =   "Browse"
               Height          =   495
               Left            =   480
               TabIndex        =   12
               Top             =   1200
               Width           =   855
            End
            Begin VB.TextBox txi_valp 
               Height          =   285
               Left            =   1440
               TabIndex        =   36
               Top             =   1320
               Width           =   3615
            End
            Begin VB.ComboBox cbi_labp 
               Height          =   315
               Left            =   480
               TabIndex        =   10
               Top             =   600
               Width           =   3015
            End
            Begin MSComDlg.CommonDialog cmd_dialog 
               Left            =   480
               Top             =   1800
               _ExtentX        =   847
               _ExtentY        =   847
               _Version        =   393216
            End
            Begin VB.Label Label5 
               Caption         =   "ชื่อไฟล์"
               Height          =   255
               Left            =   1440
               TabIndex        =   37
               Top             =   1080
               Width           =   495
            End
         End
         Begin VB.Frame Frame6 
            Caption         =   "ผล LAB"
            Height          =   4935
            Left            =   120
            TabIndex        =   30
            Top             =   1920
            Width           =   4935
            Begin VB.Frame Frame10 
               Caption         =   "ผล LAB  ตีวอักษร"
               Height          =   2415
               Left            =   0
               TabIndex        =   31
               Top             =   2520
               Width           =   4935
               Begin VB.ComboBox cbi_labc 
                  Height          =   315
                  Left            =   360
                  TabIndex        =   7
                  Top             =   600
                  Width           =   2655
               End
               Begin VB.CommandButton cmi_ins2 
                  Caption         =   "Insert"
                  Height          =   495
                  Left            =   3360
                  TabIndex        =   9
                  Top             =   720
                  Width           =   1215
               End
               Begin VB.TextBox txi_valc 
                  Height          =   285
                  Left            =   1560
                  TabIndex        =   8
                  Top             =   1200
                  Width           =   735
               End
               Begin VB.Label Label12 
                  Caption         =   "VALUE"
                  Height          =   255
                  Left            =   840
                  TabIndex        =   32
                  Top             =   1200
                  Width           =   615
               End
            End
            Begin VB.Frame Frame9 
               Caption         =   "ผล LAB  ตัวเลข"
               Height          =   2415
               Left            =   0
               TabIndex        =   33
               Top             =   240
               Width           =   4935
               Begin VB.TextBox txi_valn 
                  Height          =   285
                  Left            =   1560
                  TabIndex        =   5
                  Top             =   1080
                  Width           =   735
               End
               Begin VB.CommandButton cmi_ins1 
                  Caption         =   "Insert"
                  Height          =   495
                  Left            =   3360
                  TabIndex        =   6
                  Top             =   480
                  Width           =   1215
               End
               Begin VB.ComboBox cbi_labn 
                  Height          =   315
                  Left            =   360
                  TabIndex        =   4
                  Top             =   480
                  Width           =   2655
               End
               Begin VB.Label Label11 
                  Caption         =   "VALUE"
                  Height          =   255
                  Left            =   840
                  TabIndex        =   34
                  Top             =   1080
                  Width           =   615
               End
            End
         End
         Begin VB.Frame Frame11 
            Caption         =   "รายละเอียดคนไข้"
            Height          =   855
            Left            =   120
            TabIndex        =   23
            Top             =   1080
            Width           =   10095
            Begin VB.TextBox txi_sur 
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   285
               Left            =   4680
               TabIndex        =   26
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txi_name 
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   285
               Left            =   2520
               TabIndex        =   25
               Top             =   360
               Width           =   1455
            End
            Begin VB.TextBox txi_hn 
               Enabled         =   0   'False
               BeginProperty Font 
                  Name            =   "MS Dialog"
                  Size            =   7.5
                  Charset         =   222
                  Weight          =   700
                  Underline       =   0   'False
                  Italic          =   0   'False
                  Strikethrough   =   0   'False
               EndProperty
               Height          =   285
               Left            =   600
               TabIndex        =   24
               Top             =   360
               Width           =   1455
            End
            Begin VB.Label Label19 
               Caption         =   "นามสกุล"
               Height          =   255
               Left            =   4080
               TabIndex        =   29
               Top             =   360
               Width           =   615
            End
            Begin VB.Label Label20 
               Caption         =   "ชื่อ"
               Height          =   255
               Left            =   2280
               TabIndex        =   28
               Top             =   360
               Width           =   375
            End
            Begin VB.Label Label22 
               Caption         =   "H.N."
               Height          =   255
               Left            =   240
               TabIndex        =   27
               Top             =   360
               Width           =   375
            End
         End
         Begin MSComctlLib.ListView lsi_lab 
            Height          =   2175
            Left            =   5160
            TabIndex        =   22
            Top             =   4680
            Width           =   5055
            _ExtentX        =   8916
            _ExtentY        =   3836
            View            =   3
            LabelWrap       =   -1  'True
            HideSelection   =   -1  'True
            GridLines       =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            BorderStyle     =   1
            Appearance      =   1
            NumItems        =   2
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "ชื่อ LAB"
               Object.Width           =   4410
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "ค่า"
               Object.Width           =   4410
            EndProperty
         End
      End
      Begin VB.TextBox txi_date 
         Enabled         =   0   'False
         Height          =   285
         Left            =   1560
         TabIndex        =   20
         Top             =   7800
         Width           =   1335
      End
      Begin VB.Label Label13 
         Caption         =   "วันเวลา insert"
         Height          =   255
         Left            =   480
         TabIndex        =   40
         Top             =   7800
         Width           =   975
      End
   End
   Begin Navctl32Lib.NavControl admission_nav 
      Height          =   600
      Left            =   2640
      TabIndex        =   16
      Top             =   0
      Visible         =   0   'False
      Width           =   1350
      _Version        =   65536
      _ExtentX        =   2381
      _ExtentY        =   1058
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DOF             =   -1  'True
      ModelFile       =   "D:\hospital_install\nuvohospital_vb\nuvo_hospital.MLT"
      DataPath        =   ""
      Table           =   "admission"
      DataGroup       =   "admission"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      Mode01LastWidth =   90
      Mode01LastHeight=   40
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Left       =   26
      Ctrl1Width      =   31
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Left       =   57
      Ctrl2Width      =   31
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Left       =   88
      Ctrl3Width      =   31
      Ctrl3Height     =   20
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   30
      Ctrl4Height     =   20
      Ctrl5ID         =   5
      Ctrl5Style      =   2
      Ctrl5Caption    =   "admission - #"
      Ctrl5Top        =   20
      Ctrl5Width      =   150
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Top        =   20
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Left       =   45
      Ctrl7Top        =   20
      Ctrl7Width      =   45
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Left       =   30
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Left       =   60
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Top       =   40
      Ctrl11Width     =   50
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   40
      Ctrl12Width     =   99
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   100
      Ctrl13Top       =   40
      Ctrl13Width     =   50
      Ctrl13Height    =   20
   End
   Begin Navctl32Lib.NavControl patience_nav 
      Height          =   600
      Left            =   1320
      TabIndex        =   15
      Top             =   0
      Visible         =   0   'False
      Width           =   1350
      _Version        =   65536
      _ExtentX        =   2381
      _ExtentY        =   1058
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DOF             =   -1  'True
      ModelFile       =   "D:\hospital_install\nuvohospital_vb\nuvo_hospital.MLT"
      DataPath        =   ""
      Table           =   "patience"
      DataGroup       =   "patience"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      Mode01LastWidth =   90
      Mode01LastHeight=   40
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Left       =   26
      Ctrl1Width      =   31
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Left       =   57
      Ctrl2Width      =   31
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Left       =   88
      Ctrl3Width      =   31
      Ctrl3Height     =   20
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   30
      Ctrl4Height     =   20
      Ctrl5ID         =   5
      Ctrl5Style      =   2
      Ctrl5Caption    =   "patience - #"
      Ctrl5Top        =   20
      Ctrl5Width      =   150
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Top        =   20
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Left       =   45
      Ctrl7Top        =   20
      Ctrl7Width      =   45
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Left       =   30
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Left       =   60
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Top       =   40
      Ctrl11Width     =   50
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   40
      Ctrl12Width     =   99
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   100
      Ctrl13Top       =   40
      Ctrl13Width     =   50
      Ctrl13Height    =   20
   End
   Begin Navctl32Lib.NavControl diagnosis_nav 
      Height          =   600
      Left            =   0
      TabIndex        =   14
      Top             =   0
      Visible         =   0   'False
      Width           =   1350
      _Version        =   65536
      _ExtentX        =   2381
      _ExtentY        =   1058
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   222
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      DOF             =   -1  'True
      ModelFile       =   "D:\hospital_install\nuvohospital_vb\nuvo_hospital.MLT"
      DataPath        =   ""
      Table           =   "diagnosis"
      DataGroup       =   "diagnosis"
      DefaultButtonSize=   1
      SaveButtonVisible=   -1  'True
      QueryButtonVisible=   -1  'True
      QBEButtonVisible=   -1  'True
      InsertButtonVisible=   -1  'True
      DeleteButtonVisible=   -1  'True
      LayoutMode      =   1
      ControlCount    =   14
      Mode01LastWidth =   90
      Mode01LastHeight=   40
      Ctrl0Style      =   1
      Ctrl0Caption    =   ""
      Ctrl0Width      =   30
      Ctrl0Height     =   20
      Ctrl1ID         =   1
      Ctrl1Style      =   1
      Ctrl1Caption    =   ""
      Ctrl1Left       =   26
      Ctrl1Width      =   31
      Ctrl1Height     =   20
      Ctrl2ID         =   2
      Ctrl2Style      =   1
      Ctrl2Caption    =   ""
      Ctrl2Left       =   57
      Ctrl2Width      =   31
      Ctrl2Height     =   20
      Ctrl3ID         =   3
      Ctrl3Style      =   1
      Ctrl3Caption    =   ""
      Ctrl3Left       =   88
      Ctrl3Width      =   31
      Ctrl3Height     =   20
      Ctrl4ID         =   4
      Ctrl4Visible    =   -1  'True
      Ctrl4Style      =   1
      Ctrl4Caption    =   "New"
      Ctrl4Width      =   30
      Ctrl4Height     =   20
      Ctrl5ID         =   5
      Ctrl5Style      =   2
      Ctrl5Caption    =   "diagnosis - #"
      Ctrl5Top        =   20
      Ctrl5Width      =   150
      Ctrl5Height     =   20
      Ctrl6ID         =   9
      Ctrl6Visible    =   -1  'True
      Ctrl6Style      =   2
      Ctrl6Caption    =   "Query"
      Ctrl6Top        =   20
      Ctrl6Width      =   45
      Ctrl6Height     =   20
      Ctrl7ID         =   10
      Ctrl7Visible    =   -1  'True
      Ctrl7Style      =   2
      Ctrl7Caption    =   "Save"
      Ctrl7Left       =   45
      Ctrl7Top        =   20
      Ctrl7Width      =   45
      Ctrl7Height     =   20
      Ctrl8ID         =   11
      Ctrl8Visible    =   -1  'True
      Ctrl8Style      =   1
      Ctrl8Caption    =   "Delete"
      Ctrl8Left       =   30
      Ctrl8Width      =   30
      Ctrl8Height     =   20
      Ctrl9ID         =   12
      Ctrl9Visible    =   -1  'True
      Ctrl9Style      =   1
      Ctrl9Caption    =   "QBE"
      Ctrl9Left       =   60
      Ctrl9Width      =   30
      Ctrl9Height     =   20
      Ctrl10ID        =   100
      Ctrl10Style     =   2
      Ctrl10Caption   =   "Caption!"
      Ctrl10Width     =   22
      Ctrl10Height    =   18
      Ctrl11ID        =   6
      Ctrl11Style     =   1
      Ctrl11Caption   =   ""
      Ctrl11Top       =   40
      Ctrl11Width     =   50
      Ctrl11Height    =   20
      Ctrl12ID        =   7
      Ctrl12Style     =   1
      Ctrl12Caption   =   ""
      Ctrl12Left      =   1
      Ctrl12Top       =   40
      Ctrl12Width     =   99
      Ctrl12Height    =   20
      Ctrl13ID        =   8
      Ctrl13Style     =   1
      Ctrl13Caption   =   ""
      Ctrl13Left      =   100
      Ctrl13Top       =   40
      Ctrl13Width     =   50
      Ctrl13Height    =   20
   End
   Begin VB.Label Label31 
      Caption         =   "DateTime ::"
      Height          =   255
      Left            =   8880
      TabIndex        =   45
      Top             =   360
      Width           =   855
   End
   Begin VB.Label Label6 
      Caption         =   "ad_code"
      Height          =   300
      Left            =   4395
      TabIndex        =   43
      Top             =   1985
      Width           =   840
   End
   Begin VB.Label Label3 
      Caption         =   "dia_code"
      Height          =   300
      Left            =   900
      TabIndex        =   42
      Top             =   1970
      Width           =   960
   End
   Begin VB.Label Label2 
      Caption         =   "dia_code"
      Height          =   300
      Left            =   1185
      TabIndex        =   41
      Top             =   2015
      Width           =   960
   End
   Begin VB.Label Label7 
      Caption         =   "ad_code"
      Height          =   300
      Left            =   4305
      TabIndex        =   19
      Top             =   2000
      Width           =   840
   End
   Begin VB.Label Label4 
      Caption         =   "ad_code"
      Height          =   300
      Left            =   4260
      TabIndex        =   18
      Top             =   2030
      Width           =   840
   End
   Begin VB.Label Label1 
      Caption         =   "ad_code"
      Height          =   300
      Left            =   4455
      TabIndex        =   17
      Top             =   2060
      Width           =   840
   End
End
Attribute VB_Name = "lab"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public rowid_diag As Integer
Public rowid_patience As Integer
Public rowid_admit As Integer

Public Sub labarray()
On Error GoTo error1
    sql = "execute procedure set2table_lab();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    While Not oVtable.EOT
      i = i + 1
      oVtable.NextRecord
    Wend
    nrecord = i - 1
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    oVtable.FirstRecord
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = oVtable.Columns(2).Value
        lab_char(i) = oVtable.Columns(3).Value
        lab_type(i) = oVtable.Columns(4).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function findlabname(rowid As Integer, t As String) As String
On Error GoTo error1
    For i = 0 To UBound(lab_id)
        If (lab_id(i) = rowid And lab_type(i) = t) Then findlabname = lab_char(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function
Function findlabrowid(str As String) As Integer
On Error GoTo error1
    For i = 0 To UBound(lab_id)
        If (lab_char(i) = str) Then findlabrowid = lab_id(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function
Function findlabrowid_sp(str As String) As Integer
On Error GoTo error1
    For i = 0 To UBound(lab_id)
        If (lab_char(i) = str) Then findlabrowid_sp = lab_code(i)
    Next i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Function findposinlablist(str As String) As Integer
On Error GoTo error1
    i = 0
    Do While (lab_char(i) <> str)
        i = i + 1
    Loop
    findposinlablist = i
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Private Sub cbi_an_Click()
On Error GoTo error1
    If (op_an.Value = True And cbi_an.Text <> "") Then
' FIND HN FROM AN
    sql = "select rowid from admission where ad_code = " & cbi_an.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_admit = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute function A2P(" & rowid_admit & ");"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND HN FROM ROWID PATIENCE
    sql = "select hn from patience where rowid = " & rowid_patience
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_hn.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_sur.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

'insert lab to lab combobox
    sql = "execute procedure null_LRA2table(" & rowid_admit & ")"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "execute procedure checklab_list();"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from lab_list"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If oVtable.Columns(1).Value <> "nothing" Then
    i = 0
    While Not oVtable.EOT
      i = i + 1
      oVtable.NextRecord
    Wend
    nrecord = i - 1
    ReDim lab_id(nrecord) As Integer
    ReDim lab_code(nrecord) As Integer
    ReDim lab_char(nrecord) As String
    ReDim lab_type(nrecord) As String
    i = 0
    oVtable.FirstRecord
    While Not oVtable.EOT
        lab_id(i) = oVtable.Columns(1).Value
        lab_code(i) = oVtable.Columns(2).Value
        lab_char(i) = oVtable.Columns(3).Value
        lab_type(i) = oVtable.Columns(4).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    For i = 0 To UBound(lab_id)
        If lab_type(i) = "n" Then
            cbi_labn.AddItem (lab_char(i))
        ElseIf lab_type(i) = "c" Then
            cbi_labc.AddItem (lab_char(i))
        ElseIf lab_type(i) = "p" Then
            cbi_labp.AddItem (lab_char(i))
        End If
    Next i
    Else: MsgBox "ไม่มีการสั่งตรวจทางห้องปฏิบัติการ", OK = vbOKOnly, "NOT MATCH"
            patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cbi_dn_Click()
Dim oVtable As ddoTable
On Error GoTo error1
    If (op_dn.Value = True And cbi_dn.Text <> "") Then
' FIND HN FROM DN
    sql = "select rowid from diagnosis where dia_code = " & cbi_dn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_diag = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    sql = "execute function D2P(" & rowid_diag & ");"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    rowid_patience = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND HN FROM ROWID PATIENCE
    sql = "select hn from patience where rowid = " & rowid_patience
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_hn.Text = oVtable.Columns(1).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
' FIND NAME FROM HN
    sql = "execute procedure current_pat_name('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_name.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
'FIND SUR FROM HN
    sql = "execute procedure current_pat_sur('" & forever & "')"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select * from result_rowchar where code = " & txi_hn.Text
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    txi_sur.Text = oVtable.Columns(3).Value
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)

xbool = False
'insert lab to lab combobox
    sql = "select  lab from LRND where diagnosis = " & rowid_diag & "and lab_result is null"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        labname = findlabname(oVtable.Columns(1).Value, "n")
        cbi_labn.AddItem (labname)
        oVtable.NextRecord
        xbool = True
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

    sql = "select  lab from LRCD where diagnosis = " & rowid_diag & "and lab_result is null"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        labname = findlabname(oVtable.Columns(1).Value, "c")
        cbi_labc.AddItem (labname)
        oVtable.NextRecord
        xbool = True
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If

    sql = "select  lab from LRPD where diagnosis = " & rowid_diag & "and lab_result is null"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        labname = findlabname(oVtable.Columns(1).Value, "p")
        cbi_labp.AddItem (labname)
        oVtable.NextRecord
        xbool = True
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
End If

    If Not xbool Then
            MsgBox "ไม่มีการสั่งตรวจทางห้องปฏิบัติการ", OK = vbOKOnly, "NOT MATCH"
    End If

GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmi_browse_Click()
    cmd_dialog.ShowOpen
    txi_valp.Text = cmd_dialog.FileName
End Sub

Private Sub cmi_ins1_Click()
Dim index As ListItem
On Error GoTo error1
    If (cbi_labn.Text <> "" And txi_valn.Text <> "") Then
    If op_dn.Value = True Then
        rowid_lab = findlabrowid(cbi_labn.Text)
        sql = "update LRND set lab_result = " & txi_valn & "  where lab = " & rowid_lab & "and diagnosis = " & rowid_diag
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    'temporal update to LRNP
        sql = "execute procedure ULRP(" & rowid_diag & "," & rowid_lab & "," & txi_valn & ",'d');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labn.Text
        index.SubItems(1) = txi_valn
        'remove lab name from cbi_labn
        i = cbi_labn.ListIndex
        cbi_labn.RemoveItem (i)
        'clear cbi_labn and txi_valn
        cbi_labn.Text = ""
        txi_valn.Text = ""
    Else:
        i = findposinlablist(cbi_labn.Text)
        rowid_lab = findlabrowid_sp(cbi_labn.Text)
        If lab_type(i) = "n" Then
           sql = "execute procedure ULRNA(" & lab_id(i) & "," & txi_valn & ")"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        End If
        'temporal update to LRNP
        sql = "execute procedure ULRP(" & rowid_admit & "," & rowid_lab & "," & txi_valn & ",'a');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labn.Text
        index.SubItems(1) = txi_valn
        'remove lab name from cbi_labn
        i = cbi_labn.ListIndex
        cbi_labn.RemoveItem (i)
        'clear cbi_labn and txi_valn
        cbi_labn.Text = ""
        txi_valn.Text = ""
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmi_ins2_Click()
On Error GoTo error1
    If (cbi_labc.Text <> "" And txi_valc.Text <> "") Then
    If op_dn.Value = True Then
        rowid_lab = findlabrowid(cbi_labc.Text)
        sql = "update LRCD set lab_result = '" & txi_valc & "'  where lab = " & rowid_lab & "and diagnosis = " & rowid_diag
        Debug.Print sql
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        'temporal update to LRCP
        sql = "execute procedure ULRP(" & rowid_diag & "," & rowid_lab & ",'" & txi_valc & "','d');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labc.Text
        index.SubItems(1) = txi_valc
        'remove lab name from cbi_labc
        i = cbi_labc.ListIndex
        cbi_labc.RemoveItem (i)
        'clear cbi_labc and txi_valc
        cbi_labc.Text = ""
        txi_valc.Text = ""
    Else:
        i = findposinlablist(cbi_labc.Text)
        rowid_lab = findlabrowid_sp(cbi_labc.Text)
        If lab_type(i) = "c" Then
           sql = "execute procedure ULRCA(" & lab_id(i) & ",'" & txi_valc & "')"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        End If
        'temporal update to LRCP
        sql = "execute procedure ULRP(" & rowid_admit & "," & rowid_lab & ",'" & txi_valc & "','a');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labc.Text
        index.SubItems(1) = txi_valc
        'remove lab name from cbi_labc
        i = cbi_labc.ListIndex
        cbi_labc.RemoveItem (i)
        'clear cbi_labc and txi_valc
        cbi_labc.Text = ""
        txi_valc.Text = ""
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Function Insert_Pic(file As String) As Integer
    Dim sql As String
    Dim oVtable As ddoTable
    Dim tmp(10) As Integer
On Error GoTo error1
    If (file <> "") Then
    sql = "insert into photo values (0,filetoblob('" & file & " ','client'));"
    patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
    sql = "select rowid from photo where pic=filetoblob(""" & file & """,'client');"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    i = 0
    While Not oVtable.EOT
        tmp(i) = oVtable.Columns(1).Value
        oVtable.NextRecord
        i = i + 1
    Wend
    Insert_Pic = tmp(0)
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    Else: MsgBox "เลือกไฟล์ก่อนซิครับ", OK = vbOKOnly, "Insert Picture Error"
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Function

Private Sub cmi_ins3_Click()
On Error GoTo error1
        rowid_pic = Insert_Pic(txi_valp)
   If (cbi_labp.Text <> "" And txi_valp.Text <> "") Then
    If op_dn.Value = True Then
        rowid_lab = findlabrowid(cbi_labp.Text)
        sql = "update LRPD set lab_result = " & "filetoblob('" & txi_valp & "','client')" & "  where lab = " & rowid_lab & "and diagnosis = " & rowid_diag
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        'temporal update to LRPP
        sql = "execute procedure ULRP(" & rowid_diag & "," & rowid_lab & "," & rowid_pic & ",'d','p');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labp.Text
        index.SubItems(1) = txi_valp
        'remove lab name from cbi_labp
        i = cbi_labp.ListIndex
        cbi_labp.RemoveItem (i)
        'clear cbi_labp and txi_valp
        cbi_labp.Text = ""
         txi_valp.Text = ""
Else:
        i = findposinlablist(cbi_labp.Text)
        rowid_lab = findlabrowid_sp(cbi_labp.Text)
        If lab_type(i) = "p" Then
           sql = "execute procedure ULRPA(" & lab_id(i) & "," & rowid_pic & ")"
            patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        End If
        'temporal update to LRPP
        sql = "execute procedure ULRP(" & rowid_admit & "," & rowid_lab & ",'" & rowid_pic & "','a','p');"
        patience_nav.ddoDataGroup.ExecuteSQLCommand (sql)
        'insert lab was inserted into list
        Set index = lsi_lab.ListItems.Add
        index.Text = cbi_labp.Text
        index.SubItems(1) = txi_valp
        'remove lab name from cbi_labp
        i = cbi_labp.ListIndex
        cbi_labp.RemoveItem (i)
        'clear cbi_labp and txi_valp
        cbi_labp.Text = ""
        txi_valp.Text = ""
    End If
    End If
GoTo end1
error1:  MsgBox "Error Number : " & Err & " " & Error, vbOKOnly
end1:
End Sub

Private Sub cmn_exit_Click()
    Unload Me
    startform.Show
End Sub

Private Sub Form_activate()
    datetime = CalDate()
    Call labarray
    tx_datetime = datetime
    cbi_dn.clear
    sql = "select dia_code from diagnosis"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        cbi_dn.AddItem (oVtable.Columns(1).Value)
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
    cbi_an.clear
    sql = "select ad_code from admission"
    Set oVtable = patience_nav.ddoDataGroup.ExecuteSQLCommand(sql)
    If Not oVtable Is Nothing Then
    While Not oVtable.EOT
        cbi_an.AddItem (oVtable.Columns(1).Value)
        oVtable.NextRecord
    Wend
    patience_nav.ddoDataGroup.DeleteVirtualTable (oVtable.Name)
    End If
End Sub

Private Sub op_an_click()
    If op_an.Value = True Then
    cbi_an.Enabled = True
    cbi_dn.Enabled = False
    cbi_labn.clear
    cbi_labc.clear
    cbi_labp.clear
    End If
End Sub

Private Sub op_dn_click()
    If op_dn.Value = True Then cbi_dn.Enabled = True
End Sub

Private Sub opq_an_Click()
    If opq_an.Value = True Then cbq_an.Enabled = True
End Sub

Private Sub opq_dn_Click()
    If opq_dn.Value = True Then cbq_dn.Enabled = True
End Sub

Private Sub Timer1_Timer()
    If Timer1.Interval > 0 Then
        datetime = CalDate()
        tx_datetime.Text = datetime
    End If
End Sub
'Private Sub DataDirector_Info()
'[DataDirectorInfoStart]
'NumDataLinks=2
'[DataLink]
'GroupName=admission
'ControlName=cbi_an
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=admission_nav
'DataField=ad_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=admission
'NumColumns=1
'ColumnName=ad_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataLink]
'GroupName=diagnosis
'ControlName=cbi_dn
'ClassId=2
'Synchronize=0
'GetAllData=1
'StoreSelect=1
'SortOrder=0
'SortFlag=0
'DefaultType=1
'TrimTrailingBlanks=0
'DataSource=diagnosis_nav
'DataField=dia_code
'AssociationType=2
'SourceType=1
'[DataLinkButtonInfo]
'[EndDataLinkButtonInfo]
'[DataLinkPath]
'NumElements=1
'[DataLinkPathInfo]
'TableName=diagnosis
'NumColumns=1
'ColumnName=dia_code
'[EndDataLinkPathInfo]
'[EndDataLinkPath]
'[EndDataLink]
'[DataDirectorInfoEnd]
'End Sub
