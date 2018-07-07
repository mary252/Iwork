using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class buisiness_request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void requestt(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Apply_For_Business_Trip_Requests", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string start = start_textbox.Text;
        string end = end_textbox.Text;
        string destinaton = destination_box.Text;
        string purpose = Purpose_textbox.Text;
        //DateTime i=

        cmd.Parameters.Add(new SqlParameter("@username", name));
        cmd.Parameters.Add(new SqlParameter("@request_start_date", start));
        cmd.Parameters.Add(new SqlParameter("@request_end_date", end));
        cmd.Parameters.Add(new SqlParameter("@destination", destinaton));
        cmd.Parameters.Add(new SqlParameter("@purpose", purpose));

        SqlParameter message = cmd.Parameters.Add("@message1", SqlDbType.Int);
        message.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (message.Value.ToString().Equals("1"))
        {
            mess.Text = "can not apply for a request when it’s applied period overlaps with another request.";
        }
        else
        {
            mess.Text = "Done!";
        }

    }
}