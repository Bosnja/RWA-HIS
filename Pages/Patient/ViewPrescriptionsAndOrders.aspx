<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewPrescriptionsAndOrders.aspx.cs" Inherits="Pages_Patient_ViewPrescriptionsAndOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <h2>Prescribed Medications</h2>

      <asp:GridView ID="gvPrescribedMedications" runat="server" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:BoundField DataField="MedicationName" HeaderText="Medication Name" />
            <asp:BoundField DataField="DosageInstructions" HeaderText="Dosage Instructions" />
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="MedicationForm" HeaderText="Medication Form" />
        </Columns>
    </asp:GridView>

</asp:Content>

