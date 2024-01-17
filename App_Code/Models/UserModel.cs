using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;

namespace RWA_HIS.Models
{

        public class Patient
        {
            [Key]
            public int PatientID { get; set; }
            public DateTime DateOfBirth { get; set; }
            public string Gender { get; set; }
            public string EmergencyContactInformation { get; set; }
            public string InsuranceInformation { get; set; }
        }

        public class HealthcareProvider
        {
            [Key]
            public int ProviderID { get; set; }
            public string Specialization { get; set; }
            public string LicensingInformation { get; set; }
        }
    

}