package com.controller.web;

import DAO.queryDAO;
import com.controller.admin.shipped;
import javafx.util.StringConverter;

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
@WebServlet("/order")
public class order extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public order() {
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
        HttpSession session = request.getSession();
       // String email = (String) request.getParameter("email");
        String id= dao.idByEmail( (String) session.getAttribute("email"));
        String dem = (String) request.getParameter("dem");
        String address = (String) request.getParameter("address");
        String phone = (String) request.getParameter("phone");
        String name = (String) request.getParameter("name");
        //System.out.print("truoc dem");
        int d = Integer.parseInt(dem);
        //System.out.print("------"+d);
        if( (d  > 0))
        {
            String[] giaSP = new String[d+1];
            String[] maSP  = new String[d+1];
            String[] soLuong = new String[d+1];
            int sub = 0;
            for(int i=0; i< d  ; i++) {
                maSP[i] = (String) request.getParameter("maSP" + i);
                soLuong[i] = (String) request.getParameter("soLuong" + i);
                giaSP[i] = (String) request.getParameter("giaSP" + i);
                System.out.println(id);
                sub = sub + Integer.parseInt(giaSP[i])*Integer.parseInt(soLuong[i]);
                System.out.println(maSP[i]+"--"+soLuong[i]+"--"+giaSP[i]);
            }
            String orderId= dao.initOrder(id, String.valueOf(sub), address, phone, name ) ;
            if(orderId != null)
            {
                for(int i=0; i< d  ; i++) {
                    if( dao.InsertDetailOrder(orderId,maSP[i],soLuong[i],giaSP[i],giaSP[i]) == false)
                        System.out.println("DM SAI ROI, SAI ROI, SAI ROI");
                }
                System.out.println("____");
            }
        }

        System.out.print("FSDFSDFSDF");
        fillAllDisplay a = new fillAllDisplay();
        a.doPost(request, response);
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
