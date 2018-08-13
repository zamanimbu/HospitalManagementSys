using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class DepartmentBusinessLogic
    {
        DataTable aDepartmentDataTable = new DataTable();
        DepartmentDataAccess aDepartmentDataAccess = new DepartmentDataAccess();
        public DataTable FillDepartment()
        {
            aDepartmentDataTable.Clear();
            aDepartmentDataTable = aDepartmentDataAccess.GetAllDepartments().Tables["Department"];
            return aDepartmentDataTable;
        }
    }
}
