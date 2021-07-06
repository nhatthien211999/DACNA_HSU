using Models.DAO;
using Models.Model;
using Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Areas.admin.Controllers
{
    public class ProductController : BaseController
    {
        ModelDbContext db = new ModelDbContext();
        // GET: Product
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ProductDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return View(model);
        }
        [HttpGet]

        public ActionResult Create()
        {
            return View();
        }

        public ActionResult Edit(int id)
        {
            var user = new ProductDao().ViewDetail(id);
            return View(user);
        }
        [HttpPost]

        public ActionResult Create(ProductVM product)
        {

            //ViewBag.Categories = new SelectList(db.Categories, "ID", "Name");
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                //Thêm mới sản phẩm
                Product products = new Product();
                products.Name = product.Name;
                products.Code = product.Code;
                products.Image = product.Image;
                products.Descriptions = product.Descriptions;
                products.Price = product.Price;
                products.Quantity = product.Quantity;
                products.CreateDate = DateTime.Now;
                products.Status = true;
                products.IncludeVAT = false;
                products.CategoryID = product.CateID;
                products.SupplierID = product.SupplierID;
                long id = dao.Insert(products);
                //có tồn tại id sẽ thông báo thành công
                if (id > 0)
                {
                    SetAlert("Thêm sản phẩm mới thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm sản phẩm mới thất bại.");
                }
            }
            return View(product);
        }
        [HttpPost]

        public ActionResult Edit(Product product)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.Update(product);
                if (result)
                {
                    SetAlert("Sửa thông tin sản phẩm thành công", "success");
                    return RedirectToAction("Index", "Product");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật sản phẩm không thành công.");
                }
            }
            return View("Index");
        }
        [HttpDelete]

        public ActionResult Delete(int id)
        {
            new ProductDao().Delete(id);

            return RedirectToAction("Index");
        }

    }
}