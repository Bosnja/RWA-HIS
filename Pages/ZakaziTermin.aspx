<%@ Page Title="ZakaziTermin" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" CodeFile="ZakaziTermin.aspx.cs" Inherits="ZakaziTermin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class=" text-center mt-5 ">
            <h1>Zakaži termin
            </h1>
        </div>


        <div class="row ">
            <div class="col-lg-7 mx-auto">
                <div class="card mt-2 mx-auto p-4 bg-light">
                    <div class="card-body bg-light">

                        <div class="container">
                            <form id="contact-form" role="form">



                                <div class="controls">

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="ime">Ime</label>
                                                <input id="ime" type="text" class="form-control" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="prezime">Prezime</label>
                                                <input id="prezime" type="text" class="form-control" required="required">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="br_tel">Broj telefona</label>
                                                <input id="br_tel" type="tel" class="form-control" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="doktor">Odaberi doktora</label>
                                                <br />
                                                <select id="doktor" name="prezime" class="form-control" required="required">
                                                    <option value="doca1">doca1</option>
                                                    <option value="doca2">doca2</option>
                                                    <option value="doca3">doca3</option>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="datum">Datum</label>
                                                <input id="datum" type="date" class="form-control" required="required">
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="vrijeme">Vrijeme</label>
                                                <input id="datum" type="time" class="form-control" required="required">
                                            </div>

                                        </div>


                                        <div class="col-md-12" align="center">
                                            <br />
                                            <input type="submit" class="btn btn-success btn-send  pt-2 btn-block " value="Posalji">
                                        </div>

                                    </div>


                                </div>
                            </form>
                        </div>
                    </div>


                </div>


            </div>


        </div>
    </div>





</asp:Content>
