VERSION 5.00
Begin VB.Form frmFlowchart 
   Caption         =   "Flowchart"
   ClientHeight    =   9204
   ClientLeft      =   52
   ClientTop       =   416
   ClientWidth     =   9698
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   10457.9
   ScaleMode       =   0  'User
   ScaleWidth      =   9698
   Visible         =   0   'False
End
Attribute VB_Name = "frmFlowchart"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
frmFlowchart.Height = 10000
frmFlowchart.Width = 6000
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
FlowchartCodeForm.MenuViewFlowChart.Checked = False
End Sub
