using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;
using EntityLayer;

namespace HospitalManagementSystemApp.UI
{
    public partial class SearchPhysician : System.Web.UI.Page
    {
        DataTable aDepartmentDataTable = new DataTable();
        DataTable aStateDataTable = new DataTable();
        DataTable aPlanDataTable = new DataTable();
        DataTable aPhysicianDataTable = new DataTable();
        AddPatientBusinessLayer aAddPatientBusinessLayer = new AddPatientBusinessLayer();
        DepartmentBusinessLogic aDepartmentBusinessLogic = new DepartmentBusinessLogic();
        SearchPhysicianBusinessLogic aSearchPhysicianBusinessLogic = new SearchPhysicianBusinessLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
        }

        private void FillData()
        {
            aDepartmentDataTable = aDepartmentBusinessLogic.FillDepartment();
            departmentDropDownList.DataTextField = "DepartmentName";
            departmentDropDownList.DataValueField = "DepartmentId";
            departmentDropDownList.DataSource = aDepartmentDataTable;
            departmentDropDownList.DataBind();


            aStateDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillState();
            stateDropDownList.DataTextField = aStateDataTable.Columns[0].ToString();
            stateDropDownList.DataSource = aStateDataTable;
            stateDropDownList.DataBind();

            aPlanDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillPlan();
            planDropDownList.DataTextField = aPlanDataTable.Columns[0].ToString();
            planDropDownList.DataSource = aPlanDataTable;
            planDropDownList.DataBind();
        }

        protected void physicianSearchButton_Click(object sender, EventArgs e)
        {
            string departmentName, stateName, planName;
            departmentName = departmentDropDownList.SelectedItem.Value;
            stateName = stateDropDownList.SelectedItem.Value;
            planName = planDropDownList.SelectedItem.Value;

            aPhysicianDataTable = aSearchPhysicianBusinessLogic.GetAllPhysicianBySearch(departmentName,stateName,planName);
            searchPhysicianGridview.DataSource = aPhysicianDataTable;
            searchPhysicianGridview.DataBind();

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            FillData();
            searchPhysicianGridview.DataSource = null;
            searchPhysicianGridview.DataBind();
        }
    }
}