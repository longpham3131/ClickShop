package com.controller.web;

import DAO.queryDAO;
import com.controller.admin.shipped;
import javafx.util.StringConverter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
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
        HttpSession session = request.getSession();
        try {
            String dem = (String) request.getParameter("dem");
            System.out.print("+++++++++++: " + request.getAttribute("kq"));
            if (Integer.parseInt(dem) > 0 ) {
                queryDAO dao = new queryDAO();

                String email = (String) request.getParameter("email");
                String id = dao.idByEmail(email);
                String address = (String) request.getParameter("address");
                String phone = (String) request.getParameter("phone");
                String name = (String) request.getParameter("name");
                System.out.print("truoc dem");
                int d = Integer.parseInt(dem);

                if ((d > 0)) {
                    String[] giaSP = new String[d + 1];
                    String[] maSP = new String[d + 1];
                    String[] soLuong = new String[d + 1];
                    int sub = 0;
                    for (int i = 0; i < d; i++) {
                        maSP[i] = (String) request.getParameter("maSP" + i);
                        soLuong[i] = (String) request.getParameter("soLuong" + i);
                        giaSP[i] = (String) request.getParameter("giaSP" + i);
                        System.out.println("\n ID USER:"+id +"...");
                        sub = sub + (Integer.parseInt(giaSP[i]) * Integer.parseInt(soLuong[i]));
                        System.out.println("---"+maSP[i] + "--" + soLuong[i] + "--" + giaSP[i]);
                    }
                    String orderId = dao.initOrder(id, String.valueOf(sub), address, phone, name); // add 1
                    if (orderId != null) {

                        String mess = "This is your order: <br>Order Id: " + orderId +
                                "<table style=\"border: 2px solid black;\">" +
                                "<thead>" +
                                "<th scope=\"col\">STT</th> <th scope=\"col\">Product Id</th scope=\"col\"> <th>Quanity</th>  <th scope=\"col\">Price</th>" +
                                "</thead> <tbody>";

                        for (int i = 0; i < d; i++) {
                            if (dao.InsertDetailOrder(orderId, maSP[i], soLuong[i], giaSP[i], giaSP[i]) == false)
                                System.out.println(" SAI ROI, SAI ROI, SAI ROI");
                            else {
                                mess = mess + "<tr> <td>" + i + 1 + "</td> <td>" + maSP[i] + "</td>    <td>" + soLuong[i] + "</td> <td>" + giaSP[i] + "</td> </tr> ";
                            }
                        }
                        mess = mess + "</tbody> </table>";
                        //tru tien
                        dao.truCoin(email, String.valueOf(sub));
                        String mycoib= dao.getCoin(email);
                        session.setAttribute("coin", mycoib);
                        EmailUtility.sendEmail(host, port, user, pass, email, "ClickShop Order", mess);
                    }
                }
               // System.out.print("FSDFSDFSDF");
                session.setAttribute("kq", "1");
                response.sendRedirect(request.getContextPath()+"/fill-All-Display");
                //   fillAllDisplay a = new fillAllDisplay();
                //   a.doPost(request, response);
            }
            else
            {
                System.out.println(")))))))))))))))))))" );
                session.setAttribute("kq", "-1");
                fillAllDisplay a = new fillAllDisplay();
                a.doPost(request, response);
            }
        } catch (Exception e) {
            System.out.println("Go catch -----" + e);
            response.sendRedirect(request.getContextPath()+"/fill-All-Display");
            session.setAttribute("kq", "-1");
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