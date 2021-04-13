using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class student_fine : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        if (Session["student_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Request.QueryString["pay"] != null && !IsPostBack)
        {
            pay();
        }
    }
    public void pay()
    {
        SqlCommand cmd = new SqlCommand("UPDATE fine SET f_status=@f_status WHERE f_id=" + Request.QueryString["pay"].ToString().Trim() + "", con);
        cmd.Parameters.AddWithValue("@f_status", "Approved");
        int res = (int)cmd.ExecuteNonQuery();
        if(Convert.ToBoolean(res))
        {
            Session["fine"] = false;
            Helper.setSmsg("Fine Payed Successfully.");
            Response.Redirect("student_profile.aspx");
        }
        else
        {
            Helper.setAmsg("Error in Fine Payment.");
            Response.Redirect("login.aspx");
        }
    }
}