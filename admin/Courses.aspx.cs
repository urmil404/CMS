using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Courses : System.Web.UI.Page
{
    SqlConnection con;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }

        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            Load_Courses();
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Course();
        }

    }
    protected void add_course(object sender, EventArgs e)
    {
        String name = txt_Course_Name.Text.ToString();
        String maxsem = txt_Max_Sem.Text.ToString();
        String fees = txt_Fees.Text.ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO courses(c_name,c_maxsem,c_fees) output INSERTED.c_id values(@c_name,@c_maxsem,@c_fees)", con);

        cmd.Parameters.AddWithValue("@c_name", name);
        cmd.Parameters.AddWithValue("@c_maxsem", maxsem);
        cmd.Parameters.AddWithValue("@c_fees", fees);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Session["course_id"] = res;
            Helper.setSmsg("Courses Inserted Successfully.");
            Response.Redirect("Courses.aspx");

        }
        else
        {
            Helper.setAmsg("Error in Course Insert.");
            Response.Redirect("login.aspx");
        }
    }
    protected void upd_course(object sender, EventArgs e)
    {
        String name = txt_Course_Name.Text.ToString();
        String maxsem = txt_Max_Sem.Text.ToString();
        String fees = txt_Fees.Text.ToString();

        SqlCommand cmd = new SqlCommand("UPDATE courses SET c_name=@c_name,c_maxsem=@c_maxsem,c_fees=@c_fees output INSERTED.c_id WHERE c_id='" + Request.QueryString["edit"].ToString().Trim() + "'", con);

        cmd.Parameters.AddWithValue("@c_name", name);
        cmd.Parameters.AddWithValue("@c_maxsem", maxsem);
        cmd.Parameters.AddWithValue("@c_fees", fees);

        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Session["course_id"] = res;
            Helper.setSmsg("Courses Updated Successfully.");
            Response.Redirect("Courses.aspx");

        }
        else
        {
            Helper.setAmsg("Error in Course Updation.");
            Response.Redirect("login.aspx");
        }
    }
    public void Load_Courses()
    {
        txt_Add_Course.Visible = false;
        txt_Upd_Course.Visible = true;
        SqlCommand cmd = new SqlCommand("SELECT * FROM courses WHERE c_id=" + Request.QueryString["edit"].ToString().Trim() , con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            area_user_list.Visible = false;
            txt_Course_Name.Text = reader["c_name"].ToString().Trim();
            txt_Max_Sem.Text = reader["c_maxsem"].ToString().Trim();
            txt_Fees.Text = reader["c_fees"].ToString().Trim();
        }

    }
    public void Delete_Course()
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM courses WHERE c_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);
        cmd.ExecuteNonQuery();
        Helper.setSmsg("Record Delete Successfully.");
        Response.Redirect("courses.aspx");
    }
}