package com.controller.admin;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import DAO.queryDAO;

import java.util.Objects;

@WebServlet("/insert-product")
public class insertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 * response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

			String productid = request.getParameter("productid");
			String subcategory = request.getParameter("subcategory");
			String name = request.getParameter("name");
			int unitprice = Integer.parseInt(request.getParameter("unitprice"));
			String gender = request.getParameter("gender");
			String description = request.getParameter("description");
			String available = request.getParameter("available");
			String img = "/image_product/" + request.getParameter("img");


			// System.out.println(DateTimeNow);
			String tb = "";  // thong bao
			if (subcategory == "" || name == "" || unitprice < 0 || description == "" || gender == "" || available == "")
				tb = "input";
			String url = "Views/Admin/container/product.jsp";
			String kq = "1";
			if (tb == "") {
				queryDAO qD = new queryDAO();
				System.out.print("Chay toi đây rồi");
				try {
					if (qD.insertProduct(subcategory, name, img, unitprice, gender, description, available))
						tb = "true";
					else
						tb = "error";
				} catch (Exception e) {
					System.out.print(e);
				}
			}
			request.setAttribute("from", "insert");
			request.setAttribute("thongbao", tb);
			fillAllProduct a = new fillAllProduct();
			a.doPost(request, response);
		} else {
			request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
			RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
			rq.forward(request, response);
		}
	}
}
