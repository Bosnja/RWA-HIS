using System;
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

        private int MedicationID { get; set; }

        private string medicationName { get; set; }

        private string dosageInstructions { get; set; }

        private int providerID { get; set; }

        private DateTime startDate { get; set; }

        private DateTime endDate { get; set; }

        private string medicationForm {  get; set; }

    }

    class GenericResult
    {
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