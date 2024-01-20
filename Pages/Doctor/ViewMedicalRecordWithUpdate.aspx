<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewMedicalRecordWithUpdate.aspx.cs" Inherits="Pages_Doctor_ViewMedicalRecordWithUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div>
        <h1>Patient Data</h1>

         <asp:Label runat="server" AssociatedControlID="ddlPatients">Select Patient: </asp:Label>
        <asp:DropDownList ID="ddlPatients" runat="server" CssClass ="form-contol" AutoPostBack="true" OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged">
        </asp:DropDownList>

        <br />
        <h2>Health Record</h2>
        <asp:GridView ID="gvHealthRecord" runat="server" AutoGenerateColumns="false" OnRowEditing="gvHealthRecord_RowEditing" OnRowCancelingEdit="gvHealthRecord_RowCancelingEdit" OnRowUpdating="gvHealthRecord_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Diagnosis">
                    <ItemTemplate>
                        <asp:Label ID="lblDiagnosis" runat="server" Text='<%# Bind("Diagnosis") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDiagnosis" runat="server" Text='<%# Bind("Diagnosis") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                
                <asp:CommandField ShowEditButton="true" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblWarning" runat="server" Text="" ForeColor="Red"></asp:Label>

        <br />
        <h2>Medications</h2>
        <asp:GridView runat="server" ID="gvMedications" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="MedicationName" HeaderText="Medication Name" />
        <asp:BoundField DataField="DosageInstructions" HeaderText="Dosage Instructions" />
        <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MM/dd/yyyy}" />
        <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MM/dd/yyyy}" />

    </Columns>
</asp:GridView>


    </div>


</asp:Content>

