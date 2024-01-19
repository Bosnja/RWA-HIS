using System;
using System.Data.Entity;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace RWA_HIS.Models
{
    public class AppointmentsOrdersContext : DbContext
    {
        public DbSet<Appointment> Appointments { get; set; }
    }

    public class Appointment
    {
        [Key]
        public string AppointmentID { get; set; }

        public int PatientID { get; set; }

        public int ProviderID { get; set; }

        public DateTime DateTime { get; set; }

        public string Status { get; set; }

        public string AppointmentType { get; set; }

        public string NotesForDoctor { get; set; }

        public string BillingInformation { get; set; }
    }
}
