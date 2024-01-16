using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.IdentityModel.Protocols.WSTrust;
using System.Linq;
using System.Web;

namespace RWA_HIS.Models
{
    public class AppointmentsOrdersContext : DbContext
    {
        private DbSet<Appointment> appoinments { get; set; }

        private DbSet<ClinicalOrder> clinicalOrders { get; set; }

    }


    class Appointment : GenericOrder
    {
        [Key]
        private string appointmentID {  get; set; }

        private string appointmentType { get; set; }

        private string notesForDoctor { get; set; }

        private string billingInformation { get; set; }

        public Appointment(string appointmentID, string appointmentType, string notesForDoctor, string billingInformation, int patientID, int providerID, DateTime dateTime, string status) : base(patientID, providerID, dateTime, status)
        {
            this.appointmentID = appointmentID;
            this.appointmentType = appointmentType;
            this.notesForDoctor = notesForDoctor;
            this.billingInformation = billingInformation;
           
        }

        public Appointment()
        {
        }

    }

    class ClinicalOrder : GenericOrder
    {
        public ClinicalOrder()
        {
        }

        public ClinicalOrder(int orderID, string orderType, string clinicalNotes, string results, int patientID, int providerID, DateTime dateTime, string status) : base(patientID, providerID, dateTime, status)
        {
            this.orderID = orderID;
            this.orderType = orderType;
            this.clinicalNotes = clinicalNotes;
            this.results = results;
        }
        [Key]
        private int orderID { get; set; }

        private string orderType { get; set; }

        private string clinicalNotes { get; set; }

        private string results {  get; set; }



    }

    class GenericOrder
    {
        [Key]
        private int patientID { get; set; }

        [Key]
        private int providerID { get; set; }

        private DateTime dateTime { get; set; }

        private string status { get; set; }

        public GenericOrder() { }

        public GenericOrder(int patientID, int providerID, DateTime dateTime, string status)
        {
            this.patientID = patientID;
            this.providerID = providerID;
            this.dateTime = dateTime;
            this.status = status;
        }
    }
}
