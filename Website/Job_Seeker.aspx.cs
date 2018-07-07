using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Job_seeker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void apply_for_job(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("job_seeker_apply", conn);
        cmd.CommandType = CommandType.StoredProcedure;
    }
    protected void view_interview(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewinterview", conn);
        cmd.CommandType = CommandType.StoredProcedure;
    }
    protected void view_accepted(object sender, EventArgs e)
    {
        // Label2.Text = "I'm HERE!";
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_accepted", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        if (Session["Username"] == null)
        {
            Label2.Text = "Invalid Access, you need to Login first =)!";
            Response.Redirect("user_login", true);
        }
        string username = Session["Username"].ToString();

        cmd.Parameters.Add(new SqlParameter("@username", username));

        SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;


        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (output.Value.ToString().Equals("0"))
            Label2.Text = "You haven't applied for any job yet =(!";
        else
        {
            if (output.Value.ToString().Equals("1"))
                Label2.Text = "Your applications are still pending =)!";
            else
            {
                if (output.Value.ToString().Equals("2"))
                //apply.Visible = false;
                stat.Visible = false;
                Label2.Text = "Congratulations you were accepted in the following position/s =)!";
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dx = new DataTable();
                sda.Fill(dx);
                table2.DataSource = dx;
                table2.DataBind();

            }

        }




    }
    protected void view_status(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("viewstatus", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        if (Session["Username"] == null)
        {
            Label2.Text = "Invalid Access, you need to Login first =)!";
            Response.Redirect("user_login", true);
        }
        string username = Session["Username"].ToString();

        cmd.Parameters.Add(new SqlParameter("@username", username));

        SqlParameter output = cmd.Parameters.Add("@out", SqlDbType.Int);
        output.Direction = ParameterDirection.Output;


        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        if (output.Value.ToString().Equals("0"))
            Label2.Text = "You haven't applied for any job yet =(!";

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dx = new DataTable();
        sda.Fill(dx);
        table.DataSource = dx;
        table.DataBind();

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

    protected void calculate_score(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("savescore", conn);
        cmd.CommandType = CommandType.StoredProcedure;
    }
    protected void delete_job(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("DeleteApp", conn);
        cmd.CommandType = CommandType.StoredProcedure;
    }
    protected void choose_job(object sender, GridViewCommandEventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);
        SqlCommand cmd = new SqlCommand("ChooseJob", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        //Label2.Text = "You selected " + compname;
        int index = Convert.ToInt32(e.CommandArgument);

        // Get the last name of the selected author from the appropriate
        // cell in the GridView control.
        GridViewRow selectedRow = table3.Rows[index];
        LinkButton ldayo = (LinkButton)selectedRow.Cells[0].Controls[0];
        String dayo = ldayo.ToString();
        String username = Session["Username"].ToString();
        String job = Session["Title"].ToString();
        String dcode = Session["department"].ToString();
        String compmail = Session["company"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@chosenjob", job));
        cmd.Parameters.Add(new SqlParameter("@department", dcode));
        cmd.Parameters.Add(new SqlParameter("@company", compmail));
        cmd.Parameters.Add(new SqlParameter("@dayoff", dayo));



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
                Label2.Text = "Please choose a day off other than Friday =)!";

            else
            {
                if (output.Value.ToString().Equals("4"))
                    Label2.Text = "Congratulations you are now a staff Member";


            }
        }
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

    protected void table_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Label2.Text = "Not YET!!";
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);

            GridViewRow selectedRow = table.Rows[index];
            TableCell depCell = selectedRow.Cells[1];
            TableCell jobCell = selectedRow.Cells[0];
            TableCell compmailCell = selectedRow.Cells[2];
            if (Session["Username"] == null)
            {
                Label2.Text = "Invalid Access, you need to Login first =)!";
                Response.Redirect("user_login", true);
            }
            string username = Session["Username"].ToString();
            string dcode = depCell.Text;
            string compmail = compmailCell.Text;
            string job = jobCell.Text;

            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("DeleteApp", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            //Label2.Text = "You selected " + compname;

            cmd.Parameters.Add(new SqlParameter("@username", username));
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
                    Label2.Text = "The application you are trying to delete doesn''t exist anymore!";

                else
                {
                    if (output.Value.ToString().Equals("1"))
                        Label2.Text = "The application you are trying to delete was accepted";
                    else
                    {
                        if (output.Value.ToString().Equals("2"))
                            Label2.Text = "The application you are trying to delete was rejected";
                        else
                        {
                            if (output.Value.ToString().Equals("3"))
                            {
                                Label2.Text = "Application Successfully deleted";
                                connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                                conn = new SqlConnection(connStr);

                                cmd = new SqlCommand("viewstatus", conn);
                                cmd.CommandType = CommandType.StoredProcedure;

                                if (Session["Username"] == null)
                                {
                                    Label2.Text = "Invalid Access, you need to Login first =)!";
                                    Response.Redirect("user_login", true);
                                }
                                username = Session["Username"].ToString();

                                cmd.Parameters.Add(new SqlParameter("@username", username));

                                output = cmd.Parameters.Add("@out", SqlDbType.Int);
                                output.Direction = ParameterDirection.Output;


                                conn.Open();
                                cmd.ExecuteNonQuery();
                                conn.Close();
                                if (output.Value.ToString().Equals("0"))
                                    Label2.Text = "You haven't applied for any job yet =(!";

                                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                                DataTable dx = new DataTable();
                                sda.Fill(dx);
                                table.DataSource = dx;
                                table.DataBind();
                            }
                        }
                    }
                }


            }
        }
    }
    protected void Viewvacancy(object sender, EventArgs e)
    {


        Response.Redirect("searchvac", true);
    }

    protected void table2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("days_proc", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
          

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dx = new DataTable();
            sda.Fill(dx);
            table3.DataSource = dx;
            table3.DataBind();
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow selectedRow = table2.Rows[index];
            TableCell depCell = selectedRow.Cells[1];
            TableCell jobCell = selectedRow.Cells[0];
            TableCell compmailCell = selectedRow.Cells[2];
            if (Session["Username"] == null)
            {
                Label2.Text = "Invalid Access, you need to Login first =)!";
                Response.Redirect("user_login", true);
            }
            string username = Session["Username"].ToString();
            Session["department"] = depCell.Text;
            Session["company"] = compmailCell.Text;
            Session["Title"] = jobCell.Text;


        }
    }
}