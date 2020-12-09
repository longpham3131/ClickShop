package com.controller.admin;

import DAO.queryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-orderdetail")
public class updateOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateOrderDetail() {
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
		String purchaseorderdetailid = request.getParameter("purchaseorderdetailid");
		String purchaseorderid = request.getParameter("purchaseorderid");
		String productid = request.getParameter("productid");
		String quantity = request.getParameter("quantity");
		String unitprice = request.getParameter("unitprice");
		String subtotal = request.getParameter("subtotal");
		// System.out.println(DateTimeNow);
		String tb = "";  // thong bao
		if (purchaseorderid == "" || purchaseorderdetailid == "" || productid == "")
			tb = "input";
		String url = "Views/Admin/container/order.jsp";
		String kq="1";
		if (tb == "") {
			queryDAO qD = new queryDAO();
			try {
				if (qD.updateOrderDetail(purchaseorderdetailid,purchaseorderid, productid, quantity,unitprice,subtotal))
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
		fillAllOrder a = new fillAllOrder();
		a.doPost(request, response);

	}

}
