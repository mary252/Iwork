using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_Create_Project : System.Web.UI.Page
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
        string name = Projectname.Text;
        string startd = startdate.Text;
        string endd = enddate.Text;
        if (name.Length == 0)
        {
            status.Text = "Please Enter a Project name.";
        }
        else
        {
            if (startd.Length == 0)
            {
                status.Text = "Please Enter a Start date.";
            }
            else
            {
                if (endd.Length == 0)
                {
                    status.Text = "Please Enter an End date.";
                }
                else
                {

                    DateTime st = Convert.ToDateTime(startd);
                    DateTime ed = Convert.ToDateTime(endd);
                    string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    SqlCommand cmd = new SqlCommand("Create_New_Project", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    string userId = Session["Username"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@manager", userId));
                    string dep = Session["department"].ToString();
                    string com = Session["company"].ToString();
                    cmd.Parameters.Add(new SqlParameter("@department", dep));
                    cmd.Parameters.Add(new SqlParameter("@company", com));
                    cmd.Parameters.Add(new SqlParameter("@project_name", name));
                    cmd.Parameters.Add(new SqlParameter("@start__date", st));
                    cmd.Parameters.Add(new SqlParameter("@end_date", ed));
                    SqlParameter stat = cmd.Parameters.Add("@result", SqlDbType.Int);
                    stat.Direction = ParameterDirection.Output;
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    if (stat.Value.ToString().Equals("1"))
                    {
                        status.Text = "Sorry this project already exists";
                    }
                    else
                    {
                        if (stat.Value.ToString().Equals("2"))
                        {
                            status.Text = "Project was created sucessfully";
                        }
                    }
                       // status.Text = "Project was created sucessfully";
                }
            }
        }
    }
}