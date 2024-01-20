using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RWA_HIS.Models
{
    public class HealthRecordContext : DbContext
    {
        public HealthRecordContext()
           : base("mainDB")
        {
        }

        public DbSet<HealthRecord> Records { get; set; }
    }

    public class HealthRecord
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int HealthRecordId { get; set; }

        public int PatientID { get; set; }

        public DateTime LastUpdate { get; set; }

        public string Diagnosis { get; set; }

        public string Treatments { get; set; }

        public string Allergies { get; set; }

        public string Immunizations { get; set; }

        public string MedicationHistory { get; set; }

        public string MedicalHistory { get; set; }

        public string Notes { get; set; }

        public HealthRecord() { }

        public HealthRecord(int healthRecordId, int patientID, DateTime lastUpdate, string diagnosis, string treatments, string allergies, string immunizations, string medicationHistory, string medicalHistory, string notes)
        {
            PatientID = patientID;
            LastUpdate = lastUpdate;
            Diagnosis = diagnosis;
            Treatments = treatments;
            Allergies = allergies;
            Immunizations = immunizations;
            MedicationHistory = medicationHistory;
            MedicalHistory = medicalHistory;
            Notes = notes;
        }
    }
}
