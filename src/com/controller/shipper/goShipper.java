package com.controller.shipper;

import DAO.LoginDAO;
import DAO.queryDAO;
import com.model.DetailOrder;
import com.model.PickingUp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/shipper")
public class goShipper extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   
    public goShipper() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Views/Shipper/container/home.jsp";
		String id = request.getParameter("id");
		queryDAO dao = new queryDAO();
		List<PickingUp> list4 = dao.pickupList();
		request.setAttribute("listPicking", list4);
		List<DetailOrder> list4_1 = dao.OrtherDetailPicking();
		request.setAttribute("listPickDetail", list4_1);
		request.setAttribute("email", id);
		RequestDispatcher rq= request.getRequestDispatcher(url);
		rq.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
