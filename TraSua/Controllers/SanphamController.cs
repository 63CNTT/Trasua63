using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Trasua.Models;
using PagedList;


namespace Trasua.Controllers
{
    public class SanphamController : Controller
    {
        Qlbanhang db = new Qlbanhang();

        // GET: Sanpham
        public ActionResult trasua()
        {
            var ts = db.Sanphams.Where(n=>n.Madanhmuc==2)/*.Take(4)*/.ToList();
           return PartialView(ts);
        }
        public ActionResult kemtuoi()
        {
            var kt = db.Sanphams.Where(n => n.Madanhmuc == 1)/*.Take(4)*/.ToList();
            return PartialView(kt);
        }
        public ActionResult traicay()
        {
            var tc = db.Sanphams.Where(n => n.Madanhmuc == 3)/*.Take(4)*/.ToList();
            return PartialView(tc);
        }
		public ActionResult Sanphammoinhat()
		{
			var sanPhamMoiNhat = db.Sanphams.OrderByDescending(x => x.Ngaythem).Take(8).ToList();

			return PartialView(sanPhamMoiNhat);
		}

		//public ActionResult dttheohang()
		//{
		//    var mi = db.Sanphams.Where(n => n.Madanhmuc == 5).Take(4).ToList();
		//    return PartialView(mi);
		//}
		public ActionResult xemchitiet(int Masp=0)
        {
            var chitiet = db.Sanphams.SingleOrDefault(n=>n.Masp==Masp);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }

    }

}