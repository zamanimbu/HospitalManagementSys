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
    public partial class PhysicianEnroll : System.Web.UI.Page
    {
        DataTable aDepartmentDataTable = new DataTable();
        DataTable aStateDataTable = new DataTable();
        DataTable aPlanDataTable = new DataTable();
        DepartmentBusinessLogic aDepartmentBusinessLogic = new DepartmentBusinessLogic();
        AddPhysicianBusinessLogic aAddPhysicianBusinessLogic = new AddPhysicianBusinessLogic();
        AddPatientBusinessLayer aAddPatientBusinessLayer = new AddPatientBusinessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
                GetPhysicianId();
            }
        }

        private int physicianId = 1;
        private void GetPhysicianId()
        {
            physicianId = physicianId + aAddPhysicianBusinessLogic.GeneratePhysicianIdBusinessLogic();
            if (physicianId > 0 && physicianId < 10)
            {
                physicianIdLabel.Text = "PR00" + physicianId.ToString();
            }
            else if (physicianId >= 10 && physicianId < 99)
            {
                physicianIdLabel.Text = "PR0" + physicianId.ToString();
            }
            else if (physicianId >= 100)
            {
                physicianIdLabel.Text = "PR" + physicianId.ToString();
            }
        }

        public void FillData()
        {
            aDepartmentDataTable = aDepartmentBusinessLogic.FillDepartment();
            aDepartmentDataTable.Columns.Add("Departments", typeof(string), "DepartmentId + '   ' + DepartmentName");
            departmentDropDownList.DataTextField = "Departments";
            departmentDropDownList.DataValueField = "DepartmentId";
            departmentDropDownList.DataSource = aDepartmentDataTable;
            departmentDropDownList.DataBind();


            aStateDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillState();
            stateDropDownList.DataSource = aStateDataTable;
            stateDropDownList.DataTextField = aStateDataTable.Columns[1].ToString();
            stateDropDownList.DataValueField = aStateDataTable.Columns[0].ToString();
            stateDropDownList.DataBind();

            aPlanDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillPlan();
            planDropDownList.DataSource = aPlanDataTable;
            planDropDownList.DataTextField = aPlanDataTable.Columns[1].ToString();
            planDropDownList.DataValueField = aPlanDataTable.Columns[0].ToString();
            planDropDownList.DataBind();
        }

        protected void physicianButton_Click(object sender, EventArgs e)
        {
            Physician aPhysician = new Physician();
            aPhysician.PhysicianId = physicianIdLabel.Text;
            aPhysician.FirstName = firstNameTextBox.Text;
            aPhysician.LastName = lastNameTextBox.Text;
            aPhysician.DepartmentId = departmentDropDownList.SelectedItem.Value;
            aPhysician.EducationalQualification = educationalQualificationTextbox.Text;
            aPhysician.YearsOfExperience = (float) Math.Round(Convert.ToDouble(yearsOfExperienceTextbox.Text),2);
            aPhysician.StateId = stateDropDownList.Text;
            aPhysician.PlanId = planDropDownList.Text;


            string firstaName, lastName;
            firstaName = firstNameTextBox.Text;
            lastName = lastNameTextBox.Text;

            bool isNameExist = aAddPhysicianBusinessLogic.CheckNameBusinessLogic(firstaName, lastName);

            if (!isNameExist)
            {
                int result = aAddPhysicianBusinessLogic.AddPhysician(aPhysician);
                if (result > 0)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted failed')", true);
                }

            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                   "alert('First Name and Last Name already exist , please enter another one')", true);
            }



            ClearForm();
            GetPhysicianId();
        }

        private void ClearForm()
        {
            firstNameTextBox.Text = null;
            lastNameTextBox.Text = null;
            yearsOfExperienceTextbox.Text = null;
            educationalQualificationTextbox.Text = null;
        }
    }
}
