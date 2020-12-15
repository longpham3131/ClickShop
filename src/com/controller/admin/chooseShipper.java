package com.controller.admin;

import java.io.IOException;

import com.model.*;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.queryDAO;

/**
 * Servlet implementation class fillAllAccount
 */
@WebServlet("/chooseShipper")
public class chooseShipper extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public chooseShipper() {
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

        String chooseS = (String) request.getParameter("chooseShipper");
        String shipperID = (String) request.getParameter("shipperID");
        String OrtherID = (String) request.getParameter("OrtherID");
        HttpSession session = request.getSession();
        String fixShipper= (String) session.getAttribute("fixShipper");
        System.out.println("Aloo " + chooseS + "   " + OrtherID + " vs " + fixShipper);
        if ( OrtherID.equals(fixShipper) == false) {
            if (dao.convertNoShipToPickup(shipperID, OrtherID))       // thuc hien up date va chuyen table //
            {
                session.setAttribute("fixShipper", OrtherID);
                shipped ob = new shipped();
                ob.doPost(request, response);
            }
        }
        else {
            shipped ob = new shipped();
            ob.doPost(request, response);
        }
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
