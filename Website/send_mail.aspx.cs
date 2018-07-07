using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class send_mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void send(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("send_mails", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string name = Session["Username"].ToString();
        string sendto = txt_send.Text;
        string serial = txt_serial.Text;
        string subject = txt_subject.Text;
        string body = txt_body.Text;

        cmd.Parameters.Add(new SqlParameter("@username", name));
        cmd.Parameters.Add(new SqlParameter("@recipient", sendto));
        cmd.Parameters.Add(new SqlParameter("@isubject", subject));
        cmd.Parameters.Add(new SqlParameter("@serial_number", serial));
        cmd.Parameters.Add(new SqlParameter("@body", body));

        SqlParameter no = cmd.Parameters.Add("@no", SqlDbType.Int);
        no.Direction = ParameterDirection.Output;

        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        if (no.Value.ToString().Equals("1"))
        {
            userexists.Text = "check again the recepient name exists or that he is in your company";
        }
        else
        {
            userexists.Text = "email is sent";
        }

    }


}