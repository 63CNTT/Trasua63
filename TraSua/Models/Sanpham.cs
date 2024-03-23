﻿namespace Trasua.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Sanpham")]
    public partial class Sanpham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Sanpham()
        {
            Chitietdonhang = new HashSet<Chitietdonhang>();
        }

        [Key]
        public int Masp { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên sản phẩm")]

        public string Tensp { get; set; }
        [Display(Name = "Giá tiền")]

        public decimal? Giatien { get; set; }
        [Display(Name = "Số lượng")]

        public int? Soluong { get; set; }
		[Display(Name = "Ngày Thêm")]

		public DateTime? Ngaythem { get; set; }
		[Display(Name = "Mô tả")]

        [Column(TypeName = "ntext")]
        public string Mota { get; set; }
        [Display(Name = "Size")]

        public String Size { get; set; }
		
		[Display(Name = "Là sản phẩm mới")]

        public bool? Sanphammoi { get; set; }

        [Display(Name = "Ảnh sản phẩm")]

        [StringLength(50)]
        public string Anhbia { get; set; }
        [Display(Name = "Danh Mục")]

        public int? Madanhmuc { get; set; }


        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Chitietdonhang> Chitietdonhang { get; set; }

        public virtual Danhmuc Danhmuc { get; set; }

    }
}
