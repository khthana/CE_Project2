using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class WebRest_Startlog : System.Web.UI.Page
{
    public WebRest_Startlog()
    {
    }

    void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        CS.Service1 res = new CS.Service1();
        res = new CS.Service1();
        string token = res.checkPWD(TextBoxUsername.Text, TextBoxPassword.Text);
        LabelToken.Text = token;

        HttpCookie mycookie;
        mycookie = new HttpCookie("token", token);
        Response.Cookies.Add(mycookie);
        mycookie = new HttpCookie("username", TextBoxUsername.Text);
        Response.Cookies.Add(mycookie);
        mycookie = new HttpCookie("password", TextBoxPassword.Text);
        Response.Cookies.Add(mycookie);

        Response.Redirect("login.aspx");
        CS.Service1 ooo = new CS.Service1();
        ooo = new CS.Service1();
        CS.GeneralUser g = ooo.GetProfile(TextBoxUsername.Text, TextBoxPassword.Text);

        Labelgetprofile.Text = g.Name + g.Address;

       

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
}
