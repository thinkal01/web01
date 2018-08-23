using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Services;
using System.Data.OleDb;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    [System.Web.Services.WebMethod]
    public static string GetShuju()
    {
        OleDbConnection con = new OleDbConnection(@"data source=F:\源码\artDialog\App_Data\access.mdb;provider=microsoft.jet.oledb.4.0");
        //OleDbConnection con = new OleDbConnection("data source=" + HttpContext.Current.Server.MapPath("App_Data/access.mdb").ToString() + ";provider=microsoft.jet.oledb.4.0");
        OleDbCommand cmd = new OleDbCommand("");
        cmd.CommandText = "select classname from gsclass where id=30";
        cmd.Connection = con;
        OleDbDataAdapter adp = new OleDbDataAdapter(cmd);
        DataTable dt = new DataTable();
        adp.Fill(dt);
        //System.Web.HttpContext.Current.Response.Write("<script>window.alert('"+dt.Rows[0][0].ToString()+"')</script>");
        return dt.Rows[0][0].ToString();

    }
}
