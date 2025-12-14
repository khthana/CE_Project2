Attribute VB_Name = "Module1"
Option Explicit

Public myDSN As String
Public conn As New ADODB.Connection
Public Rssc As ADODB.Recordset
Public time As Boolean
Public j As Integer
Public L As Integer
Public flag As Boolean
Public Sel As String
Public SQL As String
Public Table As String
Public Condition As String
Public join As String
Public Order As String
Public Groupby As String

