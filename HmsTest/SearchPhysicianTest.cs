using System;
using System.Data;
using BusinessLogicLayer;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace HmsTest
{
    [TestClass]
    public class SearchPhysicianTest
    {
        SearchPhysicianBusinessLogic aBusinessLogic = new SearchPhysicianBusinessLogic();
        [TestMethod]
        [TestCategory("SearchPhysician")]
        public void CheckNameBusinessLogicTest()
        {
            DataTable aDataTable = aBusinessLogic.GetAllPhysicianBySearch("D001", "1", "2");
            int column = aDataTable.Columns.Count;
            int row = aDataTable.Rows.Count;
            Assert.AreEqual(1,row);
            Assert.AreEqual(8,column);
        }
    }
}
