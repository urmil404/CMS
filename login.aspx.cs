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
        if (student_role.Text.ToString().Trim() == "Students")
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
                        reader.Close();
                        SqlCommand c = new SqlCommand("SELECT COUNT(*) FROM fine WHERE f_student = " + student_id + " AND f_status = 'unpaid'", con);
                        if (((int)c.ExecuteScalar()) > 0)
                        {
                            Session["fine"] = true;
                            Response.Redirect("student_fine.aspx");
                        }
                        else
                        {
                            Session["fine"] = false;
                        }
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
        else if (student_role.Text.ToString().Trim() == "Faculty")
        {
            String uname = username.Text;
            String pass = password.Text;
            SqlCommand cmd = new SqlCommand("SELECT * FROM faculty WHERE f_email = '" + uname + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                String faculty_id = reader["f_id"].ToString().Trim();
                String student_username = reader["f_email"].ToString().Trim();
                String student_password = reader["f_password"].ToString().Trim();

                if (student_password == pass)
                {
                    Session["faculty_id"] = faculty_id;
                    Session["faculty_username"] = uname;
                    Helper.setSmsg("Login Successfull");
                    Response.Redirect("faculty_profile.aspx");
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
}