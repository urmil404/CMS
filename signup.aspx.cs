using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlClient;

public partial class Client_signup : System.Web.UI.Page
{
	SqlConnection con;
	protected void Page_Load(object sender, EventArgs e)
	{
		//con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
		//con.Open();
		con = Helper.getCon();
	}
	protected void btn_signup_Click(object sender, EventArgs e)
	{

		int res = Helper.Scaller("INSERT INTO students output INSERTED.student_id values('" + student_username.Text + "','" + student_email.Text + "','" + student_password.Text + "','" + student_mobile.Text + "','" + student_stream.Text + "','" + student_program.Text + "','" + student_gender.Text + "')");

		if (Convert.ToBoolean(res))
		{
			Session["student_id"] = res;
			Helper.setSmsg("Register Sucessfully done");
			Response.Redirect("Default.aspx");
			//Response.End();

		}
		else
		{
			//Response.Write("Error");
			Helper.setAmsg("Error in registration");
			Response.Redirect("Signup.aspx");
			//Response.End();
		}

	}
}