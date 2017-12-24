using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Model.EF;
using PagedList;
using Model.Dao;

namespace HaNoiParking.Areas.Admin.Controllers
{
    public class ParkingController : BaseController
    {
        private HaNoiParkingDbContext db = new HaNoiParkingDbContext();

        // GET: Admin/Parking
        public async Task<ActionResult> Index(int page = 1, int pageSize = 10)
        {
            var dao = new ParkingDao();
            var lstParking = dao.GetListParking();
            return View(lstParking.ToPagedList(page, pageSize));
        }

        // GET: Admin/Parking/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parking parking = await db.Parkings.FindAsync(id);
            if (parking == null)
            {
                return HttpNotFound();
            }
            return View(parking);
        }

        // GET: Admin/Parking/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Parking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ParkingID,Name,Address,Phone,IsOverNight,Website,OpenTime,Price,Lat,Lng")] Parking parking)
        {
            if (ModelState.IsValid)
            {
                db.Parkings.Add(parking);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(parking);
        }

        // GET: Admin/Parking/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parking parking = await db.Parkings.FindAsync(id);
            if (parking == null)
            {
                return HttpNotFound();
            }
            return View(parking);
        }

        // POST: Admin/Parking/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ParkingID,Name,Address,Phone,IsOverNight,Website,OpenTime,Price,Lat,Lng")] Parking parking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(parking).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(parking);
        }

        // GET: Admin/Parking/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Parking parking = await db.Parkings.FindAsync(id);
            if (parking == null)
            {
                return HttpNotFound();
            }
            return View(parking);
        }

        // POST: Admin/Parking/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Parking parking = await db.Parkings.FindAsync(id);
            db.Parkings.Remove(parking);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
