using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
    public partial class top_acheivers : System.Web.UI.Page
    {
        protected void View(object sender, EventArgs e)
        {
            int year = 0;
            int month = 0;
            string Ddmonth = Dmonth.SelectedValue;
            Int32.TryParse(Ddmonth, out month);
            string Ddyear = Dyear.SelectedValue;
            Int32.TryParse(Ddyear, out year);

            Session["Year"] = year;
            Session["Month"] = month;

            //Response.Redirect("",true);

        }
    }

