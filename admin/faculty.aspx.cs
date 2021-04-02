using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_faculty : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = MapPath("../" + Helper.WEBSITE_STUDENT_PATH);

        if (Request.QueryString["edit"] != null && !IsPostBack)
        {
            //Load_Student();
        }
        else if (Request.QueryString["delete"] != null && !IsPostBack)
        {
            //Delete_Student();
        }
        else
        {
            img_Student.Src = "../" + Helper.get_Student_Image();
        }
    }
    protected void add_faculty(object sender, EventArgs e)
    {

    }
    protected void upd_faculty(object sender, EventArgs e)
    {

    }
}