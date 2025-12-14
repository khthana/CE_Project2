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
public partial class WebRest_Restaurant : System.Web.UI.Page
{

    CS.Reserve[] b;
    string token = "";
    string username = "";
    string password = "";
    string rest_id = "";
    string rest_url = "";
    CS.Restaurant res;
    CS.GeneralUser gu;
    protected void Page_Load(object sender, EventArgs e)
    {

        try { token = Request.Cookies["token"].Value; }
        catch { }
        try { username = Request.Cookies["username"].Value; }
        catch { }
        try { password = Request.Cookies["password"].Value; }
        catch { }
        try { rest_id = Request.Cookies["rest_id"].Value; }
        catch { }
        if (rest_id == "") Response.Redirect("home.aspx");

        CS.Service1 map = new CS.Service1();
        map = new CS.Service1();
        CS.RMap[] r = map.getPicture(rest_id, token);

        CS.Service1 map2 = new CS.Service1();
        map2 = new CS.Service1();
        res = map2.getRestaurant(Convert.ToInt32(rest_id), token);
        gu = map2.GetProfile(username, password);

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
        CS.Service1 book = new CS.Service1();
        book = new CS.Service1();
        b = book.get_Reserve(token);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Menu.aspx");
    }
    protected void GridViewbooked_SelectedIndexChanged(object sender, EventArgs e)
    {
//        cs.Service1 book = new cs.Service1();
//        book.Url = rest_url;
//        b = book.get_Reserve(token);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Promotion.aspx");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Restaurant.aspx");
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button4_Click(object sender, EventArgs e)
    {

    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        DateTime dd = Calendar1.SelectedDate;
        DateTime dt = new DateTime(dd.Year,dd.Month,dd.Day,Convert.ToInt32(drophour.SelectedValue),Convert.ToInt32(dropminute.SelectedValue),0);
        string t1 = dt.ToShortDateString() + " " + dt.ToShortTimeString();
        dt.AddHours(Convert.ToDouble(Dropduration.SelectedValue));
        string t2 = dt.ToShortDateString() + " " + dt.ToShortTimeString();
        RS.Service1 rs = new RS.Service1();
        rs.Url = res.Reserve;
        string now = DateTime.Now.ToShortDateString()+ " "+DateTime.Now.ToShortTimeString();
        string[] name = gu.Name.Trim().Split(new char[] {' '});
        int table = rs.checkReserv(now, t1, t2, Convert.ToInt32(DropCover.SelectedValue), gu.Identify.Trim(), "test1", "test2", 0, true, gu.Address.Trim(), "", "", gu.Talephone, "", res.ID_restaurant, res.Name);
        Result.Text = "Success Booking Table ID = " + table;
    }
}