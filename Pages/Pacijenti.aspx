<%@ Page Title="DoktorHome" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Naši pacijenti</h2>

    <table class="table table-striped">
<thead>
  <tr>
    <th scope="col">Ime</th>
    <th scope="col">Prezime</th>
    <th scope="col">Broj telefona</th>
    <th scope="col">Pol</th>
    <th scope="col">Dijagnoza</th>
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