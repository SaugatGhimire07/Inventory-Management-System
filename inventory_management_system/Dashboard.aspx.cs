using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class Dashboard1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dashboard getOutOfStock = new dashboard();
                newItemTable.DataSource = getOutOfStock.GetOutOfStockItem("Item Name");
                newItemTable.DataBind();
            }

            dashboard getUnsoldItem = new dashboard();
            unsoldItemTable.DataSource = getUnsoldItem.UnsoldItem();
            unsoldItemTable.DataBind();

            dashboard getInactiveCustomer = new dashboard();
            inactiveCustomerTable.DataSource = getInactiveCustomer.inacticeCustomer();
            inactiveCustomerTable.DataBind();
        }

        protected void RetrieveGridView()
        {
            dashboard getOutOfStock = new dashboard();
            newItemTable.DataSource = getOutOfStock.GetOutOfStockItem(sortDropDown.SelectedValue);
            newItemTable.DataBind();
        }

        protected void sortDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            RetrieveGridView();
        }
    }
}