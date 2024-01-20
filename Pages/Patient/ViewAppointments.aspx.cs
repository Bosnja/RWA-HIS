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

public partial class Pages_Patient_ViewAppointments : System.Web.UI.Page
{
    AppointmentsOrdersController appointmentsController = new AppointmentsOrdersController();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            var patient = GetCurrentUser();
            LoadAppointments(patient.PatientProfile.PatientID);
        }
    }

    private void LoadAppointments(int patientID)
    {
        var appointments = appointmentsController.GetAppointmentsForPatient(patientID).ToList();


        gvAppointments.DataSource = appointments;
        gvAppointments.DataBind();
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