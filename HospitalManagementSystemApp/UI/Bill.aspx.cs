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
    public partial class Bill : System.Web.UI.Page
    {
        DataTable aBillModeDataTable = new DataTable();
        BillBusinessLogic aBillBusinessLogic = new BillBusinessLogic();
         int billId = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
                BillId();

            }
            
        }

        private int BillId()
        {
            int temp = aBillBusinessLogic.GetBillId();
            billId = billId + temp;
            return billId;
        }

        private void FillData()
        {
            aBillModeDataTable = aBillBusinessLogic.GetBill();
            billingModeDropDownList.DataTextField = aBillModeDataTable.Columns[1].ToString();   
            billingModeDropDownList.DataSource = aBillModeDataTable;
            billingModeDropDownList.DataBind();
            billingModeDropDownList.Items.Insert(0, new ListItem(String.Empty, String.Empty));

        }

        protected void BillButton_Click(object sender, EventArgs e)
        {
            BillSystem aBillSystem = new BillSystem();
            aBillSystem.BillId = BillId();
            aBillSystem.BillAmount = (float) Convert.ToDouble(billAmountTextBox.Text);
            aBillSystem.ModeOfPayment = billingModeDropDownList.Text;
            if (billingModeDropDownList.Text == "Card")
            {
                aBillSystem.CardNumber = cardNumberTextBox.Text;
            }
            else
            {
                aBillSystem.CardNumber = " ";
            }
           
            int result = aBillBusinessLogic.GetBillInfo(aBillSystem);
        }

       
       
    }
}