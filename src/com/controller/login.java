package com.controller;

import DAO.LoginDAO;
import DAO.queryDAO;
import com.controller.admin.fillDashBoard;
import com.controller.admin.shipped;
import com.controller.shipper.goShipper;
import com.controller.web.fillAllDisplay;
import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.model.Account;
import org.apache.commons.lang.RandomStringUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.concurrent.TimeUnit;

@WebServlet("/login-all")

public class login extends HttpServlet implements Filter{
    private static final long serialVersionUID = 1L;

    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//         Check the user session for the salt cache, if none is present we create one
        Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>)
                request.getSession().getAttribute("csrfPreventionSaltCache");

        if (csrfPreventionSaltCache == null){
            csrfPreventionSaltCache = CacheBuilder.newBuilder()
                    .maximumSize(5000)
                    .expireAfterWrite(20, TimeUnit.MINUTES)
                    .build();

            request.getSession().setAttribute("csrfPreventionSaltCache", csrfPreventionSaltCache);
        }

        // Generate the salt and store it in the users cache
        String salt = RandomStringUtils.random(20, 0, 0, true, true, null, new SecureRandom());
        csrfPreventionSaltCache.put(salt, Boolean.TRUE);

        // Add the salt to the current request so it can be used
        // by the page rendered in this request
        request.setAttribute("csrfPreventionSalt", salt);
        String url = "Views/loginAll.jsp";
        RequestDispatcher rq = request.getRequestDispatcher(url);
        rq.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "Views/loginAll.jsp";
        String salt = (String) request.getParameter("csrfPreventionSalt");
        Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>)request.getSession().getAttribute("csrfPreventionSaltCache");
        if (csrfPreventionSaltCache == null ||salt == null ||csrfPreventionSaltCache.getIfPresent(salt) == null) {
            doGet(request, response);
            return;
        }

        HttpSession session1 = request.getSession();
        session1.invalidate();

        String email = request.getParameter("id");
        String password = request.getParameter("password");
        request.setAttribute("id", email);



        LoginDAO loginDAO = new LoginDAO();
        String kq = loginDAO.login(email, password);
        if (kq == null)
            kq="fix";
        if(email != null) {
            if (kq.equals("BAN")) {
                request.setAttribute("kqlogin", "BAN");
                RequestDispatcher rq = request.getRequestDispatcher(url);
                rq.forward(request, response);
            } else {
                if (!kq.equals("fix")) {              // need session.get(email) <<<<<<<<<<<<<<<<<<<<<<<
                    HttpSession session = request.getSession();
                    session.setAttribute("check", "true");
                    session.setAttribute("email", email);
                    session.setAttribute("role", kq);
                    queryDAO dao = new queryDAO();
                    String id = dao.idByEmail(email);
                    String mycoib = dao.getCoin(email);
                    session.setAttribute("AccId", id);
                    session.setAttribute("coin", mycoib);
                    session.setAttribute("Check_Authentic_Final_Using", kq);
                    System.out.println("......"+kq+".......");
                    if (kq.equals("Administrator")) {
                        System.out.println("....vl ");
                        url = "Views/Admin/container/home.jsp";
                        System.out.println("...."+url);
                        RequestDispatcher rq = request.getRequestDispatcher(url);
                        rq.forward(request, response);
                    } else if (kq.equals("USER")) {
                        fillAllDisplay zx10r = new fillAllDisplay();
                        System.out.print("8888" + kq);
                        zx10r.doPost(request, response);
                        //  url = "Views/Web/index.jsp";
                    } else if (kq.equals("Shipper")) {
                        goShipper s1000rr = new goShipper();
                        s1000rr.doPost(request, response);
                    }
                } else {
                    request.setAttribute("kqlogin", "CHECK");
                    System.out.println(url);
                    RequestDispatcher rq = request.getRequestDispatcher(url);
                    rq.forward(request, response);
                }
            }
        } else
        {  // request.setAttribute("kqlogin", "EMAIL");
            RequestDispatcher rq = request.getRequestDispatcher(url);
            rq.forward(request, response);
        }
    }
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // Assume its HTTP
        HttpServletRequest httpReq = (HttpServletRequest) request;

        // Get the salt sent with the request
        String salt = (String) httpReq.getParameter("csrfPreventionSalt");

        // Validate that the salt is in the cache
        Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>)
                httpReq.getSession().getAttribute("csrfPreventionSaltCache");

        if (csrfPreventionSaltCache != null &&
                salt != null &&
                csrfPreventionSaltCache.getIfPresent(salt) != null){

            // If the salt is in the cache, we move on
            chain.doFilter(request, response);
        } else {
            // Otherwise we throw an exception aborting the request flow
            throw new ServletException("Potential CSRF detected!! Inform a scary sysadmin ASAP.");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }
}