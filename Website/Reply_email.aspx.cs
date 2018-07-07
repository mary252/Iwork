using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Reply_email : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("See_Recieved_emails", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        cmd.Parameters.Add(new SqlParameter("@username", name));


        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        table.DataSource = dt;
        table.DataBind();
    }
    protected void table_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void reply(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("Reply_email", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string recievedFrom = txt_recieved_from.Text;
        string oldserial = txt_oldserial.Text;
        string newserial = txt_newserial.Text;
        string subject = txt_subject.Text;
        string body = txt_body.Text;

        cmd.Parameters.Add(new SqlParameter("@username", name));
        cmd.Parameters.Add(new SqlParameter("@recieved_from", recievedFrom));
        cmd.Parameters.Add(new SqlParameter("@serial_of_email_to_reply_to", oldserial));
        cmd.Parameters.Add(new SqlParameter("@serial_number", newserial));
        cmd.Parameters.Add(new SqlParameter("@subject", subject));
        cmd.Parameters.Add(new SqlParameter("@reply", body));

        SqlParameter sent = cmd.Parameters.Add("@sent", SqlDbType.Int);
        sent.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (sent.Value.ToString().Equals("1"))
        {
            done.Text = "Reply is done";
        }

    }

}