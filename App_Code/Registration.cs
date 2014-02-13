using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data; 
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Registration
/// This class takes a customer and vehicle object
/// extracts the properties from them
/// and writes them to the automart database
/// </summary>
public class Registration
{
    Customer c;
    
    SqlConnection connect;

    public Registration(Customer cust)
    {
        c = cust;
      
        //get the connection string from the web config file
        connect = new SqlConnection(ConfigurationManager.ConnectionStrings["CommunityAssist"].ConnectionString);
        //call the WriteToDatabase() method
        //it needs to be in a try catch because as the calling method
        //this is where the thrown method would be caught
        //we need to rethrow it so it makes it out
        //to the web form
        try
        {
            WriteToDatabase();
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    private void WriteToDatabase()
    {
        //set up the sql strings for each table  NEED NEW INSERT STATEMENT HERE!!!
        string sqlPerson = "Insert into Person(PersonLastName, PersonFirstName, PersonUsername,  PersonPlainPassword, Personpasskey, PersonEntryDate, PersonUserPassword)"
            + " Values(@LastName, @FirstName, @UserName, @Password, @Passcode,  getdate(), @hashed )";
        string sqlPersonAddress = "Insert into PersonAddress"
            + "(Street, Apartment, State, City, Zip, PersonKey)"
            + " Values(@Street, @Apartment, @State, @City, @Zip, Ident_current('Person'))";
        string sqlPersonContact = "Insert into PersonContact"
            + "(ContactInfo, PersonKey, ContactTypeKey)"
            + " Values (@Phone, Ident_current('Person'), 1)";


       

        //create a command for each sqlstring and provide values
        //for the parameters
        SqlCommand cmdPerson = new SqlCommand(sqlPerson, connect);
        cmdPerson.Parameters.AddWithValue("@LastName", c.LastName);
        cmdPerson.Parameters.AddWithValue("@FirstName", c.FirstName);
        cmdPerson.Parameters.AddWithValue("@UserName", c.email);
        cmdPerson.Parameters.AddWithValue("@Password", c.password);
        cmdPerson.Parameters.AddWithValue("@Passcode", c.passcode);
        cmdPerson.Parameters.AddWithValue("@hashed", c.PasswordHash);

        SqlCommand cmdPersonAddress = new SqlCommand(sqlPersonAddress, connect);
        cmdPersonAddress.Parameters.AddWithValue("@Street", c.address);
        cmdPersonAddress.Parameters.AddWithValue("@Apartment", c.apartment);
        cmdPersonAddress.Parameters.AddWithValue("@State", c.state);
        cmdPersonAddress.Parameters.AddWithValue("@City", c.city);
        cmdPersonAddress.Parameters.AddWithValue("@Zip", c.zipCode);

        SqlCommand cmdPersonContact = new SqlCommand(sqlPersonContact, connect);
        cmdPersonContact.Parameters.AddWithValue("@Phone", c.phone);
       

        

        //create a transaction object
        SqlTransaction tran = null;



        //open the connection
        connect.Open();
        //start the transaction
        tran = connect.BeginTransaction();

        //try the inserts, if all are successful
        //commit the transaction
        try
        {
            //assign all the commands to the same transaction
            cmdPerson.Transaction = tran;
            cmdPersonAddress.Transaction = tran;
            cmdPersonContact.Transaction = tran;
            
            

            cmdPerson.ExecuteNonQuery();
            cmdPersonAddress.ExecuteNonQuery();
            cmdPersonContact.ExecuteNonQuery();
           

            tran.Commit();
        }
        catch (Exception ex)
        {
            //if there are any errors
            //roll back the transaction 
            //and throw the error
            tran.Rollback();
            throw ex;
        }
        finally //no matter what
        {
            connect.Close();
        }



    }
}