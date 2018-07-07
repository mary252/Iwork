using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
public partial class user_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("FirstPage", true);
    }
    protected void register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("RegisterNow", true);
    }


    protected void Login(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("User_Login", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string username = username_box.Text;
        string password = password_box.Text;

        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@password", password));


        SqlParameter log = cmd.Parameters.Add("@log", SqlDbType.Int);
        log.Direction = ParameterDirection.Output;
        SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.VarChar, 50);
        type.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (log.Value.ToString().Equals("1"))
        {
            Session["Username"] = username;
            //Logged.Text = "Sucess";
            if (type.Value.ToString().Equals("Maganer"))
            {

                Response.Redirect("Manager_Homepage", true);    //mary's part + dahlia(staff member)
            }


            if (type.Value.ToString().Equals("HR Employee"))
            {

                Response.Redirect("HR_Default_Page", true);     //israa's part + dahlia(staff member)
            }


            if (type.Value.ToString().Equals("Regular Employee"))
            {
                string connStr2 = ConfigurationManager.ConnectionStrings["iwork"].ToString();
                SqlConnection conn2 = new SqlConnection(connStr2);



                SqlCommand cmd2 = new SqlCommand("view_staffmember_info", conn2);
                cmd2.CommandType = CommandType.StoredProcedure;

                cmd2.Parameters.Add(new SqlParameter("@username", username));

                SqlParameter company = cmd2.Parameters.Add("@company", SqlDbType.VarChar, 500);
                company.Direction = ParameterDirection.Output;
                SqlParameter department = cmd2.Parameters.Add("@department", SqlDbType.VarChar, 200);
                department.Direction = ParameterDirection.Output;
                SqlParameter job = cmd2.Parameters.Add("@job", SqlDbType.VarChar, 200);
                job.Direction = ParameterDirection.Output;


                conn2.Open();
                cmd2.ExecuteNonQuery();
                conn2.Close();
                Session["company"] = company.Value.ToString();
                // Label2.Text = Session["company"].ToString();
                Session["department"] = department.Value.ToString();
                Session["job"] = job.Value.ToString();

                Response.Redirect("Regular_Homepage", true);
            }
            if (type.Value.ToString().Equals("Job seeker"))
            {

                Response.Redirect("Job_Seeker", true);
            }

        }
        else
        {
            Logged.Text = "Sorry your username or password is incorret"; 
        }
    }


}