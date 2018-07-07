using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_Homepage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_all_user_info", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string uName = rdr.GetString(rdr.GetOrdinal("username"));
            username.Text = uName;
            string fName = rdr.GetString(rdr.GetOrdinal("first_name"));
            if (fName == null)
            {
                fname.Text = "";
            }
            else
            {
                firstname.Text = fName;
            }
            string mName = rdr.GetString(rdr.GetOrdinal("middle_name"));
            if (mName == null)
            {
                mname.Text = "";
            }
            else
            {
                Middlename.Text = mName;
            }
            string lName = rdr.GetString(rdr.GetOrdinal("last_name"));
            if (lName == null)
            {
                lname.Text = "";
            }
            else
            {
                Lastname.Text = lName;
            }
            string pmail = rdr.GetString(rdr.GetOrdinal("personal_email"));
            personalemail.Text = pmail;
           // string date = rdr.GetString(rdr.GetOrdinal("birth_date"));
           // birth_date.Text = date;
            int agee = rdr.GetOrdinal("age");
            _age.Text = agee+"";
            int exyears = rdr.GetOrdinal("years_of_experience");
            yearsofexp.Text = exyears+"";
        }
        conn.Close();

        SqlCommand cmd1 = new SqlCommand("view_staff", conn);
        cmd1.CommandType = CommandType.StoredProcedure;
        cmd1.Parameters.Add(new SqlParameter("@username", userId));
        conn.Open();
        SqlDataReader rdr1 = cmd1.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr1.Read())
        {
            //int anleaves = rdr1.GetOrdinal("annual_leaves");
            //anualleaves.Text = anleaves+"";
            string cmail = rdr1.GetString(rdr1.GetOrdinal("company_email"));
            Companyemail.Text = cmail;
            string doff = rdr1.GetString(rdr1.GetOrdinal("day_off"));
            day_off.Text = doff;
            int sal = rdr1.GetOrdinal("salary");
            salary.Text = sal+"";
            string job = rdr1.GetString(rdr1.GetOrdinal("job"));
            _job.Text = job;
            string dep = rdr1.GetString(rdr1.GetOrdinal("department"));
            department.Text = dep;
            Session["department"] = dep;
            string com = rdr1.GetString(rdr1.GetOrdinal("company"));
            company.Text = com;
            Session["company"] = com;
        }
        conn.Close();



    }
    
    protected void assign_task(object sender, EventArgs e)
    {
        Response.Redirect("Manager assign task", true);
    }

    protected void see_requests(object sender, EventArgs e)
    {
        Response.Redirect("Manager sees requests", true);
    }

    protected void see_Jobs(object sender, EventArgs e)
    {
        Response.Redirect("Manager sees Jobs", true);
    }
    protected void Create_Project(object sender, EventArgs e)
    {
        Response.Redirect("Manager Create Project", true);
    }

    protected void Assign_project(object sender, EventArgs e)
    {
        Response.Redirect("Manager Assign Project", true);
    }
    protected void Remove_Project(object sender, EventArgs e)
    {
        Response.Redirect("Manager Remove Project", true);
    }
    protected void View_applications(object sender, EventArgs e)
    {
        Response.Redirect("Manager view applications", true);
    }
    protected void create_task(object sender, EventArgs e)
    {
        Response.Redirect("Manager create task", true);
    }
    protected void Change_employee(object sender, EventArgs e)
    {
        Response.Redirect("Manager change task employee", true);
    }
    protected void view_tasks(object sender, EventArgs e)
    {
        Response.Redirect("Manager view tasks", true);
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
