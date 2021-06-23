using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace inventory_management_system
{
    public class universalconnect
    {
        public SqlConnection connect;
        public universalconnect()
        {
            string sqlConnection = System.Configuration.ConfigurationManager
                .AppSettings.Get("MyConnection").ToString();
            connect = new SqlConnection(sqlConnection);
            connect.Open();
        }
    }
}