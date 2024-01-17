<%@ Page Title="About" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeFile="PacijentHome.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Pacijent Ime prezime</h2>
    
    <br>
    <div class="row">
        <div class="col-md-4">
            <h3 style="text-align:center">Zakazani pregledi:</h3>
            <p>kalendar</p>
        </div>
        <div class="col-md-4">
            <h3 style="text-align:center">Naši Doktori:</h3>
            <img src="../Pictures/Doca.jpg" width="350px" height="350px" align="center"> 
            <br>
            <p style="text-align:center; margin:10px">
            <a class="btn btn-default" href="Doktori.aspx" >Pregledaj »</a>
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
