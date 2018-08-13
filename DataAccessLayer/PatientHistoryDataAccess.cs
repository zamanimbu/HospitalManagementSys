using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class PatientHistoryDataAccess : Gateway
    {
        DataSet aDataSet = new DataSet();
        public DataSet GetSearchPatientHistory(int patientId, string firstName, string lastName)
        {
            aCommand = new SqlCommand("spViewPatientHistory", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.Add("@PatientId", SqlDbType.Int).Value = patientId;
            aCommand.Parameters.Add("@FirstName", SqlDbType.VarChar).Value = firstName;
            aCommand.Parameters.Add("@LastName", SqlDbType.VarChar).Value = lastName;
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet);
            aConnection.Close();
            return aDataSet;
        }
    }
}
