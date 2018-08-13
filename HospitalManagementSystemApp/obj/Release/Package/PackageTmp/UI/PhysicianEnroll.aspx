<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="PhysicianEnroll.aspx.cs" Inherits="HospitalManagementSystemApp.UI.PhysicianEnroll" %>

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
                <h4>Enroll a Physian</h4>
               
                 <div class="form-group">
                    <label  class="cols-sm-2 control-label">Physian Id</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:Label ID="physicianIdLabel" CssClass="form-control" runat="server"></asp:Label>
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
                    <label for="departmentDropDownList" class="cols-sm-2 control-label">Department</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-building-o" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="departmentDropDownList" CssClass="form-control"  runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="educationalQualificationTextbox" class="cols-sm-2 control-label">Education Qualification</label>
                    <div class='col-sm-13'>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-graduation-cap" aria-hidden="true"></i></span>
                            <asp:TextBox ID="educationalQualificationTextbox" CssClass="form-control" placeholder="Please enter education qualification" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
              

                <div class="form-group">
                    <label for="yearsOfExperienceTextbox" class="cols-sm-2 control-label">Years Of Experience</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-star-o" aria-hidden="true"></i></span>
                            <asp:TextBox ID="yearsOfExperienceTextbox" CssClass="form-control" placeholder="Enter your year of experience" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="dropdown">
                    <label for="stateDropDownList" class="cols-sm-2 control-label">State</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-flag-o" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="stateDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="planDropDownList" class="cols-sm-2 control-label">Plan</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-shield" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="planDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <asp:Button ID="physicianButton" CssClass="btn btn-primary btn-lg btn-block login-button" runat="server" Text="Register" OnClick="physicianButton_Click"  />
                </div>


            </div>
        </div>
    </div>


    <script>
        $(document).ready(function() {
            //$('#dateOfBirthTextbox').datepicker({
            //    format: "dd-M-yy",
            //    autoclose: true,
            //    todayHighlight: true
            //});
           
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
                
                <%=yearsOfExperienceTextbox.UniqueID %>: {
                    required: true,
                    number : true
                }             

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

                <%=yearsOfExperienceTextbox.UniqueID %>: {
                    required: "Please enter a  years of experience ",
                    digits : "Please input number only"

                }                                   
            }
        });

    </script>
</asp:Content>
