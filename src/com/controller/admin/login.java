package com.controller.admin;

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

@WebServlet("/login-admin")
//@WebServlet(name = "admin-login" , urlPatterns = {"/admin-login"})
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {
		RequestDispatcher rq = request.getRequestDispatcher(url);
		rq.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Create a session object if it is already not created.
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String url = "Views/Admin/login.jsp";

		if (isAdmin(id) == true) {
			if (check(id, password) == true) {
				url = "Views/Admin/container/home.jsp";
				session.setAttribute("check", "true");
			} else
			session.setAttribute("check", "false");
			session.setAttribute("email", id);
			response.sendRedirect(url);
		} else {
		}
	}

	public boolean isAdmin(String email) {
		return true;
	}

	public boolean check(String email, String pass) {
		// connect database
		LoginDAO loginDAO = new LoginDAO();
		Account a = loginDAO.checkLogin(email, pass);
		try {
			System.out.println(">>" + a.getUsername() + " " + a.getPassword() + " ");
		} catch (Exception e) {
			System.out.print(e);
		}

		if (a == null)
			return false;
		return true;
	}

}
