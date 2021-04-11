using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class add_fine : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        if (Session["faculty_id"] == null)
        {
            Response.Redirect("login.aspx");
        }

        if (!IsPostBack)
        {
            Bound_Data_fine();
        }
        if (Request.QueryString["pay"] != null && !IsPostBack)
        {
            pay();
        }

    }

    public void pay()
    {
        SqlCommand cmd = new SqlCommand("UPDATE fine SET f_status=@f_status WHERE f_id=" + Request.QueryString["pay"].ToString().Trim() + "", con);
        cmd.Parameters.AddWithValue("@f_status", "Approved");
        int res = (int)cmd.ExecuteNonQuery();
        if (Convert.ToBoolean(res))
        {
            Session["fine"] = true;
            Helper.setSmsg("Fine Payment Successfully.");
            Response.Redirect("Default.aspx");
        }
        else
        {
            Helper.setAmsg("Error in Fine Payment.");
            Response.Redirect("login.aspx");
        }
    }

    protected void addfine(object sender, EventArgs e)
    {
        String f_student = ddl_student.SelectedValue.ToString().Trim();
        String f_title = txt_fine.Text.ToString();
        String f_amount = ddl_Fine.Text.ToString();
        SqlCommand cmd = new SqlCommand("INSERT INTO fine(f_student,f_title,f_amount) output INSERTED.f_id values(@student,@title,@amount)", con);
        cmd.Parameters.AddWithValue("@student", f_student);
        cmd.Parameters.AddWithValue("@title", f_title);
        cmd.Parameters.AddWithValue("@amount", f_amount);
        int res = (int)cmd.ExecuteScalar();
        if (Convert.ToBoolean(res))
        {
            Helper.setSmsg("Fine added Successfully.");
            Response.Redirect("faculty_profile.aspx");
        }
        else
        {
            Helper.setSmsg("Error in Fine Addition.");
            Response.Redirect("faculty_profile.aspx");
        }
    }
    public void Bound_Data_fine()
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM students", con);
        da.Fill(ds);
        ddl_student.DataSource = ds;
        ddl_student.DataValueField = "s_id";
        ddl_student.DataTextField = "s_name";
        ddl_student.DataBind();
        ddl_student.Items.Insert(0, new ListItem("--Select--", ""));
    }

}