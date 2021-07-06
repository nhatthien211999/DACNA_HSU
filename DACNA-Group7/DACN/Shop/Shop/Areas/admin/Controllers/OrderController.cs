using Models.DAO;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Areas.admin.Controllers
{
    public class OrderController : BaseController
    {
        // GET: admin/Order
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new OrderDao();
            //Lấy danh sách đơn hàng
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }
        //lấy chi tiết đơn hàng theo mã đơn hàng đã chọn
        public ActionResult Detail(int id)
        {
            var order = new OrderDao().ViewDetail(id);
            return View(order);
        }
        

        
        [HttpDelete]

        public ActionResult Delete(int id)
        {
            new OrderDao().Delete(id);

            return RedirectToAction("Index");
        }
        
    }
}