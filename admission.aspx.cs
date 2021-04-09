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

public partial class admission : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student_id"] == null)
        {
            Response.Redirect("login.aspx");
        }

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT COALESCE(s_course,0) FROM students WHERE s_id=" + Session["student_id"], con);
        int c_id = (int)cmd.ExecuteScalar();
        if (c_id != 0)
        {
            cmd = new SqlCommand("SELECT COUNT(*) FROM Admission_Headers WHERE ah_course = " + c_id + " AND ah_sem =(SELECT MAX(ad_sem)+1 FROM Admissions WHERE ad_course = " + c_id + " AND ad_student = " + Session["student_id"] + ") AND ah_startdate <= CAST(GETDATE() AS Date) AND ah_enddate >= CAST(GETDATE() AS Date)", con);
            int flag = (int)cmd.ExecuteScalar();
            //Helper.END(flag==0);
            if (flag == 0)
            {
                Helper.setSmsg("There is no admission Available");
                Response.Redirect("student_profile.aspx");
            }
        }
        //DateTime dateTime = DateTime.UtcNow.Date;
        //Response.Write(dateTime.ToString("d"));

        if (Request.QueryString["ahid"] != null)
        {
            cmd = new SqlCommand("SELECT ah_fees FROM Admission_Headers WHERE ah_id = " + Request.QueryString["ahid"], con);
            Response.Write(cmd.ExecuteScalar().ToString());
            Response.End();
        }

        if (!IsPostBack)
        {
            Bound_Data();
        }

    }

    public void Bound_Data()
    {
        //ddl_Admission_Header
        SqlCommand cmd = new SqlCommand("SELECT s_course FROM students WHERE s_id=" + Session["student_id"], con);
        int c_id = (int)cmd.ExecuteScalar();
        SqlDataAdapter da;
        if (c_id != 0)
        {
            da = new SqlDataAdapter("SELECT ah_id, CONCAT(REPLICATE('0',3-LEN(ah_id)),ah_id,' ', c_name ,' Sem - ', ah_sem) AS ah_title FROM Admission_Headers, courses WHERE c_id = ah_course AND ah_course = " + c_id + " AND ah_sem= (SELECT COALESCE( MAX(ad_sem),0)+1 FROM Admissions WHERE ad_student = " + Session["student_id"] + ") AND ah_startdate <= CAST(GETDATE() AS Date) AND ah_enddate >= CAST(GETDATE() AS Date)", con);
            
        }
        else
        {
            //Response.Write("Newk");

            da = new SqlDataAdapter("SELECT ah_id, CONCAT(REPLICATE('0',3-LEN(ah_id)),ah_id,' ', c_name ,' Sem - ', ah_sem) AS ah_title FROM Admission_Headers, courses WHERE c_id = ah_course AND ah_sem= (SELECT COALESCE( MAX(ad_sem),0)+1 FROM Admissions WHERE ad_student = " + Session["student_id"] + ") AND ah_startdate <= CAST(GETDATE() AS Date) AND ah_enddate >= CAST(GETDATE() AS Date)", con);
        }
        DataTable dt = new DataTable();
        da.Fill(dt);
        //Helper.END(da);
        //Helper.END(dt.Rows.Count);
        if (dt.Rows.Count > 0)
        {
            ddl_Admission_Header.DataSource = dt;
            ddl_Admission_Header.DataValueField = "ah_id";
            ddl_Admission_Header.DataTextField = "ah_title";
            ddl_Admission_Header.DataBind();
            ddl_Admission_Header.Items.Insert(0, new ListItem("--Select--", ""));
        }
        else
        {
            Helper.setAmsg("Admissions Closed");
            Response.Redirect("Default.aspx");

        }
    }
    protected void take_admisssion(object sender, EventArgs e)
    {
        String ah_id = ddl_Admission_Header.Text.ToString();

        SqlCommand cmd = new SqlCommand("SELECT * FROM Admission_Headers WHERE ah_id=" + ah_id, con);
        SqlDataReader rr = cmd.ExecuteReader();
        rr.Read();
        string course_id = rr["ah_course"].ToString().Trim();
        string sem_num = rr["ah_sem"].ToString().Trim();
        string fees = rr["ah_fees"].ToString().Trim();

        cmd = new SqlCommand("INSERT INTO Admissions(ad_ah, ad_course,ad_sem,ad_student,ad_fees,ad_rollno,ad_payment,ad_date,ad_status ) output INSERTED.ad_id values(@ah,@course,@sem,@student,@fees, (SELECT (COUNT(*) +1 ) FROM Admissions WHERE ad_ah = 5), @payment, @date, 'pending')", con);
        DateTime dateTime = DateTime.UtcNow.Date;

        cmd.Parameters.AddWithValue("@ah", ah_id);
        cmd.Parameters.AddWithValue("@course", course_id);
        cmd.Parameters.AddWithValue("@sem", sem_num);
        cmd.Parameters.AddWithValue("@student", Session["student_id"]);
        cmd.Parameters.AddWithValue("@fees", fees);
        cmd.Parameters.AddWithValue("@payment", "Unpaid");
        cmd.Parameters.AddWithValue("@date", dateTime.ToString("yyyy-MM-dd"));

        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Helper.setSmsg("Admission Successfully done.");
            cmd = new SqlCommand("SELECT c_name FROM courses WHERE c_id =" + course_id, con);
            String cname = Convert.ToString(cmd.ExecuteScalar());
            String PreFix = DateTime.Now.Year.ToString() + cname;
            cmd = new SqlCommand("SELECT COUNT(*) AS cnt FROM students WHERE s_gr LIKE '" + PreFix + "%'", con);
            String GR_id = Convert.ToString(Convert.ToInt32(cmd.ExecuteScalar()) + 1);
            String GR = PreFix + GR_id;
            cmd = new SqlCommand("UPDATE students SET s_course='" + course_id + "', s_gr='" + GR + "'WHERE s_id=" + Session["student_id"], con);
            cmd.ExecuteNonQuery();
            Response.Redirect("student_profile.aspx");
        }
        else
        {
            Helper.setAmsg("Error in Admission Insert.");
            Response.Redirect("admission.aspx");
        }

    }


}