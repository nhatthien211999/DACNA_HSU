using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.ViewModel
{
   public class OrderViewModel
    {
        public int ID { get; set; }

       
        public string ShipName { get; set; }

       
        public string ShipPhone { get; set; }

      
        public string ShipAddress { get; set; }

        public string ShipEmail { get; set; }

        public bool Status { get; set; }
        public decimal? Total { get; set; }

        public int? UserID { get; set; }

        public DateTime? CreateDate { get; set; }
    }
}
