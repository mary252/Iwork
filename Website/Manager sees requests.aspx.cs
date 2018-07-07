using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Manager_sees_requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Manager_View_Requests", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string userId = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", userId));
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));


        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        table.DataSource = dt;
        table.DataBind();



    }
    protected void tablecomand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName.CompareTo("Update") == 0)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = table.Rows[index];
            string applicant = Server.HtmlDecode(row.Cells[0].Text);
            string reqdate= Server.HtmlDecode(row.Cells[1].Text);
            DateTime oDate = Convert.ToDateTime(reqdate);
            Session["applicant"] = applicant;
            Session["requestdate"] = reqdate;

            Response.Redirect("Manager approve-disapprove requests", true);


        }

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
}