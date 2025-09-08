using Microsoft.AspNetCore.Mvc;

namespace Host.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {

        [HttpGet("Demo1")]
        public string Demo1()
        {

            return "Demo1";
        }
        [HttpGet("Demo2")]
        public string Demo2()
        {

            return "Demo2";
        }
    }
}
