using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class registration : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        i_path = MapPath(Helper.WEBSITE_STUDENT_PATH);
        if (!IsPostBack)
        {
            img_Student.Src = Helper.get_Student_Image();
        }
    }

    protected void reg_student(object sender, EventArgs e)
    {
        String name = txt_student_Name.Text.ToString();
        String fathername = txt_student_Fathername.Text.ToString();
        String dob = txt_student_Dob.Text.ToString();
        String gender = ddl_student_gender.Text.ToString();
        String mobile = txt_student_Mobile.Text.ToString();
        String email = txt_student_email.Text.ToString();
        String address = txt_student_address.Text.ToString();
        String city = txt_student_city.Text.ToString();
        String pincode = txt_student_pincode.Text.ToString();
        


        SqlCommand cmd = new SqlCommand("INSERT INTO students(s_name,s_fathername,s_dob,s_gender,s_mobile,s_email,s_address,s_city,s_pincode) output INSERTED.s_id values(@s_name,@s_fathername,@s_dob,@s_gender,@s_mobile,@s_email,@s_address,@s_city,@s_pincode)", con);

        cmd.Parameters.AddWithValue("@s_name", name);
        cmd.Parameters.AddWithValue("@s_fathername", fathername);
        cmd.Parameters.AddWithValue("@s_dob", dob);
        cmd.Parameters.AddWithValue("@s_gender", gender);
        cmd.Parameters.AddWithValue("@s_mobile", mobile);
        cmd.Parameters.AddWithValue("@s_email", email);
        cmd.Parameters.AddWithValue("@s_address", address);
        cmd.Parameters.AddWithValue("@s_city", city);
        cmd.Parameters.AddWithValue("@s_pincode", pincode);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            String nm = "";
            String new_pass = Helper.Genrate_New_Password();
            eMail.sendMail(email, "Your Credensial", "<h3>PAssword : " + new_pass + "</h3><h4>Thank Your My Dear</h4>");
            if (s_Image.HasFile)
            {
                nm = "s_" + Convert.ToString(res) + new FileInfo(s_Image.FileName).Extension;
                s_Image.SaveAs(i_path + nm);
            }

            SqlCommand ncmd = new SqlCommand("UPDATE students SET s_image = '" + nm + "', s_password = '" + new_pass + "' WHERE s_id =" + res, con);
            ncmd.ExecuteNonQuery();
            Helper.setSmsg("Your are Registered Successfully.");
            Response.Redirect("Default.aspx");

        }
        else
        {
            Helper.setAmsg("Error in student registration.");
            Response.Redirect("login.aspx");
        }
    }

}