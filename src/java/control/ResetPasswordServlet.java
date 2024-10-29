package control;

import dal.DAOTokenForget;
import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.TokenForgetPassword;
import model.User;

@WebServlet(name="ResetPasswordServlet", urlPatterns={"/resetPassword"})
public class ResetPasswordServlet extends HttpServlet {
    private final DAOTokenForget DAOToken = new DAOTokenForget();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String token = request.getParameter("token");
        
        if (token == null || token.isEmpty()) {
            request.getRequestDispatcher("requestPassword.jsp").forward(request, response);
            return;
        }
        
        TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(token);
        if (tokenForgetPassword == null) {
            request.setAttribute("error", "Invalid or expired token");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }
        
        UserDAO userDAO = new UserDAO();
        User user = userDAO.getUserByID(tokenForgetPassword.getUserId());
        
        if (user == null || tokenForgetPassword.isIsUsed()) {
            request.setAttribute("error", "Invalid token or already used");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }
        
        request.setAttribute("email", user.getEmail());
        request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");
        String token = request.getParameter("token");

        if (token == null || token.isEmpty() || !password.equals(confirmPassword)) {
            request.setAttribute("error", "Invalid input. Please try again.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        TokenForgetPassword tokenForgetPassword = DAOToken.getTokenPassword(token);
        if (tokenForgetPassword == null || tokenForgetPassword.isIsUsed()) {
            request.setAttribute("error", "Invalid token or already used.");
            request.setAttribute("email", email);
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        UserDAO userDAO = new UserDAO();
        boolean updateSuccess = userDAO.updatePassword(email, password);
        if (updateSuccess) {
            tokenForgetPassword.setIsUsed(true);
            DAOToken.updateStatus(tokenForgetPassword);
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Password update failed. Please try again.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Reset Password Servlet";
    }
}
