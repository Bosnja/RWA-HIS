﻿using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Web;
using System;
using RWA_HIS;
using RWA_HIS.Models;

namespace RWA_HIS
{
    public class ApplicationUser : IdentityUser
    {
        private string firstName;
        private string lastName;
        private string role;

        public Patient PatientProfile { get; set; }
        public HealthcareProvider HealthcareProvider { get; set; }
        public string FirstName
        {
            get
            {
                return firstName;
            }
            set
            {
                firstName = value;
            }
        }

        public string LastName
        {
            get
            {
                return lastName;
            }
            set
            {
                lastName = value;
            }
        }

        public string Role
        {
            get
            {
                return role;
            }
            set
            {
                role = value;
            }
        }

        public string FirstNameLastName
        {
            get { return FirstName + " " + LastName; }
        }

        public int PatientID()
        {
            return PatientProfile.PatientID;
        }

    }


    

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("mainDB")
        {
        }
    }

    #region Helpers
    public class UserManager : UserManager<ApplicationUser>
    {
        public UserManager()
            : base(new UserStore<ApplicationUser>(new ApplicationDbContext()))
        {
        }
    }
}

namespace RWA_HIS
{
    public static class IdentityHelper
    {
        // Used for XSRF when linking external logins
        public const string XsrfKey = "XsrfId";

        public static void SignIn(UserManager manager, ApplicationUser user, bool isPersistent)
        {
            IAuthenticationManager authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut(DefaultAuthenticationTypes.ExternalCookie);
            var identity = manager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);
            authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = isPersistent }, identity);
        }

        public const string ProviderNameKey = "providerName";
        public static string GetProviderNameFromRequest(HttpRequest request)
        {
            return request[ProviderNameKey];
        }

        public static string GetExternalLoginRedirectUrl(string accountProvider)
        {
            return "/Account/RegisterExternalLogin?" + ProviderNameKey + "=" + accountProvider;
        }

        private static bool IsLocalUrl(string url)
        {
            return !string.IsNullOrEmpty(url) && ((url[0] == '/' && (url.Length == 1 || (url[1] != '/' && url[1] != '\\'))) || (url.Length > 1 && url[0] == '~' && url[1] == '/'));
        }

        public static void RedirectToReturnUrl(string returnUrl, HttpResponse response)
        {
            if (!String.IsNullOrEmpty(returnUrl) && IsLocalUrl(returnUrl))
            {
                response.Redirect(returnUrl);
            }
            else
            {
                response.Redirect("~/");
            }
        }
    }
    #endregion
}