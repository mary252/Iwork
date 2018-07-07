using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class RegisterNow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Register", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string username = txt_username.Text;
        string password = txt_password.Text;
        string email = txt_email.Text;
        string birthday = txt_birthday.Text;
        string years = txt_years.Text;
        string firstname = txt_firstname.Text;
        string middlename = txt_middlename.Text;
        string lastname = txt_lastname.Text;

        cmd.Parameters.Add(new SqlParameter("@username", username));
        cmd.Parameters.Add(new SqlParameter("@password", password));
        cmd.Parameters.Add(new SqlParameter("@email", email));
        cmd.Parameters.Add(new SqlParameter("@birth_date", birthday));
        cmd.Parameters.Add(new SqlParameter("@years_of_experience", years));
        cmd.Parameters.Add(new SqlParameter("@first_name", firstname));
        cmd.Parameters.Add(new SqlParameter("@middle_name", middlename));
        cmd.Parameters.Add(new SqlParameter("@last_name", lastname));

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (username == "" | password == "" |  email=="" | birthday==""| years==""| firstname==""| middlename==""| lastname=="")
            check.Text = "Opps! make sure all the information are entered";
        else
        {
            Session["Username"] = username;
            Response.Write("Passed");
            Response.Redirect("JobSeeker", true);
        }
    }

    protected void signin(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("user_login", true);
    }

    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("FirstPage", true);
    }


}