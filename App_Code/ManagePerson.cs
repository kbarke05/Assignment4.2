using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public class ManagePerson
{

    Customer c;
    int id;
    SqlConnection connect;

    public ManagePerson(int customerID)
    {

        id = customerID;
        connect = new SqlConnection(ConfigurationManager.ConnectionStrings["CommunityAssist"].ConnectionString);
    }

    public Customer GetCustomer()
    {
         Customer c = new Customer();
         string sql = "Select PersonLastName, PersonFirstName, PersonUsername "
             + "from Person "
           // + "Inner Join person P "//need to fix this
            //+ "on p.PersonKey=P.PersonKey "//need to fix this
           + "Where PersonKey=@customerID";

        SqlCommand cmd = new SqlCommand(sql, connect);
        cmd.Parameters.AddWithValue("@CustomerID", id);
        SqlDataReader reader;

        connect.Open();
        reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                c.LastName = reader["PersonLastName"].ToString();
                c.FirstName = reader["PersonFirstName"].ToString();
                c.email = reader["PersonUserName"].ToString();
            }
        }
        reader.Close();
        connect.Close();

        return c;
    }


}