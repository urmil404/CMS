using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_admin_login : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnAdminLogin(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        String uname = username.Text;
        String pass = password.Text;
        SqlCommand cmd = new SqlCommand("SELECT * FROM admin WHERE admin_username = '" + uname + "'");
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            String admin_id = reader["admin_id"].ToString().Trim();
            String student_username = reader["admin_username"].ToString().Trim();
            String student_password = reader["admin_password"].ToString().Trim();
            if (student_password == pass)
            {
                Helper.setSmsg("Login Successfull");
                Session["admin_id"] = admin_id;
                Session["admin_username"] = uname;
                Response.Redirect("AllStudents.aspx");
            }
            else
            {
                Helper.setAmsg("Invalid Password");
                Response.Redirect("admin_login.aspx");
            }
        }
        else
        {
            Helper.setAmsg("You Are Not Registred...");
            Response.Redirect("admin_login.aspx");
        }
        Response.End();
    }
}
