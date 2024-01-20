using RWA_HIS;
using RWA_HIS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Doctor_ViewLabOrders : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindLabOrders();
        }
    }


    private void BindLabOrders()
    {
        List<LabResult> labOrders = GetLabOrdersFromDatabase();

        // Bind the lab orders to the GridView
        gvLabOrders.DataSource = labOrders;
        gvLabOrders.DataBind();
    }

    private List<LabResult> GetLabOrdersFromDatabase()
    {
        MedicationLabController medicationLabController = new MedicationLabController();
        return medicationLabController.GetAllLabResults().ToList();
    }
}