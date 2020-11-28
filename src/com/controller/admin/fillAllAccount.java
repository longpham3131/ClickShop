package com.controller.admin;

import java.io.IOException;
import com.model.Article;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet("/fill-All-Account")
public class fillAllAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fillAllAccount() {
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
    	 System.out.print("aaa");
         String txt = request.getParameter("index");
         int index = 0;
         if(txt == null){
             index = 1;
         }else{
             index = Integer.parseInt(txt);
         }
         queryDAO dao = new queryDAO();
         List<Article> list = dao.paging(index);
         System.out.print(" xx");
         HttpSession session = request.getSession();
         session.setAttribute("listP", list);
		 response.sendRedirect("Views/Admin/container/account.jsp");  
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 processRequest(request, response);
		 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
