using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;




    public partial class Veiw_And_Edit_Jobs : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("GET_Job", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string userId = Session["Username"].ToString();
            string company = Session["company"].ToString();
            string department = Session["department"].ToString();

            cmd.Parameters.Add(new SqlParameter("@username", userId));
            cmd.Parameters.Add(new SqlParameter("@department", department));
            cmd.Parameters.Add(new SqlParameter("@company", company));



            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            table.DataSource = dt;
            table.DataBind();
        }

        protected void Edit(object sender, GridViewCommandEventArgs e){
            Response.Redirect("Edit_Job.aspx",true);
        }

        }


