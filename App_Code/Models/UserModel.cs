using System;
using System.Data.Entity;
using System.Linq;

namespace RWA_HIS.Models
{
   
        public class Person
        {
            public string firstName { get; set; }
            public string lastName { get; set; }
            public string contactInformation { get; set; }
        }

        public class Patient : Person
        {
            public int patientID { get; set; }
            public DateTime dateOfBirth { get; set; }
            public string gender { get; set; }
            public string emergencyContactInformation { get; set; }
            public string insuranceInformation { get; set; }
        }

        public class HealthcareProvider : Person
        {
            public int providerID { get; set; }
            public string specialization { get; set; }
            public string licensingInformation { get; set; }
        }
    

}