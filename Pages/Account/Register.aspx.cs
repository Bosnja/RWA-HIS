using Microsoft.AspNet.Identity;
using System;
using System.Linq;
using System.Web.UI;
using RWA_HIS;
using System.Web.UI.WebControls;

public partial class Account_Register : Page
{
    protected void CreateUser_Click(object sender, EventArgs e)
    {
        var manager = new UserManager();
        var user = new ApplicationUser() { UserName = UserName.Text };
        IdentityResult result = manager.Create(user, Password.Text);
        if (result.Succeeded)
        {
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
}

