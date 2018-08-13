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
    public class AddPatientBusinessLayer
    {
        DataTable aStateDataTable = new DataTable();
        DataTable aPlanDataTable = new DataTable();
         AddPatientDataAccessLayer addPatientData = new AddPatientDataAccessLayer();
        public DataTable AddPtientBusinessLogicFillState()
        {
            aStateDataTable.Clear();
            aStateDataTable = addPatientData.DataFillsStateDetails().Tables["State"];
            return aStateDataTable;
        }

        public DataTable AddPtientBusinessLogicFillPlan()
        {
            aPlanDataTable.Clear();
            aPlanDataTable = addPatientData.DataFillPlanDetails().Tables["Plan"];
            return aPlanDataTable;
        }

        public int GeneratePatientIdBusinesslogic()
        {
            return addPatientData.FetchPatientId();
        }

        public int AddPatient(Patient aPatient)
        {
            int result = 0;
            SqlParameter[] aSqlParameters = new SqlParameter[8];
            aSqlParameters[0] = new SqlParameter("@PatientId", SqlDbType.Int);
            aSqlParameters[0].Value = aPatient.PatientId;

            aSqlParameters[1] = new SqlParameter("@FirstName", SqlDbType.VarChar, 50);
            aSqlParameters[1].Value = aPatient.FirstName;

            aSqlParameters[2] = new SqlParameter("@LastName", SqlDbType.VarChar, 50);
            aSqlParameters[2].Value = aPatient.LastName;

            aSqlParameters[3] = new SqlParameter("@DateOfBirth", SqlDbType.VarChar, 50);
            aSqlParameters[3].Value = aPatient.DateOfBirth;

            aSqlParameters[4] = new SqlParameter("@PhoneNumber", SqlDbType.Int);
            aSqlParameters[4].Value = aPatient.PhoneNumber;

            aSqlParameters[5] = new SqlParameter("@Email", SqlDbType.VarChar, 100);
            aSqlParameters[5].Value = aPatient.Email;

            aSqlParameters[6] = new SqlParameter("@State", SqlDbType.VarChar, 10);
            aSqlParameters[6].Value = aPatient.State;

            aSqlParameters[7] = new SqlParameter("@Plan", SqlDbType.VarChar, 10);
            aSqlParameters[7].Value = aPatient.Plan;

            result = addPatientData.AddPatientDetails(aSqlParameters);

            return result;
        }

        public bool CheckNameBusinessLogic(string firstaName, string lastName)
        {
            bool isNameExist = addPatientData.CheckNameExist(firstaName, lastName);

            return isNameExist;
        }
    }
}
