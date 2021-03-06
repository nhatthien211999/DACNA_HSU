using Models.Model;
using Models.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class OrderDao
    {
        ModelDbContext db = null;
        public OrderDao()
        {
            db = new ModelDbContext();
        }
        //Thêm đơn hàng
        public int Insert(Order order)
        {
            db.Orders.Add(order);
            db.SaveChanges();
            return order.ID;
        }
        //Lấy danh sách đơn hàng
        public IEnumerable<OrderViewModel> ListAllPaging(string searchString, int page, int pageSize)
        {
            //IQueryable<Product> model = db.Products.OrderByDescending(x => x.CreateDate);
            IQueryable<OrderViewModel> models = from o in db.Orders
                                                  
                                                  select new OrderViewModel
                                                  {
                                                      ID = o.ID,
                                                      ShipName = o.ShipName,
                                                      ShipAddress=o.ShipAddress,
                                                      ShipEmail=o.ShipEmail,
                                                      ShipPhone=o.ShipPhone,
                                                      Total=o.Total,
                                                      UserID=o.UserID,
                                                      Status=o.Status,
                                                      CreateDate=o.CreateDate

                                                  };
            if (!string.IsNullOrEmpty(searchString))
            {
                models = models.Where(x => x.ShipName.Contains(searchString) || x.ShipEmail.Contains(searchString));
            }
            return models.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }
        //Cập nhật đơn hàng
        public bool Update(Order order)
        {
            try
            {
                var orders = db.Orders.Find(order.ID);
                orders.UserID = order.UserID;
                orders.Total = order.Total;
                orders.ShipName = order.ShipName;
                orders.ShipAddress = order.ShipAddress;
                orders.ShipEmail = order.ShipEmail;
                orders.ShipPhone = order.ShipPhone;

                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }

        //Lấy đơn hàng theo mã đơn hàng
        public List<OrderDetail> ViewDetail(int id)
        {
            return db.OrderDetails.Where(x=>x.OrderID==id).ToList();
        }
        //Xóa đơn hàng và chi tiết đơn hàng
        public bool Delete(int id)
        {
            try
            {
                var od = db.OrderDetails.Find(id);
                db.OrderDetails.Remove(od);
                var order = db.Orders.Find(id);
                db.Orders.Remove(order);
                
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        
        
    }
}
