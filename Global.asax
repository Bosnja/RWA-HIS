<%@ Application Language="C#" %>
<%@ Import Namespace="RWA_HIS" %>
<%@ Import Namespace="RWA_HIS.Models" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<%@ Import Namespace="Microsoft.AspNet.Identity.EntityFramework" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        using (var context = new ApplicationDbContext())
        {
            ClearDatabase();
            // Create roles if they don't exist
            CreateRoles(context);

            // Seed users
            SeedUsers(context);

            SeedMockData();
        }

        Console.WriteLine("Seeding completed successfully.");
    }

    private static void CreateRoles(ApplicationDbContext context)
    {
        var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));

        // Create roles if they don't exist
        foreach (var roleName in new List<string> { "Patient", "HealthcareProvider" })
        {
            if (!roleManager.RoleExists(roleName))
            {
                roleManager.Create(new IdentityRole(roleName));
            }
        }
    }

    private static void SeedUsers(ApplicationDbContext context)
    {
        var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

        // Seed users
        var users = new List<ApplicationUser>
            {
                new ApplicationUser
                {
                    UserName = "patient1@example.com",
                    Email = "patient1@example.com",
                    FirstName = "John",
                    LastName = "Doe",
                    Role = "Patient",
                    PatientProfile = new RWA_HIS.Models.Patient
                    {
                        DateOfBirth = DateTime.Now,
                        Gender = "Male",
                        EmergencyContactInformation = "+6874987",
                        InsuranceInformation = "Medicare Premium"

                    }
                },
                new ApplicationUser
                {
                    UserName = "doctor1@example.com",
                    Email = "doctor1@example.com",
                    FirstName = "Dr.",
                    LastName = "Smith",
                    Role = "HealthcareProvider",
                    HealthcareProvider = new RWA_HIS.Models.HealthcareProvider
                    {
                        LicensingInformation = "License1",
                        Specialization = "Cardiology"
                    }
                },
                // Add more users as needed
            };

        foreach (var user in users)
        {
            if (userManager.FindByName(user.UserName) == null)
            {
                userManager.Create(user, "123456"); // Change the password as needed
                userManager.AddToRole(user.Id, user.Role);
            }
        }
    }


    private void SeedMockData()
    {
        // Create an instance of your DbContext for each data type
        using (ApplicationDbContext userDbContext = new ApplicationDbContext())
        using (AppointmentsOrdersContext appointmentsDbContext = new AppointmentsOrdersContext())
        using (HealthRecordContext healthRecordDbContext = new HealthRecordContext())
        using (MedicationLabContext medicationLabDbContext = new MedicationLabContext())
        {
            // Seed mock data for medications
            SeedMedications(medicationLabDbContext);

            // Seed mock data for appointments
            SeedAppointments(appointmentsDbContext);

            // Seed mock data for health records
            SeedHealthRecords(healthRecordDbContext);
        }
    }


    private void SeedMedications(MedicationLabContext dbContext)
    {
        // Add mock medications
        List<Medication> meds = new List<Medication>{
            new Medication
            {
                MedicationName = "Aspirin",
                DosageInstructions = "Take one tablet daily",
                StartDate = DateTime.Now.AddDays(-30),
                EndDate = DateTime.Now.AddDays(30),
                ProviderID = 1,
                MedicationForm = "Tablet",
                PatientID = 1

            },
            new Medication
            {
                MedicationName = "Ibuprofen",
                DosageInstructions = "Take two tablets daily",
                StartDate = DateTime.Now.AddDays(-30),
                EndDate = DateTime.Now.AddDays(30),
                ProviderID = 1,
                MedicationForm = "Tablet",
                PatientID = 1

            },
            new Medication
            {
                MedicationName = "Paracetamol",
                DosageInstructions = "Take one tablet daily",
                StartDate = DateTime.Now.AddDays(-30),
                EndDate = DateTime.Now.AddDays(30),
                ProviderID = 1,
                MedicationForm = "Tablet",
                PatientID = 1

            }
            };

        List<LabResult> labResults = new List<LabResult>
            {
                new LabResult
                {
                    TestID = 1,
                    TestName = "Blood Pressure",
                    TestResult = "120/80",
                    ReferenceRange = "Normal",
                    Units = "mmHg",
                    TestMethodology = "Manual"
                },
                new LabResult
                {
                    TestID = 2,
                    TestName = "Cholesterol",
                    TestResult = "180",
                    ReferenceRange = "Below 200",
                    Units = "mg/dL",
                    TestMethodology = "Chemical Analysis"
                },
            };
        dbContext.Medications.AddRange(meds);
        dbContext.LabResults.AddRange(labResults);

        dbContext.SaveChanges();
    }

    private void SeedAppointments(AppointmentsOrdersContext dbContext)
    {
        // Add mock appointments
        dbContext.Appointments.AddRange(new List<Appointment> {
            new Appointment
            {
                PatientID = 1,
                ProviderID = 1,
                DateTimeAppointed = DateTime.Now.AddHours(24),
                Status = "Scheduled",
                AppointmentType = "Regular",

            },
            new Appointment
            {
                 PatientID = 1,
                 ProviderID = 1,
                 DateTimeAppointed = DateTime.Now.AddHours(2),
                 Status = "Scheduled",
                 AppointmentType = "Urgent",

            },
            }
        // Add more appointments as needed
        );

        dbContext.SaveChanges();
    }

    private void SeedHealthRecords(HealthRecordContext dbContext)
    {
        // Add mock health records
        dbContext.Records.Add(
            new HealthRecord
            {
                PatientID = 1,
                LastUpdate = DateTime.Now.AddDays(-7),
                Diagnosis = "Healthy",
                Treatments = "None",
                Allergies = "Severe sea food allergy",
                Immunizations = "Up to date",
                MedicationHistory = "No significant history",
                MedicalHistory = "No significant history",
                Notes = "Regular checkup",
            }
            // Add more health records as needed
        );

        dbContext.SaveChanges();
    }

    private void ClearDatabase()
    {

        using (var dbContext = new MedicationLabContext())
        {
            var medications = dbContext.Medications.ToList();
            dbContext.Medications.RemoveRange(medications);

            var labResults = dbContext.LabResults.ToList();
            dbContext.LabResults.RemoveRange(labResults);

            dbContext.SaveChanges();
        }
        using (var dbContext = new AppointmentsOrdersContext())
        {
            var appointments = dbContext.Appointments.ToList();
            dbContext.Appointments.RemoveRange(appointments);
            dbContext.SaveChanges();
        }
        using (var dbContext = new HealthRecordContext())
        {
            var records = dbContext.Records.ToList();
            dbContext.Records.RemoveRange(records);
            dbContext.SaveChanges();

        }
    }
</script>

