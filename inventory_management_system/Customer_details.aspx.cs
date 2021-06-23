using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class Customer_details1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RetrieveGridView();
            }
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Customer_details addCustomer = new Customer_details();
            addCustomer.newCustomer(inputName.Text, inputAddress.Text, inputPhone.Text, inputEmail.Text, CustDropDown.SelectedItem.Value);
            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputPhone.Text = "";
            inputEmail.Text = "";
            inputAddress.Text = "";
            alrtSuccess.Text = "New Customer Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            Customer_details getCustomer = new Customer_details();
            newCustomerTable.DataSource = getCustomer.GetCustomer();
            newCustomerTable.DataBind();
        }

        protected void CustomerSelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "editcustomer":
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = newCustomerTable.Rows[index];

                        inputId.Text = row.Cells[0].Text;
                        inputName.Text = row.Cells[1].Text;
                        inputAddress.Text = row.Cells[2].Text;
                        inputPhone.Text = row.Cells[3].Text;
                        inputEmail.Text = row.Cells[4].Text;
                        break;

                    case "deletecustomer":
                        Customer_details deleteCustomer = new Customer_details();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newCustomerTable.Rows[token];

                        deleteCustomer.RemoveCustomer(record.Cells[0].Text);
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

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            Customer_details updateCustomer = new Customer_details();
            updateCustomer.UpdateCustomer(inputId.Text, inputName.Text, inputAddress.Text, inputPhone.Text, inputEmail.Text);

            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputPhone.Text = "";
            inputEmail.Text = "";
            inputAddress.Text = "";

            alrtSuccess.Text = "Customer Updated Successfully!";
            RetrieveGridView();
        }
    }
}