using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class Dashboard : System.Web.UI.Page
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
            user_details addUser = new user_details();
            addUser.newUser(inputName.Text, inputPhone.Text, inputEmail.Text, inputPassword.Text, inputAddress.Text);
            pnlSuccess.Visible = true;
            inputName.Text = "";
            inputPhone.Text = "";
            inputEmail.Text = "";
            inputPassword.Text = "";
            inputAddress.Text = "";
            alrtSuccess.Text = "New User Added!";
            RetrieveGridView();
        }

        protected void RetrieveGridView()
        {
            user_details getUsers = new user_details();
            newUserTable.DataSource = getUsers.GetUsers();
            newUserTable.DataBind();
        }

        protected void UserSelectCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case "edituser":
                        int index = Convert.ToInt32(e.CommandArgument);
                        GridViewRow row = newUserTable.Rows[index];

                        inputId.Text = row.Cells[0].Text;
                        inputName.Text = row.Cells[1].Text;
                        inputEmail.Text = row.Cells[2].Text;
                        inputPassword.Text = row.Cells[3].Text;
                        inputPhone.Text = row.Cells[4].Text;
                        inputAddress.Text = row.Cells[5].Text;
                        break;

                    case "deleteuser":
                        user_details deleteUser = new user_details();
                        int token = Convert.ToInt32(e.CommandArgument);
                        GridViewRow record = newUserTable.Rows[token];

                        deleteUser.RemoveUser(record.Cells[0].Text);
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
                user_details updateUser = new user_details();
                updateUser.UpdateUser(inputId.Text, inputName.Text, inputEmail.Text, inputPassword.Text, inputAddress.Text, inputPhone.Text);

                pnlSuccess.Visible = true;
                inputName.Text = "";
                inputPhone.Text = "";
                inputEmail.Text = "";
                inputPassword.Text = "";
                inputAddress.Text = "";
                alrtSuccess.Text = "User Updated Successfully!";
                RetrieveGridView();
        }
    }
}