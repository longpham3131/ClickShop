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
@WebServlet("/ship")
public class shipped extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shipped() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("text/html;charset=UTF-8");
        queryDAO dao = new queryDAO();

         List<Shipper> list = dao.shipperList();

         List<OrtherNoShipper> list2 = dao.initOrderList();
         List<DetailOrder> list2_1 = dao.OrtherDetailNoShip();

         List<Shipping> list3 = dao.shippingList();
         List<DetailOrder> list3_1 = dao.OrtherDetailPicking();

         List<PickingUp> list4 = dao.pickupList();

        request.setAttribute("listShipper", list);

        request.setAttribute("listInitOrder", list2);
        request.setAttribute("listNoShipDetail", list2_1);

        request.setAttribute("listShipping", list3);
        request.setAttribute("listPickDetail", list3_1);

        request.setAttribute("listPicking", list4);
        
        request.setAttribute("from", request.getAttribute("from"));
 		request.setAttribute("thongbao", request.getAttribute("thongbao"));
        RequestDispatcher rq= request.getRequestDispatcher("Views/Admin/container/ship.jsp");
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
