package control;

import dal.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;
import model.Product;

@WebServlet(name = "ProductDetailAdmin", urlPatterns = {"/productDetail"})
public class ProductDetailAdmin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailAdmin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        int id = 0;
        int did = 0;
       
        boolean redirectToUpdate = false;

        try {
            // Parse parameters
            if (request.getParameter("id") != null) {
                id = Integer.parseInt(request.getParameter("id"));
            }
            if (request.getParameter("did") != null) {
                did = Integer.parseInt(request.getParameter("did"));
            }
          
            // Handle deletion if did is not zero
            if (did != 0) {
                productDAO.delete(did);
                id = did; // Set id to did for potential further operations
            }

            // If not redirected to update page, show product details
            if (!redirectToUpdate) {
                List<Product> productList = productDAO.getProductsByOid(id);
                request.setAttribute("list", productList);
                request.getRequestDispatcher("detailAdmin.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid product ID format.");
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//      <form action="updateProduct" method="post">
//            <!-- Setting product data in the form -->
//            <c:set value="${requestScope.product}" var="p"></c:set>
//            
//            <!-- Product ID (read-only) -->
//            <div>
//                <label for="id">ID:</label>
//                <input type="text" id="id" name="id" value="${p.id}" readonly>
//            </div>
//            
//            <!-- Name -->
//            <div>
//                <label for="name">Name:</label>
//                <input type="text" id="name" name="name" value="${p.name}">
//            </div>
//
//            <!-- Stock -->
//            <div>
//                <label for="stock">Stock:</label>
//                <input type="number" id="stock" name="stock" value="${p.stock}">
//            </div>
//
//            <!-- Thumbnail -->
//            <div>
//                <label for="thumbnail">Thumbnail:</label>
//                <input type="file" id="thumbnail" name="thumbnail">
//            </div>
//
//            <!-- Submit button for updating the product -->
//            <div>
//                <input type="submit" value="Update Product">
//            </div>
//        </form>
//    </body>


    }

    @Override
    public String getServletInfo() {
        return "Handles product details and updates for admin";
    }
}
