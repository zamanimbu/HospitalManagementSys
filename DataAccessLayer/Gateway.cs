using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
   public class Gateway
    {
        private static string connectionString =
            ConfigurationManager.ConnectionStrings["HmsDbConnection"].ConnectionString;

       public SqlConnection aConnection = new SqlConnection(connectionString);
        public SqlCommand aCommand = null;
        public SqlDataAdapter aDataAdapter = null;

        
    }
}
