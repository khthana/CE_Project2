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
public partial class WebRest_Booked : System.Web.UI.Page
{

    CS.Reserve[] b;
    string token = "";
    string username = "";
    string rest_id = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        try { token = Request.Cookies["token"].Value; }
        catch { }
        try { username = Request.Cookies["username"].Value; }
        catch { }
        try { rest_id = Request.Cookies["rest_id"].Value; }
        catch { }


        //cs.Service1 map = new cs.Service1();
        //map = new cs.Service1();
        //cs.RMap[] r = map.getPicture(rest_id, token);

       //cs.Restaurant res = map.getRestaurant(Convert.ToInt32(rest_id), token);

        //Labelnamerest.Text = res.Name;
        //Labeltelrest.Text = res.Telephone;
        //Labelrestaddress.Text = res.Address.Road + res.Address.District + res.Address.Amphur + res.Address.Province + res.Address.Zipcode;
        //Labelrestzone.Text = res.Address.Zone;

        /*try
        {
            MemoryStream ms = new MemoryStream(r[0].map);
            Bitmap a = new Bitmap(ms);
            a.Save(MapPath("temp/") + username + "-1.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
            this.Image1.ImageUrl = "temp/" + username + "-1.jpg";
        }
        catch
        {

        }*/
        CS.Service1 book = new CS.Service1();
        book = new CS.Service1();
        b = book.get_Reserve(token);

        GridViewbooked.DataSource = b;
        GridViewbooked.DataBind();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Menu.aspx");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CS.Service1 book = new CS.Service1();
        book = new CS.Service1();
        b = book.get_Reserve(token);

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