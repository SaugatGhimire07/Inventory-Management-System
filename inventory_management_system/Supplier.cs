using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class Supplier
    {
        universalconnect uconnect = new universalconnect();

        public void newSupplier(string supplier_name, string address, string phone_no)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [supplier_details](supplier_name, address, phone_no) VALUES (@supplier_name,  @address, @phone_no)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@supplier_name", supplier_name);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@phone_no", phone_no);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetSupplier()
        {
            universalconnect universalconn = new universalconnect();

            string userQuery = "SELECT * FROM [supplier_details]";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(userQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public void UpdateSupplier(string supplier_id, string supplier_name, string address, string phone_no)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [supplier_details] SET supplier_name = @supplier_name, address = @address, phone_no = @phone_no WHERE supplier_id = @supplier_id", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@supplier_id", supplier_id);
            sqlCmnd.Parameters.AddWithValue("@supplier_name", supplier_name);
            sqlCmnd.Parameters.AddWithValue("@address", address);
            sqlCmnd.Parameters.AddWithValue("@phone_no", phone_no);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public void RemoveSupplier(string @supplier_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [supplier_details] WHERE supplier_id = @supplier_id", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@supplier_id", supplier_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}