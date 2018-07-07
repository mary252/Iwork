using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;



public partial class Regular_Homepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("RegisterNow", true);
    }
    protected void signout(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("FirstPage", true);
        
    }
    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("FirstPage", true);
    }


    protected void view_projects(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Veiw_Projects", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
        {
            Response.Redirect("user_login", true);
        }
        String username = Session["Username"].ToString();
        if (Session["company"] == null)
        {

            Response.Redirect("user_login", true);
        }
        String Comp = Session["company"].ToString();


        Response.Redirect("Regular", true);

    }
    protected void view_tasks(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Veiw_task", conn);
        cmd.CommandType = CommandType.StoredProcedure;
    }


}