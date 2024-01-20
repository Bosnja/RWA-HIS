<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewAppointments.aspx.cs" Inherits="Pages_Patient_ViewAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

     <h2>View Appointments</h2>
    <div>
        <asp:Label ID="lblSuccessMessage" runat="server" CssClass="text-success"></asp:Label>
    </div>
    <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" DataKeyNames="AppointmentID" CssClass="table">
        <Columns>
            <asp:BoundField DataField="DateTimeAppointed" HeaderText="Date and Time" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:BoundField DataField="AppointmentType" HeaderText="Appointment Type" />
            <asp:BoundField DataField="NotesForDoctor" HeaderText="Notes for Doctor" />
            <asp:BoundField DataField="BillingInformation" HeaderText="Billing Information" />
        </Columns>
    </asp:GridView>
</asp:Content>

