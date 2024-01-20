using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace RWA_HIS.Models
{
    public class UserContext : DbContext
    {
        public UserContext()
           : base("mainDB")
        {
        }
        public DbSet<Patient> Patients { get; set; }
        public DbSet<HealthcareProvider> HealthcareProviders { get; set; }
    }
    public class Patient
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PatientID { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Gender { get; set; }
        public string EmergencyContactInformation { get; set; }
        public string InsuranceInformation { get; set; }

    }

    public class HealthcareProvider
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ProviderID { get; set; }
        public string Specialization { get; set; }
        public string LicensingInformation { get; set; }

    }
}

