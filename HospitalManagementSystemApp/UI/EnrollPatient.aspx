<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="EnrollPatient.aspx.cs" Inherits="HospitalManagementSystemApp.UI.EnrollPatient" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <link href="../Content/font.css" rel="stylesheet" />
     <style>
        label.error {
            color: #800000;
            font-style: italic;
        }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContentPlaceHolder" runat="server" ClientIDMode="Static">
    <div class="container">
        <div class="row main">
            
            <div class="main-login main-center">
                <h4>Enroll a Patient</h4>
               
                 <div class="form-group">
                    <label  class="cols-sm-2 control-label">Patient Id</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:Label ID="patientIdLabel" CssClass="form-control" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="firstNameTextBox" class="cols-sm-2 control-label">First Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox ID="firstNameTextBox" CssClass="form-control" placeholder="Enter your first name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="lastNameTextBox" class="cols-sm-2 control-label">Last Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox ID="lastNameTextBox" CssClass="form-control" placeholder="Enter your last name" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="dateOfBirthTextbox" class="cols-sm-2 control-label">Date Of Birth</label>
                    <div class='col-sm-13'>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar-o" aria-hidden="true"></i></span>
                            <asp:TextBox ID="dateOfBirthTextbox" CssClass="form-control" placeholder="Date of birth" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phoneTextBox" class="cols-sm-2 control-label">Phone Number</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
                            <asp:TextBox ID="phoneTextBox" CssClass="form-control" placeholder="Enter your phone number" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="emailTextbox" class="cols-sm-2 control-label">Email</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope" aria-hidden="true"></i></span>
                            <asp:TextBox ID="emailTextbox" CssClass="form-control" placeholder="Enter your email" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="dropdown">
                    <label for="stateDropDownList" class="cols-sm-2 control-label">State</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="stateDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="planDropDownList" class="cols-sm-2 control-label">Plan</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-caret-down" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="planDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <asp:Button ID="PatientButton" CssClass="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Register" OnClick="PatientButton_Click"  />
                </div>


            </div>
        </div>
    </div>


    <script>
        $(document).ready(function() {
            $('#dateOfBirthTextbox').datepicker({
                format: "dd-M-yy",
                autoclose: true,
                todayHighlight: true
            });
           
            jQuery.validator.addMethod("lettersonly", function(value, element) {
                return this.optional(element) || /^[a-zA-Z\s]+$/i.test(value);
            }, "Letters only please"); 
        });

        $("#form").validate({
            rules: {
                <%=firstNameTextBox.UniqueID %>: {
                    required: true,
                    lettersonly: true
                },
                <%=lastNameTextBox.UniqueID %>: {
                    required: true,
                    lettersonly: true
                },

                <%=emailTextbox.UniqueID %>: {
                    required: true,
                    email: true
                },
                <%=phoneTextBox.UniqueID %>: {
                    required: true,
                    digits : true
                },
                <%=dateOfBirthTextbox.UniqueID %>: {
                    required: true,
                   
                },


            },

            messages: {
                <%=firstNameTextBox.UniqueID %>: {
                    required: "Please enter your firstname",
                    lettersonly: "Please input letters only "
                },
                <%=lastNameTextBox.UniqueID %>: {
                    required: "Please enter your lastname",
                    lettersonly: "Please input letters only"
                },

                <%=emailTextbox.UniqueID %>: {
                    required: "Please enter a valid email address",
                    email: "Please enter a valid email adress "
                },
                <%=phoneTextBox.UniqueID %>: {
                    required: "Please enter a phone number",
                    digits : "Please input number only"

                },
                <%=dateOfBirthTextbox.UniqueID %>: {
                    required: "Please select a date"

                },

                    
            }
        });

    </script>
</asp:Content>

