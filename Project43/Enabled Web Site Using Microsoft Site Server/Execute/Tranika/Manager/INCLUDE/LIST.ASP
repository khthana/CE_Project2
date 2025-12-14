


<%
REM -- set flag defaults
EmptyRecordset = False
FirstPass = True
NeedRecordset = False

REM -- initialize page variables
RecordsProcessed = 0
if IsEmpty(stdListRange) then stdListRange = 15
PageSize = stdListRange

REM -- get control for going from page to page (from form)
PagingMove = mscsPage.RequestString("list_PagingMove", "")

REM Get the page we are on
ListAbsolutePage = mscsPage.RequestNumber("ListAbsolutePage")
if IsNull(ListAbsolutePage) then
	ListAbsolutePage = 1
end if

REM -- load recordset
Set rsList = Server.CreateObject("ADODB.Recordset")
rsList.CacheSize = stdListRange
On Error Resume Next
rsList.Open cmdTemp, , adOpenStatic, adLockReadOnly

if Err.Number <> 0 then
    Set errorList = Server.CreateObject("Commerce.SimpleList")
    errorList.Add "The table could not be found or the database connection failed."
    %>
    <!--#INCLUDE FILE="error.asp" -->
    <!--#INCLUDE FILE="mgmt_footer.asp" -->
    <%
    Response.end
end if

REM check for empty record set (beginning and end the same or can't get EOF or BOF)
On Error Resume Next
If rsList.BOF And rsList.EOF Then EmptyRecordset = True
On Error Goto 0
If Err Then EmptyRecordset = True
rsList.PageSize = PageSize

REM -- act on pagemove instruction (from form)
If Not EmptyRecordset Then
    If Not rsList.Supports(adApproxPosition) then 'not SQL Server - probably Oracle
        Do While Not rsList.EOF
            RecordCount = RecordCount + 1
            rsList.MoveNext
        Loop
        if Not rsList.BOF then rsList.MoveFirst
        PageCount = Round(RecordCount/PageSize)
        If PageCount < RecordCount/PageSize then PageCount = PageCount + 1
    else
        PageCount   = rsList.PageCount
        RecordCount = rsList.RecordCount
    end if
    Select Case PagingMove
        Case "<<"
            ListAbsolutePage = 1
        Case "<"
            ListAbsolutePage = ListAbsolutePage - 1
        Case ">"
            ListAbsolutePage = ListAbsolutePage + 1
        Case ">>"
            ListAbsolutePage = PageCount
        Case Else
    End Select
    If (ListAbsolutePage - 1) * PageSize > RecordCount or ListAbsolutePage < 1 Then ListAbsolutePage = 1
    If Not rsList.Supports(adApproxPosition) then 'not SQL Server - probably Oracle
		StartRecord = ((ListAbsolutePage - 1) * PageSize)
        For i = 1 to StartRecord
            If rsList.EOF then exit for
            rsList.MoveNext
        Next
    else
        rsList.AbsolutePage = ListAbsolutePage
    end if
    If rsList.EOF Then
        ListAbsolutePage = ListAbsolutePage - 1
        If Not rsList.Supports(adApproxPosition) then 'not SQL Server - probably Oracle
            if Not rsList.BOF then rsList.MoveFirst
            StartRecord = (ListAbsolutePage - 1) * PageSize
            For i = 1 to StartRecord
                If rsList.EOF then exit for
                rsList.MoveNext
            Next
        else
            rsList.AbsolutePage = ListAbsolutePage
        end if
    End If
End If

REM -- show navigation bar (if more than 1 page)
If PageCount > 1 and Not EmptyRecordset Then
%>
        <TABLE BORDER="0" CELLSPACING="3">
        <TR>
            <TH ALIGN="CENTER" BGCOLOR="#CCCCCC">
                <NOBR><% = RecordCount %> Records &nbsp;&nbsp;&nbsp;&nbsp; Page: <% = ListAbsolutePage %> of <% = PageCount %></NOBR>
            </TH>
        </TR>
        <TR>
            <TD>
                <FORM METHOD="POST" ACTION="<% = Request.ServerVariables("PATH_INFO") %><% if Request("") <> "" then %>?=<% = Server.URLEncode(Request("")) %><% end if %>">
<% If ListAbsolutePage > 1 Then %>
                    <INPUT TYPE="Submit" NAME="list_PagingMove" VALUE="   &lt;&lt;   ">
                    <INPUT TYPE="Submit" NAME="list_PagingMove" VALUE="   &lt;    ">
<% Else %>
                    <INPUT TYPE="Button" NAME="list_PagingMove" VALUE="   &lt;&lt;   ">
                    <INPUT TYPE="Button" NAME="list_PagingMove" VALUE="   &lt;    ">
<% End If %>
<% If ListAbsolutePage < PageCount Then %>
                    <INPUT TYPE="Submit" NAME="list_PagingMove" VALUE="    &gt;   ">
                    <INPUT TYPE="Submit" NAME="list_PagingMove" VALUE="   &gt;&gt;   ">
<% Else %>
                    <INPUT TYPE="Button" NAME="list_PagingMove" VALUE="    &gt;   ">
                    <INPUT TYPE="Button" NAME="list_PagingMove" VALUE="   &gt;&gt;   ">
<% End If %>
                    <INPUT TYPE="Submit" NAME="list_PagingMove" VALUE=" Requery ">
                    <INPUT TYPE="Hidden" NAME="ListAbsolutePage" VALUE="<% = ListAbsolutePage %>">
                </FORM>
            </TD>
        </TR>
        </TABLE>
<%
End If
REM -- show the column headings
%>

<TABLE BORDER="0" CELLPADDING="2">
    <TR> <% = listColumns %> </TR>

<%
REM -- show no rows message if the recordset is empty
If EmptyRecordset Then
%>
    <TR>
        <TD COLSPAN="10">
            <TABLE BORDER="0">
            <TR>
                <TD COLSPAN="10">
                    <% = listNoRows %>
                </TD>
            </TR>
            </TABLE>
        </TD>
    </TR>
<%
REM -- else show the row information for each row
Else
	RowCount = ((ListAbsolutePage - 1) * PageSize) + 1
    Do
        If EmptyRecordset Then Exit Do
        If RecordsProcessed = PageSize Then Exit Do
        If Not FirstPass Then
            rsList.MoveNext
        Else
            FirstPass = False
        End If
        If rsList.EOF Then Exit Do
        RecordsProcessed = RecordsProcessed + 1
        %>

        <TR><%= ShowRow %></TR>

        <%
        RowCount = RowCount + 1
    Loop
End If
%>
</TABLE>
<P>
