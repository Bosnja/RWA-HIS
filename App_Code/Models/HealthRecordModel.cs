using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace RWA_HIS.Models
{
    public class HealthRecordContext : DbContext
    {
        public DbSet<HealthRecord> Records { get; set; }
    }

    public class HealthRecord
    {
        [Key]
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
            HealthRecordId = healthRecordId;
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
