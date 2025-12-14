<%@ Page Language="VB" %>
<script runat="server">

    Sub Page_Load(sender As Object, e As EventArgs)
    
        if (Session.Contents("SIDD") = Session.SessionID) then
            if (trim(Session.Contents("Ustatus")) <> "User") then
                Response.Redirect("search02Sup.aspx")
            else
                Response.Redirect("search02Use.aspx")
            end if
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load

</script>
<html>
<head>
</head>
<body>
    <form runat="server">
        <!-- Insert content here -->
    </form>
</body>
</html>