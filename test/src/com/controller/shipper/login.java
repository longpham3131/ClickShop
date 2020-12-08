package com.controller.shipper;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Account;

import DAO.LoginDAO;

@WebServlet("/login-shipper")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~~ servlet_shipper_login.java shipper ~~~~  ");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String url = "Views/Shipper/login.jsp";
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("email", id);
		if (isAdmin(id) == true) {
			if (check(id, password) == true) {
				url = "Views/Shipper/shipper.jsp";
				request.setAttribute("check", "true");
			} else		
			System.out.print(id+password);		
			RequestDispatcher rq= request.getRequestDispatcher(url);
			rq.forward(request, response);
		} else {
			RequestDispatcher rq= request.getRequestDispatcher(url);
			rq.forward(request, response);
		}
	}

	public boolean isAdmin(String email) {
		LoginDAO loginDAO = new LoginDAO();
		if(loginDAO.checkRole(email, "shipper"))
			return true;
		System.out.print("Not shipper");

		return false;
	}

	public boolean check(String email, String pass) {
		// connect database
		LoginDAO loginDAO = new LoginDAO();
		Account a = loginDAO.checkLogin(email, pass);

		if (a == null)
			return false;
		return true;
	}

}
