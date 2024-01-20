<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeFile="Onama.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Zdravstveni Informacioni Sistem</h1>
        <p class>"Za pristup stranici generisani su predefinisani podaci, pogledajte sljedeće načine pristupa:</p>
    </div>
    <hr />
    <div class="row">
        <div class="col">
            <h2>Doktor</h2>
            <p>
                Doktor može kreirati nove nalaze i prepisane lijekove. Doktor također ima mogućnost pregleda svog rasporeda (Stranica pogledaj pacijente) i pregleda kartona pacijenata.
                Doktor također ima uvid u sve nalaze i lijekove koje su prepisali ostali doktori.
            </p>
          <p>
    Username: doctor1@example.com <br />
    Password: 123456
</p>
        </div>
        <div class="col">
            <h2>Pacijent</h2>
            <p>
                Pacijent može pristupiti stranici te kreirati termine. Pacijent također ima mogućnost pregleda svog kartona, zakazanih termina te prepisanih lijekova.
            </p>
           <p>
               Username: patient1@example.com <br />
Password: 123456
           </p>
        </div>
        <div class="col">
            <h2>Registracija</h2>
            <p>
                Alternativno, možete se registrovati na stranici i pristupiti i kreirati podatke na taj način .
            </p>
            
        </div>
    </div>
</asp:Content>
