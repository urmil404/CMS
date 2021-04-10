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
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = "../" + Helper.WEBSITE_ASSIGNMENT_PATH;

        if (Session["admin_id"] == null)
        {
            Response.Redirect("admin_login.aspx");
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_assignment();
        }
        if (Request.QueryString["download"] != null && !IsPostBack)
        {
            Download_assignment();
        }
        if (!IsPostBack)
        {
            Bound_Data();
        }
    }
    public void Bound_Data()
    {
        //ddl_Admission_Header
        SqlDataAdapter da = new SqlDataAdapter("SELECT ah_id, CONCAT(REPLICATE('0',3-LEN(ah_id)),ah_id,' ', c_name ,' Sem - ', ah_sem) AS ah_title FROM Admission_Headers, courses WHERE c_id = ah_course AND ah_start_termdate <= CAST(GETDATE() AS Date) AND (ah_end_termdate>= CAST(GETDATE() AS Date) OR ah_end_termdate IS NULL)", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            ddl_course.DataSource = dt;
            ddl_course.DataValueField = "ah_id";
            ddl_course.DataTextField = "ah_title";
            ddl_course.DataBind();
            ddl_course.Items.Insert(0, new ListItem("--Select--", ""));
        }
        else
        {
            Helper.setAmsg("Admissions Closed");
            Response.Redirect("Default.aspx");
        }
    }
    public void Download_assignment()
    {
        string filename = upd_assignment.FileName;
        FileInfo fileInfo = new FileInfo(filename);

        if (fileInfo.Exists)
        {
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + filename);
            Response.TransmitFile(Server.MapPath(i_path + upd_assignment.FileName));
            Response.End();
        }
        Helper.setSmsg("Assignment Downloaded Successfully.");
        Response.Redirect("assignments.aspx");
    }
    protected void add_assignment(object sender, EventArgs e)
    {
        String ah_id = ddl_course.SelectedValue.ToString().Trim();
        String textAssignment = txt_assignment.Text.ToString();
        SqlCommand cmd = new SqlCommand("INSERT INTO assignments(a_title,a_ah_id) output INSERTED.a_id values(@title,@ah_id)", con);
        cmd.Parameters.AddWithValue("@title", textAssignment); cmd.Parameters.AddWithValue("@ah_id", ah_id);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            if (upd_assignment.HasFile)
            {
                String extention = System.IO.Path.GetExtension(upd_assignment.FileName);
                if (extention.ToLower() != ".doc" && extention.ToLower() != ".pdf")
                {
                    Helper.setAmsg("Only Document or PDF file consider");
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
                Helper.setAmsg("Please upload File");
                Response.Redirect("assignments.aspx");
            }
        }
        else
        {
            Helper.setAmsg("Error in Admission Upload.");
            Response.Redirect("admin_login.aspx");
        }
    }
    public void Delete_assignment()
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
            Response.Redirect("assignments.aspx");
        }
    }
}