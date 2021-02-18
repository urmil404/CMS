using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;



public static class Helper
{
	private static SqlConnection con;
	public static String WEBSITE_NAME = "EduChamp";
	public static String WEBSITE_FULL_NAME = "Online College Management System";
	public static String WEBSITE_EMAIL = "admin@educamp.org";
	public static String WEBSITE_PHONE = "6354634577";

	public static SqlConnection getCon()
	{
		if (con == null)
		{
			con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
			con.Open();
		}
		return con;
	}

	public static int Scaller(String qry)
	{
		SqlCommand cmd = new SqlCommand(qry, getCon());
		int res = (int)cmd.ExecuteScalar();
		//HttpContext.Current.Response.Write("namo");
		return res;
	}

    public static SqlDataReader myInsert(string qry)
    {
        SqlCommand cmd = new SqlCommand(qry, getCon());
        SqlDataReader reader = cmd.ExecuteReader();
        return reader;
    }
    public static int MyNoQ(string qry)
    {
        SqlCommand cmd = new SqlCommand(qry, getCon());
        return cmd.ExecuteNonQuery();
    }

    
	public static String S(Object o)
	{
		return o.ToString().Trim();
	}
	public static void Namee()
	{
		HttpContext.Current.Response.Write("hello ji");
	}


	// for set dynamic messages

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
