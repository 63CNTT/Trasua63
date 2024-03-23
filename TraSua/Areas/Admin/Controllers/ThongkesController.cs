using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Trasua.Models;
using System.Data.Entity;
namespace Trasua.Areas.Admin.Controllers
{
    public class ThongkesController : Controller
    {
        private Qlbanhang db = new Qlbanhang();

        // GET: Admin/Thongkes
        public ActionResult Index()
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
            else
            {
				var donhangs = db.Donhangs.ToList();
				var dataThongke = (from s in db.Donhangs
								   join x in db.Nguoidungs on s.MaNguoidung equals x.MaNguoiDung
								   group s by s.MaNguoidung into g
								   select new Thongke
								   {
									   Tennguoidung = g.FirstOrDefault().Nguoidung.Hoten,
									   Tongtien = g.Sum(x => x.Tongtien),
									   Dienthoai = g.FirstOrDefault().Nguoidung.Dienthoai,
									   Soluong = g.Count()
								   });
				var dataFinal = dataThongke.OrderByDescending(s => s.Tongtien).Take(5).ToList();
				return View(dataFinal);
			}
		}
    }
}