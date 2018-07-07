using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_create_task : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
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
    protected void createproject(object sender, EventArgs e)
    {
        string tname = taskname.Text;
        string pname = Projectname.Text;
        string deadln = deadline.Text;
        string dis = Taskdescription.Text;
        if (tname.Length == 0)
        {
            status.Text = "Please Enter a Task name.";
        }
        else
        {
            if (pname.Length == 0)
            {
                status.Text = "Please Enter a Project name.";
            }
            else
            {
                if (deadln.Length == 0)
                {
                    status.Text = "Please Enter a Deadline.";
                }
                else
                {
                    if (dis.Length == 0)
                    {
                        status.Text = "Please enter a Description";
                    }
                    else
                    {

                        DateTime dd = Convert.ToDateTime(deadln);
                        
                        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                        SqlConnection conn = new SqlConnection(connStr);

                        SqlCommand cmd = new SqlCommand("Manager_create_task", conn);
                        cmd.CommandType = CommandType.StoredProcedure;
                        string userId = Session["Username"].ToString();
                        cmd.Parameters.Add(new SqlParameter("@manager", userId));
                        string dep = Session["department"].ToString();
                        string com = Session["company"].ToString();
                        cmd.Parameters.Add(new SqlParameter("@department", dep));
                        cmd.Parameters.Add(new SqlParameter("@company", com));
                        cmd.Parameters.Add(new SqlParameter("@project_name", pname));
                        cmd.Parameters.Add(new SqlParameter("@deadline", dd));
                        cmd.Parameters.Add(new SqlParameter("@task_name", tname));
                        cmd.Parameters.Add(new SqlParameter("@task_description", dis));
                        SqlParameter stat = cmd.Parameters.Add("@result", SqlDbType.Int);
                        stat.Direction = ParameterDirection.Output;
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        if (stat.Value.ToString().Equals("1"))
                        {
                            status.Text = "The project you are trying to add a task to doesnt exist";

                        }
                        else
                        {
                            if (stat.Value.ToString().Equals("2"))
                            {
                                status.Text = "This task already exist";
                            }
                            else
                            {
                                if (stat.Value.ToString().Equals("3"))
                                {
                                    status.Text = "Task was created sucessfully";
                                }
                            }
                        }

                        
                    }
                }
            }
        }
    }
}