using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;

public static class Helper
{
    public static String WEBSITE_NAME = "EduChamp";
    public static String WEBSITE_FULL_NAME = "Online College Management System";
    public static String WEBSITE_EMAIL = "admin@educamp.org";
    public static String WEBSITE_PHONE = "6354634577";


    // Other Details
    public static String WEBSITE_STUDENT_PATH = "public/students/";
    public static String WEBSITE_FACULTY_PATH = "public/facultly/";

    public static String get_Faculty_Image(String name = "")
    {
        if (name.Equals(""))
        {
            name = "photo.png";
        }
        return Helper.WEBSITE_FACULTY_PATH + name;
    }

    public static String get_Student_Image(String name = "")
    {
        if (name.Equals(""))
        {
            name = "photo.png";
        }
        return Helper.WEBSITE_STUDENT_PATH + name;
    }

    public static String S(Object o)
    {
        return o.ToString().Trim();
    }

    public static string Genrate_New_Password(int length = 8)
    {
        Random random = new Random();
        const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        return new string(Enumerable.Repeat(chars, length)
          .Select(s => s[random.Next(s.Length)]).ToArray());
    }

    public static String[] getArrayWithAddedString(String[] eles, String newele)
    {
        String[] neweles = new String[eles.Length + 1];
        int i = 0;
        foreach (String ele in eles)
        {
            neweles[i++] = ele;
        }
        neweles[i] = newele;
        return neweles;
    }

    public static void setAmsg(String amsg)
    {
        if (HttpContext.Current.Session["amsg"] == null)
        {
            String[] s = new String[] { amsg };
            HttpContext.Current.Session["amsg"] = s;
        }
        else
        {
            HttpContext.Current.Session["amsg"] = getArrayWithAddedString((String[])HttpContext.Current.Session["amsg"], amsg);
        }
    }

    public static void setSmsg(String smsg)
    {
        if (HttpContext.Current.Session["smsg"] == null)
        {
            String[] s = new String[] { smsg };
            HttpContext.Current.Session["smsg"] = s;
        }
        else
        {
            HttpContext.Current.Session["smsg"] = getArrayWithAddedString((String[])HttpContext.Current.Session["smsg"], smsg);
        }
    }

   
}
