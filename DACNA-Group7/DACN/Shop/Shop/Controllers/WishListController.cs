using Models.DAO;
using Models.ViewModel;
using Shop.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Shop.Controllers
{
    public class WishListController : Controller
    {
        // GET: WishList
        public ActionResult Index()
        {
            var cart = Session[Constants.WishListSession];
            var list = new List<CartViewModel>();
            if (cart != null)
            {
                list = (List<CartViewModel>)cart;
            }
            return View(list);
        }
        public ActionResult AddItem(int productId, int quantity)
        {
            var product = new ProductDao().ViewDetail(productId);
            var cart = Session[Constants.WishListSession];
            if (cart != null)
            {
                var list = (List<CartViewModel>)cart;
                if (list.Exists(x => x.product.ID == productId))
                {
                    foreach (var item in list)
                    {
                        if (item.product.ID == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    var item = new CartViewModel();
                    item.product = product;
                    item.Quantity = quantity;
                    list.Add(item);
                }
            }
            else
            {
                //Tạo mới đối tượng cart item   
                var item = new CartViewModel();
                item.product = product;
                item.Quantity = quantity;
                var list = new List<CartViewModel>();
                list.Add(item);
                //gán vào session
                Session[Constants.WishListSession] = list;
            }
            return Redirect("/Home/Index");
        }
    }
}