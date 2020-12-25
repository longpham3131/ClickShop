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
@WebServlet("/fill-All-Sanpham")
public class fillSanpham extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fillSanpham() {
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
		String index = request.getParameter("index");
		System.out.print(index);
		if (index ==null)
		{
			index ="1";
		}
		int	 indexPage = Integer.parseInt(index);
		queryDAO dao = new queryDAO();
		int numberPage = dao.getNumberPage();
		List<Display> listPhantrang = dao.getPaging(indexPage);
//		System.out.print(listSanpham);
		request.setAttribute("listPhantrang", listPhantrang);
		request.setAttribute("numberPage", numberPage);
		request.setAttribute("from", request.getAttribute("from"));
		request.setAttribute("thongbao", request.getAttribute("thongbao"));
		request.setAttribute("myIndex",index);
		RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/productShop.jsp");
		rq.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		processRequest(request, response);

	}

}
