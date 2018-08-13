using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using EntityLayer;

namespace BusinessLogicLayer
{
    public class BillBusinessLogic
    {
        DataTable aDataTable = new DataTable();
        BillDataAccess aDataAccess = new BillDataAccess();
        public DataTable GetBill()
        {
            aDataTable.Clear();
            aDataTable = aDataAccess.GetBill().Tables["BillingMode"];
            return aDataTable;
        }

        public int GetBillId()
        {
            return aDataAccess.GetBillId();
        }


        public int GetBillInfo(BillSystem aBillSystem)
        {
            int result=0;
            SqlParameter[] aSqlParameters = new SqlParameter[4];
            aSqlParameters[0] = new SqlParameter("@BillId", SqlDbType.Int);
            aSqlParameters[0].Value = aBillSystem.BillId;

            aSqlParameters[1] = new SqlParameter("@BillAmount", SqlDbType.Float);
            aSqlParameters[1].Value = aBillSystem.BillAmount;

            aSqlParameters[2] = new SqlParameter("@CardNumber", SqlDbType.VarChar, 50);
            aSqlParameters[2].Value = aBillSystem.CardNumber;

            aSqlParameters[3] = new SqlParameter("@ModeOfPayment", SqlDbType.VarChar, 10);
            aSqlParameters[3].Value = aBillSystem.ModeOfPayment;


            result = aDataAccess.AddBilltDetails(aSqlParameters);

            return result;
        }

      
    }

}
