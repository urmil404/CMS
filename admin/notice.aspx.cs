using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class admin_notice : System.Web.UI.Page
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
            Load_Notice();
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Notice();
        }
    }
    protected void add_notice(object sender, EventArgs e)
    {
        String title = notice_title.Text.ToString();
        String desc = notice_desc.Text.ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO notice(n_title,n_desc) output INSERTED.n_id values(@title,@desc)", con);

        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@desc", desc);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Helper.setSmsg("Notice Inserted Successfully.");
            Response.Redirect("notice.aspx");
        }
        else
        {
            Helper.setAmsg("Error in Notice Insert.");
            Response.Redirect("admin_login.aspx");
        }    
    }

    public void Load_Notice()
    {
        txt_Add_notice.Visible = false;
        txt_Upd_notice.Visible = true;
        SqlCommand cmd = new SqlCommand("SELECT * FROM notice WHERE n_id=" + Request.QueryString["edit"].ToString().Trim(), con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            area_notice_list.Visible = false;
            notice_title.Text = reader["n_title"].ToString().Trim();
            notice_desc.Text = reader["n_desc"].ToString().Trim();
        }

    }
    public void Delete_Notice()
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM notice WHERE n_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);
        cmd.ExecuteNonQuery();
        Helper.setSmsg("Notice Delete Successfully.");
        Response.Redirect("notice.aspx");
    }
    protected void upd_notice(object sender, EventArgs e)
    {
        String title = notice_title.Text.ToString();
        String desc = notice_desc.Text.ToString();

        SqlCommand cmd = new SqlCommand("UPDATE notice SET n_title=@title,n_desc=@desc output INSERTED.n_id WHERE n_id='" + Request.QueryString["edit"].ToString().Trim() + "'", con);
        
        cmd.Parameters.AddWithValue("@title", title);
        cmd.Parameters.AddWithValue("@desc", desc);

        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Session["notice_id"] = res;
            Helper.setSmsg("Notice Updated Successfully.");
            Response.Redirect("notice.aspx");

        }
        else
        {
            Helper.setAmsg("Error in notice Updation.");
            Response.Redirect("admin_login.aspx");
        }
    }
}