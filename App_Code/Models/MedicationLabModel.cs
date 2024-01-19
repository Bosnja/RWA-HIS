using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;

namespace RWA_HIS.Models
{
    public class MedicationLabContext : DbContext
    {
        public DbSet<Medication> Medications { get; set; }
        public DbSet<LabResult> LabResults { get; set; }
    }

    public class LabResult : GenericResult
    {
        [Key]
        public int TestID { get; set; }
        public string TestName { get; set; }
        public string TestResult { get; set; }
        public string ReferenceRange { get; set; }
        public string Units { get; set; }
        public string TestMethodology { get; set; }
    }

    public class Medication : GenericResult
    {
        [Key]
        public int MedicationID { get; set; }
        public string MedicationName { get; set; }
        public string DosageInstructions { get; set; }
        [Key]
        public int ProviderID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string MedicationForm { get; set; }
        [Key]
        public int PatientID { get; set; }
    }

    public class GenericResult
    {
        [Key]
        public int OrderID { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public GenericResult(int orderID, DateTime createdAt, DateTime updatedAt)
        {
            OrderID = orderID;
            CreatedAt = createdAt;
            UpdatedAt = updatedAt;
        }

        public GenericResult()
        {
        }
    }
}
