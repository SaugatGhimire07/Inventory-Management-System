using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class dashboard
    {
        public DataTable GetOutOfStockItem(string sortItem)
        {
            universalconnect universalconn = new universalconnect();

            string itemQuery = "SELECT item_details.item_id, item_details.item_name, item_details.description, item_details.unit_price, category.category_type, supplier_details.supplier_name FROM item_details inner join category on (category.category_id = item_details.category_id) inner join supplier_details on (supplier_details.supplier_id = item_details.supplier_id) where quantity_available = 0";

            switch (sortItem)
            {
                case "Item Name":
                    itemQuery += " ORDER BY [item_details].item_name ASC";
                    break;

                case "Purchase Date":
                    itemQuery += " ORDER BY [item_details].purchase_date ASC";
                    break;

                case "Quantity":
                    itemQuery += " ORDER BY [item_details].quantity_available ASC";
                    break;
            }

            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(itemQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public DataTable UnsoldItem()
        {
            universalconnect universalconn = new universalconnect();

            string itemQuery = "SELECT item_details.item_id, item_details.item_name, item_details.description, item_details.unit_price, item_details.purchase_date FROM item_details inner join sales_details on (sales_details.item_id = item_details.item_id) WHERE item_details.item_id NOT IN (SELECT item_id from [sales_details] WHERE DATEDIFF(day, [sales_details].sales_date, GETDATE()) <= 31)";


            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(itemQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }

        public DataTable inacticeCustomer()
        {
            universalconnect universalconn = new universalconnect();

            string itemQuery = "SELECT customer_details.member_number, customer_details.name, customer_details.address, customer_details.contact_no, customer_details.email FROM customer_details inner join sales_details on (sales_details.member_number = customer_details.member_number) WHERE customer_details.member_number NOT IN (SELECT member_number from [sales_details] WHERE DATEDIFF(day, [sales_details].sales_date, GETDATE()) <= 31)";


            SqlDataAdapter sqldataAdapt = new SqlDataAdapter(itemQuery, universalconn.connect);

            DataTable dTable = new DataTable();
            sqldataAdapt.Fill(dTable);

            return dTable;
        }
    }
}