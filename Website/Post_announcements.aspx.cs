using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



public partial class Post_announcements : System.Web.UI.Page
    {
        protected void submit(object sender, EventArgs e)
        {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("post_announcements", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string deadline = txt_deadline.Text;
            string title = txt_title.Text;
            string Hr_emp = txt_hr_emp.Text;
            string annon = txt_annon.Text;
            string dis = txt_dis.Text;

            cmd.Parameters.Add(new SqlParameter("@announcement_date", deadline));
            cmd.Parameters.Add(new SqlParameter("@title", title));
            cmd.Parameters.Add(new SqlParameter("@hr_employee", Hr_emp));
            cmd.Parameters.Add(new SqlParameter("@announcement_type", annon));
            cmd.Parameters.Add(new SqlParameter("@announcement_description",dis));

            SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
            count.Direction = ParameterDirection.Output;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            if (count.Value.ToString().Equals("1"))
            {
                Response.Write("Annoncement posted.");
            }
            else
            {
                Response.Write("Announcement not posted.");
            }
        }

        }
    

