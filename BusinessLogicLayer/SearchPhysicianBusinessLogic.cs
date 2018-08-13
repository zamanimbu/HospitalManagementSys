using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using EntityLayer;

namespace BusinessLogicLayer
{
    public class SearchPhysicianBusinessLogic
    {
        SearchPhysicianDataAccess aSearchPhysicianDataAccess = new SearchPhysicianDataAccess();
        DataTable aPhysicianDataTable = new DataTable();
        public DataTable GetAllPhysicianBySearch(string departmentName, string stateName, string planName)
        {
            aPhysicianDataTable.Clear();
            aPhysicianDataTable =  aSearchPhysicianDataAccess.GetAllPhysicianBySearch(departmentName, stateName, planName).Tables["Physician"];
            return aPhysicianDataTable;
        }
    }
}
