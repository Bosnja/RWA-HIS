using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;
using System.Web;


namespace RWA_HIS.Models
{

    public class HealthRecordContext : DbContext
    {
        private DbSet<HealthRecord> Records {  get; set; }
    }

    public class HealthRecord
    {

        [Key]
        private int healthRecordId {  get; set; }

        private int patientID { get; set; }

        private DateTime lastUpdate {  get; set; }

        private string diagnosis { get; set; }

        private string treatments { get; set; }

        private string allergies { get; set; }

        private string immunizations { get; set; }

        private string medicationHistory {  get; set; }

        private string medicalHistory { get; set; }

        private string notes {  get; set; }



        public HealthRecord() { }

        public HealthRecord(int healthRecordId, int patientID, DateTime lastUpdate, string diagnosis, string treatments, string allergies, string immunizations, string medicationHistory, string medicalHistory, string notes)
        {
            this.healthRecordId = healthRecordId;
            this.patientID = patientID;
            this.lastUpdate = lastUpdate;
            this.diagnosis = diagnosis;
            this.treatments = treatments;
            this.allergies = allergies;
            this.immunizations = immunizations;
            this.medicationHistory = medicationHistory;
            this.medicalHistory = medicalHistory;
            this.notes = notes;
        }
    }
}