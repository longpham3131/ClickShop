package com.controller.admin;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;

/**
 * Servlet implementation class updateAccount
 */
@WebServlet("/update-account")
public class updateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateAccount() {
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
				if (qD.updateAccount(role, email, pass, "link to IMG", firstname, lastname, phone, address, gender,
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
		session.setAttribute("from", "update");
		response.sendRedirect("Views/Admin/container/account.jsp");
	}

}
