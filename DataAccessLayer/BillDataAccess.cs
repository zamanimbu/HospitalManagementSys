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
    public class BillDataAccess:Gateway
    {
        DataSet aDataSet = new DataSet();
        public DataSet GetBill()
        {
            aCommand = new SqlCommand("spGetBillingMode", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aConnection.Open();
            aDataAdapter = new SqlDataAdapter(aCommand);
            aDataAdapter.Fill(aDataSet, "BillingMode");
            aConnection.Close();
            return aDataSet;

        }

        public int GetBillId()
        {
            int temp;
            aCommand = new SqlCommand();
            aCommand.Connection = aConnection;
            aCommand.CommandText = "Select Count(BillId) from Billing";
            aConnection.Open();
            temp = Convert.ToInt32(aCommand.ExecuteScalar());
            aConnection.Close();
            return temp;
        }


        public int AddBilltDetails(SqlParameter[] aSqlParameters)
        {
            int result = 0;
            aCommand = new SqlCommand("spBillInfo", aConnection);
            aCommand.CommandType = CommandType.StoredProcedure;
            aCommand.Parameters.AddRange(aSqlParameters);
            aConnection.Open();
            result = aCommand.ExecuteNonQuery();
            aConnection.Close();
            return result;
        }
    }
}
