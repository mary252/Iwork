using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_change_task_employee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
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
    protected void assign_task(object sender, EventArgs e)
    {
        Response.Redirect("Manager assign task", true);
    }
    protected void assigntask(object sender, EventArgs e)
    {
        string name = Projectname.Text;
        string em = staffmember.Text;
        string task = taskname.Text;

        if (name.Length == 0)
        {
            status.Text = "Please Enter a Project name.";
        }
        else
        {
            if (em.Length == 0)
            {
                status.Text = "Please Enter an Employee Name.";
            }
            else
            {
                if (task.Length == 0)
                {
                    status.Text = "Please Enter a Task name";
                }
                else
                {

                    string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    SqlCommand cmd = new SqlCommand("Manager_Change_Regular_Employee_Task", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    string dep = Session["department"].ToString();
                    string com = Session["company"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@department", dep));
                    cmd.Parameters.Add(new SqlParameter("@company", com));
                    cmd.Parameters.Add(new SqlParameter("@project_name", name));
                    cmd.Parameters.Add(new SqlParameter("@regular_employee", em));
                    cmd.Parameters.Add(new SqlParameter("@task_name", task));
                    SqlParameter stat = cmd.Parameters.Add("@result", SqlDbType.Int);
                    stat.Direction = ParameterDirection.Output;

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (stat.Value.ToString().Equals("1") )
                    {
                        status.Text = "Sorry this employee is not assigned to this project";
                    }
                    else
                    {
                        if (stat.Value.ToString().Equals("3"))
                        {
                            status.Text = "This task is not Assigned or it doesn't exist ";
                        }
                        else
                        {
                            if (stat.Value.ToString().Equals("2"))
                            {
                                status.Text = "Task's Employee was changed ";
                            }
                        }
                    }

                }

            }
        }
    }
}