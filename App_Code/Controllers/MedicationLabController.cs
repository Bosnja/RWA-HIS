using RWA_HIS.Models;
using System;
using System.Linq;

namespace RWA_HIS
{ 
public class MedicationLabController
{
    private MedicationLabContext dbContext;

    public MedicationLabController()
    {
        dbContext = new MedicationLabContext();
    }

    // Get all medications
    public IQueryable<Medication> GetAllMedications()
    {
        return dbContext.Medications;
    }

    // Get medication by ID
    public Medication GetMedicationById(int medicationID)
    {
        return dbContext.Medications.Find(medicationID);
    }

    // Get all lab results
    public IQueryable<LabResult> GetAllLabResults()
    {
        return dbContext.LabResults;
    }

    // Get lab result by ID
    public LabResult GetLabResultById(int testID)
    {
        return dbContext.LabResults.Find(testID);
    }

    // Add medication to the database
    public void AddMedication(Medication newMedication)
    {
        dbContext.Medications.Add(newMedication);
        dbContext.SaveChanges();
    }

    // Add lab result to the database
    public void AddLabResult(LabResult newLabResult)
    {
        dbContext.LabResults.Add(newLabResult);
        dbContext.SaveChanges();
    }

    // Update medication
    public void UpdateMedication(Medication updatedMedication)
    {
        var existingMedication = dbContext.Medications.Find(updatedMedication.MedicationID);

        if (existingMedication != null)
        {
            // Update properties based on your needs
            existingMedication.MedicationName = updatedMedication.MedicationName;
            existingMedication.DosageInstructions = updatedMedication.DosageInstructions;
            // Update other properties...

            dbContext.SaveChanges();
        }
    }

    // Update lab result
    public void UpdateLabResult(LabResult updatedLabResult)
    {
        var existingLabResult = dbContext.LabResults.Find(updatedLabResult.TestID);

        if (existingLabResult != null)
        {
            // Update properties based on your needs
            existingLabResult.TestName = updatedLabResult.TestName;
            existingLabResult.TestResult = updatedLabResult.TestResult;
            // Update other properties...

            dbContext.SaveChanges();
        }
    }

    // Delete medication
    public void DeleteMedication(int medicationID)
    {
        var medicationToDelete = dbContext.Medications.Find(medicationID);

        if (medicationToDelete != null)
        {
            dbContext.Medications.Remove(medicationToDelete);
            dbContext.SaveChanges();
        }
    }

    // Delete lab result
    public void DeleteLabResult(int testID)
    {
        var labResultToDelete = dbContext.LabResults.Find(testID);

        if (labResultToDelete != null)
        {
            dbContext.LabResults.Remove(labResultToDelete);
            dbContext.SaveChanges();
        }
    }
}
}