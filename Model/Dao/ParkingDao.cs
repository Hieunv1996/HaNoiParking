using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ParkingDao
    {
        private HaNoiParkingDbContext obj = null;
        public ParkingDao()
        {
            obj = new HaNoiParkingDbContext();
        }

        public bool Insert(Parking acc)
        {
            try
            {
                obj.Parkings.Add(acc);
                return obj.SaveChanges() > 0;
            }
            catch
            {
                return false;
            }
        }

        public List<Parking> GetListParking()
        {
            List<Parking> lst =  obj.Parkings.ToList();
            return lst;
        }

        public bool Update(Parking parking)
        {
            try
            {
                Parking updateParking = obj.Parkings.Find(parking.ParkingID);
                updateParking.Address = parking.Address;
                updateParking.IsOverNight = parking.IsOverNight;
                updateParking.Name = parking.Name;
                updateParking.Phone = parking.Phone;
                updateParking.Price = parking.Price;
                updateParking.Website = parking.Website;
                updateParking.Lat = parking.Lat;
                updateParking.Lng = parking.Lng;
                updateParking.OpenTime = parking.OpenTime;
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }

        public Parking GetByParkingID(int id)
        {
            return obj.Parkings.Find(id);
        }
        

        public bool Delete(int id)
        {
            try
            {
                var parking = GetByParkingID(id);
                obj.Parkings.Remove(parking);
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }
    }
}
