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

public partial class student_assignments : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = Helper.WEBSITE_SUBMITED_PATH;
        if (Session["student_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Request.QueryString["upload"] == null)
        {
            Response.Redirect("student_profile.aspx");
        }
    }
    protected void add_assignment(object sender, EventArgs e)
    {
        String a_id = Request.QueryString["upload"];
        String user_id = Session["student_id"].ToString().Trim();
        SqlCommand cmd = new SqlCommand("INSERT INTO submissions(sub_a_id,sub_user_id) output INSERTED.sub_id values("+a_id+","+user_id+")", con);

        //Helper.END(cmd.CommandText);
       
        //cmd.Parameters.AddWithValue("@sub_a_id", a_id);
        //cmd.Parameters.AddWithValue("@sub_user_id", user_id);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            if (upd_assignment.HasFile)
            {
                String extention = System.IO.Path.GetExtension(upd_assignment.FileName);
                if (extention.ToLower() != ".doc" && extention.ToLower() != ".pdf")
                {
                    Helper.setAmsg("Only Document or PDF file consider");
                    Response.Redirect("student_profile.aspx");
                }
                else
                {
                    upd_assignment.SaveAs(Server.MapPath(i_path + upd_assignment.FileName));
                    Session["a_id"] = res;
                    String filename = upd_assignment.FileName;
                    SqlCommand ncmd = new SqlCommand("UPDATE submissions SET sub_file = '" + filename + "' WHERE sub_id =" + res, con);
                    ncmd.ExecuteNonQuery();
                    Helper.setSmsg("Assignment Uploaded Successfully.");
                    Response.Redirect("student_profile.aspx");
                }
            }
            else
            {
                Helper.setAmsg("Please upload File");
                Response.Redirect("student_assignments.aspx");
            }
        }
        else
        {
            Helper.setAmsg("Error in Admission Upload.");
            Response.Redirect("admin_login.aspx");
        }
    }
}