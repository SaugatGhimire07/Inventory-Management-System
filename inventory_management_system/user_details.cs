using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class user_details
    {
        universalconnect uconnect = new universalconnect();
        public DataTable Verify(string email, string password, bool isAdmin)
        {

            universalconnect universalconn = new universalconnect();

            string userQuery = "SELECT * FROM [user_details] WHERE email='" + email + "'" + " AND password ='" + password + "'" + " AND is_admin=" + "'" + isAdmin + "'";
            //System.Diagnostics.Debug.WriteLine("User: ", userQuery);
            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(userQuery, universalconn.connect);

            DataSet dSet = new DataSet();
            sqldataAdapt.Fill(dSet, "user_details");

            return dSet.Tables[0];
        }

        public void newUser(string username, string contact_no, string email, string password, string address)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [user_details](username, email, password, address, contact_no, is_admin) VALUES (@username,  @email, @password, @address, @contact_no, @isAdmin)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@username", username);
            sqlCmnd.Parameters.AddWithValue("@email", email);
            sqlCmnd.Parameters.AddWithValue("@password", password);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@contact_no", contact_no);
            sqlCmnd.Parameters.AddWithValue("@isAdmin", false);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetUsers()
        {
            universalconnect universalconn = new universalconnect();

            string userQuery = "SELECT * FROM [user_details]";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(userQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public void UpdateUser(string user_id, string username, string email, string password, string address, string contact_no)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [user_details] SET username = @username, email = @email, password = @password, address = @address, contact_no = @contact_no WHERE user_id = @user_id", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@user_id", user_id);
            sqlCmnd.Parameters.AddWithValue("@username", username);
            sqlCmnd.Parameters.AddWithValue("@email", email);
            sqlCmnd.Parameters.AddWithValue("@password", password);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@contact_no", contact_no);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public void RemoveUser(string @user_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [user_details] WHERE user_id = @user_id", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@user_id", user_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}