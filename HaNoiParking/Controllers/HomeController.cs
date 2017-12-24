using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HaNoiParking.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
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

        public JsonResult List()
        {
            return Json(new Model.Dao.ParkingDao().GetListParking(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetComment(int id_panking)
        {
            ViewBag.id_panking = id_panking;
            return View(new Models.HaNoiParkingEntities().Comments.ToList().Where(q => q.ParkingID == id_panking).OrderByDescending(q => q.Rating).Take(20).ToList());
        }

        public ActionResult AddComment(int id_panking)
        {
            var db = new Models.HaNoiParkingEntities();
            var u_login = User.Identity;
            Models.Comment comment = new Models.Comment()
            {
                ParkingID = id_panking
            };
            if (u_login.IsAuthenticated)
            {
                var user = db.Users.FirstOrDefault(q => q.Email == u_login.Name);
                comment.UserID = user.UserID;
                comment.User = user;
            }
            return View(comment);
        }

        [HttpPost]
        public ActionResult ActionAddComment(Models.Comment comment)
        {
            var db = new Models.HaNoiParkingEntities();
            comment.Time = DateTime.Now;
            db.Comments.Add(comment);
            db.SaveChanges();
            return RedirectToAction("GetComment", new { id_panking = comment.ParkingID });
        }
    }
}