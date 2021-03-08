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

public partial class admin_Admissions : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        if (Request.QueryString["ahid"] != null)
        {
            SqlCommand cmd = new SqlCommand("SELECT ah_fees FROM Admission_Headers WHERE ah_id = " + Request.QueryString["ahid"], con);
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
        SqlDataAdapter da = new SqlDataAdapter("SELECT ah_id, CONCAT(REPLICATE('0',3-LEN(ah_id)),ah_id,' ', c_name ,' Sem - ', ah_sem) AS ah_title FROM Admission_Headers, courses WHERE c_id = ah_course", con);
        DataSet ds = new DataSet();
        da.Fill(ds);

        ddl_ah.DataSource = ds;
        ddl_ah.DataValueField = "ah_id";
        ddl_ah.DataTextField = "ah_title";
        ddl_ah.DataBind();
        ddl_ah.Items.Insert(0, new ListItem("--Select--", ""));

        da = new SqlDataAdapter("SELECT * FROM students", con);

        ds.Clear();

        da.Fill(ds);

        ddl_student.DataSource = ds;
        ddl_student.DataValueField = "s_id";
        ddl_student.DataTextField = "s_name";
        ddl_student.DataBind();
        ddl_student.Items.Insert(0, new ListItem("--Select--", ""));
    }

    protected void add_admission(object sender, EventArgs e)
    {
        String s_id = ddl_student.SelectedValue.ToString();
        SqlCommand cmd = new SqlCommand("SELECT s_course FROM students WHERE s_id=" + s_id, con);
        int c_id = (int)cmd.ExecuteScalar();
        Response.Write("Student id is : " + s_id + "  and it's Cource id: " + c_id);
        if (c_id == 0)
        {
            Response.Write("\n Course is 0 now find the course of admission header ");
            //new student have'nt take adminssion in any course
            String ah_id = ddl_ah.SelectedValue.ToString();
            Response.Write(" The Admission header id is " + ah_id);
            cmd = new SqlCommand("SELECT ah_course FROM Admission_Headers WHERE ah_id=" + ah_id, con);
            int ch_id = Convert.ToInt32(cmd.ExecuteScalar());
            Response.Write(" \nThe Admission is Assosiated with Course : " + ch_id + "  ");
            cmd = new SqlCommand("SELECT c_name FROM courses WHERE c_id =" + ch_id, con);
            String cname = Convert.ToString(cmd.ExecuteScalar());
            String PreFix = DateTime.Now.Year.ToString() + cname;
            cmd = new SqlCommand("SELECT COUNT(*) AS cnt FROM students WHERE s_gr LIKE '" + PreFix + "%'", con);
            String GR_id = Convert.ToString(Convert.ToInt32(cmd.ExecuteScalar()) + 1);
            String GR = PreFix + GR_id;
            cmd = new SqlCommand("UPDATE students SET s_course='" + ch_id + "', s_gr='" + GR + "'WHERE s_id=" + s_id, con);
            cmd.ExecuteNonQuery();
        }
        else
        {
            //student already associated with admission

        }

        String name = ddl_ah.Text.ToString();
        String maxsem = ddl_student.Text.ToString();
        String fees = txt_fees.Text.ToString();
        String payment = ddl_payment.Text.ToString();
        String date = txt_date.Text.ToString();

        cmd = new SqlCommand("INSERT INTO Admissions(ad_ah,ad_student,ad_fees,ad_rollno,ad_payment,ad_date,ad_status ) output INSERTED.ad_id values(@ah,@student,@fees, (SELECT (COUNT(*) +1 ) FROM Admissions WHERE ad_ah = 5), @payment, @date, 1)", con);

        cmd.Parameters.AddWithValue("@ah", ddl_ah.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@student", ddl_student.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@fees", txt_fees.Text.ToString());
        cmd.Parameters.AddWithValue("@payment", ddl_payment.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@date", txt_date.Text.ToString());
        int res = (int)cmd.ExecuteScalar();

        if (Convert.ToBoolean(res))
        {
            Helper.setSmsg("Admission Inserted Successfully.");
            Response.Redirect("Admissions.aspx");
        }
        else
        {
            Helper.setAmsg("Error in Admission Insert.");
            Response.Redirect("Admissions.aspx");
        }
    }
}