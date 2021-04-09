using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;
public partial class admin_assignments : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = "../" + Helper.WEBSITE_ASSIGNMENT_PATH;
    }
    protected void add_assignment(object sender, EventArgs e)
    {
        String textAssignment = txt_assignment.Text.ToString();
        SqlCommand cmd = new SqlCommand("INSERT INTO assignments(a_title) output INSERTED.a_id values(@title)", con);
        cmd.Parameters.AddWithValue("@title", textAssignment);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            if (upd_assignment.HasFile)
            {
                String extention = System.IO.Path.GetExtension(upd_assignment.FileName);
                if (extention.ToLower() != ".doc" && extention.ToLower() != ".pdf")
                {
                    Helper.setSmsg("Only Document or PDF file consider");
                    Response.Redirect("assignments.aspx");
                }
                else
                {
                    upd_assignment.SaveAs(Server.MapPath(i_path + upd_assignment.FileName));
                    Session["a_id"] = res;
                    String filename = upd_assignment.FileName;
                    SqlCommand ncmd = new SqlCommand("UPDATE assignments SET a_file = '" + filename + "' WHERE a_id =" + res, con);
                    ncmd.ExecuteNonQuery();
                    Helper.setSmsg("Assignment Uploaded Successfully.");
                    Response.Redirect("assignments.aspx");
                }
            }
            else
            {
                Helper.setSmsg("Please upload File");
                Response.Redirect("assignments.aspx");
            }
        }
        else
        {
            Helper.setAmsg("Error in Admission Upload.");
            Response.Redirect("admin_login.aspx");
        }
    }

    public void Delete_Student()
    {
        //del assignemt
        SqlCommand cmd = new SqlCommand("DELETE FROM assignments WHERE a_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);

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