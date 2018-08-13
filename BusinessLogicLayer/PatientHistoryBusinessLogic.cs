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
    public class PatientHistoryBusinessLogic
    {
        PatientHistoryDataAccess aDataAccess = new PatientHistoryDataAccess();
        DataTable aHistoryPatientDataTable = new DataTable();
        public DataTable GetSearchPatientHistory(int patientId, string firstName, string lastName)
        {
            aHistoryPatientDataTable.Clear();
            aHistoryPatientDataTable = aDataAccess.GetSearchPatientHistory(patientId,firstName,lastName).Tables[0];
            return aHistoryPatientDataTable;
        }
    }
}
