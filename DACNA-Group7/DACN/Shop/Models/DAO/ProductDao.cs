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
    public class ProductDao
    {
        ModelDbContext db = null;
        public ProductDao()
        {
            db = new ModelDbContext();
        }

        #region ProductDAO
        //Lấy tất cả thông tin sản phẩm và phân trang thông tin sản phẩm
        public IEnumerable<ProductViewModel> ListAllPaging(string searchString, int page, int pageSize)
        {
            //IQueryable<Product> model = db.Products.OrderByDescending(x => x.CreateDate);
            IQueryable<ProductViewModel> models = from p in db.Products
                                                  join s in db.Suppliers
                                                  on p.SupplierID equals s.ID
                                                  join c in db.Categories
                                                  on p.CategoryID equals c.ID
                                                  select new ProductViewModel
                                                  {
                                                      ID = p.ID,
                                                      Name = p.Name,
                                                      Code = p.Code,
                                                      Descriptions = p.Descriptions,
                                                      Image = p.Image,
                                                      Price = p.Price,
                                                      Quantity = p.Quantity,
                                                      CreateDate = p.CreateDate,
                                                      Status = p.Status,
                                                      SupplierName = s.Name,
                                                      CateName = c.Name

                                                  };
            if (!string.IsNullOrEmpty(searchString))
            {
                models = models.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString));
            }
            return models.OrderByDescending(x => x.CreateDate).ToPagedList(page, pageSize);
        }
        //Thêm thông tin sản phẩm
        public long Insert(Product product)
        {
            try
            {
                
                db.Products.Add(product);
                db.SaveChanges();
                return product.ID;
            }
            catch (Exception e)
            {
                throw e;
            }


        }
        //Cập nhật thông tin sản phẩm
        public bool Update(Product product)
        {
            try
            {
                var products = db.Products.Find(product.ID);
                products.Name = product.Name;
                products.Code = product.Code;
                products.Descriptions = product.Descriptions;
                products.Price = product.Price;
                products.CreateDate = DateTime.Now;
                products.Quantity = product.Quantity;

                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }
        //Lấy sản phẩm theo mã sản phẩm
        public Product GetById(int id)
        {
            return db.Products.SingleOrDefault(x => x.ID == id);
        }
        //Lấy chi tiết thông tin sản phẩm
        public Product ViewDetail(int id)
        {
            return db.Products.Where(x => x.ID == id).FirstOrDefault() ;
        }
        //Xóa thông tin sản phẩm
        public bool Delete(int id)
        {
            try
            {
                var product = db.Products.Find(id);
                db.Products.Remove(product);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        //Lấy tất cả thông tin sản phẩm
        public List<ProductViewModel> GetAll()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };
            return models.OrderByDescending(x => x.CreateDate).ToList();
        }
        //Lấy danh sách danh mục sản phẩm
        public List<CategoryViewModel> GetAllCate()
        {
            var model = from c in db.Categories
                        select new CategoryViewModel
                        {
                            CategoryID = c.ID,
                            Name = c.Name,
                            Descriptions = c.Descriptions
                        };

            return model.ToList();

        }
        //Lấy thông tin nhà cung cấp
        public List<Supplier> GetAllSup()
        {
            return db.Suppliers.ToList();

        }
        //Lấy danh mục sản phẩm theo mã danh mục
        public Category CateViewDetail(int id)
        {
            return db.Categories.Find(id);
        }
        //Lấy danh sách sản phẩm mới
        public List<ProductViewModel> ListNewProduct()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };
            return models.OrderByDescending(x => x.CreateDate).Take(4).ToList();
        }
        //Lấy danh sách sản phẩm theo danh mục sản phẩm
        public List<ProductViewModel> ListByCategoryID(int cateId, ref int totalRecord, int pageIndex = 1, int pageSize = 6)
        {
            totalRecord = db.Products.Where(x => x.CategoryID == cateId).Count();
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         where p.CategoryID == cateId
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };
            return models.OrderByDescending(x => x.CreateDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }
        //Lấy danh sách sản phẩm bán chạy
        public List<ProductViewModel> ListTopSelling()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         where p.CategoryID == 1

                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };

            return models.OrderByDescending(x => x.Quantity).Take(4).ToList();
        }
        //Lấy danh sách sản phẩm Laptop bán chạy 
        public List<ProductViewModel> ListTopSellingLaptop()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         where p.CategoryID == 1
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };

            return models.Take(4).ToList();
        }
        //Lấy danh sách sản phẩm Smartphone bán chạy
        public List<ProductViewModel> ListTopSellingSmartphone()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         where p.CategoryID == 2
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };

            return models.Take(4).ToList();
        }
        //Lấy danh sách sản phẩm đồng hồ bán chạy 
        public List<ProductViewModel> ListTopSellingWatch()
        {
            var models = from p in db.Products
                         join s in db.Suppliers
                         on p.SupplierID equals s.ID
                         join c in db.Categories
                         on p.CategoryID equals c.ID
                         where p.CategoryID == 3
                         select new ProductViewModel
                         {
                             ID = p.ID,
                             Name = p.Name,
                             Code = p.Code,
                             Descriptions = p.Descriptions,
                             Image = p.Image,
                             Price = p.Price,
                             Quantity = p.Quantity,
                             CreateDate = p.CreateDate,
                             Status = p.Status,
                             SupplierName = s.Name,
                             CateName = c.Name

                         };

            return models.Take(4).ToList();
        }
