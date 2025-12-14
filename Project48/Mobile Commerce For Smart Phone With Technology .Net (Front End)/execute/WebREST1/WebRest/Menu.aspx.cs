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
using System.IO;
using System.Drawing;
public partial class WebRest_Menu : System.Web.UI.Page
{
    RS.menu[] m;
    string token = "";
    string username = "";
    string rest_id = "";
    string rest_url = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        try { token = Request.Cookies["token"].Value; }
        catch { }
        try { username = Request.Cookies["username"].Value; }
        catch { }
        try { rest_id = Request.Cookies["rest_id"].Value; }
        catch { }
        if (rest_id == "") Response.Redirect("Search.aspx");

        CS.Service1 map = new CS.Service1();
        map = new CS.Service1();
        CS.RMap[] r = map.getPicture(rest_id, token);

        CS.Restaurant res = map.getRestaurant(Convert.ToInt32(rest_id), token);

        Labelnamerest.Text = res.Name;
        Labeltelrest.Text = res.Telephone;
        Labelrestaddress.Text = res.Address.Road + res.Address.District + res.Address.Amphur + res.Address.Province + res.Address.Zipcode;
        Labelrestzone.Text = res.Address.Zone;
        rest_url = res.Reserve;

        try
        {
            MemoryStream ms = new MemoryStream(r[0].map);
            Bitmap a = new Bitmap(ms);
            a.Save(MapPath("temp/") + username + "-1.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
            this.Image1.ImageUrl = "temp/" + username + "-1.jpg";
        }
        catch
        {

        }
        if (rest_url == "") return;
        RS.Service1 menu = new RS.Service1();
        menu = new RS.Service1();
        //menu.Url = rest_url;
        m = menu.updateMenuAll();

        GridView1.DataSource = m;
        GridView1.DataBind();

        for (int i = 0; i < m.GetLength(0); i++)
        {
            MemoryStream ms = new MemoryStream(m[i].Picture);
            Bitmap b = new Bitmap(ms);
            b.Save(MapPath("temp/") + username + "-m-" + i + ".jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
            GridView1.Rows[i].Cells[0].Text = "<image src='temp/" + username + "-m-" + i + ".jpg'>";
        }     

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Menu.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
 //       RS.Service1 menu = new RS.Service1();
 //       menu = new RS.Service1();
 //       m = menu.updateMenuAll();


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Promotion.aspx");
    }

    protected void Button3_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Restaurant.aspx");
    }
}
