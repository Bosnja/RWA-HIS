<%@ Page Title="ZakaziTermin" Language="C#" MasterPageFile="~/Pages/Site.Master" AutoEventWireup="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


     <div class="container">
        <div class=" text-center mt-5 ">
            <h1 >Izdaj Preskripcije</h1>
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
                            <label for="ime">Ime pacijenta</label>
                            <br />
                            <select id="ime" name="ime" class="form-control" required="required">
                                <option value="pacijent1">pacijent1</option>
                                <option value="pacijent2">pacijent2</option>
                                <option value="pacijent3">pacijent3</option>
                            </select> 
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="prezime">Prezime pacijenta</label>
                            <br />
                            <select id="prezime" name="prezime" class="form-control" required="required">
                                <option value="pacijent1">pacijent1</option>
                                <option value="pacijent2">pacijent2</option>
                                <option value="pacijent3">pacijent3</option>
                            </select> 

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="dijagnoza">Dijagnoza</label>
                            <input id="dijagnoza" type="text" class="form-control"  required="required">
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="preskripcija">Preskripcija</label>
                            <input id="preskripcija" type="text" class="form-control"  required="required">
                            
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="doza">Doza</label>
                            <input id="doza" type="text" class="form-control"  required="required">
        
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="instrukcije">Dodatne instrukcije</label>
                            <textarea id="instrukcije" name="message" class="form-control"  rows="4" required="required" ></textarea>
                                
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
     
        

 <!-- <form method="post">
  <table width:="50%">
    <tbody>
		<tr>
        <td>Ime pacijenta: </td>
        <td>    
        <select id="ime_pacijenta" required>
            <option value="pacijent1">pacijent1</option>
            <option value="pacijent2">pacijent2</option>
            <option value="pacijent3">pacijent3</option>
        </select> 
        </td>   
        </tr>
        
      
        <tr>
        <td>Dijagnoza: </td> 
        <td><input name="id" type="text"></td>
        </tr> 
        
      
        <tr>
        <td>Preskripcija: </td>
        <td><textarea cols="30" rows="3"></textarea></td>
        </tr>
        
      
        <tr>
        <td>Doza: </td> 
        <td><input name="id" type="text"></td>
        </tr> 
      
        <tr>
        <td>Dodatne instrukcije:</td>
        <td><textarea cols="30" rows="3" name="instructions"></textarea> </td>
        </tr>
      
    </tbody>
  </table>
  
  <button type="submit" class="btn-u">Izdaj</button>
  </form>
    
    -->
</asp:Content>