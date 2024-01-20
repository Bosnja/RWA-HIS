<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Site.master" AutoEventWireup="true" CodeFile="ViewLabOrders.aspx.cs" Inherits="Pages_Doctor_ViewLabOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <div>
            <h2>Lab Orders</h2>
        <hr />
            <asp:GridView ID="gvLabOrders" runat="server" AutoGenerateColumns="False" CssClass="table table-light table-stripe">
                <Columns>
                    <asp:BoundField DataField="TestID" HeaderText="Test ID" SortExpression="TestID" />
                    <asp:BoundField DataField="TestName" HeaderText="Test Name" SortExpression="TestName" />
                    <asp:BoundField DataField="TestResult" HeaderText="Test Result" SortExpression="TestResult" />
                    <asp:BoundField DataField="ReferenceRange" HeaderText="Reference Range" SortExpression="ReferenceRange" />
                    <asp:BoundField DataField="Units" HeaderText="Units" SortExpression="Units" />
                    <asp:BoundField DataField="TestMethodology" HeaderText="Test Methodology" SortExpression="TestMethodology" />
                </Columns>
            </asp:GridView>
        </div>
</asp:Content>

