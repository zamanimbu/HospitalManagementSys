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
    public partial class PatientDiagnosis : System.Web.UI.Page
    {
        DataTable aPhysicianDataTable = new DataTable();
        PhysicianBusinessLogic aPhysicianBusinessLogic = new PhysicianBusinessLogic();
        PatiendDiagnososBusinessLogic aBusinessLogic = new PatiendDiagnososBusinessLogic();
        BillBusinessLogic aBillBusinessLogic = new BillBusinessLogic();
        DataTable aBillModeDataTable = new DataTable();
        private int diagnosisId = 1;
        int billId = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
           
           
        }

        private void FillData()
        {
            aPhysicianDataTable = aPhysicianBusinessLogic.GetPhysician();
            aPhysicianDataTable.Columns.Add("Physicians", typeof(string), "PhysicianId + '   ' + FirstName + '   ' + LastName ");                    
            administratedByDropDownList.DataSource = aPhysicianDataTable;
            administratedByDropDownList.DataTextField = "Physicians";
            administratedByDropDownList.DataValueField = "PhysicianId";
            administratedByDropDownList.DataBind();
            administratedByDropDownList.Items.Insert(0, new ListItem("Please select"));



            aBillModeDataTable = aBillBusinessLogic.GetBill();
            billingModeDropDownList.DataSource = aBillModeDataTable;
            billingModeDropDownList.DataTextField = aBillModeDataTable.Columns[1].ToString();
            billingModeDropDownList.DataValueField = aBillModeDataTable.Columns[1].ToString();
            billingModeDropDownList.DataBind();
            billingModeDropDownList.Items.Insert(0, new ListItem("Please select"));
        }

        private int BillId()
        {
            int temp = aBillBusinessLogic.GetBillId();
            billId = billId + temp;
            return billId;
        }

        protected void patientDiagnosisButton_Click(object sender, EventArgs e)
        {
            EntityLayer.PatientDiagnosis aPatientDiagnosis = new EntityLayer.PatientDiagnosis();
            aPatientDiagnosis.DiagnosisId = GetDiagnosisId();
            aPatientDiagnosis.Symptoms = symptompsTextBox.Text;
            aPatientDiagnosis.DiagnosisProvided = diagnosisProvidedTextBox.Text;
            aPatientDiagnosis.AdministeredBy = administratedByDropDownList.SelectedItem.Value;
            aPatientDiagnosis.DateOfDiagnosis = dateOfDiagnosisTextbox.Text;
            aPatientDiagnosis.FollowUpRequired = followUpTrueRadioButton.Text == "Yes" ? followUpTrueRadioButton.Text : followUpFalseRadioButton.Text;
            aPatientDiagnosis.DateOfFollowUp = dateOfFollowedUpTextbox.Text;

            BillSystem aBillSystem = new BillSystem();
            aBillSystem.BillId = BillId();
            aBillSystem.BillAmount = (float)Convert.ToDouble(billAmountTextBox.Text);
            aBillSystem.ModeOfPayment = billingModeDropDownList.Text;
            if (billingModeDropDownList.Text == "Card")
            {
                aBillSystem.CardNumber = cardNumberTextBox.Text;
            }
            else
            {
                aBillSystem.CardNumber = " ";
            }

            int resultBillSystem = aBillBusinessLogic.GetBillInfo(aBillSystem);

            aPatientDiagnosis.BillId = aBillBusinessLogic.GetBillId();

            int resultPatientDiagnosys = aBusinessLogic.AddPatientDiagnosis(aPatientDiagnosis);

            if (resultPatientDiagnosys > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted failed')", true);
            }

            Clear();
        }

        private void Clear()
        {
            symptompsTextBox.Text = string.Empty;
            diagnosisProvidedTextBox.Text = string.Empty;            
            dateOfDiagnosisTextbox.Text = string.Empty;
            followUpTrueRadioButton.Text = string.Empty;
            followUpFalseRadioButton.Text = string.Empty;
            dateOfFollowedUpTextbox.Text = string.Empty;
            billAmountTextBox.Text = string.Empty;

        }


        private int GetDiagnosisId()
        {
            diagnosisId = diagnosisId + aBusinessLogic.GetDiagnosisId();
            return diagnosisId;
        }
    }
}