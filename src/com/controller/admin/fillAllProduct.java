package com.controller.admin;

import java.io.IOException;

import com.model.Article;
import com.model.Article1;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;
import com.model.Article;
import com.model.Category;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/fill-All-Product")
public class fillAllProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;


    /**
     * @see HttpServlet#HttpServlet()
     */
    public fillAllProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (Objects.equals((String) session.getAttribute("Check_Authentic_Final_Using"), "Administrator") == true) {

            response.setContentType("text/html;charset=UTF-8");
            String txt = request.getParameter("index");
            int index = 0;
            if (txt == null) {
                index = 1;
            } else {
                index = Integer.parseInt(txt);
            }
            queryDAO dao = new queryDAO();
            List<Article1> list1 = dao.sanpham();
            List<Category> listcate = dao.listcategory();
            request.setAttribute("listCategory", listcate);
            request.setAttribute("listProduct", list1);
            request.setAttribute("from", request.getAttribute("from"));
            request.setAttribute("thongbao", request.getAttribute("thongbao"));
            RequestDispatcher rq = request.getRequestDispatcher("Views/Admin/container/product.jsp");
            rq.forward(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang.");
            RequestDispatcher rq = request.getRequestDispatcher("Views/error.jsp");
            rq.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        processRequest(request, response);

    }

}
