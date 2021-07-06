namespace Models.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class FavoriteProduct
    {
        [Key]
        [Column(Order=0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int UserID { get; set; }
        public string UserName { get; set; }
        [Key]
        [Column(Order=1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProductID { get; set; }

        

        public bool isLike { get; set; }
        public DateTime LastDayModified { get; set; }

        public virtual User User { get; set; }

        public virtual Product Product { get; set; }
    }
}
