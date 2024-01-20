using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;

namespace RWA_HIS.Models
{
    public class MedicationLabContext : DbContext
    {
        public MedicationLabContext()
           : base("mainDB")
        {
        }
        public DbSet<Medication> Medications { get; set; }
        public DbSet<LabResult> LabResults { get; set; }
    }

    public class LabResult : GenericResult
    {
        [Key]
        [Column(Order = 2)]
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
        [Column(Order = 2)]
        public int MedicationID { get; set; }
        public string MedicationName { get; set; }
        public string DosageInstructions { get; set; }
        public int ProviderID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string MedicationForm { get; set; }
        public int PatientID { get; set; }
    }

    public class GenericResult
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column(Order = 1)]
        public int OrderID { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }

        public GenericResult()
        {

            CreatedAt = DateTime.Now;
            UpdatedAt = DateTime.Now.AddMinutes(5);
        }

        
    }
}
