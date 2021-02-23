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
using System.IO;


public partial class Client_signup : System.Web.UI.Page
{
    public String p_path;
    public String pro;
	SqlConnection con;
	protected void Page_Load(object sender, EventArgs e)
	{
		con = Helper.getCon();
		 p_path = MapPath("public\\student_profile\\");
        if (Session["pro"] == null)
        {
            Session["pro"] = "photo.png";
        }
	}
    private String m(Object s)
    {
        return s.ToString().Trim();
    }
	protected void btn_signup_Click(object sender, EventArgs e)
	{
		String Fname = student_FullName.Text.ToString();
        String FFname = student_Father_FullName.Text.ToString();
        String Foccupation = student_FatherOccupation.Text.ToString();
        String Email = student_email.Text.ToString();
        String mobile = student_mobile.Text.ToString();
        String password = student_pass.Text.ToString();
        String dob = student_dob.Text.ToString();
        String city = student_city.Text.ToString();
        String pincode = student_pin.Text.ToString();
        String address = student_add.Text.ToString();
        String gender = student_gender.Text.ToString();
        String category = student_category.Text.ToString();
        String nationality = student_nationality.Text.ToString();
        String stream = student_stream.Text.ToString();
        String programs = student_program.Text.ToString();
        String grno = txt_Grno.Text.ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO student_Profile(S_FullName, S_FatherFullName, S_FatherOccupation, S_Email, S_Mobile, S_Password, S_Dob, S_City, S_Pincode, S_Address, S_Gender, S_Category, S_Nationality, S_Stream, S_Program, S_GrNO) output INSERTED.S_Id VALUES(@fname, @ffname, @foccupation, @email, @mobile, @password, @dob, @city, @pincode, @address, @gender, @category, @nationality, @stream, @programs, @grno)", con);

        cmd.Parameters.AddWithValue("@fname", Fname);
        cmd.Parameters.AddWithValue("@ffname", FFname);
        cmd.Parameters.AddWithValue("@foccupation", Foccupation);
        cmd.Parameters.AddWithValue("@email", Email);
        cmd.Parameters.AddWithValue("@mobile", mobile);
        cmd.Parameters.AddWithValue("@password", password);
        cmd.Parameters.AddWithValue("@dob", dob);
        cmd.Parameters.AddWithValue("@city", city);
        cmd.Parameters.AddWithValue("@pincode", pincode);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@gender", gender);
        cmd.Parameters.AddWithValue("@category", category);
        cmd.Parameters.AddWithValue("@nationality", nationality);
        cmd.Parameters.AddWithValue("@stream", stream);
        cmd.Parameters.AddWithValue("@programs", programs);
        cmd.Parameters.AddWithValue("@grno", grno);

        int sid = (int)cmd.ExecuteScalar();

        String pro = "photo.png";
        if (f_pro.HasFile)
        {
            pro = "p_" + Session["S_Id"] + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
        }

        cmd = new SqlCommand("UPDATE student_Profile  SET S_Profile = '" + pro + "' WHERE S_Id = " + m(sid), con);
        cmd.ExecuteNonQuery();
        Helper.setSmsg("Registration Successfully");
		
		if (Convert.ToBoolean(sid))
		{
			Session["student_id"] = sid;
			Helper.setSmsg("Register Sucessfully done");
			Response.Redirect("Default.aspx");
		}
		else
		{
			Helper.setAmsg("Error in registration");
			Response.Redirect("Signup.aspx");
		}

	}
    protected void b_reg_Click(object sender, EventArgs e)
    {

    }
}