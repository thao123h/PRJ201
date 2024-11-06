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
import java.io.PrintWriter;
import model.Product;

@WebServlet(name = "addProduct", urlPatterns = {"/addProduct"})
@MultipartConfig
public class addProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        OriginalProductDAO originalProductDAO = new OriginalProductDAO();
        PrintWriter out = response.getWriter();
        try {
            String originalProductIdStr = request.getParameter("o");
            if (originalProductIdStr == null || originalProductIdStr.trim().isEmpty()) {
                throw new IllegalArgumentException("Original product ID is required");
            }
            
            int originalProductId = Integer.parseInt(originalProductIdStr);
            String name = request.getParameter("name");
            int stock = Integer.parseInt(request.getParameter("stock"));
            
            Part thumbnailPart = request.getPart("thumbnail");
            String thumbnailFileName = null;

            if (thumbnailPart != null && thumbnailPart.getSize() > 0) {
                thumbnailFileName = Paths.get(thumbnailPart.getSubmittedFileName()).getFileName().toString();
                
                String applicationPath = request.getServletContext().getRealPath("");
                String uploadPath = applicationPath + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                
                String filePath = uploadPath + File.separator + thumbnailFileName;
                thumbnailPart.write(filePath);
                
                thumbnailFileName = "images/" + thumbnailFileName;
            }

            Product product = new Product();
            product.setOproduct(originalProductDAO.getOProductByID(originalProductId));
            product.setName(name);
            product.setStock(stock);
            product.setThumbnail(thumbnailFileName);

            productDAO.insertProduct(product);
         
             

            response.sendRedirect("productDetail?id=" + originalProductId);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format: Please check your input");
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }
    }
}
