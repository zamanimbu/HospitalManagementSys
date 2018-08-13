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
    public class PatiendDiagnososBusinessLogic
    {
        PatientDiagnosisDataAccess aDataAccess = new PatientDiagnosisDataAccess();
        public int AddPatientDiagnosis(PatientDiagnosis aPatientDiagnosis)
        {
            int result = 0;
            SqlParameter[] aSqlParameters = new SqlParameter[8];

            aSqlParameters[0] = new SqlParameter("@DiagnosisId", SqlDbType.VarChar, 5000);
            aSqlParameters[0].Value = aPatientDiagnosis.DiagnosisId;


            aSqlParameters[1] = new SqlParameter("@Symptoms", SqlDbType.VarChar, 5000);
            aSqlParameters[1].Value = aPatientDiagnosis.Symptoms;

            aSqlParameters[2] = new SqlParameter("@DiagnosisProvided", SqlDbType.VarChar, 50);
            aSqlParameters[2].Value = aPatientDiagnosis.DiagnosisProvided;

            aSqlParameters[3] = new SqlParameter("@AdministeredBy", SqlDbType.VarChar, 50);
            aSqlParameters[3].Value = aPatientDiagnosis.AdministeredBy;

            aSqlParameters[4] = new SqlParameter("@DateOfDiagnosis", SqlDbType.VarChar, 50);
            aSqlParameters[4].Value = aPatientDiagnosis.DateOfDiagnosis;

            aSqlParameters[5] = new SqlParameter("@FollowUpRequired", SqlDbType.VarChar,2);
            aSqlParameters[5].Value = aPatientDiagnosis.FollowUpRequired;

            aSqlParameters[6] = new SqlParameter("@DateOfFollowUp", SqlDbType.VarChar, 50);
            aSqlParameters[6].Value = aPatientDiagnosis.DateOfFollowUp;

            aSqlParameters[7] = new SqlParameter("@BillId", SqlDbType.Int);
            aSqlParameters[7].Value = aPatientDiagnosis.BillId;

            result = aDataAccess.AddPatientDiagnosis(aSqlParameters);

            return result;
        }

        public int GetDiagnosisId()
        {
            return aDataAccess.GetDiagnosisId();
        }
    }
}
