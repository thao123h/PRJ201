package control;

import dal.OriginalProductDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.OriginalProduct;
import model.Product;

@WebServlet(name = "UpdateProduct", urlPatterns = {"/updateProduct"})
@MultipartConfig // Enables file upload handling
public class UpdateProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Product product = productDAO.getProductByID(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception for debugging
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid product ID.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        OriginalProductDAO originalProductDAO = new OriginalProductDAO();

        try {
            // Retrieve the form data
            int id = Integer.parseInt(request.getParameter("id"));
            int o = Integer.parseInt(request.getParameter("o"));
            String name = request.getParameter("name");
            int stock = Integer.parseInt(request.getParameter("stock"));
            
            // Handle the file upload
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnailFileName = null;

            // Check if a new file was uploaded
            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnailFileName = Paths.get(thumbnailPart.getSubmittedFileName()).getFileName().toString();
                // Save the file (specify a proper directory path for saving)
                String uploadPath = "/path/to/your/upload/directory"; // Update this path
                thumbnailPart.write(uploadPath + "/" + thumbnailFileName);
            } else {
                // If no new file, keep the existing thumbnail
                thumbnailFileName = productDAO.getProductByID(id).getThumbnail();
            }

            // Update the product
            Product product = new Product(id, originalProductDAO.getOProductByID(o), name, stock, thumbnailFileName);
            productDAO.updateProduct(product);

            // Forward to productDetail with the original product ID
            request.setAttribute("id", o);
            request.getRequestDispatcher("productDetail").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating the product.");
        }
    }
}
