using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using PoePart1.Models;

namespace PoePart1.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        // GET: Home/Index
        public IActionResult Index()
        {
            return View(); // This will look for the Index.cshtml view in Views/Home folder
        }

        // GET: Home/Error
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}

