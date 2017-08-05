using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MaintenanceWeb.Startup))]
namespace MaintenanceWeb
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
