<%@ Page Language="C#" MasterPageFile="main.Master" AutoEventWireup="true" CodeBehind="SearchPhysician.aspx.cs" Inherits="HospitalManagementSystemApp.UI.SearchPhysician" %>

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
    </style>

    <link href="../Content/style.css" rel="stylesheet" />
    <link href="../Content/bootstrap-datepicker.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-3.1.1.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/bootstrap-datepicker.min.js"></script>
    <link href="../Content/font.css" rel="stylesheet" />
</asp:Content>

<asp:Content ContentPlaceHolderID="mainContentPlaceHolder" runat="server" ClientIDMode="Static">
    <div class="container">
        <div class="row main">

            <div class="main-login main-center">
                <h4>Search Physian</h4>

                <div class="form-group">
                    <label for="departmentDropDownList" class="cols-sm-2 control-label">Department</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-building-o" aria-hidden="true"></i></span>
                            <asp:DropDownList ID="departmentDropDownList" CssClass="form-control" runat="server"></asp:DropDownList>
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
                    <asp:Button ID="physicianSearchButton" CssClass="button button2" runat="server" Text="Search" OnClick="physicianSearchButton_Click" />
                    <div class="divider"/>
                    <asp:Button ID="resetButton" CssClass="button button2" runat="server" Text="Reset" OnClick="resetButton_Click" />
                </div>


            </div>
        </div>
    </div>
     <div class="container">
        <div class="row main">
            <asp:GridView ID="searchPhysicianGridview" AutoGenerateColumns="False" CssClass="table table-bordered" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField HeaderText="Physician Id">
                        <ItemTemplate>
                            <%#Eval("PhysicianId") %>
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
                              
                    <asp:TemplateField HeaderText="Educational qualification">
                        <ItemTemplate>
                            <%#Eval("EducationalQualification") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Years of experience">
                        <ItemTemplate>
                            <%#Eval("YearsOfExperience") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Department Name">
                        <ItemTemplate>
                            <%#Eval("DepartmentId") %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <%#Eval("StateId") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Plan">
                        <ItemTemplate>
                            <%#Eval("PlanId") %>
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
        $(document).ready(function () {


        });

    </script>
</asp:Content>
