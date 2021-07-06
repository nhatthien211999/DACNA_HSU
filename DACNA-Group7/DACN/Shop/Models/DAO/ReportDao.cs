using Models.Model;
using Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.DAO
{
    public class ReportDao
    {
        ModelDbContext db = null;
        public ReportDao()
        {
            db = new ModelDbContext();
        }
        //Tính số lượng sản phẩm đã bán
        public int CountProduct()
        {
            return db.OrderDetails.Sum(x => x.Quantity).Value;
        }
        //Tính doanh thu 
        public decimal CountEarning()
        {
            return db.Orders.Sum(x => x.Total).Value;
        }
        //Đếm số lượng tài khoản đã được sử dụng
        public int CountUser()
        {
            return db.Users.Count();
        }
        //Đếm số lượng đơn hàng đã thành công
        public int CountOrder()
        {
            return db.Orders.Count();
        }
        //Biểu đồ
        public List<DataPoint> Chart()
        {
           
            var model = from o in db.Orders
                        select new DataPoint()
                        {
                            
                            Label = o.CreateDate.ToString(),
                            Y = o.Total
                        };
            return model.Take(7).ToList();
        }
        //Lấy dữ liệu hiển thị biểu đồ doanh thu theo ngày
        public List<DataPoint> ChartByDay()
        {            
            var model = db.Orders.GroupBy(m => m.CreateDate.Day.ToString()).
                Select(m => 
                new DataPoint { Label = m.FirstOrDefault().CreateDate.ToString(), Y = m.Sum(v => v.Total) });
            return model.Take(7).ToList();
        }
        //Lấy dữ liệu hiển thị biểu đồ doanh thu theo ngày
        public List<DataPoint> ChartByMonth()
        {
            var model = db.Orders.GroupBy(m => m.CreateDate.Month.ToString()).
                Select(m =>
                new DataPoint { Label = m.FirstOrDefault().CreateDate.ToString(), Y = m.Sum(v => v.Total) });
            return model.Take(12).ToList();
        }
        //Lấy dữ liệu lên báo cáo thống kê doanh thu theo tháng
        public List<ReportViewModel> GetReportMonth(DateTime? date)
        {
            

            SqlParameter param = new SqlParameter("@DATE", date?.ToString("yyyyMMdd"));           
            if(date==null)
            {
                param.Value = DBNull.Value;
            }
            var report = db.Database.SqlQuery<ReportViewModel>("EXEC RPT_RevenueByMonth @DATE", param).ToList();
            
            return report;
        }
        //Lấy dữ liệu lên báo cáo thống kê doanh thu theo năm
        public List<ReportViewModel> GetReportYear(DateTime? date)
        {


            SqlParameter param = new SqlParameter("@DATE", date?.ToString("yyyyMMdd"));           
            if (date == null)
            {
                param.Value = DBNull.Value;
            }
            var report = db.Database.SqlQuery<ReportViewModel>("EXEC RPT_RevenueByYear @DATE", param).ToList();

            return report;
        }
        //Lấy dữ liệu lên báo cáo thống kê doanh thu theo ngày
        public List<ReportViewModel> GetReportDay(DateTime? date)
        {


            SqlParameter param = new SqlParameter("@DATE", date?.ToString("yyyyMMdd"));           
            if (date == null)
            {
                param.Value = DBNull.Value;
            }
            var report = db.Database.SqlQuery<ReportViewModel>("EXEC RPT_RevenueByDay @DATE", param).ToList();

            return report;
        }
        //Lấy dữ liệu báo cáo thống kê sản phẩm bán chạy nhất
        public List<RPT_TopSelling> GetReportTopSelling()
        {

            var report = db.Database.SqlQuery<RPT_TopSelling>("EXEC RPT_TopSellingProduct").ToList();
            return report;
        }
    }
}
