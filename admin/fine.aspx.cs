using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class admin_fine : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            Bound_Data();
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_fine();
        }

    }
    protected void add_fine(object sender, EventArgs e)
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
            Response.Redirect("fine.aspx");
        }
        else
        {
            Helper.setSmsg("Error in Fine Addition.");
            Response.Redirect("fine.aspx");
        }
    }

    public void Bound_Data()
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

    public void Delete_fine()
    {
        //del fine
        SqlCommand cmd = new SqlCommand("DELETE FROM fine WHERE f_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);
        cmd.ExecuteNonQuery();
        Success("Record Delete Successfully.");
    }
    public void Success(String msg, Boolean refresh = true)
    {
        Helper.setSmsg(msg);
        if (refresh)
        {
            Response.Redirect("fine.aspx");
        }
    }
}