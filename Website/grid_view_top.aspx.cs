using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


    public partial class grid_view_top : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int inyear = 0;
            int inmonth = 0;
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_Top_Achievers", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string userId = Session["Username"].ToString();
            string company = Session["company"].ToString();
            string department = Session["department"].ToString();
            string year = Session["Year"].ToString();
            string month = Session["Month"].ToString();

            Int32.TryParse(year, out inyear);
            Int32.TryParse(month, out inmonth);

            cmd.Parameters.Add(new SqlParameter("@hr", userId));
            cmd.Parameters.Add(new SqlParameter("@department", department));
            cmd.Parameters.Add(new SqlParameter("@company", company));
            cmd.Parameters.Add(new SqlParameter("@month", inmonth));
            cmd.Parameters.Add(new SqlParameter("@year", inyear));

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            table_top.DataSource = dt;
            table_top.DataBind();



        }

        protected void tableCommand(object sender, GridViewCommandEventArgs e)
        {
            int serial = 200;
            if (e.CommandName.CompareTo("Accept") == 0)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = table_top.Rows[index];
                string recipient = Server.HtmlDecode(row.Cells[0].Text);

                SqlConnection conn = new SqlConnection(@"Server=localhost; Database=iWork;User Id=sa;Password=Password123");


                SqlCommand cmd = new SqlCommand("send_mails", conn);
                cmd.CommandType = CommandType.StoredProcedure;


                string userId = Session["Username"].ToString();
                string company = Session["company"].ToString();
                string department = Session["department"].ToString();


                string isubject = "Top Achiever.";
                string body = "Congralations You are a top achiever!";

                cmd.Parameters.Add(new SqlParameter("@username", userId));
                cmd.Parameters.Add(new SqlParameter("@recipient", recipient));
                cmd.Parameters.Add(new SqlParameter("@department", department));
                cmd.Parameters.Add(new SqlParameter("@company", company));
                cmd.Parameters.Add(new SqlParameter("@serial_number", serial++));
                cmd.Parameters.Add(new SqlParameter("@body", body));
                cmd.Parameters.Add(new SqlParameter("@isubject", isubject));




            }
        }
    }

