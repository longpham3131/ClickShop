package com.controller.admin;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;

/**
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-product")
public class updateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productid = request.getParameter("productid");
		String subcategory = request.getParameter("subcategory");
		String name = request.getParameter("name");
		String unitprice = request.getParameter("unitprice");
		String gender = request.getParameter("gender");
		String description = request.getParameter("description");
		String available = request.getParameter("available");
		// System.out.println(DateTimeNow);
		String tb = "";  // thong bao
		if (productid == "" || subcategory == "" || name == "" || unitprice == "" || description == "" || gender == "" || available == "")
			tb = "input";
		String url = "Views/Admin/container/product.jsp";
		String kq="1";
		if (tb == "") {
			queryDAO qD = new queryDAO();
			try {
				if (qD.updateProduct(productid, subcategory, name, unitprice, gender, description, available))
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

		request.setAttribute("from", "update");
		request.setAttribute("thongbao", tb);
		fillAllProduct a = new fillAllProduct();
		a.doPost(request, response);

	}

}