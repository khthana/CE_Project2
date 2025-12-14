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

public partial class MasterPage_master : System.Web.UI.MasterPage
{
    public MasterPage_master()
    {
    }

    void Page_Load(object sender, EventArgs e)
    {
        /*string username="";
        string password="";
        try { username = Request.Cookies["username"].Value; }
        catch { }
        try { password = Request.Cookies["password"].Value; }
        catch { }

        CS.Service1 cook = new CS.Service1();
        cook = new CS.Service1();
        

        try { CS.GeneralUser g = cook.GetProfile(username, password); }
        catch { }*/
       // Labelprof.Text = g.Name;

      
    }
}
