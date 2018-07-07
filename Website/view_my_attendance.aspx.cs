using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class view_my_attendance : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void vieww(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_my_attendance", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string start = start_textbox.Text;
        string end = end_textbox.Text;


        cmd.Parameters.Add(new SqlParameter("@username", name)) ;
        cmd.Parameters.Add(new SqlParameter("@start_period", start)) ;
        cmd.Parameters.Add(new SqlParameter("@end_period", end)) ;

        SqlParameter hours = cmd.Parameters.Add("@missing_hours", SqlDbType.Int);
        hours.Direction = ParameterDirection.Output;
        SqlParameter duration = cmd.Parameters.Add("@duration", SqlDbType.Int);
        duration.Direction = ParameterDirection.Output;


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