<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewPatients.aspx.cs" Inherits="Pages_Doctor_ViewPatients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container ">
        <h2>Patients List</h2>
        <hr />

        <asp:GridView ID="gvPatients" runat="server" AutoGenerateColumns="False" CssClass="table table-light" OnRowDataBound="gvPatients_RowDataBound">
            <Columns>
                <asp:BoundField DataField="PatientId" HeaderText="Patient ID" SortExpression="PatientID" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                <asp:BoundField DataField="EmergencyContact" HeaderText="Emergency Contact" SortExpression="EmergencyContact" />
                <asp:BoundField DataField="InsuranceInformation" HeaderText="Insurance Information" SortExpression="InsuranceInformation" />
                <asp:TemplateField HeaderText="Appointments">
                    <ItemTemplate>
                        <asp:GridView ID="gvAppointments" runat="server" AutoGenerateColumns="False" CssClass ="table table-sm table-info">
                            <Columns>
                                <asp:BoundField DataField="AppointmentID" HeaderText="Appointment ID" ReadOnly="True" SortExpression="AppointmentID" />
                                <asp:BoundField DataField="DateTimeAppointed" HeaderText="Appointment Date" ReadOnly="True" SortExpression="DateTimeAppointed" />
                                <asp:BoundField DataField="AppointmentType" HeaderText="Appointment Type" ReadOnly="True" SortExpression="AppointmentType" />
                                <asp:BoundField DataField="NotesForDoctor" HeaderText="Appointment Notes" ReadOnly="True" SortExpression="NotesForDoctor" />
                                <asp:BoundField DataField="BillingInformation" HeaderText="Appointment Billing" ReadOnly="True" SortExpression="BillingInformation" />
                            </Columns>
                        </asp:GridView>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>


