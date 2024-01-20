<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="CreateLabMedicationOrder.aspx.cs" Inherits="Pages_Doctor_CreateLabMedicationOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <container class="mt-5">
    <div>
            <h2>Create Medication/Lab Order</h2>
        <hr />

        <div class="form-group">
            <label for="ddlPatients">Select Patient:</label>
            <asp:DropDownList runat="server" ID="ddlPatients" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged">
                
            </asp:DropDownList>
            <br />

        </div>
         <div class="form-group">
                <label>Order Type:</label>
            <asp:RadioButtonList runat="server" CssClass="form-check" ID="rblOrderType" AutoPostBack="true" OnSelectedIndexChanged="rblOrderType_SelectedIndexChanged">
                <asp:ListItem Text="Medication" CssClass="form-check-input" Value="Medication" />
                <asp:ListItem Text="Lab Order" CssClass="form-check-input" Value="LabOrder" />
            </asp:RadioButtonList>

            <br />

            <asp:Panel runat="server" ID="pnlMedicationOrder" Visible="false">
                
                <label for="txtMedicationName">Medication Name:</label>
                <asp:TextBox runat="server" ID="txtMedicationName" CssClass="form-control" />
                <br />

                <label for="txtDosageInstructions">Dosage Instructions:</label>
                <asp:TextBox runat="server" ID="txtDosageInstructions" CssClass="form-control" />
                <br />

                <label for="txtStartDate">Start Date:</label>
                <asp:TextBox runat="server" ID="txtStartDate" CssClass="form-control" />
                <br />

                <label for="txtEndDate">End Date:</label>
                <asp:TextBox runat="server" ID="txtEndDate" CssClass="form-control" />
                <br />

                <label for="txtMedicationForm">Medication Form:</label>
                <asp:TextBox runat="server" ID="txtMedicationForm" CssClass="form-control" />
                <br />

            </asp:Panel>

            <asp:Panel runat="server" ID="pnlLabOrder" Visible="false">
               <label for="txtTestName">Lab Test Name:</label>
                <asp:TextBox runat="server" ID="txtTestName" CssClass="form-control" />
                <br />

                <label for="txtReferenceRange">Reference Range:</label>
                <asp:TextBox runat="server" ID="txtReferenceRange" CssClass="form-control" />
                <br />

                <label for="txtUnits">Units:</label>
                <asp:TextBox runat="server" ID="txtUnits" CssClass="form-control" />
                <br />

                <label for="txtTestMethodology">Test Methodology:</label>
                <asp:TextBox runat="server" ID="txtTestMethodology" CssClass="form-control" />
                <br />

                <label for="txtTestResult">Test Result:</label>
                <asp:TextBox runat="server" ID="txtTestResult" CssClass="form-control" />
                <br />
            </asp:Panel>

            <asp:Button runat="server" CssClass="btn btn-primary" ID="btnSaveOrder" OnClick="btnSaveOrder_Click" Text="Save Order" />
             <asp:Label runat="server" ID="lblConfirmation" CssClass="text-success" Visible="false"></asp:Label>
        </div>
</container>
</asp:Content>

