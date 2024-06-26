﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Trasua.Models;
using PagedList;
using System.Web.UI;

namespace Trasua.Areas.Admin.Controllers
{
    public class HomeController : Controller
        
    {
        Qlbanhang db = new Qlbanhang();
       
        // GET: Admin/Home
        
        public ActionResult Index(int ?page)
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
            {
				// 1. Tham số int? dùng để thể hiện null và kiểu int( số nguyên)
				// page có thể có giá trị là null ( rỗng) và kiểu int.

				// 2. Nếu page = null thì đặt lại là 1.
				if (page == null) page = 1;

				// 3. Tạo truy vấn sql, lưu ý phải sắp xếp theo trường nào đó, ví dụ OrderBy
				// theo Masp mới có thể phân trang.
				var sp = db.Sanphams.OrderBy(x => x.Masp);

				// 4. Tạo kích thước trang (pageSize) hay là số sản phẩm hiển thị trên 1 trang
				int pageSize = 5;

				// 4.1 Toán tử ?? trong C# mô tả nếu page khác null thì lấy giá trị page, còn
				// nếu page = null thì lấy giá trị 1 cho biến pageNumber.
				int pageNumber = (page ?? 1);

				// 5. Trả về các sản phẩm được phân trang theo kích thước và số trang.
				return View(sp.ToPagedList(pageNumber, pageSize));

			}

		}

        // Xem chi tiết người dùng GET: Admin/Home/Details/5 
        public ActionResult Details(int id)
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
			{
				var dt = db.Sanphams.Find(id);
                return View(dt);

			}
			
        }

        // Tạo sản phẩm mới phương thức GET: Admin/Home/Create
        public ActionResult Create()
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
			{
                ViewBag.Madanhmuc = new SelectList(db.Danhmucs, "Madanhmuc", "Tendanhmuc");
           
                return View();

			}
			
        }

        // POST: Admin/Sanphams/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Masp,Tensp,Giatien,Soluong,Mota,Size,Ngaythem,Sanphammoi,Anhbia,Madanhmuc")] Sanpham sanpham)
        {
            if (ModelState.IsValid)
            {
                sanpham.Ngaythem = DateTime.Now;
                db.Sanphams.Add(sanpham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Madanhmuc = new SelectList(db.Danhmucs, "Madanhmuc", "Tendanhmuc", sanpham.Madanhmuc);
         
            return View(sanpham);
        }


        // Sửa sản phẩm GET lấy ra ID sản phẩm: Admin/Home/Edit/5
        public ActionResult Edit(int id)
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
			{
				// Hiển thị dropdownlist
				var dt = db.Sanphams.Find(id);
				var hangselected = new SelectList(db.Danhmucs, "Madanhmuc", "Tendanhmuc", dt.Madanhmuc);
				ViewBag.Madanhmuc = hangselected;

				// 
				return View(dt);

			}
			
        }

        // POST: Admin/Home/Edit/5
        [HttpPost]
        public ActionResult Edit(Sanpham sanpham)
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
			{
                try
                        {
                            // Sửa sản phẩm theo mã sản phẩm
                            var oldItem = db.Sanphams.Find(sanpham.Masp);
                            oldItem.Tensp = sanpham.Tensp;
                            oldItem.Giatien = sanpham.Giatien;
                            oldItem.Soluong = sanpham.Soluong;
                            oldItem.Mota = sanpham.Mota;
                            oldItem.Anhbia = sanpham.Anhbia;
                            oldItem.Size = sanpham.Size;
                            oldItem.Madanhmuc = sanpham.Madanhmuc;
                            // lưu lại
                            db.SaveChanges();
                            // xong chuyển qua index
                            return RedirectToAction("Index");
                        }
                        catch
                        {
                            return View();
                        }

			}
			
        }

        
        // Xoá sản phẩm phương thức GET: Admin/Home/Delete/5
        public ActionResult Delete(int id)
        {
			if (Session["use"] == null)
			{
				Session["use"] = null;
				return RedirectToAction("Dangnhap", "User", new { area = "" });
			}
			else
			{
var dt = db.Sanphams.Find(id);
            return View(dt);

			}
			
        }

        // Xoá sản phẩm phương thức POST: Admin/Home/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                //Lấy được thông tin sản phẩm theo ID(mã sản phẩm)
                var dt = db.Sanphams.Find(id);
                // Xoá
                db.Sanphams.Remove(dt);
                // Lưu lại
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
