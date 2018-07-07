using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Regular : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Veiw_Projects", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
            Response.Redirect("user_login", true);
        String username = Session["Username"].ToString();
        String company = Session["company"].ToString();

        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@company", company));

       // Label2.Text = company;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        table.DataSource = dt;
        table.DataBind();
        table.Visible = true;



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

        Response.Redirect("Regular_Homepage", true);
    }

    protected void table_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //   Label2.Text = "Not YET!!";
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table.Rows[index];
            LinkButton ProjectCell = (LinkButton)selectedRow.Cells[0].Controls[0];
            String username = Session["Username"].ToString();
            string projectname = ProjectCell.Text;
            Session["project"] = projectname;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Veiw_task", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@project_name", projectname));
            table2.Visible = true;
            table.Visible = false;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dx = new DataTable();
            sda.Fill(dx);
            table2.DataSource = dx;
            table2.DataBind();

        }
    }
    protected void table2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table2.Rows[index];
            TableCell TaskCell = selectedRow.Cells[0];
            string Taskname = TaskCell.Text;
            Session["task"] = Taskname;
            Fixed.Visible = true;
            Assign.Visible = true;

        }
    }
    protected void Finalizing_Task(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Finalizing_Task", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
            Response.Redirect("user_login", true);
        String username = Session["Username"].ToString();
        String task = Session["task"].ToString();
        String project = Session["project"].ToString();
        String company = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));
        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@company", company));
        SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;

       // Label1.Text = "hii";
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (output == null)
        {
            Label1.Text = "NULL!!!!!";
        }
        else
        {

            if (output.Value.ToString().Equals("0"))
                Label1.Text = "Invalid Access, you need to login first =)!";

            else
            {
                if (output.Value.ToString().Equals("1"))
                    Label1.Text = "No such task!"+ output.Value.ToString();
                else
                {
                    if (output.Value.ToString().Equals("2"))
                        Label1.Text = "The deadline for this task has passed! ";
                    else
                    {
                        Label1.Text = "Successfuly chanded the statuse for the task " + task + " to Fixed";
                        string connStr2 = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                        SqlConnection conn2 = new SqlConnection(connStr2);

                        SqlCommand cmd2 = new SqlCommand("Veiw_task", conn2);
                        cmd2.CommandType = CommandType.StoredProcedure;

                        cmd2.Parameters.Add(new SqlParameter("@username", username));
                        cmd2.Parameters.Add(new SqlParameter("@project_name", project));

                        SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                        DataTable dx2 = new DataTable();
                        sda2.Fill(dx2);
                        table2.DataSource = dx2;
                        table2.DataBind();

                    }


                }
            }

        }
    }
    protected void Update_Task(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("Update_Task", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
            Response.Redirect("user_login", true);
        String username = Session["Username"].ToString();
        String task = Session["task"].ToString();
        String project = Session["project"].ToString();
        String company = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@regular_employee", username));
        cmd.Parameters.Add(new SqlParameter("@project_name", project));
        cmd.Parameters.Add(new SqlParameter("@task_name", task));
        cmd.Parameters.Add(new SqlParameter("@company", company));
        SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;


        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (output == null)
        {
            Label1.Text = "NULL!!!!!";
        }
        else
        {

            if (output.Value.ToString().Equals("0"))
                Label1.Text = "Invalid Access, you need to login first =)!";

            else
            {
                if (output.Value.ToString().Equals("1"))
                    Label1.Text = "You are not assigned to this task!";
                else
                {
                    if (output.Value.ToString().Equals("2"))
                        Label1.Text = "The current status for this task isn't fixed!";
                    else
                    {
                        if (output.Value.ToString().Equals("3"))
                            Label1.Text = "SORRY! The deadline for this task  has passed!";
                        else
                        {
                            Label1.Text = "Successfuly chanded the statuse for the task " + task + " to Assigned";
                            string connStr2 = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                            SqlConnection conn2 = new SqlConnection(connStr2);

                            SqlCommand cmd2 = new SqlCommand("Veiw_task", conn2);
                            cmd2.CommandType = CommandType.StoredProcedure;

                            cmd2.Parameters.Add(new SqlParameter("@username", username));
                            cmd2.Parameters.Add(new SqlParameter("@project_name", project));
                            table2.Visible = true;
                            table.Visible = false;

                            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                            DataTable dx2 = new DataTable();
                            sda2.Fill(dx2);
                            table2.DataSource = dx2;
                            table2.DataBind();

                        }


                    }
                }

            }
        }
    }
}