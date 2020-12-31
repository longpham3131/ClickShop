package com.controller.web;

import DAO.queryDAO;
import com.controller.admin.shipped;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/chooseProduct")
public class chooseProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public chooseProduct() {
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        queryDAO dao = new queryDAO();

        String productId  = (String) request.getParameter("ProductId");
        String name  = (String) request.getParameter("Name");
        String unitprice  = (String) request.getParameter("UnitPrice");
        String imagePath  = (String) request.getParameter("ImagePath");
        String description  = (String) request.getParameter("Description");
        String quan = (String) request.getParameter("Quannity");
        request.setAttribute("productId", productId);
        request.setAttribute("name", name);
        request.setAttribute("unitprice", unitprice);
        request.setAttribute("imagepath", imagePath);
        request.setAttribute("description", description);
        request.setAttribute("Quannity", quan);
        RequestDispatcher rq = request.getRequestDispatcher("Views/Web/container/productDetail.jsp");
        rq.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

}
