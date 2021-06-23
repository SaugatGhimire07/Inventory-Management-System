using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class purchase_details
    {
        public DataTable GetPurchase(string member_number)
        {
            universalconnect universalconn = new universalconnect();

            string purchaseQuery = "SELECT item_details.item_name, category.category_type, item_details.unit_price, sales_details.quantity_bought, sales_details.sales_date, sales_details.total_amount FROM sales_details inner join item_details on (sales_details.item_id = item_details.item_id) inner join category on (category.category_id = item_details.category_id) where sales_details.member_number = '"+ member_number +"' AND DATEDIFF(day, sales_date, GETDATE()) <= 31";

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(purchaseQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }


    }
}