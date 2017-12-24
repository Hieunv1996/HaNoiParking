using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace HaNoiParking.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        private Model.Dao.AdminDao dao = new Model.Dao.AdminDao(); 
        // GET: Admin/Login
        public ActionResult Index(Model.EF.Admin account)
        {
            if (ModelState.IsValid)
            {
                var result = dao.LoginCheck(account.Username, account.Password);
                if (result == true)
                {
                    Session["AdminUsername"] = account.Username;
                    return RedirectToAction("Index", "Parking");
                }
                else
                {
                    ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu");
                }
            }
            return View("Index");
        }
        public ActionResult Logout()
        {
            Session.Remove("AdminUsername");
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Login");
        }
        //public ActionResult LoginValid(Model.EF.Admin account)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var result = dao.LoginCheck(account.Username, account.Password);
        //        if (result == true)
        //        {
        //            Session["AdminUsername"] = account.Username;
        //            return RedirectToAction("Index", "Parking");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "Sai tài khoản hoặc mật khẩu");
        //        }
        //    }
        //    return View("LoginValid");
        //}

    }
}