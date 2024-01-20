using RWA_HIS;
using RWA_HIS.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Doctor_ViewMedicalRecordWithUpdate : System.Web.UI.Page
{
    private HealthRecordContext healthRecordContext;
    MedicationLabController medicationLabController = new MedicationLabController();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPatientsDropDown();
            var selectedPatientID = GetSelectedPatientID();
            DisplayHealthRecord(selectedPatientID);
        }
    }

    protected void ddlPatients_SelectedIndexChanged(object sender, EventArgs e)
    {
        var selectedPatientID = GetSelectedPatientID();
        System.Diagnostics.Debug.WriteLine("Selected patient ID: " + selectedPatientID);


            Debug.WriteLine(selectedPatientID);
            DisplayHealthRecord(selectedPatientID);

        
        List<Medication> medications = medicationLabController.GetMedicationsForPatient(selectedPatientID).ToList();

        
        // Bind the medications to the GridView
        gvMedications.DataSource = medications;
        gvMedications.DataBind();


    }

    protected void gvHealthRecord_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvHealthRecord.EditIndex = e.NewEditIndex;
        int selectedPatientID = GetSelectedPatientID();
        DisplayHealthRecord(selectedPatientID);
    }

    protected void gvHealthRecord_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvHealthRecord.EditIndex = -1;
        int selectedPatientID = GetSelectedPatientID();
        DisplayHealthRecord(selectedPatientID);
    }

    protected void gvHealthRecord_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int selectedPatientID = GetSelectedPatientID();
        GridViewRow row = gvHealthRecord.Rows[e.RowIndex];
        TextBox txtDiagnosis = (TextBox)row.FindControl("txtDiagnosis");
        string updatedDiagnosis = txtDiagnosis.Text;

        // Update the diagnosis in the database using patientID and updatedDiagnosis
        UpdateHealthRecord(selectedPatientID, updatedDiagnosis);

        gvHealthRecord.EditIndex = -1;
        DisplayHealthRecord(selectedPatientID);
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

    private void DisplayHealthRecord(int patientID)
    {
        healthRecordContext = new HealthRecordContext();
        var healthRecord = healthRecordContext.Records.FirstOrDefault(r => r.PatientID == patientID);

        if (healthRecord != null)
        {
            // Bind health record details to the GridView
            gvHealthRecord.DataSource = new List<HealthRecord> { healthRecord };
            gvHealthRecord.DataBind();
        }
        else
        {
            // Show a warning message or handle appropriately when health record is not found
            lblWarning.Text = "Health record not found for the selected patient.";
            gvHealthRecord.DataSource = null;
            gvHealthRecord.DataBind();
        }
    }

    private void UpdateHealthRecord(int patientID, string updatedDiagnosis)
    {
        healthRecordContext = new HealthRecordContext();
        var healthRecord = healthRecordContext.Records.FirstOrDefault(r => r.PatientID == patientID);

        if (healthRecord != null)
        {
            // Update the diagnosis
            healthRecord.Diagnosis = updatedDiagnosis;
            healthRecordContext.SaveChanges();
        }
        else
        {
            // Handle appropriately when health record is not found
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
}