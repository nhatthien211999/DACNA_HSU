using Models.Common;
using Models.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class UserDao
    {
        ModelDbContext db = null;
        public UserDao()
        {
            db = new ModelDbContext();
        }
        //Thêm mới tài khoản
        public long Insert(User entity)
        {
            try {
                db.Users.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }catch(Exception e)
            {
                throw e;
            }
            

        }
        //Cập nhật thông tin tài khoản
        public bool Update(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);
                user.UserName = entity.UserName;
                if (!string.IsNullOrEmpty(entity.Password))
                {
                    user.Password = entity.Password;
                }
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;

                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }
        //Lấy dữ liệu thông tin tài khoản theo mã 
        public User GetById(string username)
        {
            return db.Users.SingleOrDefault(x => x.UserName == username);
        }
        //Lấy chi tiết dữ liệu tài khoản
        public User ViewDetail(int id)
        {
            return db.Users.Find(id);
        }
        //Thay đổi trạng thái tài khoản
        public bool ChangeStatus(long id)
        {
            var user = db.Users.Find(id);
            user.Status = !user.Status;
            db.SaveChanges();
            return user.Status;
        }
        //Xóa thông tin tài khoản
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);
                db.Users.Remove(user);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        //Đăng nhập
        public int Login(string userName, string password, bool isLoginAdmin = false)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
                return 0;
            else
            {
                if (isLoginAdmin == true)
                {
                    if (result.Role == CommonConstants.ADMIN_GROUP)
                    {
                        if (result.Status == false)
                            return -1;
                        else
                        {
                            if (result.Password == password)
                                return 1;
                            else
                                return -2;
                        }
                    }
                    else
                    {
                        return -3;
                    }
                }
                else
                {
                    if (result.Status == false)
                        return -1;
                    else
                    {
                        if (result.Password == password)
                            return 1;
                        else
                            return -2;
                    }
                }
            }
        }
        //Lấy danh sách thông tin tài khoản
        public IEnumerable<User> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<User> model = db.Users.OrderByDescending(x => x.CreateDate);
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.UserName.Contains(searchString));
            }
            return model.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        //Kiểm tra tên đăng nhập
        public bool CheckUserName(string userName)
        {
            return db.Users.Count(x => x.UserName == userName) > 0;
        }
        //Kiểm tra email
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
    }
}
