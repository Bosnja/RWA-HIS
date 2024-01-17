<%@ Page Title="DoktorHome" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<h2>Doktor Ime prezime</h2>

<br>
<div class="row">
    <div class="col-md-4">
        <h3 style="text-align:center">Zakazani pregledi:</h3>
        <p>kalendar</p>
    </div>
    <div class="col-md-4">
        <h3 style="text-align:center">#########</h3>
        <img src="../Pictures/Pacijenti.jpg" width="350px" height="350px" align="center"> 
        <br>
        <p style="text-align:center; margin:10px">
        <a class="btn btn-default" href="#" >Pregledaj »</a>
        </p>
    </div>
    <div class="col-md-4">
        <h3 style="text-align:center">O nama:</h3>
        <img src="../Pictures/Onama.jpg" width="350px" height="350px" align="center"> 
        <br>
        <p style="text-align:center; margin:10px">
        <a class="btn btn-default" href="Onama.aspx" >Pregledaj »</a>
        </p>
    </div>
</div>

</asp:Content>