using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;

public partial class WebRest_Login : System.Web.UI.Page
{
    CS.Service1 res = new CS.Service1();
    string token = "";
    string username = "";
    string password = "";
    string keysearch = "";
    CS.Restaurant[] r;
    CS.Building2[] b;
    CS.Placemark[] p;

    public WebRest_Login()
    {
    }

    void display()
    {
        try
        {
            token = Request.Cookies["token"].Value;
            LabelToken.Text = token;
        }
        catch { }
        try
        {
            username = Request.Cookies["username"].Value;
            TextBoxUsername.Text = username;
        }
        catch { }
        try
        {
            password = Request.Cookies["password"].Value;
            TextBoxPassword.Text = password;
        }
        catch { }
        try
        {
            CS.GeneralUser g = res.GetProfile(username, password);
            Labelgetprofile.Text = g.Name + g.Address;
        }
        catch { }

        try
        {
            keysearch = Request.Cookies["keysearch"].Value;
            TextBox1.Text = keysearch;
            b = res.find_Building(TextBox1.Text);
            r = res.find_Restaurant(TextBox1.Text, token);
            p = res.find_Placemark(TextBox1.Text, token);
            GridView1.DataSource = r;
            GridView1.DataBind();
        }
        catch { }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        display();
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        username = TextBoxUsername.Text;
        password = TextBoxPassword.Text;
        string token = res.checkPWD(username, password);
        //LabelToken.Text = token;

        if (token != "")
        {
            HttpCookie mycookie;
            mycookie = new HttpCookie("token", token);
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("username", username);
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("password", password);
            Response.Cookies.Add(mycookie);
        }
        display();
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie mycookie;
        mycookie = new HttpCookie("keysearch", TextBox1.Text);
        Response.Cookies.Add(mycookie);

        display();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
      /*  CS.Service1 res = new CS.Service1();
        b = res.find_Building(TextBox1.Text);
        r = res.find_Restaurant(TextBox1.Text, token);
        p = res.find_Placemark(TextBox1.Text, token);

        string rest_id = r[GridView1.SelectedIndex].ID_restaurant.ToString();

        HttpCookie mycookie = new HttpCookie("rest_id", rest_id);
        Response.Cookies.Add(mycookie);


        Response.Redirect("Restaurant.aspx");*/
    }
}