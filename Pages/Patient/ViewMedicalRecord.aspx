<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewMedicalRecord.aspx.cs" Inherits="Pages_Patient_ViewMedicalRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Personal Medical Record</h2>
    <br />
        <asp:Label ID="lblWarning" runat="server" Text="" ForeColor="Red"></asp:Label>

     <div>
        <label>Patient ID:</label>
        <asp:Label ID="lblPatientID" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Date of Last Update:</label>
        <asp:Label ID="lblLastUpdate" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Diagnosis:</label>
        <asp:Label ID="lblDiagnosis" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Treatments:</label>
        <asp:Label ID="lblTreatments" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Allergies:</label>
        <asp:Label ID="lblAllergies" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Immunizations:</label>
        <asp:Label ID="lblImmunizations" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Medication History:</label>
        <asp:Label ID="lblMedicationHistory" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Medical History:</label>
        <asp:Label ID="lblMedicalHistory" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <label>Notes:</label>
        <asp:Label ID="lblNotes" runat="server" Text=""></asp:Label>
    </div>


</asp:Content>

