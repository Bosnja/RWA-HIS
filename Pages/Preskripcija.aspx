<%@ Page Title="Preskripcija" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   
    <h2>Ljekarske preskripcije</h2>
    <table class="table table-striped">
    <thead>
      <tr>
        <th scope="col">Doktor</th>
        <th scope="col">Medicina</th>
        <th scope="col">Doza</th>
        <th scope="col">Dijagnoza</th>
        <th scope="col">Dodatne instrukcije</th>
      </tr>
    </thead>
      <tr>
        <td>Alfreds Futterkiste</td>
        <td>Maria Anders</td>
        <td>Germany</td>
        <td></td>
        <td></td>
      </tr>
      <tr>
        <td>Centro comercial Moctezuma</td>
        <td>Francisco Chang</td>
        <td>Mexico</td>
        <td></td>
        <td></td>
      </tr>
    </tbody>
    </table>
</asp:Content>