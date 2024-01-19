using RWA_HIS.Models;
using RWA_HIS;
using System;
using System.Linq;

namespace RWA_HIS
{ 
public class UserController
{
    private ApplicationDbContext dbContext;

    public UserController()
    {
        dbContext = new ApplicationDbContext();
    }

    // Get user by ID
    public ApplicationUser GetUserById(string userId)
    {
        return dbContext.Users.Find(userId);
    }

    // Get user by username
    public ApplicationUser GetUserByUsername(string username)
    {
        return dbContext.Users.FirstOrDefault(u => u.UserName == username);
    }

}
}