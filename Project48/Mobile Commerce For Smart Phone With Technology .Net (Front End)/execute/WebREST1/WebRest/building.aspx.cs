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

public partial class WebRest_building : System.Web.UI.Page
{
    string building_id = "";
    string floor_id = "";
    string token = "";

    CS.Service1 cs = new CS.Service1();
    CS.Building bd;

    void display()
    {
        try { token = Request.Cookies["token"].Value; }
        catch { }
        try { token = Request.Cookies["floor_id"].Value; }
        catch { }
        try { building_id = Request.Cookies["building_id"].Value; }
        catch { }
        //building_id = "53";
        if (building_id == "") Response.Redirect("home.aspx");

        bd = cs.getBuilding(Convert.ToInt32(building_id));

        namerest.Text = ("" + bd.name).Trim();
        // DesAddr.Text = (""+bd.addr.Road).Trim()+" " + (""+bd.addr.Amphur).Trim() + " " + (""+bd.addr.District).Trim() +" " + (""+bd.addr.Province).Trim() + " " + (""+bd.addr.Zipcode).ToString();
        Deslon.Text = bd.lon.ToString();
        Deslat.Text = bd.lat.ToString();
        int findex = 0;
        for (int i = 0; i < bd.floor.Length; i++)
        {
            if ((bd.floor[i].ToString() == floor_id)) findex = i;
        }
        //findex = 0;
        MemoryStream ms = new MemoryStream(bd.floor[findex].background);
        Bitmap bit = new Bitmap(ms);

        bit.Save(MapPath("temp/") + token + "-builing.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
        ImageMap1.ImageUrl = "temp/" + token + "-builing.jpg";

        GridView1.DataSource = bd.floor;
        GridView1.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        display();

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        CS.Floor f = bd.floor[GridView1.SelectedIndex];
        HttpCookie mycookie;
        mycookie = new HttpCookie("floor_id", f.id.ToString());
        Response.Cookies.Add(mycookie);
        display();
    }
}
