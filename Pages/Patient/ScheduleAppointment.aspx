<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ScheduleAppointment.aspx.cs" Inherits="Pages_Patient_ScheduleAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <h2>Schedule Appointment</h2>
        <hr />

        <br />
        <div class="row">
            <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="ddlProviders">Select Healthcare Provider:</asp:Label>
        <asp:DropDownList runat="server" ID="ddlProviders" CssClass="form-control">
        </asp:DropDownList>
                </div>
        
            <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="txtAppointmentDate">Select Date:</asp:Label>
        <asp:TextBox runat="server" ID="txtAppointmentDate" CssClass="form-control" ReadOnly="true" onfocus="showCalendar()"></asp:TextBox>
        <asp:Calendar runat="server" ID="calAppointmentDate" OnSelectionChanged="calAppointmentDate_SelectionChanged" Style="display: none;" />
        <script type="text/javascript">
            function showCalendar() {
                var cal = document.getElementById('<%= calAppointmentDate.ClientID %>');
                if (cal) {
                    cal.style.display = 'block';
                }
            }
        </script>
                </div>
        <br />
             <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="txtAppointmentTime">Select Time:</asp:Label>
        <asp:TextBox runat="server" ID="txtAppointmentTime" CssClass="form-control"></asp:TextBox>
                 </div>
        <br />
            </div>
        <div class="row">
             <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="ddlAppointmentType">Select Appointment Type</asp:Label>
        <asp:DropDownList runat="server" ID="ddlAppointmentType" CssClass="form-control">
            <asp:ListItem Text="Regular" Value="Regular"></asp:ListItem>
            <asp:ListItem Text="Urgent" Value="Urgent"></asp:ListItem>
            <asp:ListItem Text="Emergency" Value="Emergency"></asp:ListItem>


        </asp:DropDownList>
                 </div>
        <br />
         <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="txtNotesForDoctor">Notes for Doctor:</asp:Label>
        <asp:TextBox runat="server" ID="txtNotesForDoctor" CssClass="form-control"></asp:TextBox>
             </div>
        <br />
              <div class="col-md-4 mb-3 mb-sm-0">
        <asp:Label runat="server" AssociatedControlID="txtBillingInformation">Billing Information:</asp:Label>
        <asp:TextBox runat="server" ID="txtBillingInformation" CssClass="form-control"></asp:TextBox>
        </div>
              </div>
        <div class="row ">
            <div class="col-md-4 mb-3 mb-sm-0 mt-4">
        <asp:Button runat="server" OnClick="ScheduleAppointment_Click" Text="Schedule Appointment" CssClass="btn btn-primary" />
        <asp:Label runat="server" ID="lblConfirmation" CssClass="text-success" Visible="false"></asp:Label>
    </div>
            </div>
        </div>
</asp:Content>

