using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;

public partial class smtp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Response.Write(Convert.ToString(eMail.sendMail("urmil8989@gmail.com", "Your Credensial", "<h3>PAssword : " + Helper.Genrate_New_Password() + "</h3><h4>Thank Your My Dear</h4>")));   
        
        Response.End();

    }
}