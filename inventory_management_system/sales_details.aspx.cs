using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class sales_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Item_details linkItem = new Item_details();
                ItemDropDown.DataSource = linkItem.GetItems();
                ItemDropDown.DataBind();
                ItemDropDown.DataTextField = "item_name";
                ItemDropDown.DataValueField = "item_id";
                ItemDropDown.DataBind();


                Customer_details linkCustomer = new Customer_details();
                CustDropDown.DataSource = linkCustomer.GetCustomer();
                CustDropDown.DataBind();
                CustDropDown.DataTextField = "name";
                CustDropDown.DataValueField = "member_number";
                CustDropDown.DataBind();
                RetrieveGridView();
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Sales_details addSales = new Sales_details();
            addSales.newSales(inputQuantity.Text, inputAmount.Text, ItemDropDown.SelectedItem.Value, CustDropDown.SelectedItem.Value, inputSalesDate.Text);
            pnlSuccess.Visible = true;
            inputQuantity.Text = "";
            inputAmount.Text = "";
            inputSalesDate.Text = "";
            alrtSuccess.Text = "New Sales Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            Sales_details getSales = new Sales_details();
            newSalesTable.DataSource = getSales.GetSales();
            newSalesTable.DataBind();
        }

        protected void SalesSelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "deleteitem":
                        Item_details deleteSales = new Item_details();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newSalesTable.Rows[token];

                        deleteSales.RemoveItem(record.Cells[0].Text);
                        RetrieveGridView();
                        break;

                    default:
                        return;
                }
            }
            catch (Exception ex)
            {
                pnlError.Visible = true;
                alrtError.Text = ex.Message;
            }
        }
    }
}