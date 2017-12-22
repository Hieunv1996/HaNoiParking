using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class AdminDao
    {
        private HaNoiParkingDbContext obj = new HaNoiParkingDbContext();
        public bool LoginCheck(String u, String p)
        {
            List<Admin> tks = obj.Admins.Where(x => x.Username == u && x.Password == p).ToList();
            return tks.Count > 0;
        }
    }
}
