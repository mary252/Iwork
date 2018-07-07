using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;



public partial class search_by_type: System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SearchNational(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_national_Comapanies", conn);
        cmd.CommandType = CommandType.StoredProcedure;

       


        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dx = new DataTable();
        sda.Fill(dx);
        table.DataSource = dx;
        table.DataBind();

    }
    protected void SearchInternational(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_international_companies", conn);
        cmd.CommandType = CommandType.StoredProcedure;




        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        table.DataSource = dt;
        table.DataBind();

    }

    protected void table_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {

            // Convert the row index stored in the CommandArgument
            // property to an Integer.
            int index = Convert.ToInt32(e.CommandArgument);

            // Get the last name of the selected author from the appropriate
            // cell in the GridView control.
            GridViewRow selectedRow = table.Rows[index];
            LinkButton compnameCell = (LinkButton)selectedRow.Cells[0].Controls[0];

            string compname = compnameCell.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("View_Companys_Departments", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            Label2.Text = "You selected " + compname;


            cmd.Parameters.Add(new SqlParameter("@compname", compname));
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
        // Label2.Text = "Not YET!!";
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table2.Rows[index];
            LinkButton dnameCell = (LinkButton)selectedRow.Cells[0].Controls[0];
            TableCell compmailCell = selectedRow.Cells[4];
            string dname = dnameCell.Text;
            string compmail = compmailCell.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("View_Department_Vacancies", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            Label2.Text = "You selected " + dname;


            cmd.Parameters.Add(new SqlParameter("@dname", dname));
            cmd.Parameters.Add(new SqlParameter("@company", compmail));
            table3.Visible = true;
            table.Visible = false;
            table2.Visible = false;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dx = new DataTable();
            sda.Fill(dx);
            table3.DataSource = dx;
            table3.DataBind();
        }
    }
    protected void table3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table3.Rows[index];
            TableCell depCell = selectedRow.Cells[0];
            TableCell jobCell = selectedRow.Cells[2];
            TableCell compmailCell = selectedRow.Cells[1];
            if (Session["Username"] == null)
            {
                Label2.Text = "Invalid Access, you need to Login first =)!";
                Response.Redirect("user_login", true);
            }
            string username = Session["Username"].ToString();
            int years = Convert.ToInt32(Session["Exp"]);
            string dcode = depCell.Text;
            string compmail = compmailCell.Text;
            string job = jobCell.Text;
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("job_seeker_apply", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            Label2.Text = "You selected " + job;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@experience", years));
            cmd.Parameters.Add(new SqlParameter("@jobtitle", job));
            cmd.Parameters.Add(new SqlParameter("@department", dcode));
            cmd.Parameters.Add(new SqlParameter("@company", compmail));

            SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
            output.Direction = ParameterDirection.Output;


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            if (output == null)
            {
                Label2.Text = "NULL!!!!!";
            }
            else
            {

                if (output.Value.ToString().Equals("0"))
                    Label2.Text = "Invalid Access, you need to register first =)!";

                else
                {
                    if (output.Value.ToString().Equals("1"))
                        Label2.Text = "You don't have sufficiant years of experience for this job =(!";
                    else
                    {
                        if (output.Value.ToString().Equals("2"))
                            Label2.Text = "Your previous request to this job is still pending =)!";
                        else
                        {
                            Label2.Text = "Successfuly applied for " + job;
                            Interview.Visible = true;
                            Session["Job"] = job;
                            Session["department"] = dcode;
                            Session["company"] = compmail;
                        }


                    }
                }
                table3.Visible = false;
                //Label2.Text = "Table3";
            }
        }
    }
    protected void ViewInterview(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("Interview", true);
    }


    protected void signin(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("user_login", true);
    }

    protected void register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("RegisterNow", true);
    }

    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("Job_Seeker", true);
    }
}