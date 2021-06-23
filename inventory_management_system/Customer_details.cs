using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class Customer_details
    {
        universalconnect uconnect = new universalconnect();

        public void newCustomer(string name, string address, string contact_no, string email, string member_type)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [customer_details](name, address, contact_no, email, member_type) VALUES (@name, @address, @contact_no, @email, @member_type)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@name", name);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@contact_no", contact_no);
            sqlCmnd.Parameters.AddWithValue("@email", email);
            sqlCmnd.Parameters.AddWithValue("@member_type", member_type);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetCustomer()
        {
            universalconnect universalconn = new universalconnect();

            string customerQuery = "SELECT * FROM [customer_details]";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(customerQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public void UpdateCustomer(string member_number, string name, string address, string contact_no, string email)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [customer_details] SET name = @name, address = @address, contact_no = @contact_no, email = @email WHERE member_number = @member_number ", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@member_number", member_number);
            sqlCmnd.Parameters.AddWithValue("@name", name);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@contact_no", contact_no);
            sqlCmnd.Parameters.AddWithValue("@email", email);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public void RemoveCustomer(string @member_number)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [customer_details] WHERE member_number = @member_number", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@member_number", member_number);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}