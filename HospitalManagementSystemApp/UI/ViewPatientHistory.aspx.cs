using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLogicLayer;

namespace HospitalManagementSystemApp.UI
{
    public partial class ViewPatientHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DataTable aHistoryPatientDataTable = new DataTable();
        PatientHistoryBusinessLogic aHistoryBusinessLogic = new PatientHistoryBusinessLogic();
        protected void patientHistoryButton_Click(object sender, EventArgs e)
        {
            int patientId;
            string firstName, lastName;
            patientId = Convert.ToInt32(patientIdTextBox.Text);
            firstName = firstNameTextBox.Text;
            lastName = lastNameTextBox.Text;
            aHistoryPatientDataTable = aHistoryBusinessLogic.GetSearchPatientHistory(patientId,firstName,lastName);
            if (aHistoryPatientDataTable.Rows.Count > 0 )
            {
                searchPatientHistoryGridview.DataSource = aHistoryPatientDataTable;
                searchPatientHistoryGridview.DataBind();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('No record Available !! try again please ')", true);

            }

        }

        protected void resetButton_Click(object sender, EventArgs e)
        {
            patientIdTextBox.Text = string.Empty;
            firstNameTextBox.Text = string.Empty;
            lastNameTextBox.Text = string.Empty;
            searchPatientHistoryGridview.DataSource = null;
            searchPatientHistoryGridview.DataBind();
        }
    }
}