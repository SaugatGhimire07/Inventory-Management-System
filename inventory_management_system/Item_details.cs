using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class Item_details
    {
        universalconnect uconnect = new universalconnect();
        public void newItems(string item_name, string description, string unit_price, string purchase_date, string manufacture_date, string expiry_date, string category_id, string quantity_available, string supplier_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("INSERT INTO [item_details](item_name, description, unit_price, purchase_date, manufacture_date, expiry_date, category_id, quantity_available, supplier_id) VALUES (@item_name,  @description, @unit_price, @purchase_date, @manufacture_date, @expiry_date, @category_id, @quantity_available, @supplier_id)", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@item_name", item_name);
            sqlCmnd.Parameters.AddWithValue("@description", description);
            sqlCmnd.Parameters.AddWithValue("@unit_price", unit_price);
            sqlCmnd.Parameters.AddWithValue("@purchase_date", purchase_date);
            sqlCmnd.Parameters.AddWithValue("@manufacture_date", manufacture_date);
            sqlCmnd.Parameters.AddWithValue("@expiry_date", expiry_date);
            sqlCmnd.Parameters.AddWithValue("@category_id", category_id);
            sqlCmnd.Parameters.AddWithValue("@quantity_available", quantity_available);
            sqlCmnd.Parameters.AddWithValue("@supplier_id", supplier_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public DataTable GetItems()
        {
            universalconnect universalconn = new universalconnect();

            string itemQuery = "SELECT item_details.item_id, item_details.item_name, item_details.description, item_details.unit_price, item_details.purchase_date, item_details.manufacture_date, item_details.expiry_date, category.category_type, item_details.quantity_available, supplier_details.supplier_name FROM item_details inner join category on (category.category_id = item_details.category_id) inner join supplier_details on (supplier_details.supplier_id = item_details.supplier_id)";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(itemQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public void UpdateSupplier(string item_id, string item_name, string description, string unit_price, string purchase_date, string manufacture_date, string expiry_date, string quantity_available)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [item_details] SET  item_name = @item_name, description = @description, unit_price = @unit_price, purchase_date = @purchase_date, manufacture_date = @manufacture_date, expiry_date = @expiry_date, quantity_available = @quantity_available WHERE item_id = @item_id", uconnect.connect);

            sqlCmnd.Parameters.AddWithValue("@item_id", item_id);
            sqlCmnd.Parameters.AddWithValue("@item_name", item_name);
            sqlCmnd.Parameters.AddWithValue("@description", description);
            sqlCmnd.Parameters.AddWithValue("@unit_price", unit_price);
            sqlCmnd.Parameters.AddWithValue("@purchase_date", purchase_date);
            sqlCmnd.Parameters.AddWithValue("@manufacture_date", manufacture_date);
            sqlCmnd.Parameters.AddWithValue("@expiry_date", expiry_date);
            sqlCmnd.Parameters.AddWithValue("@quantity_available", quantity_available);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }

        public void RemoveItem(string @item_id)
        {
            SqlCommand sqlCmnd = new SqlCommand("DELETE FROM [item_details] WHERE item_id = @item_id", uconnect.connect);
            sqlCmnd.Parameters.AddWithValue("@item_id", @item_id);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}