using RWA_HIS.Models;
using System;
using System.Linq;

namespace RWA_HIS {
    public class HealthRecordController
    {
        private HealthRecordContext dbContext;

        public HealthRecordController()
        {
            dbContext = new HealthRecordContext();
        }

        // Add health record to the database
        public void AddHealthRecord(HealthRecord newHealthRecord)
        {
            dbContext.Records.Add(newHealthRecord);
            dbContext.SaveChanges();
        }

        // Get health record by ID
        public HealthRecord GetHealthRecordById(int healthRecordId)
        {
            return dbContext.Records.Find(healthRecordId);
        }

        // Get all health records for a specific patient
        public HealthRecord GetHealthRecordForPatient(int patientID)
        {
            return dbContext.Records.Where(hr => hr.PatientID == patientID).FirstOrDefault();
        }

        // Update health record
        public void UpdateHealthRecord(HealthRecord updatedHealthRecord)
        {
            var existingHealthRecord = dbContext.Records.Find(updatedHealthRecord.HealthRecordId);

            if (existingHealthRecord != null)
            {
                // Update properties based on your needs
                existingHealthRecord.Diagnosis = updatedHealthRecord.Diagnosis;
                existingHealthRecord.Treatments = updatedHealthRecord.Treatments;
                existingHealthRecord.Allergies = updatedHealthRecord.Allergies;
                existingHealthRecord.Immunizations = updatedHealthRecord.Immunizations;
                existingHealthRecord.MedicationHistory = updatedHealthRecord.MedicationHistory;
                existingHealthRecord.MedicalHistory = updatedHealthRecord.MedicalHistory;
                existingHealthRecord.Notes = updatedHealthRecord.Notes;

                dbContext.SaveChanges();
            }
        }

        // Delete health record
        public void DeleteHealthRecord(int healthRecordId)
        {
            var healthRecordToDelete = dbContext.Records.Find(healthRecordId);

            if (healthRecordToDelete != null)
            {
                dbContext.Records.Remove(healthRecordToDelete);
                dbContext.SaveChanges();
            }
        }
    }
    }