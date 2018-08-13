using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class PatientDiagnosisDataAccess :Gateway
    {
        public int AddPatientDiagnosis(SqlParameter[] aSqlParameters)
        {
            int result = 0;
            aCommand = new SqlCommand("spPatientDiagnosis", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.AddRange(aSqlParameters);
            aConnection.Open();
            result = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return result;
        }

        public int GetDiagnosisId()
        {
            int temp;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "Select Count(DiagnosisId) from PatientDiagnosis";
            aConnection.Open();
            temp = Convert.ToInt32(aCommand.ExecuteScalar());
            aConnection.Close();
            return temp;
        }
    }
}
