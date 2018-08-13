using System;
using BusinessLogicLayer;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Data;
using DataAccessLayer;
using EntityLayer;

namespace HmsTest
{
    [TestClass]
    public class AddPatientBusinessLayerTest
    {
        AddPatientBusinessLayer addPatientBusinessLayer = new AddPatientBusinessLayer();
        [TestMethod]
        [TestCategory("AddPatient")]
        public void AddPtientBusinessLogicFillStateTest()
        {
            DataTable aDataTable = addPatientBusinessLayer.AddPtientBusinessLogicFillState();
            int column = aDataTable.Columns.Count;
            int row = aDataTable.Rows.Count;
            Assert.IsNotNull(aDataTable);
            Assert.AreEqual(column, 2);
            Assert.AreEqual(row, 3);
        }
        [TestMethod]
        [TestCategory("AddPatient")]
        public void AddPtientBusinessLogicFillPlanTest()
        {
            DataTable aDataTable = addPatientBusinessLayer.AddPtientBusinessLogicFillPlan();
            int column = aDataTable.Columns.Count;
            int row = aDataTable.Rows.Count;
            Assert.IsNotNull(aDataTable);
            Assert.AreEqual(column, 2);
            Assert.AreEqual(row, 2);
        }

        [TestMethod]
        [TestCategory("AddPatient")]
        public void AddPatientTest()
        {
            Patient aPatient = new Patient
            {
                PatientId = 1,
                FirstName = "Ashraf",
                LastName = "Shahria",
                DateOfBirth = "23-10-1995",
                PhoneNumber = 01682393688,
                Email = "a@mail.com",
                State = "1",
                Plan = "1"
            };
            int predict = addPatientBusinessLayer.AddPatient(aPatient);
            Assert.AreEqual(predict,1);
        }

        [TestMethod]
        [TestCategory("AddPatient")]
        public void CheckNameBusinessLogicTest()
        {
            bool predict = addPatientBusinessLayer.CheckNameBusinessLogic("Ashraf", "Shahria");
            Assert.AreEqual(predict, true);
        }

    }
}
