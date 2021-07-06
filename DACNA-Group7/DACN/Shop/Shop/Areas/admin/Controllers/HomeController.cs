using Models.DAO;
using Models.ViewModel;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Areas.admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: admin/Home
        
        public ActionResult Index()
        {
            //Lấy dữ liệu số lượng sản phẩm đã bán
            var QuantityProduct = new ReportDao().CountProduct();
            ViewBag.QuantityProduct = QuantityProduct;
            //Lấy dữ liệu tổng doanh thu của cửa hàng
            var Earnings = new ReportDao().CountEarning();
            ViewBag.Earnings = Earnings;
            //Lấy số lượng tài khoản đã đăng ký
            var Users = new ReportDao().CountUser();
            ViewBag.Users = Users;
            //Lấy dữ liệu đơn hàng thành công
            var Orders = new ReportDao().CountOrder();
            ViewBag.Orders = Orders;

            //Lấy dữ liệu hiển thị lên biểu đồ doanh thu theo ngày
            var chartday = new ReportDao().ChartByDay();
            ViewBag.ChartByDay = JsonConvert.SerializeObject(chartday);
            //Lấy dữ liệu hiển thị lên biểu đồ doanh thu theo tháng
            var chartmonth = new ReportDao().ChartByMonth();
            ViewBag.ChartByMonth = JsonConvert.SerializeObject(chartmonth);

            return View();
            
        }
        
        public ActionResult Header()
        {
            return PartialView();
        }

    }
}