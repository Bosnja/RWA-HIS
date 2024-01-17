<%@ Page Title="ZakaziTermin" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

      <div class="container">
        <div class=" text-center mt-5 ">
            <h1 >Zakaži termin
            </h1>
        </div>

    
    <div class="row ">
      <div class="col-lg-7 mx-auto">
        <div class="card mt-2 mx-auto p-4 bg-light">
            <div class="card-body bg-light">
       
            <div class = "container">
                <form id="contact-form" role="form">

            

            <div class="controls">

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="ime">Ime</label>
                            <input id="ime" type="text" class="form-control"  required="required">
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="prezime">Prezime</label>
                            <input id="prezime" type="text" class="form-control"  required="required">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="br_tel">Broj telefona</label>
                            <input id="br_tel" type="tel" class="form-control"  required="required">
                            
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
                            <input id="datum" type="date" class="form-control"  required="required">
        
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="vrijeme">Vrijeme</label>
                            <input id="datum" type="time" class="form-control"  required="required">
                                
                            </div>

                        </div>


                    <div class="col-md-12" align="center">
                        <br />
                        <input type="submit" class="btn btn-success btn-send  pt-2 btn-block " value="Posalji" >

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









<!--

        <div class="col-md-4">
        </div>
        <div class="col-md-4" align="center">
	
	        <h3 style="text-decoration:underline">Appointment Notes</h3>
		    <p> You Only Can Book Your Appointment Between <strong>8 AM to 10 PM.</strong> </p>
		    <p> In Other Times You Can Call Our Ambulance Which Is Available 24/7. </p>

			<h3 style="text-decoration:underline">Business Hours</h3>
		    <ul class="list-unstyled " style="margin-bottom: 30px;">
		    <li><strong>Monday-Saturday:</strong> 24/7 Available.</li>
		    <li><strong>Sunday:</strong> 4 AM to 11 PM.</li>
		    </ul>

				Why choose us? 
	    <h3 style="text-decoration:underline">Why Choose Us?</h3>
		<p>All healthcare facilities can be accessed here under one roof, making UNITY Hospital a one point contact for all your healthcare needs.</p>
		<ul class="list-unstyled">
		<li> 24/7 Ambulance Support.</li>
		<li>Eminent and Experienced Doctors.</li>
		<li> Multiple Options For Treatment.</li>
		</ul>
	</div>
-->
</asp:Content>