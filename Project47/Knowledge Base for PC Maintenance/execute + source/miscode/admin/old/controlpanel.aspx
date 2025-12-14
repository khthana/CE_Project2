<%@ Page Language="VB" Debug="true" %>
<script runat="server">

    Sub Page_Init(sender As Object, e As EventArgs)
        QueryDepartment()
        QuerySection()
        QueryLocation()
        QueryMachine()
    End Sub
    
    sub QueryDepartment()
            DropDownDep.Items.Clear()
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT [Department] FROM [Department]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownDep.Items.Add(New ListItem(Trim(dataReader.GetString(0))))
            end while
    end sub
    
    sub QuerySection()
            DropDownSec.Items.Clear()
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT [Section] FROM [Section]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownSec.Items.Add(New ListItem(Trim(dataReader.GetString(0))))
            end while
    end sub
    
    sub QueryLocation()
            DropDownLoc.Items.Clear()
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT [Location] FROM [Location]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownLoc.Items.Add(New ListItem(Trim(dataReader.GetString(0))))
            end while
    end sub
    
    sub QueryMachine()
            DropDownMac.Items.Clear
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
    
            Dim queryString As String = "SELECT [Id],[Machine] FROM [Machine]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownMac.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub
    
    Function AddItem(ItemValue as string ,ItemTable as string)
        Dim MaxRef = MaxIdItem(ItemTable)
        Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
        Dim queryString As String = "INSERT INTO [" & ItemTable & "] ([Id], [" & ItemTable & "]) VALUES ('" & MaxRef &"', '" & ItemValue & "')"
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
    
    Function DeleteItem(ItemValue as string ,ItemTable as string)
                Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
                Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                Dim queryString As String = "Delete From [" & ItemTable & "] where [" & ItemTable & "]='" & ItemValue & "'"
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
    
    Function MaxIdItem(ItemTable as string) As Integer
            Dim MaxRef
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='DB'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
            Dim queryString As String = "SELECT MAX([" & ItemTable & "].[Id]) FROM [" & ItemTable & "]"
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
            DeleteItem(DropDownDep.SelectedItem.Text,"Department")
            QueryDepartment()
        end if
    End Sub
    
    Sub BDelSec_Click(sender As Object, e As EventArgs)
        if(DropDownSec.Items.count > 0) then
            DeleteItem(DropDownSec.SelectedItem.Text,"Section")
            QuerySection()
        end if
    
    End Sub
    
    Sub BDelLoc_Click(sender As Object, e As EventArgs)
        if(DropDownLoc.Items.count > 0) then
            DeleteItem(DropDownLoc.SelectedItem.Text,"Location")
            QueryLocation()
        end if
    
    End Sub
    
    Sub BDelMac_Click(sender As Object, e As EventArgs)
        if(DropDownMac.Items.count > 0) then
            DeleteItem(DropDownMac.SelectedItem.Text,"Machine")
            QueryMachine()
        end if
    
    End Sub
    
    Sub BAddDep_Click(sender As Object, e As EventArgs)
        if (TextBoxDep.Text <> "") then
            AddItem(TextBoxDep.Text,"Department")
            TextBoxDep.Text = ""
            QueryDepartment()
        end if
    End Sub
    
    Sub BAddSec_Click(sender As Object, e As EventArgs)
        if (TextBoxSec.Text <> "") then
            AddItem(TextBoxSec.Text,"Section")
            TextBoxSec.Text = ""
            QuerySection()
        end if
    
    End Sub
    
    Sub BAddLoc_Click(sender As Object, e As EventArgs)
        if (TextBoxLoc.Text <> "") then
            AddItem(TextBoxLoc.Text,"Location")
            TextBoxLoc.Text = ""
            QueryLocation()
        end if
    
    End Sub
    
    Sub BAddMac_Click(sender As Object, e As EventArgs)
        if (TextBoxMac.Text <> "") then
            AddItem(TextBoxMac.Text,"Machine")
            TextBoxMac.Text = ""
            QueryMachine()
        end if
    
    End Sub

</script>
<html>
<head>
</head>
<body>
    <center>
        <form runat="server">
            <p>
            </p>
            <p>
                <asp:Label id="Label5" runat="server">Control Panel (Add/Delete Item)</asp:Label>
            </p>
            <table style="WIDTH: 517px; HEIGHT: 84px">
                <tbody>
                    <tr>
                        <td>
                            <asp:Label id="Label1" runat="server">Department</asp:Label></td>
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
                            <asp:Label id="Label2" runat="server">Sections</asp:Label></td>
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
                            <asp:Label id="Label3" runat="server">Location</asp:Label></td>
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
                            <asp:Label id="Label4" runat="server">Machine</asp:Label></td>
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
                </tbody>
            </table>
            <!-- Insert content here -->
        </form>
    </center>
</body>
</html>
