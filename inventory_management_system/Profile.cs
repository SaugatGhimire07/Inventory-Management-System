using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class Profile
    {
        universalconnect uconnect = new universalconnect();
        public void ChangePassword(string user_id, string password)
        {
            SqlCommand sqlCmnd = new SqlCommand("UPDATE [user_details] SET password = @password WHERE user_id = @user_id", uconnect.connect);


            sqlCmnd.Parameters.AddWithValue("@user_id", user_id);
            sqlCmnd.Parameters.AddWithValue("@password", password);

            sqlCmnd.ExecuteNonQuery();
            uconnect.connect.Close();
        }
    }
}