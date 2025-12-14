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

public partial class WebRest_home : System.Web.UI.Page
{
    CS.Service1 res = new CS.Service1();
    string token = "";
    string username = "";
    string password = "";
    string keysearch = "";
    CS.Restaurant[] r;
    CS.Building2[] b;
    CS.Placemark[] p;
    CS.Reserve[] re;

    public class reservecolumn
    {
        public string name;
        public int table;
        public string starttime;
        public string endtime;
    }

    void display()
    {
        try
        {
            token = Request.Cookies["token"].Value;
            LabelToken.Text = token;
            re = res.get_Reserve(token);
           /* reservecolumn[] rr = new reservecolumn[re.Length];
            for (int i = 0; i < re.Length; i++)
            {
                rr[i] = new reservecolumn();
                rr[i].name = re[i].Restaurant.Name.Trim();
                rr[i].table = re[i].Table;
                rr[i].starttime = re[i].Time.Trim();
                rr[i].endtime = re[i].EndTime.Trim();
            }*/
            GridView2.DataSource = re;
            GridView2.DataBind();
            //
        }
        catch { }
 
        try
        {
            username = Request.Cookies["username"].Value;
            //TextBoxUsername.Text = username;
        }
        catch { }
        try
        {
            password = Request.Cookies["password"].Value;
            //TextBoxPassword.Text = password;
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
            //TextBox1.Text = keysearch;
            b = res.find_Building(TextBox1.Text);
            r = res.find_Restaurant(TextBox1.Text, token);
            p = res.find_Placemark(TextBox1.Text, token);
            GridRest.DataSource = r;
            GridRest.DataBind();
            GridPlace.DataSource = p;
            GridPlace.DataBind();
            GridBuilding.DataSource = b;
            GridBuilding.DataBind();
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie mycookie;
        mycookie = new HttpCookie("keysearch", TextBox1.Text);
        Response.Cookies.Add(mycookie);

        display();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (GridRest.SelectedIndex >= 0)
        {
            double l1 = r[GridRest.SelectedIndex].Position.Latitude;
            double l2 = r[GridRest.SelectedIndex].Position.Longitude;

            HttpCookie mycookie;
            mycookie = new HttpCookie("latitude", l1.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("longitude", l2.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("rest_id", r[GridRest.SelectedIndex].ID_restaurant.ToString());
            Response.Cookies.Add(mycookie);

            Response.Redirect("restaurant.aspx");
        }
    }
    protected void GridBuilding_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridBuilding.SelectedIndex >= 0)
        {
            double l1 = b[GridBuilding.SelectedIndex].lat;
            double l2 = b[GridBuilding.SelectedIndex].lon;

            HttpCookie mycookie;
            mycookie = new HttpCookie("latitude", l1.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("longitude", l2.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("building_id", b[GridBuilding.SelectedIndex].id.ToString());
            Response.Cookies.Add(mycookie);

            Response.Redirect("building.aspx");
        }
    }
    protected void GridPlace_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (GridPlace.SelectedIndex >= 0)
        {
            double l1 = p[GridPlace.SelectedIndex].latitude;
            double l2 = p[GridPlace.SelectedIndex].longitude;

            HttpCookie mycookie;
            mycookie = new HttpCookie("latitude", l1.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("longitude", l2.ToString());
            Response.Cookies.Add(mycookie);
            mycookie = new HttpCookie("place_id", b[GridPlace.SelectedIndex].id.ToString());
            Response.Cookies.Add(mycookie);

            Response.Redirect("map.aspx");
        }
    }
}
