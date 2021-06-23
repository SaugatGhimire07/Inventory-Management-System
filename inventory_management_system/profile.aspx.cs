using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace inventory_management_system
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            Profile changePassword = new Profile();
            changePassword.ChangePassword(Session["user_id+"].ToString(), inputPassword.Text);

            pnlSuccess.Visible = true;
            inputPassword.Text = "";
            alrtSuccess.Text = "Password Changed Successfully!";
        }
    }
}