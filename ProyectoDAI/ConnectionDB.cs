using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Web;

namespace ProyectoDAI
{
    public class ConnectionDB
    {
        public OdbcConnection con { get; set; }

        public ConnectionDB()
        {
            System.Configuration.Configuration webConfig;

            webConfig = System.Web.Configuration
                .WebConfigurationManager
                .OpenWebConfiguration("/dia-well");

            System.Configuration.ConnectionStringSettings connectionString;

            connectionString = webConfig.ConnectionStrings
                .ConnectionStrings["DefaultConnection"];

            con = new OdbcConnection(connectionString.ToString());

            con.Open();
        }
    }
}