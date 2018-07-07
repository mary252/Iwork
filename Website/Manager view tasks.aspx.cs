using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_view_tasks : System.Web.UI.Page
{
    string taskname;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void viewtasks(object sender, EventArgs e)
    {
        string name = projectname.Text;
        string stat = status.Text;
        

        if (name.Length == 0)
        {
            entertitle.Text = "Please enter a vaild Project name";
        }
        else
        {
            if (stat.Length == 0)
            {
                entertitle.Text = "Please enter a Task status";
            }
            else
            {

                string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand cmd = new SqlCommand("Manager_Veiw_Tasks", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                string userId = Session["Username"].ToString();
                cmd.Parameters.Add(new SqlParameter("@manager", userId));
                string dep = Session["department"].ToString();
                string com = Session["company"].ToString();
                cmd.Parameters.Add(new SqlParameter("@department", dep));
                cmd.Parameters.Add(new SqlParameter("@company", com));
                cmd.Parameters.Add(new SqlParameter("@project_name", name));
                cmd.Parameters.Add(new SqlParameter("@task_status", stat));

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
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
    }
    protected void dataenter(object sender, GridViewRowEventArgs e)
    {
        string stat = status.Text;
        if (!(stat.Equals("Fixed")))
        {
            table.Columns[6].Visible = false;
            table.Columns[7].Visible = false;
        }
        else
        {
            table.Columns[6].Visible = true;
            table.Columns[7].Visible = true;
        }
    }
    protected void tablecomand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("Accept") == 0)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = table.Rows[index];
            string title = Server.HtmlDecode(row.Cells[0].Text);
            string project = projectname.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Review_Accept_Task", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string userId = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@manager", userId));
            string dep = Session["department"].ToString();
            string com = Session["company"].ToString();
            
            cmd.Parameters.Add(new SqlParameter("@department", dep));
            cmd.Parameters.Add(new SqlParameter("@company", com));
            cmd.Parameters.Add(new SqlParameter("@task_name", title));
            cmd.Parameters.Add(new SqlParameter("@project_name", project));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            entertitle.Text = "Task was Accepted";
            //Response.Redirect("Manager approve-disapprove job", true);


        }
        if (e.CommandName.CompareTo("reject") == 0)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = table.Rows[index];
            taskname = Server.HtmlDecode(row.Cells[0].Text);
            Session["taskname"] = taskname;
            ndd.Visible = true;
            newdeadline.Visible = true;
            reject.Visible = true;

        }
        else
        {
            ndd.Visible = false;
            newdeadline.Visible = false;
            reject.Visible = false;
        }

    }
    protected void rejec(object sender, EventArgs e)
    {
        string project = projectname.Text;
        string deadln = newdeadline.Text;
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        string task = Session["taskname"].ToString();
        SqlCommand cmd = new SqlCommand("Review_Reject_Task", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@manager", userId));
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();
        DateTime dd = Convert.ToDateTime(deadln);
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));
        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));
        cmd.Parameters.Add(new SqlParameter("@deadline", dd));

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        entertitle.Text = "Task was Rejected";
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
}