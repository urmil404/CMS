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

        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            Load_Edit_View();            
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Record();
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
    protected String GRNO()
    {
        String gr = "2021";
        return gr;
    }

    protected void b_reg_Click(object sender, EventArgs e)
    {

        String Fname = student_FullName.Text.ToString().Trim();
        String FFname = student_Father_FullName.Text.ToString().Trim();
        String Foccupation = student_FatherOccupation.Text.ToString().Trim();
        String Email = student_email.Text.ToString().Trim();
        String mobile = student_mobile.Text.ToString().Trim();
        String password = student_pass.Text.ToString().Trim();
        String dob = student_dob.Text.ToString().Trim();
        String city = student_city.Text.ToString().Trim();
        String pincode = student_pin.Text.ToString().Trim();
        String address = student_add.Text.ToString().Trim();
        String gender = student_gender.Text.ToString().Trim();
        String category = student_category.Text.ToString().Trim();
        String nationality = student_nationality.Text.ToString().Trim();
        String stream = student_stream.Text.ToString().Trim();
        String program = student_program.Text.ToString().Trim();

        SqlCommand cmd = new SqlCommand("INSERT INTO student_Profile(S_FullName, S_FatherFullName, S_FatherOccupation, S_Email, S_Mobile, S_Password, S_Dob, S_City, S_Pincode, S_Address, S_Gender, S_Category, S_Nationality, S_Stream, S_Program, S_GrNO) output INSERTED.S_Id VALUES(@fname, @ffname, @foccupation, @email, @mobile, @password, @dob, @city, @pincode, @address, @gender, @category, @nationality, @stream, @program, @grno)", con);

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
        cmd.Parameters.AddWithValue("@program", program);
        cmd.Parameters.AddWithValue("@grno", GRNO());

        int sid = (int)cmd.ExecuteScalar();

        String pro = "photo.png";
        if (f_pro.HasFile)
        {
            pro = "p_" + m(sid) + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
        }
        cmd = new SqlCommand("UPDATE student_Profile  SET S_Profile = '" + pro + "' WHERE S_Id = " + m(sid), con);
        cmd.ExecuteNonQuery();
        Helper.setSmsg("Registration Successfully.");

    }

    protected void b_upd_Click(object sender, EventArgs e)
    {
        Edit_Record();

    }
    protected void Load_Edit_View()
    {
        b_upd.Visible = true;
        b_reg.Visible = false;

        //Response.Write("namo");
        cmd = new SqlCommand("SELECT * FROM student_Profile WHERE S_Id ='" + Request.QueryString["edit"].ToString().Trim() + "'", Helper.getCon());
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            student_FullName.Text = m(dr["S_FullName"]);
            student_Father_FullName.Text = m(dr["S_FatherFullName"]);
            student_FatherOccupation.Text = m(dr["S_FatherOccupation"]);
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
            student_program.Text = m(dr["S_GrNo"]);
        }
    }

    protected void Edit_Record()
    {
        //Edit Record
        String Fname = student_FullName.Text.ToString().Trim();
        String FFname = student_Father_FullName.Text.ToString().Trim();
        String Foccupation = student_FatherOccupation.Text.ToString().Trim();
        String Email = student_email.Text.ToString().Trim();
        String mobile = student_mobile.Text.ToString().Trim();
        String password = student_pass.Text.ToString().Trim();
        String dob = student_dob.Text.ToString().Trim();
        String city = student_city.Text.ToString().Trim();
        String pincode = student_pin.Text.ToString().Trim();
        String address = student_add.Text.ToString().Trim();
        String gender = student_gender.Text.ToString().Trim();
        String category = student_category.Text.ToString().Trim();
        String nationality = student_nationality.Text.ToString().Trim();
        String stream = student_stream.Text.ToString().Trim();
        String program = student_program.Text.ToString().Trim();

        SqlCommand cmd = new SqlCommand("UPDATE student_Profile SET S_FullName = @fname,S_FatherFullName=@ffname,S_FatherOccupation=@foccupation,S_email = @email,S_mobile = @mobile,S_password = @password,S_DOB=@dob,S_City=@city,S_Pincode=@pincode,S_Address=@address,S_Gender=@gender,S_Category=@category,S_Stream = @stream, S_Program = @program WHERE S_Id ='" + Request.QueryString["edit"].ToString().Trim() + "'", Helper.getCon());

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
        cmd.Parameters.AddWithValue("@program", program);
        //if (f_pro.HasFile)
        //{
        //    String pro = "p_" + Session["S_Id"] + new FileInfo(f_pro.FileName).Extension;
        //    f_pro.SaveAs(p_path + pro);
        //    cmd = new SqlCommand("UPDATE student_Profile SET S_Profile = '" + pro + "' WHERE S_Id = " + Session["S_Id"], con);
        //    cmd.ExecuteNonQuery();

        //}
        if (cmd.ExecuteNonQuery() == 1)
        {
            Session["S_Name"] = student_FullName.Text;
            Helper.setSmsg("Profile Update Successfully");
            Response.Redirect("AllStudents.aspx");

        }

    }
    protected void Delete_Record()
    {
        // delete student record
        int res = Helper.MyNoQ("DELETE FROM student_Profile WHERE S_Id = '" + Request.QueryString["delete"].ToString().Trim() + "'");
        Helper.setSmsg("Record Delete Successfully.");
        Response.Redirect("AllStudents.aspx");
    }
}