using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



public partial class veiw_appli : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Veiw_Applications", conn);
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

        protected void tableCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName.CompareTo("Accept")==0)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = table.Rows[index];
                string job_seeker = row.Cells[10].Text;
                string job = row.Cells[0].Text;

                SqlConnection conn = new SqlConnection(@"Server=localhost; Database=iWork;User Id=sa;Password=Password123");
                SqlCommand cmd = new SqlCommand("accept_applications", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string userId = Session["Username"].ToString();
                string company = Session["company"].ToString();
                string department = Session["department"].ToString();
           
                cmd.Parameters.Add(new SqlParameter("@hr_employee", userId));
                cmd.Parameters.Add(new SqlParameter("@job", job));
                cmd.Parameters.Add(new SqlParameter("@department", department));
                cmd.Parameters.Add(new SqlParameter("@company", company));
                cmd.Parameters.Add(new SqlParameter("@job_Seeker", job_seeker));


                SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
                count.Direction = ParameterDirection.Output;


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (count.Value.ToString().Equals("1"))
                {
                    Response.Write("APPLICANT ACCEPT!");
                }

            }

            if (e.CommandName.CompareTo("Reject") == 0)
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = table.Rows[index];
                string job_seeker = Server.HtmlDecode(row.Cells[10].Text);
                string job = Server.HtmlDecode(row.Cells[1].Text);

                SqlConnection conn = new SqlConnection(@"Server=localhost; Database=iWork;User Id=sa;Password=Password123");
                SqlCommand cmd = new SqlCommand("reject_applications", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string userId = Session["Username"].ToString();
                string company = Session["company"].ToString();
                string department = Session["department"].ToString();

                cmd.Parameters.Add(new SqlParameter("@hr_employee", userId));
                cmd.Parameters.Add(new SqlParameter("@job", job));
                cmd.Parameters.Add(new SqlParameter("@department", department));
                cmd.Parameters.Add(new SqlParameter("@company", company));
                cmd.Parameters.Add(new SqlParameter("@job_Seeker", job_seeker));


                SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
                count.Direction = ParameterDirection.Output;


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                if (count.Value.ToString().Equals("0"))
                {
                    Response.Write("APPLICANT IS REJECTED!");
                }

            }



            }
           
        }
    

