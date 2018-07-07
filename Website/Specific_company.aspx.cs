using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class Specific_company : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Search(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_Companys_Departments", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        string compname = compname_box.Text;
         if (compname==null)
        {
            msg.Text = "You need to enter a company name to proceed! ";
        }
         cmd.Parameters.Add(new SqlParameter("@compname", compname));

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dx = new DataTable();
        sda.Fill(dx);
        table2.DataSource = dx;
        table2.DataBind();
       
        if (table2.Attributes.Equals(null))
        {
            msg.Text = "Sorry, we don't have such company,you either spelled it wrong or we don't support its information! ";
        }


    }
    protected void table_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void link(object sender, EventArgs e) {

    }

    protected void signin(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("user_login", true);
    }

    protected void register(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("RegisterNow", true);
    }

    protected void home(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        Response.Redirect("FirstPage", true);
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
            e.Row.Attributes["onclick"] = "Response.Redirect(table2.SelectedRow.Cells[0].Text, true);";


            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        string connStr = ConfigurationManager.ConnectionStrings["iwork"].ToString();
        SqlConnection conn = new SqlConnection(connStr);

        SqlCommand cmd = new SqlCommand("View_Companys_Departments", conn);
        cmd.CommandType = CommandType.StoredProcedure;

        String comp = compname_box.Text;
        cmd.Parameters.Add(new SqlParameter("@compname", comp));

        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dx = new DataTable();
        sda.Fill(dx);
        table2.DataSource = dx;
        table2.DataBind();


    }

}