/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.DAOTokenForget;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TokenForgetPassword;
import model.User;

/**
 *
 * @author asus
 */
@WebServlet(name = "RequestPasswordServlet", urlPatterns = {"/requestPassword"})
public class RequestPasswordServlet extends HttpServlet {

    static final String from = "your_email@gmail.com";
    static final String password = "your_app_password"; // Sử dụng App Password nếu bạn đã bật xác thực 2 bước

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
            out.println("<title>Servlet RequestPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RequestPasswordServlet at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
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
        System.out.println("Processing request for email: " + email);
        
        UserDAO ud = new UserDAO();
        User user = ud.getUserByEmail(email);
        
        if (user == null) {
            System.out.println("User not found for email: " + email);
            request.setAttribute("mess", "Email không tồn tại trong hệ thống!");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }
        
        System.out.println("User found: " + user.getFullname());
        
        ResetService service = new ResetService();
        String token = service.generateToken();
        System.out.println("Generated token: " + token);
        
        TokenForgetPassword tokenForget = new TokenForgetPassword();
        tokenForget.setToken(token);
        tokenForget.setExpiryTime(service.expireDateTime());
        tokenForget.setIsUsed(false);
        tokenForget.setUserId(user.getId());
        
        DAOTokenForget daoToken = new DAOTokenForget();
        boolean insertSuccess = daoToken.insertTokenForget(tokenForget);
        
        System.out.println("Token insert success: " + insertSuccess);
        
        if (!insertSuccess) {
            System.out.println("Failed to insert token");
            request.setAttribute("mess", "Có lỗi xảy ra, vui lòng thử lại sau!");
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }
        
        boolean emailSent = service.sendEmail(email, token, user.getFullname());
        System.out.println("Email sent result: " + emailSent);
        
        if (emailSent) {
            request.setAttribute("success", "Link reset password đã được gửi vào email của bạn!");
        } else {
            request.setAttribute("mess", "Không thể gửi email. Vui lòng thử lại sau!");
        }
        
        request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
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
