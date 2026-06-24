using Microsoft.AspNetCore.Mvc;
using SimpleMvcApp.Web.Services;

namespace SimpleMvcApp.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly CalculatorService _calculator;
        public HomeController(CalculatorService calculator)
        {
            _calculator = calculator;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            ViewData["Message"] = "Your application description page.";
            return View();
        }

        public IActionResult Contact()
        {
            ViewData["Message"] = "Your contact page.";
            return View();
        }
    }
}
