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
public partial class WebRest_Map : System.Web.UI.Page
{
    double lat = 13.7589;
    double lon = 100.512;
    protected void Page_Load(object sender, EventArgs e)
    {
    /*    string token = "";
        string username = "";
        string rest_id = "";
        try { token = Request.Cookies["token"].Value; }
        catch { }
        try { username = Request.Cookies["username"].Value; }
        catch { }
        try { rest_id = Request.Cookies["rest_id"].Value; }
        catch { }


        cs2.Service1 map = new cs2.Service1();
        map = new cs2.Service1();
        cs2.RMap[] r = map.getPicture(rest_id, token);

        cs2.Restaurant res = map.getRestaurant(Convert.ToInt32(rest_id), token);


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
        //Labelmap.Text = filename;*/
        try { lat = Convert.ToDouble(Request.Cookies["latitude"].Value); }
        catch { }
        try { lon = Convert.ToDouble(Request.Cookies["longitude"].Value); }
        catch { }
        tlat.Text = lat.ToString();
        tlon.Text = lon.ToString();
        CS.Service1 cs = new CS.Service1();
        CS.TmgData tmg = cs.GetMapTmg("2", lat, lon);
        MemoryStream ms = new MemoryStream(tmg.mapdata);
        Bitmap b = new Bitmap(ms);
        b.Save(MapPath("temp/") + "map.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
        Image1.ImageUrl = "temp/map.jpg";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        HttpCookie mycookie;
        mycookie = new HttpCookie("latitude", tlat.Text);
        Response.Cookies.Remove("latitude");
        Response.Cookies.Add(mycookie);
        mycookie = new HttpCookie("longitude", tlon.Text);
        Response.Cookies.Remove("longitude");
        Response.Cookies.Add(mycookie);
       //Response.Redirect("map.aspx");
    }
}
