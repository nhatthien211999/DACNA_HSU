namespace Models.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
            FavoriteProducts = new HashSet<FavoriteProduct>();
        }

        public int ID { get; set; }

        [StringLength(100)]
        [Display(Name="Tên sản phẩm")]
        public string Name { get; set; }

        [StringLength(50)]
        [Display(Name = "Mã sản phẩm")]
        public string Code { get; set; }
        [Display(Name = "Mô tả")]
        public string Descriptions { get; set; }

        [StringLength(100)]
        [Display(Name = "Hình ảnh sản phẩm")]
        public string Image { get; set; }
        [Display(Name = "Giá")]
        public decimal? Price { get; set; }
        [Display(Name = "VAT")]
        public bool IncludeVAT { get; set; }
        [Display(Name = "Số lượng")]
        public int? Quantity { get; set; }
        [Display(Name = "Ngày tạo")]
        public DateTime? CreateDate { get; set; }
        [Display(Name = "Trạng thái")]
        public bool Status { get; set; }
        [Display(Name = "Nhà cung cấp")]
        public int SupplierID { get; set; }
        [Display(Name = "Tên danh mục sản phẩm")]
        public int CategoryID { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FavoriteProduct> FavoriteProducts { get; set; }

        public virtual Supplier Supplier { get; set; }
    }
}
