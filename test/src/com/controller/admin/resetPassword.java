package com.controller.admin;

        import java.io.IOException;

        import javax.servlet.RequestDispatcher;
        import javax.servlet.ServletException;
        import javax.servlet.annotation.WebServlet;
        import javax.servlet.http.HttpServlet;
        import javax.servlet.http.HttpServletRequest;
        import javax.servlet.http.HttpServletResponse;
        import javax.servlet.http.HttpSession;

        import DAO.queryDAO;

/**
 * Servlet implementation class deleteAccount
 */
@WebServlet("/reset-password")
public class resetPassword extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public resetPassword() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String tb = "";
        String url = "Views/Admin/container/account/account.jsp";
        String kq = "3";
        System.out.print("BAN Account: "+ email +"<<");
        if (email == "")
            tb = "input";
        else {
            try {
                queryDAO qD = new queryDAO();
                if (qD.accountExists(email)) {
                    if (qD.resetPass(email))
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

        request.setAttribute("from", "reset");
        request.setAttribute("thongbao", tb);
        fillAllAccount a = new fillAllAccount();
        a.doPost(request, response);
        // response.sendRedirect("Views/Admin/container/account.jsp");
    }

}