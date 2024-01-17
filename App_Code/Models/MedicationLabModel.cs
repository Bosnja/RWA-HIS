using System;
using System.ComponentModel.DataAnnotations;
using System.Data.Entity;
using System.Linq;

namespace RWA_HIS.Models
{

    public class MedicationLabContext : DbContext
    {
        private DbSet<Medication> medications { get; set; }

        private DbSet<LabResult> labResults { get; set; }

    }


    class LabResult : GenericResult
    {
        public LabResult(int orderID, DateTime createdAt, DateTime updatedAt) : base(orderID, createdAt, updatedAt)
        {
        }
        [Key]
        private int testID { get; set; }
        private string testName { get; set; }
        private string testResult { get; set; }

        private string referenceRange { get; set; }

        private string units { get; set; }

        private string testMethodology { get; set; }

    }

    class Medication : GenericResult
    {
        public Medication(int orderID, DateTime createdAt, DateTime updatedAt) : base(orderID, createdAt, updatedAt)
        {
        }

        public Medication(int medicationID, string medicationName, string dosageInstructions, int providerID, DateTime startDate, DateTime endDate, string medicationForm, int patientID)
        {
            MedicationID = medicationID;
            this.medicationName = medicationName;
            this.dosageInstructions = dosageInstructions;
            this.providerID = providerID;
            this.startDate = startDate;
            this.endDate = endDate;
            this.medicationForm = medicationForm;
            this.patientID = patientID;
        }

        [Key]
        private int MedicationID { get; set; }

        private string medicationName { get; set; }

        private string dosageInstructions { get; set; }

        [Key]
        private int providerID { get; set; }

        private DateTime startDate { get; set; }

        private DateTime endDate { get; set; }

        private string medicationForm {  get; set; }
        [Key]
        private int patientID { get; set; }

    }

    class GenericResult
    {
        [Key]
        private int orderID { get; set; }

        private DateTime createdAt { get; set; }

        private DateTime updatedAt { get; set; }

        public GenericResult(int orderID, DateTime createdAt, DateTime updatedAt)
        {
            this.orderID = orderID;
            this.createdAt = createdAt;
            this.updatedAt = updatedAt;
        }

        public GenericResult()
        {
        }
    }
}