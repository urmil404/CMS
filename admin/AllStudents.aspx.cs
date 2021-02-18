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
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        p_path = MapPath("student_profile\\");
        if (Session["pro"] == null)
        {
            Session["pro"] = "photo.png";
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
        cmd = new SqlCommand("INSERT INTO student_Profile(S_Name, S_Mobile, S_Username, S_Password, S_Dob, S_City, S_Pincode, S_Address) output INSERTED.S_Id VALUES('" + student_name.Text + "', '" + student_mobile.Text + "', '" + student_uname.Text + "', '" + student_pass.Text + "', '" + student_dob.Text + "', '" + student_city.Text + "', '" + student_pin.Text + "', '" + student_add.Text + "')", con);

        cmd = new SqlCommand("INSERT INTO student_Profile(S_Name, S_Mobile, S_Username, S_Password, S_Dob, S_City, S_Pincode, S_Address) output INSERTED.S_Id VALUES('" + student_name.Text + "', '" + student_mobile.Text + "', '" + student_uname.Text + "', '" + student_pass.Text + "', '" + student_dob.Text + "', '" + student_city.Text + "', '" + student_pin.Text + "', '" + student_add.Text + "')", con);
        int sid = (int)cmd.ExecuteScalar();
        String pro = "photo.png";
        if (f_pro.HasFile)
        {
            pro = "p_" + m(sid) + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
        }
        cmd = new SqlCommand("UPDATE student_Profile  SET S_Profile = '" + pro + "' WHERE S_Id = " + m(sid), con);
        cmd.ExecuteNonQuery();
        home("Registration Successfully, Now You Can Login..");
    }

    protected void login_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("SELECT S_Id, S_Name, S_Password, S_Profile FROM student_Profile WHERE S_Username = '" + student_username.Text + "'", con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            if (String.Compare(m(dr["S_Password"]), m(student_password.Text)) == 0)
            {
                Session["S_Id"] = dr["S_Id"];
                Session["S_Name"] = m(dr["S_Name"]);
                Session["pro"] = m(dr["S_Profile"]);
                home("Login Successfully");
            }
            else
            {
                home("Invalid Password");
            }
        }
        else
        {
            home("Username Not Found");
        }
    }
    protected void b_upd_Click(object sender, EventArgs e)
    {
        cmd = new SqlCommand("UPDATE student_Profile SET S_Name = '" + student_name.Text + "', S_Mobile = '" + student_mobile.Text + "', S_Username = '" + student_uname.Text + "', S_Password = '" + student_pass.Text + "', S_Dob = '" + student_dob.Text + "', S_City = '" + student_city.Text + "', S_Pincode = '" + student_pin.Text + "', S_Address = '" + student_add.Text + "' WHERE S_Id = " + Session["S_Id"], con);
        cmd.ExecuteNonQuery();
        if (f_pro.HasFile)
        {
            String pro = "p_" + Session["S_Id"] + new FileInfo(f_pro.FileName).Extension;
            f_pro.SaveAs(p_path + pro);
            cmd = new SqlCommand("UPDATE student_Profile SET S_Profile = '" + pro + "' WHERE S_Id = " + Session["S_Id"], con);
            cmd.ExecuteNonQuery();
            Session["pro"] = pro;
        }
        Session["S_Name"] = student_name.Text;
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
            student_name.Text = m(dr["S_Name"]);
            student_mobile.Text = m(dr["S_Mobile"]);
            student_uname.Text = m(dr["S_Username"]);
            student_pass.Text = m(dr["S_Password"]);
            student_dob.Text = m(dr["S_Dob"]);
            student_city.Text = m(dr["S_City"]);
            student_pin.Text = m(dr["S_Pincode"]);
            student_add.Text = m(dr["S_Address"]);
        }
        dr.Close();
    }

    protected void b_logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        home();
    }
}