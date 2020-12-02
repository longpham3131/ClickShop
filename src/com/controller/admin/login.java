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

import com.model.Account;

import DAO.LoginDAO;

@WebServlet("/login-admin")
//@WebServlet(name = "admin-login" , urlPatterns = {"/admin-login"})
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

		System.out.println("~~~ servlet_login.java ~~~~  ");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String url = "Views/Admin/loginMain.jsp";
		HttpSession session1 = request.getSession();
		session1.invalidate();  // khi vao login thi xoa het trc do
		request.setAttribute("email", id);

		if (isAdmin(id) == true) {
			if (check(id, password) == true) {
				HttpSession session = request.getSession();
				session.setAttribute("check", "true");
				session.setAttribute("email", id);
				url = "Views/Admin/container/home.jsp";

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
		System.out.println("~~~ 2.1 ~~~~  ");
		LoginDAO loginDAO = new LoginDAO();
		System.out.println("~~~ 2.2 ~~~~  ");
		if(loginDAO.checkRole(email, "administrator"))
			return true;
		System.out.print("Not administrator");
		
		return false;
		
	}

	public boolean check(String email, String pass) {
		// connect database
		
		LoginDAO loginDAO = new LoginDAO();
		Account a = loginDAO.checkLogin(email, pass);
		System.out.println("~~~ 2.4 ~~~~  ");
		if (a == null)
			return false;
		return true;
	}

}
