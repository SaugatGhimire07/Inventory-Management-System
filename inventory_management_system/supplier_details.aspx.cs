using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class supplier_details : System.Web.UI.Page
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
            Supplier addSupplier = new Supplier();
            addSupplier.newSupplier(inputName.Text, inputAddress.Text, inputPhone.Text);
            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputAddress.Text = "";
            inputPhone.Text = "";
            alrtSuccess.Text = "New Supplier Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            Supplier addSupplier = new Supplier();
            newSupplierTable.DataSource = addSupplier.GetSupplier();
            newSupplierTable.DataBind();
        }

        protected void SupplierSelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "editsupplier":
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = newSupplierTable.Rows[index];

                        inputId.Text = row.Cells[0].Text;
                        inputName.Text = row.Cells[1].Text;
                        inputAddress.Text = row.Cells[2].Text;
                        inputPhone.Text = row.Cells[3].Text;
                        break;

                    case "deletesupplier":
                        Supplier deleteSupplier = new Supplier();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newSupplierTable.Rows[token];

                        deleteSupplier.RemoveSupplier(record.Cells[0].Text);
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
            Supplier updateSupplier = new Supplier();
            updateSupplier.UpdateSupplier(inputId.Text, inputName.Text, inputAddress.Text, inputPhone.Text);

            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputAddress.Text = "";
            inputPhone.Text = "";
            alrtSuccess.Text = "User Updated Successfully!";
            RetrieveGridView();
        }
    }
}