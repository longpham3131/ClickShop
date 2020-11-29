package com.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD

=======
import com.controller.admin.login;
>>>>>>> be5f72e (sua het)
@WebServlet(name = "admin-login" , urlPatterns = {"/admin"})
public class goAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    public goAdmin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< HEAD
		response.sendRedirect("Views/Admin/login.jsp");
=======
		login a = new login();
		a.doPost(request, response);
>>>>>>> be5f72e (sua het)
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
