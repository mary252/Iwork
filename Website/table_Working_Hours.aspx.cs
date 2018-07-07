using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class table_Working_Hours : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("HR_View_WorkingHours", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            int year = 0;
            string userId = Session["Username"].ToString();
            string department = Session["department"].ToString();
            string company = Session["company"].ToString();
            string staff = Session["Staff"].ToString();
            string years = Session["Year"].ToString();

            Int32.TryParse(years, out year);

            cmd.Parameters.Add(new SqlParameter("@hr", userId));
            cmd.Parameters.Add(new SqlParameter("@department", department));
            cmd.Parameters.Add(new SqlParameter("@company", company));
            cmd.Parameters.Add(new SqlParameter("@username", staff));
            cmd.Parameters.Add(new SqlParameter("@year", years));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            table1.DataSource = dt;
            table1.DataBind();
        }
    }

