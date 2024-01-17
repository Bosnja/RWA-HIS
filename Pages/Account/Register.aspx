<%@ Page Title="Register" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>


    <h4>Create a new account.</h4>
    <hr />
    <asp:ValidationSummary runat="server" CssClass="text-danger" />


    <div class="row">
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="form-label">First name</asp:Label>
            <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                CssClass="text-danger" ErrorMessage="The user name field is required." />
        </div>
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="form-label">Last name</asp:Label>
            <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                CssClass="text-danger" ErrorMessage="The user name field is required." />
        </div>
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="form-label">E-mail</asp:Label>
            <asp:TextBox runat="server" ID="Email" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                CssClass="text-danger" ErrorMessage="The user name field is required." />
        </div>

    </div>

    <div class="row">
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="form-label">User name</asp:Label>
            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                CssClass="text-danger" ErrorMessage="The user name field is required." />
        </div>
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="form-label">Password</asp:Label>

            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                CssClass="text-danger" ErrorMessage="The password field is required." />
        </div>
        <div class="col-sm-3 mb-3 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="form-label">Confirm password</asp:Label>
            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
        </div>
    </div>
    <div class="row mb-5">
        <div class="col-sm-9 mb-5 mb-sm-0">
            <asp:Label runat="server" AssociatedControlID="chkRoles" CssClass="col-md-2 control-label">Select your Role</asp:Label>
            <div class="m-2">
                <asp:RadioButtonList runat="server" ID="chkRoles" OnSelectedIndexChanged="chkRoles_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Patient" Value="Patient" />
                    <asp:ListItem Text="HealthcareProvider" Value="HealthcareProvider" />
                </asp:RadioButtonList>
            </div>
        </div>

        <div id="patientFields" runat="server" visible="false" class="row mt-3">
            <div class="col-sm-2">
                <label for="txtDateOfBirth">Date of Birth:</label>
                <asp:TextBox runat="server" ID="txtDOB" CssClass="form-control" ReadOnly="true" onfocus="showCalendar()"></asp:TextBox>
                <asp:Calendar runat="server" ID="calDOB" OnSelectionChanged="calDOB_SelectionChanged" style="display: none;"/>
                <script type="text/javascript">
                    function showCalendar() {
                        var cal = document.getElementById('<%= calDOB.ClientID %>');
                        if (cal) {
                            cal.style.display = 'block';
                        }
                    }
                </script>
            </div>
            <div class="col-sm-2">
                <label for="txtGender">Gender:</label>
                <asp:TextBox ID="txtGender" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <label for="txtEmergencyContact">Emergency Contact</label>
                <asp:TextBox ID="txtEmergencyContact" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <label for="txtInsuranceInfo">Insurance Information:</label>
                <asp:TextBox ID="txtInsuranceInfo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <div id="providerFields" runat="server" visible="false" class="row mt-3">
            <div class="col-sm-2">
                <label for="txtSpecialization">Specialization:</label>
                <asp:TextBox ID="txtSpecialization" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-sm-2">
                <label for="txtLicensingInfo">Licensing Information:</label>
                <asp:TextBox ID="txtLicensingInfo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

        </div>
    </div>

    <div class="form-group">
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn bg-dark" />
        </div>
    </div>
</asp:Content>

