using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_approve_disapprove_job : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("manager_see_job", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();
        string tit = Session["title"].ToString();
        string jobse = Session["jobseeker"].ToString();
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));
        cmd.Parameters.Add(new SqlParameter("@title", tit));
        cmd.Parameters.Add(new SqlParameter("@jobseeker", jobse));
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string jobt = rdr.GetString(rdr.GetOrdinal("title"));
            jtitle.Text = jobt;
            //DateTime sdate = rdr.GetDateTime(0);
            //startdate.Text = sdate.ToString("yyyy/MM/dd");

            string shd = rdr.GetString(rdr.GetOrdinal("short_discription"));
            short_discription.Text = shd;
            string detd = rdr.GetString(rdr.GetOrdinal("detailed_discription"));
            detailed_discription.Text = detd;
            int minex = rdr.GetOrdinal("min_experience");
            min_experience.Text = minex + "";
            int sal = rdr.GetOrdinal("salary");
            salary.Text = sal + "";
            int nvan = rdr.GetOrdinal("no_of_vacancies");
            no_of_vacancies.Text = nvan + "";
            int wh = rdr.GetOrdinal("working_hours");
            working_hours.Text = wh + "";
            DateTime deadl = rdr.GetDateTime(7);
            deadline.Text = deadl.ToString("yyyy/MM/dd");

            string jobseek = rdr.GetString(rdr.GetOrdinal("username"));
            username.Text = jobseek;
            string peremail = rdr.GetString(rdr.GetOrdinal("personal_email"));
            personal_email.Text = peremail;
            string fn = rdr.GetString(rdr.GetOrdinal("first_name"));
            first_name.Text = fn;
            string mn = rdr.GetString(rdr.GetOrdinal("middle_name"));
            middle_name.Text = mn;
            string ln = rdr.GetString(rdr.GetOrdinal("last_name"));
            last_name.Text = ln ;


            DateTime bdate = rdr.GetDateTime(13);
            birth_date.Text = bdate.ToString("yyyy/MM/dd");
            int ag = rdr.GetOrdinal("age");
            age.Text = ag + "";
            int exy = rdr.GetOrdinal("years_of_experience");
            years_of_experience.Text = exy + "";
            int sc = rdr.GetOrdinal("score");
            score.Text = sc + "";
        }
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
    protected void Approve(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Manager_approve_Job", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();
        string tit = Session["title"].ToString();
        string jobse = Session["jobseeker"].ToString();
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));
        cmd.Parameters.Add(new SqlParameter("@title", tit));
        cmd.Parameters.Add(new SqlParameter("@job_seeker", jobse));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        application.Text = "Application was Approved.";

    }
    protected void reject(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Manager_reject_job", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();
        string tit = Session["title"].ToString();
        string jobse = Session["jobseeker"].ToString();
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));
        cmd.Parameters.Add(new SqlParameter("@title", tit));
        cmd.Parameters.Add(new SqlParameter("@job_seeker", jobse));
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        application.Text = "Application was Rejected.";
    }
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
    }

}