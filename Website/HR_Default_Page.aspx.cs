using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    public partial class HR_Default_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("view_staff", conn);
            cmd.CommandType = CommandType.StoredProcedure;

        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        conn.Open();

        SqlDataReader rdr1 = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr1.Read())
        {
            
            string dep = rdr1.GetString(rdr1.GetOrdinal("department"));
            Session["department"] = dep;
            string com = rdr1.GetString(rdr1.GetOrdinal("company"));
            Session["company"] = com;
        }
        conn.Close();

       

        //take session variable instead of company department tet boxes.
        }

        protected void add_job(object sender, EventArgs e)
        {
            Response.Redirect("add_hr_job.aspx", true);
        }

        protected void veiw_edit_job(object sender, EventArgs e)
        {
            Response.Redirect("Veiw_And_Edit_Jobs.aspx",true);
        }

        protected void veiw_appli(object sender, EventArgs e)
        {
            Response.Redirect("veiw_appli.aspx",true);
        }

        protected void announce(object sender, EventArgs e)
        {
            Response.Redirect("Post_announcements.aspx",true);
        }

        protected void veiw_request(object sender, EventArgs e)
        {
            Response.Redirect("veiw_request.aspx",true);
        }

        protected void attend(object sender, EventArgs e)
        {
            Response.Redirect("attend.aspx",true);
        }

        protected void veiw_working_hours(object sender, EventArgs e)
        {
            Response.Redirect("veiw_working_hours.aspx",true);
        }

        protected void top_achivers(object sender, EventArgs e)
        {
            Response.Redirect("top_acheivers.aspx", true);
        }
    protected void checkin(object sender, EventArgs e)
    {
        string name = Session["Username"].ToString();

        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Staff_Member_Check_in", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@username", name));

        SqlParameter dayoff = cmd.Parameters.Add("@dayoff", SqlDbType.Int);
        dayoff.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (dayoff.Value.ToString().Equals("1"))
        {
            hello.Text = "sorry can't check-in on a dayoff";
        }

        else
        {
            hello.Text = "you checked in";
        }
    }

    protected void checkout(object sender, EventArgs e)
    {
        string name = Session["Username"].ToString();

        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Staff_Member_Check_out", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new SqlParameter("@username", name));

        SqlParameter dayoff = cmd.Parameters.Add("@dayoff", SqlDbType.Int);
        dayoff.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (dayoff.Value.ToString().Equals("0"))
        {
            hello.Text = "you checked out! Bye bye";
        }
        else
        {
            hello.Text = "cannot check-out on a dayoff";
        }

    }

    protected void viewattendance(object sender, EventArgs e)
    {
        Response.Redirect("view_my_attendance", true);
    }

    protected void leave(object sender, EventArgs e)
    {
        Response.Redirect("Leave_request", true);
    }

    protected void buisness(object sender, EventArgs e)
    {
        Response.Redirect("buisiness_request", true);
    }

    protected void prev_requests(object sender, EventArgs e)
    {
        Response.Redirect("prev_requests", true);
    }

    protected void delete_request(object sender, EventArgs e)
    {
        Response.Redirect("delete_request", true);
    }

    protected void send_mail(object sender, EventArgs e)
    {
        Response.Redirect("send_mail", true);
    }

    protected void check_mail(object sender, EventArgs e)
    {
        Response.Redirect("check_mails", true);
    }

    protected void reply_mail(object sender, EventArgs e)
    {
        Response.Redirect("Reply_email", true);
    }

    protected void view_announcements(object sender, EventArgs e)
    {
        Response.Redirect("view_announcements", true);
    }


}

