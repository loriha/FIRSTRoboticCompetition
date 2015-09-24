using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HolmenHighSchoolRoboticClub.Startup))]
namespace HolmenHighSchoolRoboticClub
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
