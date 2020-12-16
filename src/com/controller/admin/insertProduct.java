package com.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import DAO.LoginDAO;
import DAO.queryDAO;

import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter;

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
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productid = request.getParameter("productid");
		String subcategory = request.getParameter("subcategory");
		String name = request.getParameter("name");
		String unitprice = request.getParameter("unitprice");
		String like = request.getParameter("like");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String available = request.getParameter("available");
		String img = request.getParameter("img");
		// System.out.println(DateTimeNow);
		String tb = "";  // thong bao
		if (subcategory == "" || name == "" || unitprice == "" || description == "" || gender == "" || available == ""|| img == "")
			tb = "input";
		String url = "Views/Admin/container/product.jsp";
		String kq="1";
		if (tb == "") {
			queryDAO qD = new queryDAO();
			try {
				if (qD.insertProduct(productid, subcategory, name, unitprice, like, gender, description, available,img))
					tb = "true";
				else
					tb = "error";
			} catch (Exception e) {
				System.out.print(e);
			}
		}
		HttpSession session = request.getSession(false);
		if(session == null)
			response.sendRedirect("Views/Admin/login.jsp");

		request.setAttribute("from", "insert");
		request.setAttribute("thongbao", tb);
		fillAllProduct a = new fillAllProduct();
		a.doPost(request, response);

	}
}
