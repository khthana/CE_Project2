Imports Banking.Customer
Imports Banking.ATM

Public Class Transaction
    Private m_trCode As Integer
    Private m_trDate As Date
    Private m_trTime As Date
    Private m_trSeq As Integer
    Private m_customerUsed As Customer
    Private m_ServiceUsed As Service
    Private m_atmNo As ATM
    Private b_successFlag As Boolean
End Class