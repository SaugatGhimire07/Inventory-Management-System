using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class Category : System.Web.UI.Page
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
            category addCategory = new category();
            addCategory.newCategory(inputCategory.Text);
            pnlSuccess.Visible = true;
            inputCategory.Text = "";
            alrtSuccess.Text = "New Category Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            category addCategory = new category();
            newCategoryTable.DataSource = addCategory.GetCategory();
            newCategoryTable.DataBind();
        }

        protected void CategorySelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "editcategory":
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = newCategoryTable.Rows[index];

                        inputId.Text = row.Cells[0].Text;
                        inputCategory.Text = row.Cells[1].Text;
                        break;

                    case "deletecategory":
                        category deleteCategory = new category();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newCategoryTable.Rows[token];

                        deleteCategory.RemoveCategory(record.Cells[0].Text);
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
            category updateCat = new category();
            updateCat.UpdateCategory(inputId.Text, inputCategory.Text);

            pnlSuccess.Visible = true;
            inputCategory.Text = "";
            alrtSuccess.Text = "Category Updated Successfully!";
            RetrieveGridView();
        }

    }
}