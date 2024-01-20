using RWA_HIS;
using RWA_HIS.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Doctor_ViewPatients : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindPatients();
        }
    }

    private void BindPatients()
    {
        UserController userController = new UserController();
        List<ApplicationUser> users = userController.GetPatients().ToList();
        List<Patient> patients = users.Select(u => u.PatientProfile).ToList();

        var merge = from user in users
                    join patient in patients on user.PatientProfile.PatientID equals patient.PatientID
                    select new
                    {
                        FirstName = user.FirstName,
                        LastName = user.LastName,
                        Gender = patient.Gender,
                        DateOfBirth = patient.DateOfBirth,
                        PatientId = patient.PatientID,
                        EmergencyContact = patient.EmergencyContactInformation,
                        InsuranceInformation = patient.InsuranceInformation,

                    };

        var result = merge.ToList();
        gvPatients.DataSource = result;
        gvPatients.DataBind();
    }

    protected void gvPatients_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            GridView gvAppointments = (GridView)e.Row.FindControl("gvAppointments");

            if (gvAppointments != null)
            {
                // Access the patient data and extract the patient ID
                var patientData = (dynamic)e.Row.DataItem;
                int patientID = patientData.PatientId;

                // Fetch and bind appointments for the current patient ID
                AppointmentsOrdersController appointmentsController = new AppointmentsOrdersController();
                List<Appointment> appointments = appointmentsController.GetAppointmentsForPatient(patientID).ToList();
                gvAppointments.DataSource = appointments;
                gvAppointments.DataBind();
            }
        }
    }
}
