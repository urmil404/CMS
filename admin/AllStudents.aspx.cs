using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;


public partial class admin_AllStudents : System.Web.UI.Page
{
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataReader dr;
    public String p_path;
    public Boolean edit_mode = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Redirect("AdminLogin.aspx");
        }
        else
        {
            con = Helper.getCon();
            p_path = MapPath("student_profile\\");
            if (Session["pro"] == null)
            {
                Session["pro"] = "photo.png";
            }
        }
    }

    private String m(Object s)
    {
        return s.ToString().Trim();
    }

    private void home(Object msg = null)
    {
        Session["msg"] = msg;
        Response.Redirect("AllStudents.aspx");
    }

    protected void b_reg_Click(object sender, EventArgs e)
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
            pro = "p_" + m(sid) + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
        }
        cmd = new SqlCommand("UPDATE student_Profile  SET S_Profile = '" + pro + "' WHERE S_Id = " + m(sid), con);
        cmd.ExecuteNonQuery();
        home("Registration Successfully, Now You Can See Profile..");
    }
    
    protected void b_upd_Click(object sender, EventArgs e)
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

        SqlCommand cmd = new SqlCommand("UPDATE student_Profile SET S_FullName = @fname,S_FatheFullName=@ffname,S_FatherOccupation=@foccupation,S_email = @email,S_mobile = @mobile,S_password = @password,S_DOB=@dob,S_City=@city,S_Pincode=@pincode,S_Address=@address,S_Gender=@gender,S_Category=@category,S_ student_stream = @stream, student_programs = @programs WHERE student_id ='" + Request.QueryString["edit"].ToString().Trim() + "'", Helper.getCon());

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


        cmd.ExecuteNonQuery();
        if (f_pro.HasFile)
        {
            String pro = "p_" + Session["S_Id"] + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
            cmd = new SqlCommand("UPDATE student_Profile SET S_Profile = '" + pro + "' WHERE S_Id = " + Session["S_Id"], con);
            cmd.ExecuteNonQuery();
            Session["pro"] = pro;
        }
        Session["S_Name"] = student_FullName.Text;
        home("Profile Update Successfully");
    }


    protected void edit_pro_Click(object sender, EventArgs e)
    {
        this.edit_mode = true;
        cmd = new SqlCommand("SELECT * FROM student_Profile WHERE S_Id = " + Session["S_Id"], con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            edit_pro.Visible = false;
            b_logout.Visible = false;
            student_FullName.Text = m(dr["S_Name"]);
            student_Father_FullName.Text = m(dr["FatherFullName"]);
            student_FatherOccupation.Text = m(dr["S_Occupation"]);
            student_email.Text = m(dr["S_Email"]);
            student_mobile.Text = m(dr["S_Mobile"]);
            student_pass.Text = m(dr["S_Password"]);
            student_dob.Text = m(dr["S_Dob"]);
            student_city.Text = m(dr["S_City"]);
            student_pin.Text = m(dr["S_Pincode"]);
            student_add.Text = m(dr["S_Address"]);
            student_gender.Text = m(dr["S_Gender"]);
            student_category.Text = m(dr["S_Category"]);
            student_nationality.Text = m(dr["S_Nationality"]);
            student_stream.Text = m(dr["S_Stream"]);
            student_program.Text = m(dr["S_Program"]);
        }
        dr.Close();
    }

    protected void Delete_Record()
    {
        // delete student record
        int res = Helper.MyNoQ("DELETE FROM student_Profile WHERE S_Id = '" + Request.QueryString["delete"].ToString().Trim() + "'");
        Helper.setSmsg("Record Delete Successfully.");
    }

    protected void b_logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Response.Redirect("Default.aspx");
    }
}