using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class PhysicianBusinessLogic
    {
        DataTable aPhysicianDataTable = new DataTable();
        PhysicianDataAccess aDataAccess = new PhysicianDataAccess();
        public DataTable GetPhysician()
        {
            aPhysicianDataTable.Clear();
            aPhysicianDataTable = aDataAccess.GetPhysician().Tables["Physician"];
            return aPhysicianDataTable;
        }
    }
}
