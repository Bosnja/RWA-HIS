using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using RWA_HIS;
using System.Web.UI.WebControls;
using RWA_HIS.Models;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        ApplicationUser user = CreateApplicationUser();
        var manager = new UserManager();
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
            manager.AddToRole(user.Id, user.Role);
            IdentityHelper.SignIn(manager, user, isPersistent: false);
            IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
        }
        else
        {
            ErrorMessage.Text = result.Errors.FirstOrDefault();
        }
    }

    protected void chkRoles_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedRoles = string.Join(", ", chkRoles.Items.Cast<ListItem>().Where(li => li.Selected).Select(li => li.Value));
        System.Diagnostics.Debug.WriteLine(selectedRoles);
        // Toggle visibility of additional fields based on selected roles
        patientFields.Visible = selectedRoles.Contains("Patient");
        providerFields.Visible = selectedRoles.Contains("HealthcareProvider");
    }

    protected void calDOB_SelectionChanged(object sender, EventArgs e)
    {
        txtDOB.Text = calDOB.SelectedDate.ToShortDateString();
        calDOB.Visible = false; // Hide the calendar after selection
    }

    private ApplicationUser CreateApplicationUser()
    {
        string username = UserName.Text;
        string password = Password.Text;
        string email = Email.Text;

        ApplicationUser user = new ApplicationUser
        {
            UserName = username,
            Email = email,
            FirstName = FirstName.Text,
            LastName = LastName.Text,
            Role = chkRoles.SelectedValue == "Patient" ? "Patient" : "Provider",
            PatientProfile = chkRoles.SelectedValue == "Patient" ? new Patient
            {
                DateOfBirth = DateTime.Parse(txtDOB.Text),
                Gender = txtGender.Text,
                EmergencyContactInformation = txtEmergencyContact.Text,
                InsuranceInformation = txtInsuranceInfo.Text
            } : null,

            HealthcareProvider = chkRoles.SelectedValue == "HealthcareProvider" ? new HealthcareProvider
            {
                Specialization = txtSpecialization.Text,
                LicensingInformation = txtLicensingInfo.Text
            } : null,
            
        };
        return user;
    }
}

