using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Web.Script.Serialization;

public partial class admin_Admission_Headers : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        if (Request.QueryString["cid"] != null)
        {
            SqlCommand cmd = new SqlCommand("SELECT c_fees, c_maxsem FROM courses WHERE c_id = " + Request.QueryString["cid"], con);
            SqlDataReader dr = cmd.ExecuteReader();
            
            JavaScriptSerializer js = new JavaScriptSerializer();
            if (dr.HasRows)
            {
                dr.Read();
                Response.Write(js.Serialize(new
                {
                    status = true,
                    fee = dr["c_fees"].ToString().Trim(),
                    sem = dr["c_maxsem"].ToString().Trim()
                }));
            }
            else
            {
                Response.Write(js.Serialize(new
                {
                    status = false
                }));
            }
            Response.End();
        }

        if (!IsPostBack)
        {
            Bound_Data();
        }
        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            Load_Admissions();
        }
        if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            Delete_Admission();
        }

    }

    private void Bound_Data()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM courses", con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        ddl_course.DataSource = ds;
        ddl_course.DataValueField = "c_id";
        ddl_course.DataTextField = "c_name";
        ddl_course.DataBind();
        ddl_course.Items.Insert(0, new ListItem("--Select--", ""));
    }

    public void Load_Admissions()
    {
        txt_Add_admission.Visible = false;
        txt_Upd_admission.Visible = true;
        SqlCommand cmd = new SqlCommand("SELECT ah_id, ah_course, ah_sem,ah_fees, CONVERT(varchar, ah_startdate) AS ah_startdate,  CONVERT(varchar, ah_enddate) AS ah_enddate,  CONVERT(varchar, ah_start_termdate) AS ah_start_termdate,  CONVERT(varchar, ah_end_termdate) AS ah_end_termdate FROM Admission_Headers WHERE ah_id = " + Request.QueryString["edit"], con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            area_user_list.Visible = false;
            ddl_course.SelectedValue = reader["ah_course"].ToString().Trim();
            txt_ah_sem.Text = reader["ah_sem"].ToString().Trim();
            txt_ah_fees.Text = reader["ah_fees"].ToString().Trim();
            txt_ah_startdate.Text = reader["ah_startdate"].ToString().Trim();
            txt_ah_enddate.Text = reader["ah_enddate"].ToString().Trim();
            txt_ah_starttermdate.Text = reader["ah_start_termdate"].ToString().Trim();
            txt_ah_endtermdate.Text = reader["ah_end_termdate"].ToString().Trim();
        }
    }
    protected void add_admission(object sender, EventArgs e)
    {
        String course = ddl_course.SelectedValue;
        String sem = txt_ah_sem.Text.ToString();
        String fees = txt_ah_fees.Text.ToString();
        String startdate = txt_ah_startdate.Text.ToString();
        String enddate = txt_ah_enddate.Text.ToString();
        String starttermdate = txt_ah_starttermdate.Text.ToString();
        String endtermdate = txt_ah_endtermdate.Text.ToString();

        SqlCommand cmd = new SqlCommand("INSERT INTO Admission_Headers(ah_course,ah_sem,ah_fees,ah_startdate,ah_enddate,ah_start_termdate,ah_end_termdate) output INSERTED.ah_id values(@ah_course,@ah_sem,@ah_fees,@ah_startdate,@ah_enddate,@ah_starttermdate,@ah_endtermdate)", con);

        cmd.Parameters.AddWithValue("@ah_course", course);
        cmd.Parameters.AddWithValue("@ah_sem", sem);
        cmd.Parameters.AddWithValue("@ah_fees", fees);
        cmd.Parameters.AddWithValue("@ah_startdate", startdate);
        cmd.Parameters.AddWithValue("@ah_enddate", enddate);
        cmd.Parameters.AddWithValue("@ah_starttermdate", starttermdate);
        cmd.Parameters.AddWithValue("@ah_endtermdate", endtermdate);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Session["ah_id"] = res;
            Helper.setSmsg("Admission Inserted Successfully.");
            Response.Redirect("Admission_Headers.aspx");

        }
        else
        {
            Helper.setAmsg("Error in Admission Insert.");
            Response.Redirect("login.aspx");
        }
    }
    protected void upd_admission(object sender, EventArgs e)
    {

        String course = ddl_course.SelectedValue;
        String sem = txt_ah_sem.Text.ToString();
        String fees = txt_ah_fees.Text.ToString();
        String startdate = txt_ah_startdate.Text.ToString();
        String enddate = txt_ah_enddate.Text.ToString();
        String starttermdate = txt_ah_starttermdate.Text.ToString();
        String endtermdate = txt_ah_endtermdate.Text.ToString();

        SqlCommand cmd = new SqlCommand("UPDATE Admission_Headers SET ah_course=@ah_course,ah_sem=@ah_sem,ah_fees=@ah_fees,ah_startdate=@ah_startdate,ah_enddate=@ah_enddate,ah_start_termdate=@ah_starttermdate,ah_end_termdate=@ah_endtermdate output INSERTED.ah_id WHERE ah_id='" + Request.QueryString["edit"].ToString().Trim() + "'", con);

        cmd.Parameters.AddWithValue("@ah_course", course);
        cmd.Parameters.AddWithValue("@ah_sem", sem);
        cmd.Parameters.AddWithValue("@ah_fees", fees);
        cmd.Parameters.AddWithValue("@ah_startdate", startdate);
        cmd.Parameters.AddWithValue("@ah_enddate", enddate);
        cmd.Parameters.AddWithValue("@ah_starttermdate", starttermdate);
        cmd.Parameters.AddWithValue("@ah_endtermdate", endtermdate);
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Session["ah_id"] = res;
            Helper.setSmsg("Admission Updated Successfully.");
            Response.Redirect("Admission_Headers.aspx");

        }
        else
        {
            Helper.setAmsg("Error in Admission Update.");
            Response.Redirect("login.aspx");
        }

    }
    public void Delete_Admission()
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM Admission_Headers WHERE ah_id='" + Request.QueryString["delete"].ToString().Trim() + "'", con);
        cmd.ExecuteNonQuery();
        Helper.setSmsg("Record Delete Successfully.");
        Response.Redirect("Admission_Headers.aspx");
    }
}