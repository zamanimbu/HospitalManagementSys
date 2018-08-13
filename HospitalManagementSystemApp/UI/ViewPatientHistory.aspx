<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="ViewPatientHistory.aspx.cs" Inherits="HospitalManagementSystemApp.UI.ViewPatientHistory" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <style>
        .button {
            background-color: #286090; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s; /* Safari */
            transition-duration: 0.4s;
        }

        .button2:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }

        .divider {
            width: 10px;
            height: auto;
            display: inline-block;
        }
        label.error {
            color: #800000;
            font-style: italic;
        }
    </style>

    <link href="../Content/style.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <link href="../Content/font.css" rel="stylesheet" />
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContentPlaceHolder" runat="server" ClientIDMode="Static">
    <div class="container">
        <div class="row main">

            <div class="main-login main-center">
                <h4>View Patient History</h4>


                <div class="form-group">
                    <label for="patientIdTextBox" class="cols-sm-2 control-label">Patient ID</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <asp:TextBox ID="patientIdTextBox" CssClass="form-control" placeholder="Enter patient Id" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="firstNameTextBox" class="cols-sm-2 control-label">First Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                            <asp:TextBox ID="firstNameTextBox" CssClass="form-control" placeholder="Enter suggest diagnosis" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="lastNameTextBox" class="cols-sm-2 control-label">Last Name</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></span>
                            <asp:TextBox ID="lastNameTextBox" CssClass="form-control" placeholder="Enter suggest diagnosis" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>


                <div class="form-group ">
                    <asp:Button ID="patientHistoryButton" CssClass="button button2" runat="server" Text="Search" OnClick="patientHistoryButton_Click" />
                    <div class="divider" />
                    <asp:Button ID="resetButton" CssClass="button button2" runat="server" Text="Reset" OnClick="resetButton_Click" />
                </div>


            </div>
        </div>
    </div>
    <div class="container">
        <div class="row main">
            <asp:GridView ID="searchPatientHistoryGridview" AutoGenerateColumns="False" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Physician Id">
                        <ItemTemplate>
                            <%#Eval("PatientId") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <%#Eval("FirstName") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <%#Eval("LastName") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date Of Diagnosis">
                        <ItemTemplate>
                            <%#Eval("DateOfDiagnosis") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Physician Id">
                        <ItemTemplate>
                            <%#Eval("AdministeredBy") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Symptomps">
                        <ItemTemplate>
                            <%#Eval("Symptoms") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Diagnosis Provided">
                        <ItemTemplate>
                            <%#Eval("DiagnosisProvided") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date Of Follow Up">
                        <ItemTemplate>
                            <%#Eval("DateOfFollowUp") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Bill Amount">
                        <ItemTemplate>
                            <%#Eval("BillAmount") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            jQuery.validator.addMethod("lettersonly", function(value, element) {
                return this.optional(element) || /^[a-zA-Z\s]+$/i.test(value);
            }, "Letters only please"); 

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
                
                <%=patientIdTextBox.UniqueID %>: {
                    required: true,
                    digits : true
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

                <%=patientIdTextBox.UniqueID %>: {
                    required: "Please enter digits only ",
                    digits : "Please input number only"

                }                                   
            }
            });
        });

            

    </script>
</asp:Content>
