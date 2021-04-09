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

public partial class admin_faculty : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = MapPath("../" + Helper.WEBSITE_FACULTY_PATH);

        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            Load_Faculty();
        }
        else if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Faculty();
        }
        else
        {
            img_Faculty.Src = "../" + Helper.get_Student_Image();
        }
    }
   
    public void Load_Faculty()
    {
        SqlCommand cmd = new SqlCommand("SELECT * FROM faculty WHERE f_id = " + Request.QueryString["edit"], con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            txt_Upd_Faculty.Visible = true;
            txt_Add_Faculty.Visible = false;
            area_Faculty_list.Visible = false;
            txt_Faculty_Name.Text = reader["f_name"].ToString().Trim();
            txt_Faculty_Dob.Text = reader["f_dob"].ToString().Trim();
            ddl_Gender.SelectedValue = reader["f_gender"].ToString().Trim();
            txt_Faculty_Mobile.Text = reader["f_mobile"].ToString().Trim();
            txt_Faculty_email.Text = reader["f_email"].ToString().Trim();
            txt_Faculty_address.Text = reader["f_address"].ToString().Trim();
            txt_Faculty_city.Text = reader["f_city"].ToString().Trim();
            txt_Faculty_pincode.Text = reader["f_pincode"].ToString().Trim();
            img_Faculty.Src = "../" + Helper.get_Faculty_Image(reader["f_image"].ToString().Trim());
        }
    }
    protected void add_faculty(object sender, EventArgs e)
    {
        String name = txt_Faculty_Name.Text.ToString();
        String dob = txt_Faculty_Dob.Text.ToString();
        String gender = ddl_Gender.Text.ToString();
        String mobile = txt_Faculty_Mobile.Text.ToString();
        String email = txt_Faculty_email.Text.ToString();
        String address = txt_Faculty_address.Text.ToString();
        String city = txt_Faculty_city.Text.ToString();
        String pincode = txt_Faculty_pincode.Text.ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO faculty(f_name,f_dob,f_gender,f_mobile,f_email,f_address,f_city,f_pincode) output INSERTED.f_id values(@f_name,@f_dob,@f_gender,@f_mobile,@f_email,@f_address,@f_city,@f_pincode)", con);

        cmd.Parameters.AddWithValue("@f_name", name);
        cmd.Parameters.AddWithValue("@f_dob", dob);
        cmd.Parameters.AddWithValue("@f_gender", gender);
        cmd.Parameters.AddWithValue("@f_mobile", mobile);
        cmd.Parameters.AddWithValue("@f_email", email);
        cmd.Parameters.AddWithValue("@f_address", address);
        cmd.Parameters.AddWithValue("@f_city", city);
        cmd.Parameters.AddWithValue("@f_pincode", pincode);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {

            if (f_Image.HasFile)
            {
                String nm = "f_" + Convert.ToString(res) + new FileInfo(f_Image.FileName).Extension;
                f_Image.SaveAs(i_path + nm);
                SqlCommand ncmd = new SqlCommand("UPDATE faculty SET f_image = '" + nm + "' WHERE f_id =" + res, con);
                ncmd.ExecuteNonQuery();
            }
            Helper.setSmsg("Faculty Inserted Successfully.");
            Response.Redirect("faculty.aspx");

        }
        else
        {
            Helper.setAmsg("Error in student Insert.");
            Response.Redirect("admin_login.aspx");
        }
    }
    protected void upd_faculty(object sender, EventArgs e)
    {
        String name = txt_Faculty_Name.Text.ToString();
        String dob = txt_Faculty_Dob.Text.ToString();
        String gender = ddl_Gender.Text.ToString();
        String mobile = txt_Faculty_Mobile.Text.ToString();
        String email = txt_Faculty_email.Text.ToString();
        String address = txt_Faculty_address.Text.ToString();
        String city = txt_Faculty_city.Text.ToString();
        String pincode = txt_Faculty_pincode.Text.ToString();

        SqlCommand cmd = new SqlCommand("UPDATE faculty SET f_name=@f_name,f_dob=@f_dob,f_gender=@f_gender,f_mobile=@f_mobile,f_email=@f_email,f_address=@f_address,f_city=@f_city,f_pincode=@f_pincode output INSERTED.f_id WHERE f_id='" + Request.QueryString["edit"].ToString().Trim() + "'", con);

        cmd.Parameters.AddWithValue("@f_name", name);
        cmd.Parameters.AddWithValue("@f_dob", dob);
        cmd.Parameters.AddWithValue("@f_gender", gender);
        cmd.Parameters.AddWithValue("@f_mobile", mobile);
        cmd.Parameters.AddWithValue("@f_email", email);
        cmd.Parameters.AddWithValue("@f_address", address);
        cmd.Parameters.AddWithValue("@f_city", city);
        cmd.Parameters.AddWithValue("@f_pincode", pincode);

        int res = (int)cmd.ExecuteScalar();
        if (Convert.ToBoolean(res))
        {
            Session["student_id"] = res;
            if (f_Image.HasFile)
            {
                String nm = "s_" + Convert.ToString(res) + new FileInfo(f_Image.FileName).Extension;
                f_Image.SaveAs(i_path + nm);
                SqlCommand ncmd = new SqlCommand("UPDATE faculty SET f_image = '" + nm + "' WHERE f_id =" + res, con);
                ncmd.ExecuteNonQuery();
            }
            Helper.setSmsg("Faculty Updated Successfully.");
            Response.Redirect("faculty.aspx");
        }
        else
        {
            Helper.setAmsg("Error in student Update.");
            Response.Redirect("admin_login.aspx");
        }

    }

    public void Delete_Faculty()
    {
        //del student
        SqlCommand cmd = new SqlCommand("DELETE FROM faculty WHERE f_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);

        cmd.ExecuteNonQuery();
        Success("Record Delete Successfully.");
    }
    public void Success(String msg, Boolean refresh = true)
    {
        Helper.setSmsg(msg);
        if (refresh)
        {
            Response.Redirect("faculty.aspx");
        }
    }
}