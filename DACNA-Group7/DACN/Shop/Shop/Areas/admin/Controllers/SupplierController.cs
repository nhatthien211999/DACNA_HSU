using Models.DAO;
using Models.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Areas.admin.Controllers
{
    public class SupplierController : BaseController
    {
        // GET: admin/Supplier
        public ActionResult Index(string searchString)
        {
            var model = new ProductDao().GetListSup(searchString);
            return View(model);
        }
        public ActionResult Create()
        {
            return View();
        }
        public ActionResult Edit(int id)
        {
            var model = new ProductDao().SupViewDetail(id);
            return View(model);
        }
        [HttpPost]

        public ActionResult Create(Supplier sup)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();

                long id = dao.InsertSup(sup);
                if (id > 0)
                {
                    SetAlert("Thêm nhà cung cấp thành công", "success");
                    return RedirectToAction("Index", "Category");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm nhà cung cấp không thành công.");
                }
            }
            return View("Index");
        }
        [HttpPost]

        public ActionResult Edit(Supplier sup)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductDao();
                var result = dao.UpdateSup(sup);
                if (result)
                {
                    SetAlert("Sửa thông tin nhà cung cấp thành công", "success");
                    return RedirectToAction("Index", "Supplier");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin nhà cung cấp không thành công.");
                }
            }
            return View("Index");
        }
        [HttpDelete]

        public ActionResult Delete(int id)
        {
            new ProductDao().DeleteSup(id);

            return RedirectToAction("Index");
        }
    }
}