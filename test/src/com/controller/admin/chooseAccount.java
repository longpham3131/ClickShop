package com.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class chooseAccount
 */
@WebServlet("/choose-in-account")
public class chooseAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chooseAccount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a= request.getParameter("choose");
		String url="Views/Admin/container/account/account.jsp";
		String kq="0";
		if(a.equals("Insert"))
			//System.out.println("Let insert");
			kq="1";
		else if(a.equals("Update"))
			//System.out.println("Let Update");
			kq="2";
		else if(a.equals("Delete"))
			//System.out.println("Let Delete");
			kq="3";
		request.setAttribute("kq", kq);
		RequestDispatcher rq = request.getRequestDispatcher(url);
		rq.forward(request, response);
	}

}
