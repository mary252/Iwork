using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    public partial class veiw_working_hours : System.Web.UI.Page
    {


        protected void veiw(object sender, EventArgs e)
        {
            string staff = txt_staff.Text;
            string year = txt_year.Text;
            Session["Staff"] = staff;
            Session["Year"] = year;
            Response.Redirect("table_Working_Hours.aspx",true);
        }
    }

