using Models.DAO;
using Shop.Common;
using Shop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Areas.admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: admin/Login
        public ActionResult Index()

        {
            return View();
        }
        //Action đăng nhập 
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid) //Kiểm tra dữ liệu nhập vào
            {
                var dao = new UserDao();
                var result = dao.Login(model.UserName, Encryptor.MD5Hash(model.Password), true);
                if (result == 1) // Đăng nhập thành công
                {
                    var user = dao.GetById(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.UserID = user.ID;
                    userSession.Role = user.Role;
                    Session.Add(Constants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0) //Username không tồn tại
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại.");
                }
                else if (result == -1) // Status tài khoản không được kích hoạt
                {
                    ModelState.AddModelError("", "Tài khoản bị khóa.");
                }
                else if (result == -2) //Nhập sai password
                {
                    ModelState.AddModelError("", "Mật khẩu không đúng.");
                }
                else if (result == -3) // Không có quyền đăng nhập
                {
                    ModelState.AddModelError("", "Tài khoản của bạn không có quyền đăng nhập.");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng.");
                }
            }
            return View("Index");
        }

    }
}