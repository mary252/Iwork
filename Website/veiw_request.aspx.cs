using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

    public partial class veiw_request : System.Web.UI.Page
    {
        protected void view_leave(object sender, EventArgs e)
        {
            Response.Redirect("leaves_requestss.aspx", true);
        }
        protected void view_business(object sender, EventArgs e)
        {
            Response.Redirect("business_requests.aspx", true);
        }

    }

