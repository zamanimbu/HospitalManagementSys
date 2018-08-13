using System;
using BusinessLogicLayer;
using EntityLayer;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace HmsTest
{
    [TestClass]
    public class AddPhysicianTest
    {
        AddPhysicianBusinessLogic aBusinessLogic = new AddPhysicianBusinessLogic();
        [TestMethod]
        [TestCategory("AddPhysician")]
        public void CheckNameBusinessLogicTest()
        {
            bool predict = aBusinessLogic.CheckNameBusinessLogic("A", "B");
            Assert.AreEqual(predict,true);
        }

        [TestMethod]
        [TestCategory("AddPhysician")]
        public void AddPhysicianBusinessTest()
        {
            Physician aPhysician = new Physician
            {
                PhysicianId = "P001",
                FirstName = "C",
                LastName = "D",
                DepartmentId = "D001",
                EducationalQualification = "S",
                YearsOfExperience = 3,
                StateId = "1",
                PlanId = "2"
            };
            int predict = aBusinessLogic.AddPhysician(aPhysician);
            Assert.AreEqual(predict,1);
        }


    }
}
