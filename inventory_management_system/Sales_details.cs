using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class Sales_details
    {
        universalconnect uconnect = new universalconnect();
        public void newSales(string quantity_bought, string total_amount, string item_id, string member_number, string sales_date)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [sales_details](quantity_bought, total_amount, item_id, member_number, sales_date) VALUES (@quantity_bought,  @total_amount, @item_id, @member_number, @sales_date)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@quantity_bought", quantity_bought);
            sqlCmnd.Parameters.AddWithValue("@total_amount", total_amount);
            sqlCmnd.Parameters.AddWithValue("@item_id", item_id);
            sqlCmnd.Parameters.AddWithValue("@member_number", member_number);
            sqlCmnd.Parameters.AddWithValue("@sales_date", sales_date);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetSales()
        {
            universalconnect universalconn = new universalconnect();

            string salesQuery = "SELECT TOP 1 sales_details.sales_id, item_details.item_name, sales_details.quantity_bought, sales_details.total_amount, customer_details.name, sales_details.sales_date FROM sales_details inner join item_details on (item_details.item_id = sales_details.item_id) inner join customer_details on (customer_details.member_number = sales_details.member_number ) ORDER BY sales_id DESC";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(salesQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public void RemoveSales(string @sales_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [sales_details] WHERE item_id = @item_id", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@sales_id", @sales_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}