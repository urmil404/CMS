using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;  

public static class eMail
{
    public static String username = "urmilrupareliya14@gmail.com";
    public static String password = IMP.email_password; // Chonage This Variable With Your Email Password
    public static String from = "EduCamp <urmil@gmail.com>";
    public static String smtpServer = "smtp.gmail.com";
    public static int smtpPort = 587;

    public static bool sendMail(string to, string subject, string mailbody)
    {  
        MailMessage message = new MailMessage(eMail.from, to);
        message.Subject = subject;
        message.Body = mailbody;
        message.BodyEncoding = Encoding.UTF8;
        message.IsBodyHtml = true;
        SmtpClient client = new SmtpClient(eMail.smtpServer, eMail.smtpPort); //Gmail smtp    
        System.Net.NetworkCredential basicCredential1 = new
        System.Net.NetworkCredential(eMail.username, eMail.password);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = basicCredential1;
        
        try
        {
            client.Send(message);
            return true;
        }
        catch (Exception ex)
        {
            throw ex;
            //return false;
        } 
    }
}