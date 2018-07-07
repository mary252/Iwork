using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class searchvac : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("FirstPage", true);
    }
    protected void viewjob(object sender, EventArgs e)
    {
        string title = jobtitle.Text;
        if (title.Length == 0)
        {
            entertitle.Text = "Please enter a vaild Keyword";
        }
        else
        {
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Search_for_Vacancy", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            
            cmd.Parameters.Add(new SqlParameter("@keyword", title));


            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            table.DataSource = dt;
            table.DataBind();
            if (dt == null)
            {
                entertitle.Text = "Sorry no data was found";
            }
        }
    }
}