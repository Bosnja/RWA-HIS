<%@ Application Language="C#" %>
<%@ Import Namespace="RWA_HIS" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Microsoft.AspNet.Identity" %>
<%@ Import Namespace="Microsoft.AspNet.Identity.EntityFramework" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        CreateRoles();
    }

    private void CreateRoles()
    {
        var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));

        // Check if roles exist, and create them if not
        if (!roleManager.RoleExists("Patient"))
        {
            roleManager.Create(new IdentityRole("Patient"));
        }

        if (!roleManager.RoleExists("HealthcareProvider"))
        {
            roleManager.Create(new IdentityRole("HealthcareProvider"));
        }

        // Add more roles as needed
    }


</script>

