package com.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class fillByMail
 */
@WebServlet("/fill-By-Email")
public class fillByMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public fillByMail() {
        super();
    
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email =request.getParameter("email");
		String url="Views/Admin/container/account/account.jsp";
		//get all data from email and return them. if email wrong, return a error.
		
		request.setAttribute("email", email);
		request.setAttribute("kq", "2");
		RequestDispatcher rq = request.getRequestDispatcher(url);
		rq.forward(request, response);
	}

}
