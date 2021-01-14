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
import java.util.Objects;

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
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {
            String email = request.getParameter("email");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");
            String Bday = request.getParameter("Bday");
            String role = request.getParameter("role");
            String tb = "";  // thong bao
            if (tb == "") {
                queryDAO qD = new queryDAO();
                try {
                    if (qD.insertAccount(email, firstname, lastname,
                            phone, address, gender, Bday, role))
                        tb = "true";
                    else
                        tb = "error";
                } catch (Exception e) {
                    System.out.print(e);
                }
            }
            if (session == null)
                response.sendRedirect("Views/Admin/login.jsp");
            if (tb == "error")
                request.setAttribute("from", "insert");
            request.setAttribute("thongbao", tb);
            fillAllAccount a = new fillAllAccount();
            a.doPost(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }
}
