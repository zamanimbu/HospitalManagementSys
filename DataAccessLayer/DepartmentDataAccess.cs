using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DepartmentDataAccess : Gateway
    {
        DataSet aDataSet = new DataSet();
        public DataSet GetAllDepartments()
        {
            aCommand = new SqlCommand("USPDepartment",aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aConnection.Open();
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "Department");
            aConnection.Close();
            return aDataSet;

        }
    }
}
