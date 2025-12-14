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

public partial class WebRest_Search : System.Web.UI.Page
{
    string token;
    CS.Restaurant[] r;
    CS.Building2[] b;
    CS.Placemark[] p;

    protected void Page_Load(object sender, EventArgs e)
    {
        try { token = Request.Cookies["token"].Value; }
        catch { }
        Labeltoken.Text = token;
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CS.Service1 res = new CS.Service1();
        b = res.find_Building(TextBox1.Text);
        r = res.find_Restaurant(TextBox1.Text, token);
        p = res.find_Placemark(TextBox1.Text, token);

        GridView1.DataSource = r;
        GridView1.DataBind();      
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CS.Service1 res = new CS.Service1();
        b = res.find_Building(TextBox1.Text);
        r = res.find_Restaurant(TextBox1.Text, token);
        p = res.find_Placemark(TextBox1.Text, token);

        string rest_id = r[GridView1.SelectedIndex].ID_restaurant.ToString();

        HttpCookie mycookie = new HttpCookie("rest_id",rest_id);
        Response.Cookies.Add(mycookie);


        Response.Redirect("Restaurant.aspx");
    }
}
