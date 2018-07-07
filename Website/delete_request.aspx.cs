using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class delete_request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_status_of_requests", conn);
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

    protected void delete(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Delete_request", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string start_date = txt_deleted.Text;

        cmd.Parameters.Add(new SqlParameter("@username", name));
        cmd.Parameters.Add(new SqlParameter("@deleted_request_start_date", start_date));

        SqlParameter delete = cmd.Parameters.Add("@delete", SqlDbType.Int);
        delete.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();


        if (delete.Value.ToString().Equals("1"))
        {
            Labellog.Text = "cannot delete an approved request";
        }

        else
        {
            Labellog.Text = "Request is deleted";
        }
    }
}