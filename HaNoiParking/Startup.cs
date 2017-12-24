using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HaNoiParking.Startup))]
namespace HaNoiParking
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
