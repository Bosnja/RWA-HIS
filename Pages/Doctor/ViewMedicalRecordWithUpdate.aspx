<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewMedicalRecordWithUpdate.aspx.cs" Inherits="Pages_Doctor_ViewMedicalRecordWithUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div>
        <h1>Patient Data</h1>

        <asp:Label runat="server" AssociatedControlID="ddlPatients">Select Patient: </asp:Label>
        <asp:DropDownList ID="ddlPatients" runat="server" CssClass="form-contol" AutoPostBack="true" OnSelectedIndexChanged="ddlPatients_SelectedIndexChanged">
        </asp:DropDownList>
<hr />
        <br />
        
        <h2>Health Record</h2>
        <asp:GridView CssClass="table table-dark table-striped ml-auto" ID="gvHealthRecord" runat="server" AutoGenerateColumns="false" OnRowEditing="gvHealthRecord_RowEditing" OnRowCancelingEdit="gvHealthRecord_RowCancelingEdit" OnRowUpdating="gvHealthRecord_RowUpdating">
            <Columns>
                <asp:TemplateField HeaderText="Diagnosis">
                    <ItemTemplate>
                        <asp:Label ID="lblDiagnosis" runat="server" Text='<%# Bind("Diagnosis") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDiagnosis" runat="server" Text='<%# Bind("Diagnosis") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Treatments">
                    <ItemTemplate>
                        <asp:Label ID="lblTreatments" runat="server" Text='<%# Bind("Treatments") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtTreatments" runat="server" Text='<%# Bind("Treatments") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Allergies">
                    <ItemTemplate>
                        <asp:Label ID="lblAllergies" runat="server" Text='<%# Bind("Allergies") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtAllergies" runat="server" Text='<%# Bind("Allergies") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Medication History">
                    <ItemTemplate>
                        <asp:Label ID="lblMedicationHistory" runat="server" Text='<%# Bind("MedicationHistory") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMedicationHistory" runat="server" Text='<%# Bind("MedicationHistory") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Medical History">
                    <ItemTemplate>
                        <asp:Label ID="lblMedicalHistory" runat="server" Text='<%# Bind("MedicalHistory") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMedicalHistory" runat="server" Text='<%# Bind("MedicalHistory") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Immunizations">
                    <ItemTemplate>
                        <asp:Label ID="lblImmunizations" runat="server" Text='<%# Bind("Immunizations") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtImmunizations" runat="server" Text='<%# Bind("Immunizations") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Notes">
                    <ItemTemplate>
                        <asp:Label ID="lblNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNotes" runat="server" Text='<%# Bind("Notes") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" />
            </Columns>
            <HeaderStyle CssClass="table-header" />
    <AlternatingRowStyle CssClass="alt-row" />

        </asp:GridView>
        <asp:Label ID="lblWarning" runat="server" Text="" ForeColor="Red"></asp:Label>
        <hr />
        <br />
        <h2>Medications</h2>
        <asp:GridView runat="server" ID="gvMedications" AutoGenerateColumns="false" CssClass="table table-dark table-striped">
            <Columns>
                <asp:BoundField DataField="MedicationName" HeaderText="Medication Name" />
                <asp:BoundField DataField="DosageInstructions" HeaderText="Dosage Instructions" />
                <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:MM/dd/yyyy}" />
                <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:MM/dd/yyyy}" />

            </Columns>
        </asp:GridView>


    </div>


</asp:Content>

