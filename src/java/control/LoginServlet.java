package control;

import dal.CartDAO;
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
import model.Cart;
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
        request.getRequestDispatcher("login.jsp").forward(request, response);
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

            Cookie cname = new Cookie("email", email);
            Cookie cpass = new Cookie("pass", pass);

            cname.setMaxAge(24 * 60 * 60);
            cpass.setMaxAge(24 * 60 * 60);

            response.addCookie(cname);
            response.addCookie(cpass);

            session.setAttribute("user", u);
            if (u.getRole().equalsIgnoreCase("admin")) {
                response.sendRedirect("dashboard");
            } else {
                CartDAO cd = new CartDAO();
                Cart c = cd.getCardByUserID(u.getId());
                if (c == null) {
                    cd.insertCart(u.getId());
                    c = cd.getCardByUserID(u.getId());
                }
                session.setAttribute("cartID", c.getId());
                if (session.getAttribute("loginToBuy") != null) {
                    int productID = (int) session.getAttribute("productIDToBuy");
                    response.sendRedirect("detail?id=" + productID);
                } else {
                    response.sendRedirect("home");
                }
            }

        } else {
            // Đăng nhập thất bại
            session.setAttribute("msg", "Email hoặc mật khẩu không chính xác!");
            response.sendRedirect("login");
        }
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
