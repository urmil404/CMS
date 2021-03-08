using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Client_login : System.Web.UI.Page
{
	SqlConnection con;
	protected void Page_Load(object sender, EventArgs e)
	{
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
	}
	protected void client_btn_submit_Click(object sender, EventArgs e)
	{
		String uname = username.Text;
        String pass = password.Text;
		
        SqlCommand cmd = new SqlCommand("SELECT * FROM students WHERE student_email = '" + uname + "'",con);
        SqlDataReader reader = cmd.ExecuteReader();
		if (reader.Read())
		{
			String student_id = reader["student_id"].ToString().Trim();
			String student_password = reader["student_password"].ToString().Trim();
			String student_username = reader["student_name"].ToString().Trim();
			if (student_password == pass)
			{
				Helper.setSmsg("Login Successfull");
				Session["student_id"] = student_id;
				Session["student_username"] = uname;
				Response.Redirect("Default.aspx");
			}
			else
			{
				Helper.setAmsg("Invalid Password");
				Response.Redirect("login.aspx");
			}
		}
		else
		{
			Helper.setAmsg("You Are Not Registred...");
			Response.Redirect("login.aspx");
		}
		Response.End();
	}
}