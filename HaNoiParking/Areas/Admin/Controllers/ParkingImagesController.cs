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

namespace HaNoiParking.Areas.Admin.Controllers
{
    public class ParkingImagesController : BaseController
    {
        private HaNoiParkingDbContext db = new HaNoiParkingDbContext();

        // GET: Admin/ParkingImages
        public async Task<ActionResult> Index()
        {
            return View(await db.ParkingImages.ToListAsync());
        }

        // GET: Admin/ParkingImages/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParkingImage parkingImage = await db.ParkingImages.FindAsync(id);
            if (parkingImage == null)
            {
                return HttpNotFound();
            }
            return View(parkingImage);
        }

        // GET: Admin/ParkingImages/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/ParkingImages/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ImageID,ParkingID,ImagePath")] ParkingImage parkingImage)
        {
            if (ModelState.IsValid)
            {
                db.ParkingImages.Add(parkingImage);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(parkingImage);
        }

        // GET: Admin/ParkingImages/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParkingImage parkingImage = await db.ParkingImages.FindAsync(id);
            if (parkingImage == null)
            {
                return HttpNotFound();
            }
            return View(parkingImage);
        }

        // POST: Admin/ParkingImages/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ImageID,ParkingID,ImagePath")] ParkingImage parkingImage)
        {
            if (ModelState.IsValid)
            {
                db.Entry(parkingImage).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(parkingImage);
        }

        // GET: Admin/ParkingImages/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ParkingImage parkingImage = await db.ParkingImages.FindAsync(id);
            if (parkingImage == null)
            {
                return HttpNotFound();
            }
            return View(parkingImage);
        }

        // POST: Admin/ParkingImages/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ParkingImage parkingImage = await db.ParkingImages.FindAsync(id);
            db.ParkingImages.Remove(parkingImage);
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
