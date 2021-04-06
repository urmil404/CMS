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
       
        if (student_gender.Text.ToString().Trim() == "Students")
        {
            String uname = username.Text;
            String pass = password.Text;
            SqlCommand cmd = new SqlCommand("SELECT * FROM students WHERE s_email = '" + uname + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                String student_id = reader["s_id"].ToString().Trim();
                String student_username = reader["s_email"].ToString().Trim();
                String student_password = reader["s_password"].ToString().Trim();
                //Int32 s_course = ;

                if (student_password == pass)
                //if(String.Compare(student_password,pass) == 0)
                {
                    Helper.setSmsg("Login Successfull");
                    Session["student_id"] = student_id;
                    Session["student_username"] = uname;
                    if ((int)reader["s_course"] == 0)
                    {
                        Helper.setSmsg("Let's Take admission");
                        Response.Redirect("admission.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
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
        else  if (student_gender.Text.ToString().Trim() == "Faculty")
        {
            Response.Write("faculty section");
        }
        else if (student_gender.Text.ToString().Trim() == "Employees")
        {
            Response.Write("Employee section");
        }
        else
        {
            Response.Write("Other peoples can see this section");
        }


    }
}