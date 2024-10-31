/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.CartDAO;
import dal.OrderDAO;
import dal.ProductDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.CartItem;
import model.Order;
import model.OrderDetail;
import model.User;

/**
 *
 * @author asus
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        int cartID = 0;
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null);
        cartID = (int) session.getAttribute("cartID");
        CartDAO cd = new CartDAO();
        List<CartItem> list = cd.getAllCartItemsByCardID(cartID);
        request.setAttribute("list", list);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

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
        OrderDAO od = new OrderDAO();
        ProductDAO pd = new ProductDAO();
        List<CartItem> listItem = new ArrayList<>();
         PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
         CartDAO cd = new CartDAO();
        User user = (User) session.getAttribute("user");
        Order order = new Order();
        if (user != null) {
            od.insertIntoOrder(new Order(0, user, 0, 0));

            //insert into OrderDetail
            order = od.getOrderByUserID(user.getId());
           
            listItem = cd.getAllCartItemsByCardID(cd.getCardByUserID(user.getId()).getId());
        }

        for (CartItem cartItem : listItem) {
            int price = 0;
            if (cartItem != null && cartItem.getProduct() != null && cartItem.getProduct().getOproduct() != null) {
                price = cartItem.getQuantity() * (int) cartItem.getProduct().getOproduct().getListedPrice();
            } else {
                out.print("One of the objects is null.");
            }

          
            od.insertIntoOrderDetail(new OrderDetail(0, order,
                     cartItem.getProduct(), cartItem.getQuantity(), price));
        }

        //update Order money
        od.updateTotalMoneyInOrder(order.getId());
        if (user!=null)   cd.deteteCartByUserID(user.getId());
     
        out.println("xavc nhan ");

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
