using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using RWA_HIS;
using RWA_HIS.Models;
using System;
using System.Collections.Generic;
using System.Configuration.Provider;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Patient_ScheduleAppointment : System.Web.UI.Page
{
    AppointmentsOrdersController controller = new AppointmentsOrdersController();
    UserController userController = new UserController();
    static List<ApplicationUser> users = new List<ApplicationUser>();
    static ApplicationUser currentUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        users = userController.GetHealthCareProviders();
        currentUser = GetCurrentUser();
        ddlProviders.Items.Clear();


        // Loop through the list and add items to the dropdown
        foreach (ApplicationUser provider in users)
        {
            // Add a new item to the dropdown
            ddlProviders.Items.Add(new ListItem(provider.FirstName + " " + provider.LastName, provider.HealthcareProvider.ProviderID.ToString()));
        }
    }
    protected void ScheduleAppointment_Click(object sender, EventArgs e)
    {
        
        int selectedProviderID = Convert.ToInt32(ddlProviders.SelectedValue);
        DateTime selectedDate = Convert.ToDateTime(txtAppointmentDate.Text);
        string selectedTime = txtAppointmentTime.Text;
        // Handle the logic for scheduling the appointment
        // Retrieve selected patient, provider, date, and time
        controller.AddAppointment(new Appointment
        {
            PatientID = currentUser.PatientProfile.PatientID,
            ProviderID = int.Parse(ddlProviders.SelectedValue),
            DateTimeAppointed = Convert.ToDateTime(txtAppointmentDate.Text + " " + txtAppointmentTime.Text),
            Status = "Scheduled",
            AppointmentType = ddlAppointmentType.SelectedValue,
            NotesForDoctor = txtNotesForDoctor.Text,
            BillingInformation = txtBillingInformation.Text
        });



        lblConfirmation.Text = "Appointment added successfully!";
        lblConfirmation.Visible = true;
    }

    protected void calAppointmentDate_SelectionChanged(object sender, EventArgs e)
    {
        // Update the appointment date textbox when the calendar selection changes
        txtAppointmentDate.Text = calAppointmentDate.SelectedDate.ToShortDateString();
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