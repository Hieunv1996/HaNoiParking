using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class ParkingImageDao
    {
        private HaNoiParkingDbContext obj = null;
        public ParkingImageDao()
        {
            obj = new HaNoiParkingDbContext();
        }

        public bool Insert(ParkingImage pImg)
        {
            try
            {
                obj.ParkingImages.Add(pImg);
                return obj.SaveChanges() > 0;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(ParkingImage ParkingImage)
        {
            try
            {
                ParkingImage updateParkingImage = obj.ParkingImages.Find(ParkingImage.ImageID);
                updateParkingImage.ImagePath = ParkingImage.ImagePath;
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }

        public ParkingImage GetByParkingImageID(int id)
        {
            return obj.ParkingImages.Find(id);
        }


        public bool Delete(int id)
        {
            try
            {
                var ParkingImage = GetByParkingImageID(id);
                obj.ParkingImages.Remove(ParkingImage);
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }
    }
}
