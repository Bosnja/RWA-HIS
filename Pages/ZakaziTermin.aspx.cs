using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ZakaziTermin : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnZakaziTermin_Click(object sender, EventArgs e)
    {
        Response.Redirect("ZakaziTermin.aspx");
    }

}