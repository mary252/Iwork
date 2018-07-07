using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Manager_approve_disapprove_requests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_request", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string app = Session["applicant"].ToString();
        string reqd = Session["requestdate"].ToString();
        cmd.Parameters.Add(new SqlParameter("@applicant", app));
        cmd.Parameters.Add(new SqlParameter("@start_date", reqd));
        SqlParameter type = cmd.Parameters.Add("@type", SqlDbType.Int);
        type.Direction = ParameterDirection.Output;
        conn.Open();
        SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
        while (rdr.Read())
        {
            string appl = rdr.GetString(rdr.GetOrdinal("applicant"));
            applicant_.Text = appl;
            DateTime sdate = rdr.GetDateTime(0);
            startdate.Text = sdate.ToString("yyyy/MM/dd");
            DateTime edate = rdr.GetDateTime(2);
            enddate.Text = edate.ToString("yyyy/MM/dd");
            DateTime rdate = rdr.GetDateTime(3);
            requestdate.Text = rdate.ToString("yyyy/MM/dd");
            int tdays = rdr.GetOrdinal("total_days");
            Totaldays.Text = tdays+"";
            string hrr =rdr.GetOrdinal("hr_response").ToString();
            hrresponce.Text = hrr;

            if (type.Value != null)
            {
                if (type.Value.ToString().Equals("1"))
                {
                    Label typ = new Label();
                    typ.Text = "Request Type:Leave Request <br />";
                    string reason = rdr.GetString(rdr.GetOrdinal("leave_request_type"));
                    Label ltype = new Label();
                    ltype.Text = "Leave Request Type:" + reason + "<br />";
                    req.Controls.Add(typ);
                    req.Controls.Add(ltype);

                }
                else
                {
                    if (type.Value.ToString().Equals("2"))
                    {
                        Label typ = new Label();
                        typ.Text = "Request Type:Business Trip Request <br />";
                        string destnation = rdr.GetString(rdr.GetOrdinal("destination"));
                        string purpose = rdr.GetString(rdr.GetOrdinal("purpose"));

                        Label Bdis = new Label();
                        Bdis.Text = "Trip Destination:" + destnation + "<br /";
                        Label Bpor = new Label();
                        Bpor.Text = "Trip Purpose:" + purpose + "<br />";
                        req.Controls.Add(typ);
                        req.Controls.Add(Bdis);
                        req.Controls.Add(Bpor);

                    }

                }
            }
            


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
    protected void mghome(object sender, EventArgs e)
    {
        Response.Redirect("Manager_Homepage", true);
    }
    protected void Approve(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Manger_Accept_Request", conn);
        cmd.CommandType = CommandType.StoredProcedure;
        string app = Session["applicant"].ToString();
        string reqd = Session["requestdate"].ToString();
        string user = Session["Username"].ToString();
        string dep = Session["department"].ToString();
        string com = Session["company"].ToString();


        cmd.Parameters.Add(new SqlParameter("@applicant", app));
        cmd.Parameters.Add(new SqlParameter("@request_start_date", reqd));
        cmd.Parameters.Add(new SqlParameter("@username", user));
        cmd.Parameters.Add(new SqlParameter("@department", dep));
        cmd.Parameters.Add(new SqlParameter("@company", com));

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("Manager sees requests", true);

    }
    protected void reject(object sender, EventArgs e)
    {
        string reas = reason.Text;
        if (reas.Length == 0)
        {
            enter.Text = "Please enter a reason";
        }
        else
        {
            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("Manager_Reject_Request", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            string app = Session["applicant"].ToString();
            string reqd = Session["requestdate"].ToString();
            string user = Session["Username"].ToString();
            string dep = Session["department"].ToString();
            string com = Session["company"].ToString();


            cmd.Parameters.Add(new SqlParameter("@applicant", app));
            cmd.Parameters.Add(new SqlParameter("@request_start_date", reqd));
            cmd.Parameters.Add(new SqlParameter("@username", user));
            cmd.Parameters.Add(new SqlParameter("@department", dep));
            cmd.Parameters.Add(new SqlParameter("@company", com));
            cmd.Parameters.Add(new SqlParameter("@manager_reason", reas));


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("Manager sees requests", true);
        }
    }

}