using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModel
{

    public class ProductViewModel
    {
        [Key]
        public int ID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Descriptions { get; set; }
        public string Image { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public DateTime? CreateDate { get; set; }
        public bool? Status { get; set; }
        public string SupplierName { get; set; }
        public string CateName { get; set; }

    }
    public class ProductVM
    {
        [Key]
        public int ID { get; set; }
        [Display(Name="Tên sản phẩm")]
        [Required(ErrorMessage ="Vui lòng nhập tên sản phẩm")]
        public string Name { get; set; }
        [Display(Name = "Mã sản phẩm")]
        [Required(ErrorMessage = "Vui lòng nhập mã sản phẩm")]
        public string Code { get; set; }
        [Display(Name = "Mô tả")]     
        public string Descriptions { get; set; }
        [Display(Name = "Hình")]
        [Required(ErrorMessage = "Vui lòng thêm hình ảnh sản phẩm")]
        public string Image { get; set; }
        [Display(Name = "Giá")]
        [Required(ErrorMessage = "Vui lòng nhập giá sản phẩm")]
        public decimal? Price { get; set; }
        [Display(Name = "Số lượng")]
        [Required(ErrorMessage = "Vui lòng số lượng sản phẩm")]
        public int? Quantity { get; set; }
        [Display(Name = "VAT")]
       
        public bool IncludeVAT { get; set; }
        [Display(Name = "Ngày")]
        
        public DateTime? CreateDate { get; set; }
        [Display(Name = "Trạng thái")]
        
        public bool Status { get; set; }
        [Display(Name = "Nhà cung cấp")]
       
        public int SupplierID { get; set; }
        [Display(Name = "Danh mục")]
    
        public int CateID { get; set; }

    }

    [DataContract]
    public class DataPoint
    {
        public DataPoint() { }
        public DataPoint(string label, decimal y)
        {
            this.Label = label;
            this.Y = y;
        }

        //Explicitly setting the name to be used while serializing to JSON.
        [DataMember(Name = "label")]
        public string Label = "";

        //Explicitly setting the name to be used while serializing to JSON.
        [DataMember(Name = "y")]
        public Nullable<decimal> Y = null;
    }
}



