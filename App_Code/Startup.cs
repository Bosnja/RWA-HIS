using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RWA_HIS.Startup))]
namespace RWA_HIS
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
