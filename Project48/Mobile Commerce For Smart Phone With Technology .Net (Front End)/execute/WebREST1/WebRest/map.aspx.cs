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

public partial class WebRest_map : System.Web.UI.Page
{
    CS.Service1 center = new CS.Service1();
    string token = "";
    double lat = 13.7488362493268;
    double lon = 100.583449229678;
    CS.Restaurant[] r;
    CS.Building2[] b;
    CS.Placemark[] p;

    void display()
    {
        try{token = Request.Cookies["token"].Value;}
        catch { }
        try
        {
            lat = Convert.ToDouble(Request.Cookies["latitude"].Value);
            lon = Convert.ToDouble(Request.Cookies["longitude"].Value);
        }
        catch
        { }
        LabelLat.Text = lat.ToString();
        LabelLon.Text = lon.ToString();

        if (token != "")
        {
            r = center.getAllRes(lat, lon, 1000, token);
            p = center.getallPlacemark(lat, lon, 1000, token);
            b = center.getallBuilding(lat, lon, 1000, token);
            GridRest.DataSource = r;
            GridRest.DataBind();
            GridPlace.DataSource = p;
            GridPlace.DataBind();
            GridBuilding.DataSource = b;
            GridBuilding.DataBind();

            CS.TmgData map = center.GetMapTmg(token.ToString(), lat, lon);
            MemoryStream ms = new MemoryStream(map.mapdata);

            Bitmap bit = new Bitmap(ms);
            double ratio = 512/map.len;
            double left = lon - (map.len/2);
            double top = lat + (map.len/2);

            // draw image
            Graphics gc = Graphics.FromImage(bit);
            Pen pe = new Pen(Color.Red);
            Brush br = new SolidBrush(Color.Blue);
            Brush bp = new SolidBrush(Color.Yellow);
            Brush bb = new SolidBrush(Color.Gray);
            for (int i = 0; i < r.Length; i++)
            {
                int x = Convert.ToInt32((r[i].Position.Longitude - left)*ratio);
                int y = Convert.ToInt32((top - r[i].Position.Latitude)*ratio);
                //int x = 100;
                //int y = 100;
                gc.FillEllipse(br, x-10, y-10, 20, 20);
                gc.DrawEllipse(pe, x-10, y-10, 20, 20);
                CircleHotSpot cc = new CircleHotSpot();
                cc.X = x;
                cc.Y = y;
                cc.Radius = 20;
                cc.AlternateText = r[i].Name.Trim();
                cc.HotSpotMode = HotSpotMode.PostBack;
                cc.PostBackValue = "r" + r[i].ID_restaurant.ToString();
                ImageMap1.HotSpots.Add(cc);
            }
            for (int i = 0; i < p.Length; i++)
            {
                int x = Convert.ToInt32((p[i].longitude - left) * ratio);
                int y = Convert.ToInt32((top - p[i].latitude) * ratio);
                //int x = 100;
                //int y = 100;
                gc.FillEllipse(bp, x - 10, y - 10, 20, 20);
                gc.DrawEllipse(pe, x - 10, y - 10, 20, 20);
                CircleHotSpot cc = new CircleHotSpot();
                cc.X = x;
                cc.Y = y;
                cc.Radius = 20;
                cc.AlternateText = p[i].name.Trim();
                cc.HotSpotMode = HotSpotMode.PostBack;
                cc.PostBackValue = "p" + p[i].name.ToString();
                ImageMap1.HotSpots.Add(cc);
            }
            for (int i = 0; i < b.Length; i++)
            {
                int x = Convert.ToInt32((b[i].lon - left) * ratio);
                int y = Convert.ToInt32((top - b[i].lat) * ratio);
                //int x = 100;
                //int y = 100;
                gc.FillEllipse(bb, x - 10, y - 10, 20, 20);
                gc.DrawEllipse(pe, x - 10, y - 10, 20, 20);
                CircleHotSpot cc = new CircleHotSpot();
                cc.X = x;
                cc.Y = y;
                cc.Radius = 20;
                cc.AlternateText = b[i].name.Trim();
                cc.HotSpotMode = HotSpotMode.PostBack;
                cc.PostBackValue = "b"+b[i].id.ToString() ;
                ImageMap1.HotSpots.Add(cc);
            }
            gc.Dispose();


            bit.Save(MapPath("temp/") + token + "-map.jpg", System.Drawing.Imaging.ImageFormat.Jpeg);
            ImageMap1.ImageUrl = "temp/" + token + "-map.jpg";
        }
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        //center.center.Url = "http://161.246.5.196/webservicecenter/service1.asmx";
        display();
    }
    protected void GridRest_SelectedIndexChanged(object sender, EventArgs e)
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
            lat = l1;
            lon = l2;
            Response.Redirect("map.aspx");
        }
    }
    protected void ImageMap1_Click(object sender, ImageMapEventArgs e)
    {
        if (e.PostBackValue[0] == 'r')
        {

            HttpCookie mycookie;
            mycookie = new HttpCookie("rest_id", e.PostBackValue.Remove(0,1));
            Response.Cookies.Add(mycookie);
            Response.Redirect("restaurant.aspx");
        }
        if (e.PostBackValue[0] == 'p')
        {
 
           // Response.Redirect("building.aspx");
        }
        if (e.PostBackValue[0] == 'b')
        {
            //Response.Redirect("building.aspx");
        }
        TextBox1.Text = e.PostBackValue;
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
            lat = l1;
            lon = l2;
            Response.Redirect("map.aspx");
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
            lat = l1;
            lon = l2;
            Response.Redirect("map.aspx");
        }
    }
}
