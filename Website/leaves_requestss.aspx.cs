using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
      public partial class leaves_requestss : System.Web.UI.Page     {         protected void Page_Load(object sender, EventArgs e)         {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("view_leave_requests", conn);             cmd.CommandType = CommandType.StoredProcedure;              string userId = Session["Username"].ToString();             string company = Session["company"].ToString();             string department = Session["department"].ToString();              cmd.Parameters.Add(new SqlParameter("@username", userId));             cmd.Parameters.Add(new SqlParameter("@department", department));             cmd.Parameters.Add(new SqlParameter("@company", company));               SqlDataAdapter sda = new SqlDataAdapter(cmd);             DataTable dt = new DataTable();             sda.Fill(dt);             table1.DataSource = dt;             table1.DataBind();         }          protected void tableCommand(object sender, GridViewCommandEventArgs e)         {             if (e.CommandName.CompareTo("Accept") == 0)             {                 int index = Convert.ToInt32(e.CommandArgument);                 GridViewRow row = table1.Rows[index];                 string request_date = Server.HtmlDecode(row.Cells[3].Text);                 string apllicant = Server.HtmlDecode(row.Cells[1].Text);

            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Hr_Accept_request", conn);                 cmd.CommandType = CommandType.StoredProcedure;                  string userId = Session["Username"].ToString();                 string company = Session["company"].ToString();                 string department = Session["department"].ToString();                  cmd.Parameters.Add(new SqlParameter("@hr", userId));                 cmd.Parameters.Add(new SqlParameter("@department", department));                 cmd.Parameters.Add(new SqlParameter("@company", company));                 cmd.Parameters.Add(new SqlParameter("@request_start_date", request_date));                 cmd.Parameters.Add(new SqlParameter("@applicant", apllicant));                  SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);                 count.Direction = ParameterDirection.Output;                   conn.Open();                 cmd.ExecuteNonQuery();                 conn.Close();                  if (count.Value.ToString().Equals("1"))                 {                     Response.Write("Request is accepted!");                 }              }              if (e.CommandName.CompareTo("Reject") == 0)             {

                int index = Convert.ToInt32(e.CommandArgument);                 GridViewRow row = table1.Rows[index];                 string request_date = Server.HtmlDecode(row.Cells[3].Text);                 string apllicant = Server.HtmlDecode(row.Cells[1].Text);

            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand cmd = new SqlCommand("Hr_Reject_request", conn);                 cmd.CommandType = CommandType.StoredProcedure;                  string userId = Session["Username"].ToString();                 string company = Session["company"].ToString();                 string department = Session["department"].ToString();                  cmd.Parameters.Add(new SqlParameter("@hr", userId));                 cmd.Parameters.Add(new SqlParameter("@department", department));                 cmd.Parameters.Add(new SqlParameter("@company", company));                 cmd.Parameters.Add(new SqlParameter("@request_start_date", request_date));                 cmd.Parameters.Add(new SqlParameter("@applicant", apllicant));                  SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);                 count.Direction = ParameterDirection.Output;                   conn.Open();                 cmd.ExecuteNonQuery();                 conn.Close();                  if (count.Value.ToString().Equals("1"))                 {                     Response.Write("Request is rejected!");                 }              }
        }     }
 