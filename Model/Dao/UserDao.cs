using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class UserDao
    {
        private HaNoiParkingDbContext obj = null;
        public UserDao()
        {
            obj = new HaNoiParkingDbContext();
        }

        public bool Insert(User acc)
        {
            try
            {
                obj.Users.Add(acc);
                return obj.SaveChanges() > 0;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(User account)
        {
            try
            {
                User updateUser = obj.Users.Find(account.UserID);
                updateUser.Avatar = account.Avatar;
                updateUser.Email = account.Email;
                updateUser.Nickname = account.Nickname;
                if (!string.IsNullOrEmpty(account.Password))
                {
                    updateUser.Password = account.Password;
                }
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }

        public User GetByUserID(int id)
        {
            return obj.Users.Find(id);
        }

        public bool LoginValid(String username, String password)
        {
            List<User> tks = obj.Users.Where(x => x.Email == username && x.Password == password).ToList();
            return tks.Count > 0;
        }

        public bool Delete(int id)
        {
            try
            {
                var account = GetByUserID(id);
                obj.Users.Remove(account);
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }
    }
}
