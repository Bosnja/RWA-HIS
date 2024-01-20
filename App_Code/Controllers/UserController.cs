using RWA_HIS.Models;
using RWA_HIS;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.Entity;

namespace RWA_HIS
{ 
public class UserController
{
    private ApplicationDbContext dbContext;
    private UserContext userContext;

    public UserController()
    {
        dbContext = new ApplicationDbContext();
        userContext = new UserContext();
    }


    // Get user by ID
    public ApplicationUser GetUserById(string userId)
    {
        return dbContext.Users.Find(userId);
    }

    // Get user by username
    public ApplicationUser GetUserByUsername(string username)
    {
            var user = dbContext.Users.Include(u => u.HealthcareProvider).Include(u => u.PatientProfile).FirstOrDefault(u => u.UserName == username);
            return user;
    }

    public List<ApplicationUser> GetHealthCareProviders()
        {
        return dbContext.Users.Where(u => u.HealthcareProvider != null).Include(u => u.HealthcareProvider).ToList();
    }
        public List<ApplicationUser> GetPatients()
        {
            return dbContext.Users.Where(u => u.PatientProfile != null).Include(u => u.PatientProfile).ToList();
        }
    }
}