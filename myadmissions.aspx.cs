using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myadmissions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["student_id"] == null)
        {
              Response.Redirect("login.aspx");
        }
    }
    protected void take_admission(object sender, EventArgs e)
    {
        Response.Redirect("admission.aspx");
    }
}