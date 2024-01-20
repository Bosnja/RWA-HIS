using RWA_HIS.Models;
using RWA_HIS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Net.NetworkInformation;

public partial class Pages_Doctor_CreateLabMedicationOrder : System.Web.UI.Page
{
    private int selectedPatientID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPatientsDropDown();
           
        }
    }

    protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selectedPatientID = GetSelectedPatientID();
       
        
    }

    protected void rblOrderType_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Show/hide panels based on selected order type
        pnlMedicationOrder.Visible = rblOrderType.SelectedValue == "Medication";
        pnlLabOrder.Visible = rblOrderType.SelectedValue == "LabOrder";
    }

    protected void btnSaveOrder_Click(object sender, EventArgs e)
    {
        MedicationLabController medicationLabController = new MedicationLabController();
        // Handle saving the medication/lab order to the database
        if (rblOrderType.SelectedValue == "Medication")
        {
            Medication medication = new Medication
            {
                MedicationName = txtMedicationName.Text,
                DosageInstructions = txtDosageInstructions.Text,
                StartDate = DateTime.Parse(txtStartDate.Text),
                EndDate = DateTime.Parse(txtEndDate.Text),
                PatientID = GetSelectedPatientID(),
                MedicationForm = txtMedicationForm.Text,
                ProviderID = GetCurrentUser().HealthcareProvider.ProviderID,

            };

            medicationLabController.AddMedication(medication);
        }
        else if (rblOrderType.SelectedValue == "LabOrder")
        {
            // Save lab order
           LabResult labOrder = new LabResult
           {
                TestName = txtTestName.Text,
                ReferenceRange = txtReferenceRange.Text,
                Units = txtUnits.Text,
                TestMethodology = txtTestMethodology.Text,
                TestResult = txtTestResult.Text,

};


            medicationLabController.AddLabResult(labOrder);
        }

        lblConfirmation.Text = "Order saved successfully!";
        lblConfirmation.Visible = true;
    }

    private void BindPatientsDropDown()
    {
        var patients = GetPatients();
        foreach (ApplicationUser patient in patients)
        {
            // Add a new item to the dropdown
            ddlPatients.Items.Add(new ListItem(patient.FirstNameLastName, patient.PatientProfile.PatientID.ToString()));
        }

    }
    private int GetSelectedPatientID()
    {
        System.Diagnostics.Debug.WriteLine("Selected patient ID: " + ddlPatients.SelectedValue);
        return Convert.ToInt32(ddlPatients.SelectedValue);
    }

    private List<ApplicationUser> GetPatients()
    {
        UserController userController = new UserController();

        return userController.GetPatients();

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
                Role = "Provider",
                HealthcareProvider = new HealthcareProvider
                {
                    Specialization = "Unknown",
                    LicensingInformation = "Unknown",
                }

            };
        }


        return currentUser;
    }
}
