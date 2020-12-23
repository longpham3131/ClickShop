package com.controller;

import DAO.LoginDAO;
import DAO.queryDAO;
import com.controller.admin.shipped;
import com.controller.shipper.goShipper;
import com.controller.web.fillAllDisplay;
import com.model.Account;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login-all")

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
        String url = "Views//loginAll.jsp";
        HttpSession session1 = request.getSession();
        session1.invalidate();  // khi vao login thi xoa het trc do//-------------- chua lam dc

        String email = request.getParameter("id");
        String password = request.getParameter("password");
        request.setAttribute("id", email);

        LoginDAO loginDAO = new LoginDAO();
        String kq = loginDAO.login(email, password);
        if (kq != null) {              // need session.get(email) <<<<<<<<<<<<<<<<<<<<<<<
            HttpSession session = request.getSession();
            session.setAttribute("check", "true");
            session.setAttribute("email", email);
            session.setAttribute("role", kq);
            queryDAO dao = new queryDAO();
            String id= dao.idByEmail(email);
            session.setAttribute("AccId", id);
            if (kq.equals("Administrator")) {
                url = "Views/Admin/container/home.jsp";
                RequestDispatcher rq = request.getRequestDispatcher(url);
                rq.forward(request, response);
            } else if (kq.equals("USER")) {
                fillAllDisplay zx10r = new fillAllDisplay();
                System.out.print("8888 ");
                zx10r.doPost(request, response);
              //  url = "Views/Web/index.jsp";
            } else if (kq.equals("Shipper")) {
                goShipper s1000rr = new goShipper();
                s1000rr.doPost(request,response);

            }
        } else {
            RequestDispatcher rq = request.getRequestDispatcher(url);
            rq.forward(request, response);
        }
    }
}
