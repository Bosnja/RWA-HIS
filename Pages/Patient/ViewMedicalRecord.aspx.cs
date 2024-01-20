using Microsoft.AspNet.Identity.Owin;
using RWA_HIS.Models;
using RWA_HIS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Pages_Patient_ViewMedicalRecord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var patient = GetCurrentUser(); 
        var healthRecord = GetHealthRecord(patient.PatientProfile.PatientID);
        // Display health record information
        if (healthRecord != null)
        {
            lblPatientID.Text = healthRecord.PatientID.ToString();
            lblLastUpdate.Text = healthRecord.LastUpdate.ToString();
            lblDiagnosis.Text = healthRecord.Diagnosis;
            lblTreatments.Text = healthRecord.Treatments;
            lblAllergies.Text = healthRecord.Allergies;
            lblImmunizations.Text = healthRecord.Immunizations;
            lblMedicationHistory.Text =  healthRecord.MedicationHistory;
            lblMedicalHistory.Text = healthRecord.MedicalHistory;
            lblNotes.Text = healthRecord.Notes;
            lblWarning.Text = ""; // Reset warning message if record is found
        }
        else
        {
            // Handle the case where the health record is not found
            lblWarning.Text = "Record could not be found.";
        }
    }

    private HealthRecord GetHealthRecord(int patientID)
    {
        using (var context = new HealthRecordContext())
        {
            return context.Records.FirstOrDefault(r => r.PatientID == patientID);
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