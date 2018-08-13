<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="PatientDiagnosis.aspx.cs" Inherits="HospitalManagementSystemApp.UI.PatientDiagnosis" %>

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

        .divider {
            width: 10px;
            height: auto;
            display: inline-block;
        }
    </style>
   
   
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContentPlaceHolder" ClientIDMode="Static" runat="server">
    <div class="container">
        <div class="row main">

            <div class="main-login main-center">
                <h4>Patient Diagnosis</h4>


                <div class="form-group">
                    <label for="symptompsTextBox" class="cols-sm-2 control-label">Symptomps</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox ID="symptompsTextBox" TextMode="MultiLine" Columns="50" Rows="3" CssClass="form-control" placeholder="Enter patient symptoms details" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="diagnosisProvidedTextBox" class="cols-sm-2 control-label">Diagnosis Provided</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox ID="diagnosisProvidedTextBox" CssClass="form-control" placeholder="Enter suggest diagnosis" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="administratedByDropDownList" class="cols-sm-2 control-label">Administrated By</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-cogs" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="administratedByDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="dateOfDiagnosisTextbox" class="cols-sm-2 control-label">Date of diagnosis</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                            <asp:TextBox ID="dateOfDiagnosisTextbox" CssClass="form-control"  placeholder="Enter your year of experience" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="followUp" class="cols-sm-2 control-label">Follow up requiered</label>
                    <div class='col-sm-13'>
                        <div class="input-group" data-toggle="buttons">
                            <span class="input-group-addon"><i class="fa fa-check-circle" aria-hidden="true"></i></span>
                            <div class="col-lg-8">
                                <fieldset>


                                    <div class="radio">
                                        <label>
                                            <asp:RadioButton ID="followUpTrueRadioButton"  Text="Yes" GroupName="followUp" runat="server" />

                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <asp:RadioButton ID="followUpFalseRadioButton" Text="No" GroupName="followUp" runat="server" />

                                        </label>
                                    </div>
                                </fieldset>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="dateOfFollowedUpTextbox" class="cols-sm-2 control-label">Date of Followed Up</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                            <asp:TextBox ID="dateOfFollowedUpTextbox"  CssClass="form-control" placeholder="Enter follwed up date" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                


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
                    <asp:Button ID="patientDiagnosisButton" CssClass="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Register" OnClick="patientDiagnosisButton_Click" />
                </div>


            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $('#dateOfDiagnosisTextbox').datepicker({
                format: "dd-M-yyyy",
                autoclose: true,
                todayHighlight: true,
                endDate: new Date()
            });

            $('#dateOfFollowedUpTextbox').datepicker({
                format: "dd-M-yyyy",
                autoclose: true,
                todayHighlight: true,
                startDate: new Date()
            });


           
            //document.getElementById("billAmountTextBox").disabled = true;
            //document.getElementById("billingModeDropDownList").disabled = true;
            //document.getElementById("cardNumberTextBox").disabled = true;


            //$('#symptompsTextBox, #diagnosisProvidedTextBox, #dateOfDiagnosisTextbox, #administratedByDropDownList').each(function() {
            //    if ($(this).val() != '') {
            //        document.getElementById("billAmountTextBox").disabled = false;
            //        document.getElementById("billingModeDropDownList").disabled = false;
            //        document.getElementById("cardNumberTextBox").disabled = false;
            //    }
            //});
           
            $("#billAmountTextBox").prop("disabled", "disabled");
            $("#billingModeDropDownList").prop("disabled", "disabled");
            $("#cardNumberTextBox").prop("disabled", "disabled");

            $("#symptompsTextBox, #diagnosisProvidedTextBox ,#dateOfDiagnosisTextbox, #administratedByDropDownList").on("keypress", function () {
                if ($(this).val() != "") {
                    $("#billAmountTextBox").prop("disabled", false);
                    $("#billingModeDropDownList").prop("disabled", false);
                    $("#cardNumberTextBox").prop("disabled", false);

                } 
            });


            $("#followUpFalseRadioButton").click(function() {
                $("#dateOfFollowedUpTextbox").hide();
            });
            $("#followUpTrueRadioButton").click(function() {
                $("#dateOfFollowedUpTextbox").show();
            });

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
                    <%=symptompsTextBox.UniqueID %>: {
                        required: true,
                        alphanumeric: true
                    }                        
                },

                messages: {
                    <%=symptompsTextBox.UniqueID %>: {
                        required: "Please enter Symptomps",
                        alphanumeric: "Please input letters and numbers only"
                    }                          
                }
            });
        });

       
       
    </script>
</asp:Content>
