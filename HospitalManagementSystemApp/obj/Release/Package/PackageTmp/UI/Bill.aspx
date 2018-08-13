<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="HospitalManagementSystemApp.UI.Bill" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <link href="../Content/font.css" rel="stylesheet" />
    <link href="../Content/font-awesome.css" rel="stylesheet" />

    <style>
        label.error {
            color: #800000;
            font-style: italic;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContentPlaceHolder" ClientIDMode="Static" runat="server">
    <div class="container">
        <div class="row main">

            <div class="main-login main-center">
                <h4>Billing Information</h4>


                <div class="form-group">
                    <label for="billAmountTextBox" class="cols-sm-2 control-label">Amount</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-money" aria-hidden="true"></i></span>
                            <asp:TextBox ID="billAmountTextBox" CssClass="form-control" placeholder="Enter bill amount" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="billingModeDropDownList" class="cols-sm-2 control-label">Billing Mode</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-exchange" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="billingModeDropDownList"  onchange="showBox(this.value)" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="billAmountTextBox" class="cols-sm-2 control-label">Card Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
                            <asp:TextBox ID="cardNumberTextBox" CssClass="form-control" placeholder="Enter patient symptoms details" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>







                <div class="form-group ">
                    <asp:Button ID="BillButton" CssClass="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Confirm" OnClick="BillButton_Click" />
                </div>


            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {

            

          


           
            $('[id*="billingModeDropDownList"]').on('change', function () {
                var val = this.value,
                    $txtbox = $('[id*="cardNumberTextBox"]');

                if (val === "Card") {
                    // Show text box
                    $txtbox.show();
                } else {
                    // Hide text box
                    $txtbox.hide();
                }
            });

            $("#form").validate({
                rules: {
                    <%=billAmountTextBox.UniqueID %>: {
                            required: true,
                            number: true
                        }
               

                    },

                messages: {
                    <%=billAmountTextBox.UniqueID %>: {
                             required: "Please enter bill amount",
                             number: "Please input number only "
                         }
                     }
            });
  
      
        });

       
    </script>
</asp:Content>
