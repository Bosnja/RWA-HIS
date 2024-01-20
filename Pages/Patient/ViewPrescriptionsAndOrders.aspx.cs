using RWA_HIS;
using RWA_HIS.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Patient_ViewPrescriptionsAndOrders : System.Web.UI.Page
{
    MedicationLabController medicationLabController = new MedicationLabController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var patient = GetCurrentUser();
            // Get all medications for the patient
            var medications = medicationLabController.GetAllMedications().Where(m => m.PatientID == patient.PatientProfile.PatientID).ToList();


            // Bind the data to the gridview
            gvPrescribedMedications.DataSource = medications;
            gvPrescribedMedications.DataBind();


        }



    }

    private ApplicationUser GetCurrentUser()
    {
        ApplicationUser currentUser;
        UserController userManager = new UserController();
        try
        {

            currentUser = userManager.GetUserByUsername(Context.User.Identity.Name);
            return currentUser;

        }
        catch (Exception e)
        {
            currentUser = new ApplicationUser
            {
                FirstName = "Anonymous",
                LastName = "User",
                Role = "Patient",
                PatientProfile = new Patient
                {
                    Gender = "Unknown",
                    DateOfBirth = DateTime.Now,
                    EmergencyContactInformation = "Unknown",
                    InsuranceInformation = "Unknown"
                }

            };
        }


        return currentUser;
    }
}