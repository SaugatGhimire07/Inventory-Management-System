using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace inventory_management_system
{
    public partial class loginpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                user_details user = new user_details();
                DataTable solution = user.Verify(exampleInputEmail.Text, exampleInputPassword.Text, CheckBox1.Checked);

                if (solution.Rows.Count > 0)
                {
                    Session["user_id"] = solution.Rows[0]["user_id"].ToString();

                    Session["role"] = Convert.ToBoolean(solution.Rows[0]["is_admin"].ToString()) ? "Admin" : "User";

                    ErrorMsg.Text = "";
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    ErrorMsg.Text = "Please enter correct email and password";
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = ex.Message;
            }
        }
    }
}