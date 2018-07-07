using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Leave_request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void requestt(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Apply_For_Leave_Request", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string start = start_textbox.Text;
        string end = end_textbox.Text;
        string type = type_box.Text;

        cmd.Parameters.Add(new SqlParameter("@username", name));
        cmd.Parameters.Add(new SqlParameter("@request_start_date", start));
        cmd.Parameters.Add(new SqlParameter("@request_end_date", end));
        cmd.Parameters.Add(new SqlParameter("@request_type", type));

        SqlParameter message = cmd.Parameters.Add("@message", SqlDbType.Int);
        message.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (message.Value.ToString().Equals("1"))
        {
            labell.Text = "can not apply for a request when it’s applied period overlaps with another request.";
        }

        else
        {
            labell.Text = "Done!";
        }
    }




}