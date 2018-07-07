using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_sees_Jobs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
    }
    protected void viewjob(object sender, EventArgs e)
    {
        string title = jobtitle.Text;
        if (title.Length == 0)
        {
            entertitle.Text = "Please enter a vaild job title";
        }
        else
        {
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Manager_Veiw_Job", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string userId = Session["Username"].ToString();
            cmd.Parameters.Add(new SqlParameter("@username", userId));
            string dep = Session["department"].ToString();
            string com = Session["company"].ToString();
            cmd.Parameters.Add(new SqlParameter("@department", dep));
            cmd.Parameters.Add(new SqlParameter("@company", com));
            cmd.Parameters.Add(new SqlParameter("@title", title));


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
    protected void tablecomand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.CompareTo("Update") == 0)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = table.Rows[index];
            string title = Server.HtmlDecode(row.Cells[0].Text);
            string jobseek = Server.HtmlDecode(row.Cells[7].Text);
            Session["title"] = title;
            Session["jobseeker"] = jobseek;

            Response.Redirect("Manager approve-disapprove job", true);


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

}