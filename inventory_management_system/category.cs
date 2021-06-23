using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class category
    {
        universalconnect uconnect = new universalconnect();

        public void newCategory(string category_type)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [category](category_type) VALUES (@category_type)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@category_type", category_type);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetCategory()
        {
            universalconnect universalconn = new universalconnect();

            string userQuery = "SELECT * FROM [category]";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(userQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }


        public void UpdateCategory(string category_id, string category_type)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [category] SET category_type = @category_type WHERE category_id = @category_id", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@category_id", category_id);
            sqlCmnd.Parameters.AddWithValue("@category_type", category_type);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public void RemoveCategory(string @category_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [category] WHERE category_id = @category_id", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@category_id", category_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}