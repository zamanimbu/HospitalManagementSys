using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class AddPhysicianDataAccess : Gateway
    {
        public int CountPhysicianId()
        {
            int temp;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "Select Count(PhysicianId) from Physician";
            aConnection.Open();
            temp = Convert.ToInt32(aCommand.ExecuteScalar());
            aConnection.Close();
            return temp;
        }

        public bool CheckNameExist(string firstaName, string lastName)
        {
            bool isNameExist = false;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "select * from Physician where FirstName = '" + firstaName + "' and LastName = '" + lastName + "' ";
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

        public int AddPhysicianDetails(SqlParameter[] aSqlParameters)
        {
            int result = 0;
            aCommand = new SqlCommand("USPPhysicianDetails", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.AddRange(aSqlParameters);
            aConnection.Open();
            result = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return result;
        }
    }
}
