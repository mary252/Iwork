using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class view_announcements : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_Announcements", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", name));

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        table.DataSource = dt;
        table.DataBind();
    }

    protected void table_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}