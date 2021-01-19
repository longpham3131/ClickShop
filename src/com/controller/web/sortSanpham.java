package com.controller.web;

import DAO.queryDAO;
import com.model.Display;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/sort-Product")
public class sortSanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public sortSanpham() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String name  = request.getParameter("Name");
		String type = request.getParameter("Type");
		queryDAO dao = new queryDAO();
		List<Display> danhsachSapxep = dao.filterSapxep(name, type);
		List<Display> danhsachLoc = dao.filterSanpham(name);
		System.out.println(danhsachLoc);
		request.setAttribute("tenCata",name);
		System.out.print(name);
		System.out.println(name.equals("Tất cả sản phẩm"));
		if (name.equals("Tất cả sản phẩm") == true) {
			if (type.equals("ASS") == true) {
				request.setAttribute("listSanpham", danhsachLoc);
			} else {
				request.setAttribute("listSanpham", danhsachSapxep);
			}
		}
		else {
			if (type.equals("ASS") == true) {
				request.setAttribute("listSanpham", danhsachLoc);
			} else {
				request.setAttribute("listSanpham", danhsachSapxep);
			}
		}
		request.setAttribute("Type",type);
//		request.setAttribute("listSanpham", danhsachSapxep);
		request.setAttribute("from", request.getAttribute("from"));
		request.setAttribute("thongbao", request.getAttribute("thongbao"));
		RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/productShop.jsp");
		rq.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);

	}

}
