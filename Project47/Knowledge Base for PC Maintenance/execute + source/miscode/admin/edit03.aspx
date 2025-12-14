<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
    
    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID and Session.Contents("UStatus") = "admin") then
            GetSession()
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load
    
    
    Sub GetSession()
        UId = Trim(Session.Contents("UId"))
        UName = Trim(Session.Contents("UName"))
        UTel = Trim(Session.Contents("UTel"))
        UDep = Trim(Session.Contents("UDep"))
        USec = Trim(Session.Contents("USec"))
        ULoc = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))
    
        RegNewSession()
    End Sub
    
    Sub RegNewSession()
        Session("UId") = UId
        Session("UName") = UName
        Session("UTel") = UTel
        Session("UDep") = UDep
        Session("USec") = USec
        Session("ULoc") = ULoc
        Session.Contents("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub
    
    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("../default.aspx")
    End Sub
    
    Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("register.aspx")
    End Sub
    
    Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub
    
    Sub Page_Init(sender As Object, e As EventArgs)
        QueryDepartment()
        QuerySection()
        QueryLocation()
        QueryMachine()
        QueryProblem()
    End Sub
    
    sub QueryDepartment()
            DropDownDep.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Department_ID,Department FROM T_Department"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownDep.Items.Add(New ListItem(Trim(dataReader.GetString(1)),Trim(dataReader.GetInt32(0).ToString())))
            end while
    end sub
    
    sub QuerySection()
            DropDownSec.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Section_ID,[Section] FROM T_Section"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownSec.Items.Add(New ListItem(Trim(dataReader.GetString(1)),Trim(dataReader.GetInt32(0).ToString())))
            end while
    end sub
    
    sub QueryLocation()
            DropDownLoc.Items.Clear()
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Location_ID,Location FROM T_Location"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownLoc.Items.Add(New ListItem(Trim(dataReader.GetString(1)),Trim(dataReader.GetInt32(0).ToString())))
            end while
    end sub
    
    sub QueryMachine()
            DropDownMac.Items.Clear
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT Machine_ID,Machine FROM T_Machine where Machine_ID > 0"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownMac.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub
    
    sub QueryProblem()
            DropDownPro.Items.Clear
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT ProblemType_ID,ProblemType FROM T_ProblemType where ProblemType_ID > 0"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownPro.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub
    
    Function AddItem(ItemValue as string ,ItemTable as string,ItemField0 as string,ItemField1 as string)
        Dim MaxRef = MaxIdItem(ItemTable,ItemField0)
        Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
        Dim queryString As String = "INSERT INTO [" & ItemTable & "] ([" & ItemField0 & "], [" & ItemField1 & "]) VALUES ('" & MaxRef &"', '" & ItemValue & "')"
        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
        dbCommand.CommandText = queryString
        dbCommand.Connection = dbConnection
        Dim rowsAffected As Integer = 0
        dbConnection.Open
        Try
            rowsAffected = dbCommand.ExecuteNonQuery
        Finally
            dbConnection.Close
        End Try
    End Function
    
    Function DeleteItem(ItemValue as string ,ItemTable as string,ItemField as string)
                Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                Dim queryString As String = "Delete From [" & ItemTable & "] where [" & ItemField & "]='" & ItemValue & "'"
                Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                dbCommand.CommandText = queryString
                dbCommand.Connection = dbConnection
    
                Dim rowsAffected As Integer = 0
                dbConnection.Open
                Try
                    rowsAffected = dbCommand.ExecuteNonQuery
                Finally
                    dbConnection.Close
                End Try
    End Function
    
    Function MaxIdItem(ItemTable as string,ItemField as string) As Integer
            Dim MaxRef
            Dim connectionString As String ="server='SURACHET'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
            Dim queryString As String = "SELECT MAX(" & ItemField & ") FROM [" & ItemTable & "]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
                dataReader.Read()
            try
                MaxRef = dataReader.GetInt32(0)
            catch ex As Exception
                MaxRef = 0
            Finally
                dbConnection.Close
            end try
            return MaxRef+1
    End Function
    
    Sub BDelDep_Click(sender As Object, e As EventArgs)
        if(DropDownDep.Items.count > 0) then
            DeleteItem(DropDownDep.SelectedItem.Value,"T_Department","Department_ID")
            QueryDepartment()
        end if
    End Sub
    
    Sub BDelSec_Click(sender As Object, e As EventArgs)
        if(DropDownSec.Items.count > 0) then
            DeleteItem(DropDownSec.SelectedItem.Value,"T_Section","Section_ID")
            QuerySection()
        end if
    
    End Sub
    
    Sub BDelLoc_Click(sender As Object, e As EventArgs)
        if(DropDownLoc.Items.count > 0) then
            DeleteItem(DropDownLoc.SelectedItem.Value,"T_Location","Location_ID")
            QueryLocation()
        end if
    
    End Sub
    
    Sub BDelMac_Click(sender As Object, e As EventArgs)
        if(DropDownMac.Items.count > 0) then
            DeleteItem(DropDownMac.SelectedItem.Value,"T_Machine","Machine_ID")
            QueryMachine()
        end if
    
    End Sub
    
    Sub BDelPro_Click(sender As Object, e As EventArgs)
        if(DropDownPro.Items.count > 0) then
            DeleteItem(DropDownPro.SelectedItem.Value,"T_ProblemType","ProblemType_ID")
            QueryProblem()
        end if
    
    End Sub
    
    Sub BAddDep_Click(sender As Object, e As EventArgs)
        if (TextBoxDep.Text <> "") then
            AddItem(TextBoxDep.Text,"T_Department","Machine_ID","Machine")
            TextBoxDep.Text = ""
            QueryDepartment()
        end if
    End Sub
    
    Sub BAddSec_Click(sender As Object, e As EventArgs)
        if (TextBoxSec.Text <> "") then
            AddItem(TextBoxSec.Text,"T_Section","Machine_ID","Machine")
            TextBoxSec.Text = ""
            QuerySection()
        end if
    
    End Sub
    
    Sub BAddLoc_Click(sender As Object, e As EventArgs)
        if (TextBoxLoc.Text <> "") then
            AddItem(TextBoxLoc.Text,"T_Location","Machine_ID","Machine")
            TextBoxLoc.Text = ""
            QueryLocation()
        end if
    
    End Sub
    
    Sub BAddMac_Click(sender As Object, e As EventArgs)
        if (TextBoxMac.Text <> "") then
            AddItem(TextBoxMac.Text,"T_Machine","Machine_ID","Machine")
            TextBoxMac.Text = ""
            QueryMachine()
        end if
    
    End Sub
    
    Sub BAddPro_Click(sender As Object, e As EventArgs)
        if (TextBoxPro.Text <> "") then
            AddItem(TextBoxPro.Text,"T_ProblemType","ProblemType_ID","ProblemType")
            TextBoxPro.Text = ""
            QueryProblem()
        end if
    
    End Sub

</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ESSILOR MANUFACTURING (THAILAND) CO., LTD.</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
    <style type="text/css">BODY {
	MARGIN: 2px
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TH {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
A {
	FONT-SIZE: 12px; COLOR: #0066ff; FONT-FAMILY: Courier New, Courier, mono
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:active {
	COLOR: #0066ff; TEXT-DECORATION: none
}
.style2 {
	COLOR: #ffffff
}
</style>
</head>
<body>
    <center><asp:Label id="Label1" runat="server" visible="false"></asp:Label><asp:Label id="Label2" runat="server" visible="false"></asp:Label><asp:Label id="dir_sort" runat="server" visible="false"></asp:Label> 
        <form name="form1" action="" method="post" runat="server">
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/images01.gif" width="95" /></td>
                                        <td width="673" background="images/images02.gif" height="45">
                                            <span class="style1"><font color="#ffffff">ESSILOR MANUFACTURING (THAILAND) CO., LTD.<br />
                                            MIS SECTION, LOGISTICS DEPARTMENT</font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/images02.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                        </td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="White">Administrators</asp:Label></td>
                                                        <td align="right" width="120">
                                                        </td>
                                                        <td align="right" width="30">
                                                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" AlternateText="Logout" src="images/images03.gif" width="20" height="20"></asp:ImageButton>
                                                            &nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="middle" width="95" bgcolor="#4f70c7" height="370">
                            <p>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton2" onclick="ImageButton2_Click" runat="server" ImageUrl="images/images04.gif"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label4" runat="server" forecolor="White">New Administator</asp:Label>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton3" onclick="ImageButton3_Click" runat="server" ImageUrl="images/images05.gif" Width="33px" Height="30px"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label3" runat="server" forecolor="White">Control panal</asp:Label>
                            </p>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                                &nbsp;&nbsp;&nbsp; 
                                <br />
                                <table style="WIDTH: 517px; HEIGHT: 84px">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <asp:Label id="Label5" runat="server">Department</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownDep" runat="server" width="200"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button id="BDelDep" onclick="BDelDep_Click" runat="server" Text="Delete"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:TextBox id="TextBoxDep" runat="server" width="200"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button id="BAddDep" onclick="BAddDep_Click" runat="server" Text="Add"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Label6" runat="server">Sections</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownSec" runat="server" width="200"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button id="BDelSec" onclick="BDelSec_Click" runat="server" Text="Delete"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:TextBox id="TextBoxSec" runat="server" width="200"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button id="BAddSec" onclick="BAddSec_Click" runat="server" Text="Add"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Label7" runat="server">Location</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownLoc" runat="server" width="200"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button id="BDelLoc" onclick="BDelLoc_Click" runat="server" Text="Delete"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:TextBox id="TextBoxLoc" runat="server" width="200"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button id="BAddLoc" onclick="BAddLoc_Click" runat="server" Text="Add"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Label9" runat="server">Machine</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownMac" runat="server" width="200"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button id="BDelMac" onclick="BDelMac_Click" runat="server" Text="Delete"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:TextBox id="TextBoxMac" runat="server" width="200"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button id="BAddMac" onclick="BAddMac_Click" runat="server" Text="Add"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label id="Label8" runat="server">Problem</asp:Label></td>
                                            <td>
                                                <asp:DropDownList id="DropDownPro" runat="server" width="200"></asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:Button id="BDelPro" onclick="BDelPro_Click" runat="server" Text="Delete"></asp:Button>
                                            </td>
                                            <td>
                                                <asp:TextBox id="TextBoxPro" runat="server" width="200"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:Button id="BAddPro" onclick="BAddPro_Click" runat="server" Text="Add"></asp:Button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>