package control;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author asus
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        UserDAO ud = new UserDAO();
        User u = ud.getUserByEmailPassword(email, pass);
        if (u != null) {
            Cookie cemail = new Cookie("email", email);
            Cookie cpass = new Cookie("pass", pass);

            cemail.setMaxAge(24 * 60 * 60);
            cpass.setMaxAge(24 * 60 * 60);

            response.addCookie(cemail);
            response.addCookie(cpass);
            cemail.setMaxAge(0);
            cpass.setMaxAge(0);

            HttpSession session = request.getSession();

            session.setAttribute("user", u);
            session.setAttribute("msg", "Đăng nhập thành công");

        } else {
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Tài khoản hoặc mật khẩu không chính xác. Vui lòng kiểm tra lại!");

        }
       response.sendRedirect("home");

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        UserDAO ud = new UserDAO();
        User u = ud.getUserByEmailPassword(email, pass);
        HttpSession session = request.getSession();
        
        if (u != null) {
            // Đăng nhập thành công
            session.setAttribute("user", u);
            session.setAttribute("msg", "Đăng nhập thành công!");
        } else {
            // Đăng nhập thất bại
            session.setAttribute("msg", "Email hoặc mật khẩu không chính xác!");
        }
        
        response.sendRedirect("home");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

