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
    public class AddPhysicianBusinessLogic
    {
        AddPhysicianDataAccess aAddPhysicianDataAccess = new AddPhysicianDataAccess();
        public int GeneratePhysicianIdBusinessLogic()
        {
            return aAddPhysicianDataAccess.CountPhysicianId();
        }

        public bool CheckNameBusinessLogic(string firstaName, string lastName)
        {
            bool isNameExist = aAddPhysicianDataAccess.CheckNameExist(firstaName, lastName);

            return isNameExist;
        }

        public int AddPhysician(Physician aPhysician)
        {
            int result = 0;
            SqlParameter[] aSqlParameters = new SqlParameter[8];
            aSqlParameters[0] = new SqlParameter("@PhysicianId", SqlDbType.VarChar, 50);
            aSqlParameters[0].Value = aPhysician.PhysicianId;

            aSqlParameters[1] = new SqlParameter("@FirstName", SqlDbType.VarChar, 50);
            aSqlParameters[1].Value = aPhysician.FirstName;

            aSqlParameters[2] = new SqlParameter("@LastName", SqlDbType.VarChar, 50);
            aSqlParameters[2].Value = aPhysician.LastName;

            aSqlParameters[3] = new SqlParameter("@DepartmentId", SqlDbType.VarChar,50);
            aSqlParameters[3].Value = aPhysician.DepartmentId;

            aSqlParameters[4] = new SqlParameter("@EducationalQualification", SqlDbType.VarChar, 500);
            aSqlParameters[4].Value = aPhysician.EducationalQualification;

            aSqlParameters[5] = new SqlParameter("@YearsOfExperience", SqlDbType.Float);
            aSqlParameters[5].Value = aPhysician.YearsOfExperience;

            aSqlParameters[6] = new SqlParameter("@StateId", SqlDbType.VarChar, 10);
            aSqlParameters[6].Value = aPhysician.StateId;

            aSqlParameters[7] = new SqlParameter("@PlanId", SqlDbType.VarChar, 10);
            aSqlParameters[7].Value = aPhysician.PlanId;

            result = aAddPhysicianDataAccess.AddPhysicianDetails(aSqlParameters);

            return result;
        }
    }
}
