using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Interview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewinterview", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
        {
            Label2.Text = "Invalid Access, you need to Login first =)!";
            Response.Redirect("user_login", true);
        }
        string username = Session["Username"].ToString();

        string job = Session["job"].ToString();
        string dcode = Session["department"].ToString();
        string compmail = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@jobtitle", job));
        cmd.Parameters.Add(new SqlParameter("@department", dcode));
        cmd.Parameters.Add(new SqlParameter("@company", compmail));

        SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;


        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (output.Value.ToString().Equals("0"))
            Label2.Text = "You haven't for any job yet =(!";

        else
        {
            if (output.Value.ToString().Equals("1"))
                Label2.Text = "You haven't for this job yet =(!";
            else
            {
                if (output.Value.ToString().Equals("2"))
                {
                    Label2.Text = "Welcome to your online interview for the job title" + Session["job"].ToString();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dx = new DataTable();
                    sda.Fill(dx);
                    table.DataSource = dx;
                    table.DataBind();
                }




            }
        }
        //table3.Visible = false;
        //Label2.Text = "Table3";
    }

    protected void register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("RegisterNow", true);
    }
    protected void signin(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("user_login", true);
    }
    protected void home(object sender, EventArgs e)
    {
        Response.Redirect("Job_Seeker", true);
    }
    protected void search_comp(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("search_company", true);
    }
    protected void Search_by_type(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("Search_by_type", true);
    }
    protected void Specific_company(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("Specific_company", true);
    }
    protected void ViewSalary(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("ViewSalary", true);
    }
    protected void view_score(object sender , EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("view_score", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string username = Session["Username"].ToString();
        if (Session["Username"] == null)
        {
            Label2.Text = "Invalid Access, you need to Login first =)!";
            Response.Redirect("user_login", true);
        }
        string job = Session["job"].ToString();
        string dcode = Session["department"].ToString();
        string compmail = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@job", job));
        cmd.Parameters.Add(new SqlParameter("@department", dcode));
        cmd.Parameters.Add(new SqlParameter("@company", compmail));

        SqlParameter output = cmd.Parameters.Add("@score", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;


        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        Label2.Text = "Thank You For Using iWork,We hope you get accepted =)!";
        table.Visible = false;
        finish.Enabled = false;
        finish1.Text = output.Value.ToString();


    }

    protected void table_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "True")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table.Rows[index];
            LinkButton T = (LinkButton)selectedRow.Cells[1].Controls[0];
            LinkButton F = (LinkButton)selectedRow.Cells[2].Controls[0];
            TableCell questionCell = selectedRow.Cells[0];
            String Question = questionCell.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            Boolean answer = true;
            SqlCommand cmd = new SqlCommand("savescore", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string username = Session["Username"].ToString();
            if (Session["Username"] == null)
            {
                Label2.Text = "Invalid Access, you need to Login first =)!";
                Response.Redirect("user_login", true);
            }
            string job = Session["job"].ToString();
            string dcode = Session["department"].ToString();
            string compmail = Session["company"].ToString();
            cmd.Parameters.Add(new SqlParameter("@answer", answer));
            cmd.Parameters.Add(new SqlParameter("@Question", Question));
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@jobtitle", job));
            cmd.Parameters.Add(new SqlParameter("@department", dcode));
            cmd.Parameters.Add(new SqlParameter("@company", compmail));

            SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
            output.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (output.Value.ToString().Equals("0"))
                Label2.Text = "You haven't Selected an answer yet!";

            else
            {
                Label2.Text = "score recorded!";
                if (output.Value.ToString().Equals("1"))
                {
                   
                    T.Enabled = false;
                    F.Enabled = false;
                }
                else
                {
                    Label2.Text = "score recorded!";
                    T.Enabled = false;
                    F.Enabled = false;
                }
            }




                }
        if (e.CommandName == "False")
        {
          
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow selectedRow = table.Rows[index];
            LinkButton T = (LinkButton)selectedRow.Cells[1].Controls[0];
            LinkButton F = (LinkButton)selectedRow.Cells[2].Controls[0];

            TableCell questionCell = selectedRow.Cells[0];
            String Question = questionCell.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            Boolean answer = false;
            SqlCommand cmd = new SqlCommand("savescore", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string username = Session["Username"].ToString();
            if (Session["Username"] == null)
            {
                Label2.Text = "Invalid Access, you need to Login first =)!";
                Response.Redirect("user_login", true);
            }
            string job = Session["job"].ToString();
            string dcode = Session["department"].ToString();
            string compmail = Session["company"].ToString();
            cmd.Parameters.Add(new SqlParameter("@answer", answer));
            cmd.Parameters.Add(new SqlParameter("@Question", Question));
            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@jobtitle", job));
            cmd.Parameters.Add(new SqlParameter("@department", dcode));
            cmd.Parameters.Add(new SqlParameter("@company", compmail));

            SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
            output.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (output.Value.ToString().Equals("0"))
                Label2.Text = "You haven't Selected an answer yet!";

            else
            {
                if (output.Value.ToString().Equals("1"))
                {
                    T.Enabled = false;
                    F.Enabled = false;

                    Label2.Text = "score recorded!";
                }
                else
                {
                    Label2.Text = "score recorded!";
                    T.Enabled = false;
                    F.Enabled = false;
                }
            }
            



        }
    }



        }