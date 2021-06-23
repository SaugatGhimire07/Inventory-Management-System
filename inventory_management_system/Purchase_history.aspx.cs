using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class Purchase_history : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(!IsPostBack)
            {
                Customer_details linkCustomer = new Customer_details();
                CustomerDropDown.DataSource = linkCustomer.GetCustomer();
                CustomerDropDown.DataBind();
                CustomerDropDown.DataTextField = "name";
                CustomerDropDown.DataValueField = "member_number";
                CustomerDropDown.DataBind();

                RetrieveGridView(CustomerDropDown.SelectedValue);
            }
        }

        protected void RetrieveGridView(string member_number)
        {
            purchase_details getPurchase = new purchase_details();
            newItemTable.DataSource = getPurchase.GetPurchase(member_number);
            newItemTable.DataBind();
        }

        protected void CustomerDropDown_SelectedIndexChanged(object sender, EventArgs e)
        {
            RetrieveGridView(CustomerDropDown.SelectedValue);
        }
    }
}