#endregion

        #region CategoryDAO
        //Lấy danh sách danh mục
        public List<Category> GetListCate(string searchString)
        {
            var model = db.Categories.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x =>x.Name.Contains(searchString)).ToList();
            }
            return model;
        }
        //Thêm danh mục sản phẩm
        public long InsertCate(Category cate)
        {

            db.Categories.Add(cate);
            db.SaveChanges();
            return cate.ID;

        }
        //Cập nhật thông tin danh mục sản phẩm
        public bool UpdateCate(Category cate)
        {
            try
            {
                var cates = db.Categories.Find(cate.ID);
                cates.Name = cate.Name;
                cate.Descriptions = cate.Descriptions;
                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }
        //Xóa danh mục sản phẩm
        public bool DeleteCate(int id)
        {
            try
            {
                var cate = db.Categories.Find(id);
                db.Categories.Remove(cate);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        #endregion

        #region SupplierDAO
        //Lấy danh sách thông tin nha cung cấp
        public List<Supplier> GetListSup(string searchString)
        {
            var model = db.Suppliers.ToList();
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Name.Contains(searchString) || x.Code.Contains(searchString)).ToList();
            }
            return model;
        }
        //Thêm thông tin nhà cung cấp
        public long InsertSup(Supplier sup)
        {

            db.Suppliers.Add(sup);
            db.SaveChanges();
            return sup.ID;

        }
        //Cập nhật thông tin nhà cung cấp
        public bool UpdateSup(Supplier sup)
        {
            try
            {
                var supps = db.Suppliers.Find(sup.ID);
                supps.Name = sup.Name;
                supps.Phone = sup.Phone;
                supps.Address = sup.Address;
                supps.Email = sup.Email;
                supps.Code = sup.Code;
                

                db.SaveChanges();
                return true;

            }
            catch
            {
                return false;
            }
        }
        //Xóa thông tin nhà cung cấp
        public bool DeleteSup(int id)
        {
            try
            {
                var sup = db.Suppliers.Find(id);
                db.Suppliers.Remove(sup);
                db.SaveChanges();
                return true;
            }
            catch { return false; }
        }
        //Lấy nhà cung cấp theo mã nhà cung cấp
        public Supplier SupViewDetail(int id)
        {
            return db.Suppliers.Find(id);
        }
        #endregion

    }
}
