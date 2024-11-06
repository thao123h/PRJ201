package control;

import dal.OriginalProductDAO;
import dal.ProductDAO;
import java.io.File;
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
                
                // Get the absolute path of the web application
                String applicationPath = request.getServletContext().getRealPath("");
                // Create the upload folder if it doesn't exist
                String uploadPath = applicationPath + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                // Save the file
                String filePath = uploadPath + File.separator + thumbnailFileName;
                thumbnailPart.write(filePath);
                
                // Set the relative path for database storage
                thumbnailFileName = "images/" + thumbnailFileName;
            } else {
                // If no new file, keep the existing thumbnail
                thumbnailFileName = productDAO.getProductByID(id).getThumbnail();
            }

            // Update the product
            Product product = new Product(id, originalProductDAO.getOProductByID(o), name, stock, thumbnailFileName);
            productDAO.updateProduct(product);

            // Redirect to productDetail with the original product ID
            response.sendRedirect("productDetail");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        }
    }
}
