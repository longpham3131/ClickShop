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

import DAO.LoginDAO;
import DAO.queryDAO;

import java.time.LocalDateTime; // Import the LocalDateTime class
import java.time.format.DateTimeFormatter;

@WebServlet("/insert-account")
public class insertAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public insertAccount() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		String role = request.getParameter("role");
		String Bday = "1993-10-06 09:45:47.000"; // thay bang timePicker
		LocalDateTime myDateObj = LocalDateTime.now(); // ngay tao acc
		DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String DateTimeNow = myDateObj.format(myFormatObj);
		// System.out.println(DateTimeNow);
		String tb = "";  // thong bao
		if (email == "" || pass == "" || firstname == "" || lastname == "" || phone == "" || address == "")
			tb = "input";
		String url = "Views/Admin/container/account.jsp";
		String kq="1";
		if (tb == "") {
			queryDAO qD = new queryDAO();
			try {
				if (qD.insertAccount(role, email, pass, "link to IMG", firstname, lastname, phone, address, gender,
						Bday, DateTimeNow, true))
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
		session.setAttribute("thongbao", tb);
		session.setAttribute("from", "insert");
		response.sendRedirect("Views/Admin/container/account.jsp");
	}
}
