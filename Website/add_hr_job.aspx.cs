using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


    public partial class add_hr_job : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void submit(object sender, EventArgs e){
            int min_exp = 0;
            int salary = 0;
            int vaccancies = 0;
            int workingh = 0;
            int Qnumber = 0;

            string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("HR_Add_Job", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string userId = Session["Username"].ToString();
            string dep_role = txt_dep_role.Text;
            string department=txt_department.Text;
            string title = txt_title.Text;
            string company = txt_company.Text;
            string short_discrip = txt_short_discrip.Text;
            string long_dscrip = txt_long_discrip.Text;
            Int32.TryParse(txt_min_exp.Text, out min_exp);
            Int32.TryParse(txt_salary.Text, out salary);
            string deadline = txt_deadline.Text;
            Int32.TryParse(txt_vaccancies.Text, out vaccancies);
            Int32.TryParse(txt_workingh.Text, out workingh);
            Int32.TryParse(txt_workingh.Text, out Qnumber);
            string question = txt_question.Text;
            bool answer = Ddanswer.SelectedItem.Equals("1");

          

        cmd.Parameters.Add(new SqlParameter("@HR_username",userId));
        cmd.Parameters.Add(new SqlParameter("@department", department));
        cmd.Parameters.Add(new SqlParameter("@dep_role", dep_role));
        cmd.Parameters.Add(new SqlParameter("@title", title));
        cmd.Parameters.Add(new SqlParameter("@company", company));
        cmd.Parameters.Add(new SqlParameter("@short_discription", short_discrip));
        cmd.Parameters.Add(new SqlParameter("@detailed_discription", long_dscrip));
        cmd.Parameters.Add(new SqlParameter("@min_experience",min_exp));
        cmd.Parameters.Add(new SqlParameter("@salary",salary ));
        cmd.Parameters.Add(new SqlParameter("@deadline",deadline));
        cmd.Parameters.Add(new SqlParameter("@working_hours",workingh));
        cmd.Parameters.Add(new SqlParameter("@Qnumber ", Qnumber));
        cmd.Parameters.Add(new SqlParameter("@no_of_vacancies", vaccancies));
        cmd.Parameters.Add(new SqlParameter("@question ", question));
        cmd.Parameters.Add(new SqlParameter("@answer",answer));


         SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
         count.Direction = ParameterDirection.Output;

          conn.Open();
          cmd.ExecuteNonQuery();
          conn.Close();

            if(count.Value.ToString().Equals("1")){
                Response.Write("Job added");
            }
            else
            {
                if (count.Value.ToString().Equals("2"))
                {
                    Response.Write("JOB ALREADY EXSISTS.");
                }
            }
        }
     
       
      

        }
    


