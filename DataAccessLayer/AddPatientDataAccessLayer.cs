using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class AddPatientDataAccessLayer : Gateway
    {
        
        public DataSet DataFillsStateDetails()
        {
            DataSet aDataSet = new DataSet();
            aCommand = new SqlCommand("USPState", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aConnection.Open();
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "State");
            aConnection.Close();
            return aDataSet;
        }

        public DataSet DataFillPlanDetails()
        {
            DataSet aDataSet = new DataSet();
            aCommand = new SqlCommand("USPPlan", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aConnection.Open();
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "Plan");
            aConnection.Close();
            return aDataSet;
        }

        public int FetchPatientId()
        {
            int temp ;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "Select Count(PatientId) from PatientDetals";
            aConnection.Open();
            temp = Convert.ToInt32(aCommand.ExecuteScalar());
            aConnection.Close();
            return temp;
        }

        public int AddPatientDetails(SqlParameter[] aSqlParameters)
        {
            int result = 0;
            aCommand = new SqlCommand("USPPatientDetals", aConnection);          
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.AddRange(aSqlParameters);
            aConnection.Open();
            result = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return result;
        }

        public bool CheckNameExist(string firstaName, string lastName)
        {
            bool isNameExist = false;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "select * from PatientDetals where FirstName = '"+firstaName+ "' and LastName = '"+lastName+"' ";
            aConnection.Open();
            SqlDataReader aReader = aCommand.ExecuteReader();
            while (aReader.Read())
            {
                isNameExist = true;
            }
            aReader.Close();
            aConnection.Close();

            return isNameExist;

        }
    }
}
