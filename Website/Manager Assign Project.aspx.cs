using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_Assign_Project : System.Web.UI.Page
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
    protected void assignproject(object sender, EventArgs e)
    {
        string name = Projectname.Text;
        string em = staffmember.Text;
       
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
               

                    
                    string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    SqlCommand cmd = new SqlCommand("Manager__assign_regular_employee_project", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    string dep = Session["department"].ToString();
                    string com = Session["company"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@department", dep));
                    cmd.Parameters.Add(new SqlParameter("@company", com));
                    cmd.Parameters.Add(new SqlParameter("@project_name", name));
                    cmd.Parameters.Add(new SqlParameter("@regular_employee", em));
                SqlParameter stat = cmd.Parameters.Add("@status", SqlDbType.Int);
                stat.Direction = ParameterDirection.Output;

                conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                if(stat.Value.ToString().Equals("1") || stat.Value.ToString().Equals("2"))
                {
                    status.Text = "There is no employee having this username";
                }
                else
                {
                    if (stat.Value.ToString().Equals("3"))
                    {
                        status.Text = "This employee is already assigned to two other projects";
                    }
                    else
                    {
                        if (stat.Value.ToString().Equals("4"))
                        {
                            status.Text = "Employee assigned successfully to the project";
                        }
                        else
                        {
                            if (stat.Value.ToString().Equals("5"))
                            {
                                status.Text = "This Employee is already assigned";
                            }
                        }
                    }
                }

                    
                
            }
        }
    }

}