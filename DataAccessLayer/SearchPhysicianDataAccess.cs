using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityLayer;

namespace DataAccessLayer
{
    public class SearchPhysicianDataAccess : Gateway
    {
        DataSet aDataSet = new DataSet();
        public DataSet GetAllPhysicianBySearch(string departmentName, string stateName, string planName)
        {
            aCommand = new SqlCommand("spSearchPhysician",aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.Add("@DepartmentId", SqlDbType.VarChar).Value = departmentName;
            aCommand.Parameters.Add("@StateId", SqlDbType.VarChar).Value = stateName;
            aCommand.Parameters.Add("@PlanId", SqlDbType.VarChar).Value = planName;
            //aCommand.Connection = aConnection;
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "Physician");
            aConnection.Close();

            return aDataSet;

        }
    }
}
