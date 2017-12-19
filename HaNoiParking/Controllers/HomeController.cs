using Model.Dao;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HaNoiParking.Controllers
{
    public class HomeController : Controller
    {
        ParkingDao dao = new ParkingDao();
        public ActionResult Index()
        {
            return View();
        }

        public JsonResult List()
        {
            return Json(dao.GetListParking(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}