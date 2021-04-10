using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
public partial class faculty_profile : System.Web.UI.Page
{
    SqlConnection con;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        
        if (Session["faculty_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_assignment();
        }
    }
    public void Delete_assignment()
    {
        //del assignemt
        SqlCommand cmd = new SqlCommand("DELETE FROM assignments WHERE a_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);
        cmd.ExecuteNonQuery();
        Success("Record Delete Successfully.");
    }
    public void Success(String msg, Boolean refresh = true)
    {
        Helper.setSmsg(msg);
        if (refresh)
        {
            Response.Redirect("faculty_profile.aspx");
        }
    }
}