using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{

    public class PhysicianDataAccess : Gateway
    {
        DataSet aDataSet = new DataSet();
        public DataSet GetPhysician()
        {
            aCommand = new SqlCommand("spGetPhysicianIdName", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aConnection.Open();
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "Physician");
            aConnection.Close();
            return aDataSet;
        }
    }
}
