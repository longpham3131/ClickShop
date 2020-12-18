package com.controller.web;

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
import DAO.queryDAO;
import com.controller.admin.fillAllAccount;

import javax.servlet.http.HttpSession;

@WebServlet("/registed")
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public register() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("passw");
        String firstname = request.getParameter("inpFname");
        String lastname = request.getParameter("Lname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String Bday = request.getParameter("Bday");
        System.out.print(email+pass+firstname+lastname+ Bday+gender);
        queryDAO qD = new queryDAO();
        String tb = "";
        try {
            if (qD.registed(email, pass, firstname, lastname,
                    phone, address, gender, Bday))
                tb = "true";
            else
                tb = "error";
        } catch (Exception e) {
            System.out.print(e);
        }

        HttpSession session = request.getSession();
        if (session == null)
            response.sendRedirect("Views/loginAll.jsp");
        request.setAttribute("thongbao", tb);
        RequestDispatcher rq = request.getRequestDispatcher("Views/loginAll.jsp");
        rq.forward(request, response);
    }
}
