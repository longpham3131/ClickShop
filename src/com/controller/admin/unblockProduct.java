package com.controller.admin;

import DAO.queryDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class deleteAccount
 */
@WebServlet("/unblock-product")
public class unblockProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public unblockProduct() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String tb = "";


        if (id == "")
            tb = "input";
        else {
            try {
                queryDAO qD = new queryDAO();
                if (qD.productIDExists(id)) {
                    if (qD.unBlockProduct(id))
                        tb = "true";
                    else
                        tb = "error";
                } else
                    tb = "notFound";
            }
            catch (Exception e) {
                System.out.print(e);
            }
        }

        HttpSession session = request.getSession(false);
        if(session == null)
            response.sendRedirect("Views/Admin/login.jsp");

        request.setAttribute("from", "unblock");
        request.setAttribute("thongbao", tb);
        fillAllProduct a = new fillAllProduct();
        a.doPost(request, response);
        // response.sendRedirect("Views/Admin/container/account.jsp");
    }

}
