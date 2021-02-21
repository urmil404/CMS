using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admission : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = Helper.getCon();
    }
    protected void btn_Signup_Click(object sender, EventArgs e)
    {
        Response.Redirect("admission");   
    }
}