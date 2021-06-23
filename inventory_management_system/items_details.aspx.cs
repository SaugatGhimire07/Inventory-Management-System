using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class items_details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                category linkCategory = new category();
                CategoryDropDown.DataSource = linkCategory.GetCategory();
                CategoryDropDown.DataBind();
                CategoryDropDown.DataTextField = "category_type";
                CategoryDropDown.DataValueField = "category_id";
                CategoryDropDown.DataBind();


                Supplier linkSupplier = new Supplier();
                SupplierDropDown.DataSource = linkSupplier.GetSupplier();
                SupplierDropDown.DataBind();
                SupplierDropDown.DataTextField = "supplier_name";
                SupplierDropDown.DataValueField = "supplier_id";
                SupplierDropDown.DataBind();
                RetrieveGridView();
            }

        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            Item_details addItems = new Item_details();
            addItems.newItems(inputName.Text, inputDesc.Text, inputPrice.Text, inputPurchase.Text, inputManufacture.Text, inputExpiry.Text, CategoryDropDown.SelectedItem.Value, inputQuantity.Text, SupplierDropDown.SelectedItem.Value);
            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputDesc.Text = "";
            inputPrice.Text = "";
            inputPurchase.Text = "";
            inputManufacture.Text = "";
            inputExpiry.Text = "";
            inputQuantity.Text = "";
            alrtSuccess.Text = "New Items Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            Item_details getItems = new Item_details();
            newItemTable.DataSource = getItems.GetItems();
            newItemTable.DataBind();
        }

        protected void ItemSelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "edititem":
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = newItemTable.Rows[index];

                        inputId.Text = row.Cells[0].Text;
                        inputName.Text = row.Cells[1].Text;
                        inputDesc.Text = row.Cells[2].Text;
                        inputPrice.Text = row.Cells[3].Text;
                        inputPurchase.Text = row.Cells[4].Text;
                        inputManufacture.Text = row.Cells[5].Text;
                        inputExpiry.Text = row.Cells[6].Text;
                        inputQuantity.Text = row.Cells[8].Text;
                        break;

                    case "deleteitem":
                        Item_details deleteItems = new Item_details();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newItemTable.Rows[token];

                        deleteItems.RemoveItem(record.Cells[0].Text);
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
            Item_details updateItems = new Item_details();
            updateItems.UpdateSupplier(inputId.Text, inputName.Text, inputDesc.Text, inputPrice.Text, inputPurchase.Text, inputManufacture.Text, inputExpiry.Text, inputQuantity.Text);

            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputDesc.Text = "";
            inputPrice.Text = "";
            inputPurchase.Text = "";
            inputManufacture.Text = "";
            inputExpiry.Text = "";
            inputQuantity.Text = "";
            alrtSuccess.Text = "Item Updated Successfully!";
            RetrieveGridView();
        }
    }
}