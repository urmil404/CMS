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

public partial class admin_Students : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = MapPath("../" + Helper.WEBSITE_STUDENT_PATH);

        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }

        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            Load_Student();
        }
        else if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Student();
        }
        else
        {
            img_Student.Src = "../" + Helper.get_Student_Image();
        }
    }
    protected void add_student(object sender, EventArgs e)
    {
        String name = txt_student_Name.Text.ToString();
        String fathername = txt_student_Fathername.Text.ToString();
        String dob = txt_student_Dob.Text.ToString();
        String gender = ddl_Gender.Text.ToString();
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

            if (s_Image.HasFile)
            {
                String nm = "s_" + Convert.ToString(res) + new FileInfo(s_Image.FileName).Extension;
                s_Image.SaveAs(i_path + nm);
                SqlCommand ncmd = new SqlCommand("UPDATE students SET s_image = '" + nm + "' WHERE s_id =" + res, con);
                ncmd.ExecuteNonQuery();
            }
            Helper.setSmsg("Student Inserted Successfully.");
            Response.Redirect("students.aspx");

        }
        else
        {
            Helper.setAmsg("Error in student Insert.");
            Response.Redirect("login.aspx");
        }

    }
    protected void upd_student(object sender, EventArgs e)
    {

        String name = txt_student_Name.Text.ToString();
        String fathername = txt_student_Fathername.Text.ToString();
        String dob = txt_student_Dob.Text.ToString();
        String gender = ddl_Gender.Text.ToString();
        String mobile = txt_student_Mobile.Text.ToString();
        String email = txt_student_email.Text.ToString();
        String address = txt_student_address.Text.ToString();
        String city = txt_student_city.Text.ToString();
        String pincode = txt_student_pincode.Text.ToString();

        SqlCommand cmd = new SqlCommand("UPDATE students SET s_name=@s_name,s_fathername=@s_fathername,s_dob=@s_dob,s_gender=@s_gender,s_mobile=@s_mobile,s_email=@s_email,s_address=@s_address,s_city=@s_city,s_pincode=@s_pincode output INSERTED.s_id WHERE s_id='" + Request.QueryString["edit"].ToString().Trim() + "'", con);

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
            Session["student_id"] = res;
            if (s_Image.HasFile)
            {
                String nm = "s_" + Convert.ToString(res) + new FileInfo(s_Image.FileName).Extension;
                s_Image.SaveAs(i_path + nm);
                SqlCommand ncmd = new SqlCommand("UPDATE students SET s_image = '" + nm + "' WHERE s_id =" + res, con);
                ncmd.ExecuteNonQuery();
            }
            Helper.setSmsg("Student Updated Successfully.");
            Response.Redirect("students.aspx");
        }
        else
        {
            Helper.setAmsg("Error in student Update.");
            Response.Redirect("login.aspx");
        }
    }

    public void Load_Student()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM students WHERE s_id = " + Request.QueryString["edit"], con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txt_Upd_Student.Visible = true;
            txt_Add_Student.Visible = false;
            area_student_list.Visible = false;
            txt_student_Name.Text = reader["s_name"].ToString().Trim();
            txt_student_Fathername.Text = reader["s_fathername"].ToString().Trim();
            txt_student_Dob.Text = reader["s_dob"].ToString().Trim();
            ddl_Gender.SelectedValue = reader["s_gender"].ToString().Trim();
            txt_student_Mobile.Text = reader["s_mobile"].ToString().Trim();
            txt_student_email.Text = reader["s_email"].ToString().Trim();
            txt_student_address.Text = reader["s_address"].ToString().Trim();
            txt_student_city.Text = reader["s_city"].ToString().Trim();
            txt_student_pincode.Text = reader["s_pincode"].ToString().Trim();
            img_Student.Src = "../" + Helper.get_Student_Image(reader["s_image"].ToString().Trim());
        }
    }
    public void Delete_Student()
    {
        //del student
        SqlCommand cmd = new SqlCommand("DELETE FROM students WHERE s_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);

        cmd.ExecuteNonQuery();
        Success("Record Delete Successfully.");
    }
    public void Success(String msg, Boolean refresh = true)
    {
        Helper.setSmsg(msg);
        if (refresh)
        {
            Response.Redirect("students.aspx");
        }
    }
}