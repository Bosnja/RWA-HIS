using RWA_HIS.Models;
using System;
using System.Linq;

namespace RWA_HIS { 
public class AppointmentsOrdersController
{
    private AppointmentsOrdersContext dbContext;

    public AppointmentsOrdersController()
    {
        dbContext = new AppointmentsOrdersContext();
    }

    // Add appointment to the database
    public void AddAppointment(Appointment newAppointment)
    {
        dbContext.Appointments.Add(newAppointment);
        dbContext.SaveChanges();
    }

    // Get all appointments for a specific doctor
    public IQueryable<Appointment> GetAppointmentsForDoctor(int doctorID)
    {
        return dbContext.Appointments.Where(a => a.ProviderID == doctorID);
    }

    // Get appointment for a specific patient
    public IQueryable<Appointment> GetAppointmentsForPatient(int patientID)
    {
        return dbContext.Appointments.Where(a => a.PatientID == patientID);
    }

    // Get all appointments in the system
    public IQueryable<Appointment> GetAllAppointments()
    {
        return dbContext.Appointments;
    }

    // Get appointments within a specified date range
    public IQueryable<Appointment> GetAppointmentsInDateRange(DateTime startDate, DateTime endDate)
    {
        return dbContext.Appointments.Where(a => a.DateTime >= startDate && a.DateTime <= endDate);
    }

    // Get appointments with a specific status
    public IQueryable<Appointment> GetAppointmentsByStatus(string status)
    {
        return dbContext.Appointments.Where(a => a.Status == status);
    }

    // Update appointment details
    public void UpdateAppointment(Appointment updatedAppointment)
    {
        var existingAppointment = dbContext.Appointments.Find(updatedAppointment.AppointmentID);

        if (existingAppointment != null)
        {
            // Update properties based on your needs
            existingAppointment.Status = updatedAppointment.Status;
            existingAppointment.NotesForDoctor = updatedAppointment.NotesForDoctor;
            existingAppointment.BillingInformation = updatedAppointment.BillingInformation;

            dbContext.SaveChanges();
        }
    }

    // Delete appointment
    public void DeleteAppointment(string appointmentID)
    {
        var appointmentToDelete = dbContext.Appointments.Find(appointmentID);

        if (appointmentToDelete != null)
        {
            dbContext.Appointments.Remove(appointmentToDelete);
            dbContext.SaveChanges();
        }
    }

}
}