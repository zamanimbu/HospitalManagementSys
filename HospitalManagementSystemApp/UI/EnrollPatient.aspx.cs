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
    public partial class EnrollPatient : System.Web.UI.Page
    {
        DataTable aStateDataTable = new DataTable();
        DataTable aPlanDataTable = new DataTable();
        AddPatientBusinessLayer aAddPatientBusinessLayer = new AddPatientBusinessLayer();
        private int patientId = 1000;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
                GeneratePatientId();
                //messageLabel.Text = "<h4> Welcome to our service </h4> ";
            }
        }

        private void GeneratePatientId()
        {
            patientId = patientId + aAddPatientBusinessLayer.GeneratePatientIdBusinesslogic();
            patientIdLabel.Text = patientId.ToString();
        }

        private void FillData()
        {
            aStateDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillState();
            stateDropDownList.DataTextField = aStateDataTable.Columns[1].ToString();
            stateDropDownList.DataValueField = aStateDataTable.Columns[0].ToString();
            stateDropDownList.DataSource = aStateDataTable;
            stateDropDownList.DataBind();

            aPlanDataTable = aAddPatientBusinessLayer.AddPtientBusinessLogicFillPlan();
            planDropDownList.DataTextField = aPlanDataTable.Columns[1].ToString();
            planDropDownList.DataValueField = aPlanDataTable.Columns[0].ToString();
            planDropDownList.DataSource = aPlanDataTable;
            planDropDownList.DataBind();

        }

        protected void PatientButton_Click(object sender, EventArgs e)
        {
            Patient aPatient = new Patient();

            aPatient.PatientId = Convert.ToInt32(patientIdLabel.Text);
            aPatient.FirstName = firstNameTextBox.Text;
            aPatient.LastName = lastNameTextBox.Text;
            aPatient.DateOfBirth = dateOfBirthTextbox.Text;
            aPatient.PhoneNumber = Convert.ToInt32(phoneTextBox.Text);
            aPatient.Email = emailTextbox.Text;
            aPatient.State = stateDropDownList.Text;
            aPatient.Plan = planDropDownList.Text;

            string firstaName, lastName;
            firstaName = firstNameTextBox.Text;
            lastName = lastNameTextBox.Text;

            bool isNameExist = aAddPatientBusinessLayer.CheckNameBusinessLogic(firstaName, lastName);

            if (!isNameExist)
            {
                int result = aAddPatientBusinessLayer.AddPatient(aPatient);
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
            GeneratePatientId();
        }

        private void ClearForm()
        {
            firstNameTextBox.Text = null;
            lastNameTextBox.Text = null;
            dateOfBirthTextbox.Text = null;
            phoneTextBox.Text = null;
            emailTextbox.Text = null;
        }
    }
}