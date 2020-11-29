package com.controller.admin;

import java.io.IOException;
import com.model.Article;
import com.model.Article1;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;
import com.model.Article;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/fill-All-Product")
public class fillAllProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
<<<<<<< HEAD
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fillAllProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
          String txt = request.getParameter("index");
          int index = 0;
          if(txt == null){
              index = 1;
          }else{
              index = Integer.parseInt(txt);
          }
         queryDAO dao = new queryDAO();
         List<Article1> list1 = dao.sanpham(index);
         System.out.print(" xx");
         System.out.print(list1.size());
         HttpSession session = request.getSession();
         session.setAttribute("listProduct", list1);
         response.sendRedirect("Views/Admin/container/product.jsp");
//         request.setAttribute("listProduct",list1);
//         RequestDispatcher rs = request.getRequestDispatcher("Views/Admin/container/product.jsp"); 
//         rs.forward(request, response); 
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 processRequest(request, response);
		 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fillAllProduct() {
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
		String txt = request.getParameter("index");
		int index = 0;
		if (txt == null) {
			index = 1;
		} else {
			index = Integer.parseInt(txt);
		}
		queryDAO dao = new queryDAO();
		List<Article1> list1 = dao.sanpham(index);
		System.out.print(" xx");

		request.setAttribute("listProduct", list1);
		request.setAttribute("from", request.getAttribute("from"));
		request.setAttribute("thongbao", request.getAttribute("thongbao"));
		RequestDispatcher rq = request.getRequestDispatcher("Views/Admin/container/product.jsp");
		rq.forward(request, response);
//         request.setAttribute("listProduct",list1);
//         RequestDispatcher rs = request.getRequestDispatcher("Views/Admin/container/product.jsp"); 
//         rs.forward(request, response); 
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
>>>>>>> be5f72e (sua het)
		processRequest(request, response);
//		HttpSession session = request.getSession(false);
//		String index=  request.getParameter("index");
//		if(session == null)
//			response.sendRedirect("Views/Admin/login.jsp");
//		String tb="";
//		queryDAO qD = new queryDAO();
//		ResultSet rs= qD.paging(Integer.parseInt(index) );
//		if(rs==null)
//		{
//			tb="error";
//		}
//		else {
//			tb="true";
//		}
//		int pageNumber = qD.getNumberPage();	
//		session.setAttribute("pageNum", pageNumber); 
//		session.setAttribute("thongbao", tb);
//		session.setAttribute("from", "openEmployees");		
//		session.setAttribute("rs", rs);
//		
//		response.sendRedirect("Views/Admin/container/account.jsp");
	}

}
